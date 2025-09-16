import argparse, time, torch

def cuda_sync():
    if torch.cuda.is_available():
        torch.cuda.synchronize()

def median_sec(times):
    return sorted(times)[len(times)//2] if times else float('inf')

def parse_dtype(name: str):
    name = name.lower()
    if name in ("fp16", "float16", "half"):   return torch.float16
    if name in ("bf16", "bfloat16"):          return torch.bfloat16
    if name in ("fp32", "float32"):           return torch.float32
    raise ValueError(f"Unsupported dtype: {name}")

@torch.inference_mode()
def random_sparse_csr(M, K, density, device, dtype):
    """
    Construct a random CSR matrix with ~uniform nnz per row.
    Generation is not timed (benchmark measures matmul only).
    """
    nnz_per_row = max(1, int(round(K * density)))
    crow = torch.zeros(M + 1, device=device, dtype=torch.int64)
    crow[1:] = nnz_per_row
    crow = torch.cumsum(crow, dim=0)
    nnz = int(crow[-1].item())

    col = torch.empty(nnz, device=device, dtype=torch.int64)
    for i in range(M):
        idx = torch.randperm(K, device=device)[:nnz_per_row]
        col[i*nnz_per_row:(i+1)*nnz_per_row] = idx

    values = torch.randn(nnz, device=device, dtype=dtype)
    A = torch.sparse_csr_tensor(crow, col, values, size=(M, K), device=device, dtype=dtype)
    return A, nnz

@torch.inference_mode()
def bench_spmm(M, K, N, density, reps, warmup, device, dtype):
    A, nnz = random_sparse_csr(M, K, density, device, dtype)
    B = torch.randn(K, N, device=device, dtype=dtype)

    for _ in range(warmup):
        C = torch.matmul(A, B)
    cuda_sync()

    times = []
    for _ in range(reps):
        t0 = time.perf_counter()
        C = torch.matmul(A, B)
        cuda_sync()
        t1 = time.perf_counter()
        times.append(t1 - t0)

    sec = median_sec(times)
    flops = 2.0 * nnz * N  # each nonzero in A does a length-N FMA with B
    tflops = flops / sec / 1e12
    return sec, tflops, nnz

@torch.inference_mode()
def bench_dense(M, K, N, reps, warmup, device, dtype):
    A = torch.randn(M, K, device=device, dtype=dtype)
    B = torch.randn(K, N, device=device, dtype=dtype)

    for _ in range(warmup):
        C = A @ B
    cuda_sync()

    times = []
    for _ in range(reps):
        t0 = time.perf_counter()
        C = A @ B
        cuda_sync()
        t1 = time.perf_counter()
        times.append(t1 - t0)

    sec = median_sec(times)
    flops = 2.0 * M * K * N
    tflops = flops / sec / 1e12
    return sec, tflops

def main():
    ap = argparse.ArgumentParser(description="Sparse CSR SpMM vs Dense GEMM throughput (select dtype)")
    ap.add_argument("--M", type=int, default=8192)
    ap.add_argument("--K", type=int, default=8192)
    ap.add_argument("--N", type=int, default=4096)
    ap.add_argument("--density", type=float, default=0.10, help="nonzero fraction of A (0..1)")
    ap.add_argument("--dtype", type=str, default="fp16", choices=["fp16","bf16","fp32"],
                    help="numeric precision for both sparse and dense paths")
    ap.add_argument("--reps", type=int, default=10)
    ap.add_argument("--warmup", type=int, default=5)
    ap.add_argument("--allow-tf32", action="store_true",
                    help="allow TF32 for FP32 matmuls (ignored for fp16/bf16)")
    args = ap.parse_args()

    assert torch.cuda.is_available(), "CUDA GPU not detected. Run on a CUDA-enabled machine."
    device = "cuda"

    # Precision knobs
    torch.backends.cuda.matmul.allow_tf32 = bool(args.allow_tf32)
    try:
        torch.set_float32_matmul_precision("high" if args.allow_tf32 else "highest")
    except Exception:
        pass

    user_dtype = parse_dtype(args.dtype)

    print("\n=== Config ===")
    print(f"M={args.M} K={args.K} N={args.N}  density={args.density:.3f}")
    print(f"Device: {torch.cuda.get_device_name(0)}  PyTorch: {torch.__version__}")
    print(f"Dtype requested: {args.dtype}")
    print(f"reps={args.reps} warmup={args.warmup}  TF32-allowed-on-FP32={args.allow_tf32}\n")

    # Sparse SpMM with requested dtype; fallback to fp32 if unsupported
    spmm_dtype_used = args.dtype
    try:
        spmm_sec, spmm_tflops, nnz = bench_spmm(args.M, args.K, args.N, args.density,
                                                args.reps, args.warmup, device,
                                                dtype=user_dtype)
    except RuntimeError as e:
        # Some CUDA/cuSPARSE builds may not support CSR SpMM in BF16/FP16
        print(f"[warn] CSR SpMM in {args.dtype} not supported here; falling back to fp32 for sparse. ({e})")
        spmm_sec, spmm_tflops, nnz = bench_spmm(args.M, args.K, args.N, args.density,
                                                args.reps, args.warmup, device,
                                                dtype=torch.float32)
        spmm_dtype_used = "fp32*"

    # Dense baseline in the requested dtype
    dgemm_sec, dgemm_tflops = bench_dense(args.M, args.K, args.N, args.reps, args.warmup,
                                          device, dtype=user_dtype)

    sparsity = 1.0 - (nnz / (args.M * args.K))

    print("=== Results (median of reps) ===")
    print(f"Sparse CSR SpMM  ({spmm_dtype_used}): {spmm_sec:.4f} s | Delivered: {spmm_tflops:8.2f} TFLOPS"
          f" | nnz={nnz} (~{(1-sparsity)*100:.2f}% dense-equiv)")
    print(f"Dense GEMM       ({args.dtype}):       {dgemm_sec:.4f} s | Delivered: {dgemm_tflops:8.2f} TFLOPS")
    print("\nNotes:")
    print("• SpMM FLOPs = 2 * nnz(A) * N; Dense FLOPs = 2 * M * K * N.")
    print("• '*' on fp32 means only the sparse path fell back to fp32 due to dtype support.")
    print("• For Ampere/Hopper 2:4 sparsity speedups, use cuSPARSELt/cuBLASLt kernels (not CSR).")

if __name__ == "__main__":
    main()

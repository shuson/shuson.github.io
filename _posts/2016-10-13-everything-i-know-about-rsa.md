---
layout: post
title: Everything I know about RSA algorithm
tags:
    - cryptography
---

# 公开密钥加密简介

⋅⋅⋅也称作非对称密钥加密，描述为用某用户公钥加密后所得的信息，只能用该用户的私钥才能解密。如果知道了其中一个，并不能计算出另外一个。
⋅⋅⋅下面我们主要聊最常用的RSA加密算法。

# 数学基础

1. 互质

⋅⋅⋅两个正整数，如果出了1之外没有其他公因子，这两个数就互为质数，简称互质。

2. 欧拉函数

⋅⋅⋅任意正整数n，在小于等于n的正整数中，与n互质的数的个数可记为：<img src="http://chart.googleapis.com/chart?cht=tx&chl=%5Cphi%20(n)" style="border:none;" />

3. 欧拉定理

⋅⋅⋅如果a, n互质, 则有<br>
    <img src="http://chart.googleapis.com/chart?cht=tx&amp;chl=a%5E%7B%5Cphi(n)%7D%5Cequiv%5C1%20(mod%5C%20n)&amp;chs=60" style="border:none;">

4. 欧拉定理的特例：费马小定理

⋅⋅⋅当p是质数，<img src="http://chart.googleapis.com/chart?cht=tx&chl=%5Cphi%20(p)%20%3D%20p%20-%201" style="border:none;" />, 则有<br>
    <img src="http://chart.googleapis.com/chart?cht=tx&amp;chl=ab%20%5Cequiv%201%5C%20(mod%5C%20n)&amp;chs=40" style="border:none;">

5. 模反元素

⋅⋅⋅由<br> <img src="http://chart.googleapis.com/chart?cht=tx&amp;chl=a%5E%7B%5Cphi(n)%7D%3Da%5Ctimes%20a%5E%7B%5Cphi(n)-1%7D%5Cequiv%5C%201%5C%20(mod%5C%20n)%20&amp;chs=40" style="border:none;"> <br>可以写成：<br><img src="http://chart.googleapis.com/chart?cht=tx&amp;chl=ab%20%5Cequiv%201%5C%20(mod%5C%20n)&amp;chs=40" style="border:none;">。 <br>这个b叫做a的模反元素

6. 扩展欧几里德算法

⋅⋅⋅用来求解二元一次方程的整数解

# 生成RSA密钥

⋅⋅⋅RSA算法的可靠性基于一个事实：两个大质数的乘积易得，但对这个乘积因式分解很困难。

1. 随机选两个质数<br>

⋅⋅⋅例如 p=13 和 q=23. 在实际情况中，这个质数特别大。

2. 计算乘积<br>

⋅⋅⋅n = p x q = 13 x 23 = 299

3. 计算欧拉函数<br>

⋅⋅⋅φ(n) = (p-1)(q-1) = 12 x 22 = 264

4. 随机选择一个整数e，条件是1< e < φ(n)，且e与φ(n) 互质<br>

⋅⋅⋅e = 17

5. 计算e对于φ(n)的模反元素d <br>

⋅⋅⋅ed ≡ 1 (mod φ(n)) 等价于 k倍的 φ(n) 加上 1 等于 ed，写作 ed = kφ(n) + 1<br>
⋅⋅⋅变形为 ed + φ(n)(-k) = 1， 代入 e 和 φ(n) 的值，也就是二元一次方程 17d + 264(-k) = 1<br>
⋅⋅⋅根据扩展欧几里德算法，可得 d = 233, k = 15.

6. 至此，我们拥有了<br>

⋅⋅⋅p = 13, q = 23, n = 299, φ(n) = 264, e = 17. d = 233. <br>
⋅⋅⋅我们把n和e包装成公钥 (299, 17)，把n和d包装成私钥 (299, 233)

7. 可靠性分析<br>

⋅⋅⋅在上面的6个数字中，我们只公布了n和e，而d是最重要的私钥，如果靠n和e计算d的话<br>
    ⋅⋅⋅1. ed≡1 (mod φ(n))。只有知道e和φ(n)，才能算出d。
    ⋅⋅⋅2. φ(n)=(p-1)(q-1)。只有知道p和q，才能算出φ(n)。
    ⋅⋅⋅3. 想要知道p和q，就需要对n进行因子分解。那就难咯。

# 加密和解密

1. 加密：有明文m，使用公钥对儿(n, e)加密得到c的过程<br>

⋅⋅⋅根据 m<sup>e</sup> ≡ c (mod n) 计算，20<sup>17</sup> ≡ 76 (mode 299), c = 76 为密文。

2. 解密：对于密文c=76, 有<br>

⋅⋅⋅c<sup>d</sup> ≡ m (mod n) 计算， 76<sup>233</sup> ≡ 20 (mode 299), 解密出m=20

提示：windows系统自带计算器可以帮助计算。

//
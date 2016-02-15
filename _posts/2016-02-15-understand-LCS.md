---
layout: post
title: Understand Longest Common Subsequence
---

> source [wikipedia](https://en.wikipedia.org/wiki/Longest_common_subsequence_problem)

The table below shows the steps of generating LCS.

<table style="text-align: center;">
<tbody><tr>
<th colspan="2" rowspan="2"></th>
<th>0</th>
<th>1</th>
<th>2</th>
<th>3</th>
<th>4</th>
<th>5</th>
<th>6</th>
<th>7</th>
</tr>
<tr>
<th>Ø</th>
<th>M</th>
<th>Z</th>
<th>J</th>
<th>A</th>
<th>W</th>
<th>X</th>
<th>U</th>
</tr>
<tr>
<th>0</th>
<th>Ø</th>
<td style="background:yellow"><b>0</b></td>
<td>0</td>
<td>0</td>
<td>0</td>
<td>0</td>
<td>0</td>
<td>0</td>
<td>0</td>
</tr>
<tr>
<th>1</th>
<th>X</th>
<td style="background:yellow">0</td>
<td>0</td>
<td>0</td>
<td>0</td>
<td>0</td>
<td>0</td>
<td>1</td>
<td>1</td>
</tr>
<tr>
<th>2</th>
<th>M</th>
<td>0</td>
<td style="background:yellow"><b>1</b></td>
<td style="background:yellow">1</td>
<td>1</td>
<td>1</td>
<td>1</td>
<td>1</td>
<td>1</td>
</tr>
<tr>
<th>3</th>
<th>J</th>
<td>0</td>
<td>1</td>
<td>1</td>
<td style="background:yellow"><b>2</b></td>
<td>2</td>
<td>2</td>
<td>2</td>
<td>2</td>
</tr>
<tr>
<th>4</th>
<th>Y</th>
<td>0</td>
<td>1</td>
<td>1</td>
<td style="background:yellow">2</td>
<td>2</td>
<td>2</td>
<td>2</td>
<td>2</td>
</tr>
<tr>
<th>5</th>
<th>A</th>
<td>0</td>
<td>1</td>
<td>1</td>
<td>2</td>
<td style="background:yellow"><b>3</b></td>
<td style="background:yellow">3</td>
<td style="background:yellow">3</td>
<td>3</td>
</tr>
<tr>
<th>6</th>
<th>U</th>
<td>0</td>
<td>1</td>
<td>1</td>
<td>2</td>
<td>3</td>
<td>3</td>
<td>3</td>
<td style="background:yellow"><b>4</b></td>
</tr>
<tr>
<th>7</th>
<th>Z</th>
<td>0</td>
<td>1</td>
<td>2</td>
<td>2</td>
<td>3</td>
<td>3</td>
<td>3</td>
<td style="background: yellow">4</td>
</tr>
</tbody></table>

Here are the steps intepreted:
1. given 2 strings: s1, s2, make them to char array:
    ``` 
    char[] seq1 = s1.toCharArray();
    char[] seq2 = s2.toCharArray();
    int i = seq1.length;
    int j = seq2.length;
    ```
2. create 2 dimensional array using seq1, seq2:
    ```
    char[][] matrix = new char[i][j]
    ```
3. from tail to head, we do:
    ```
    function lcs(matrix, seq1, seq2, i, j):
    if i == 0 or j == 0: return " ";
    else if seq1[i-1] == seq2[j-1]: return lcs(matrix, seq1, seq2, i, j) + seq1[i-1];
    else:
        if matrix[i][j-1] > matrix[i-1][j]: return lcs(matrix, seq1, seq2, i, j-1)
        else lcs(matrix, seq1, seq2, i-1, j)
    
    ```
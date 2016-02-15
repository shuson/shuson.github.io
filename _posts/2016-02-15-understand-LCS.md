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
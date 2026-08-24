---
title: "Borel-Cantelli 引理（第一部分）"
date: 2026-08-24
area: 概率论
tags: [Borel-Cantelli, 测度论, limsup]
difficulty: "★★☆"
statement: "若 sum P(A_n) < ∞，则 P(A_n 发生无穷多次) = 0"
---

# Borel-Cantelli 引理（第一部分）

> **结论（Borel-Cantelli, Part 1）**：设 $(\Omega,\mathcal{F},P)$ 为概率空间，$\{A_n\}_{n\ge 1} \subset \mathcal{F}$。若
>
> $$
> \sum_{n=1}^{\infty} P(A_n) < \infty,
> $$
>
> 则
>
> $$
> P\left(\limsup_{n\to\infty} A_n\right) = P\left(\bigcap_{n=1}^{\infty}\bigcup_{k=n}^{\infty} A_k\right) = P(\{A_n \text{ 发生无穷多次}\}) = 0.
> $$

---

## 证明思路（Sketch）

核心是**可数次可加性 + 尾部求和趋于 0**：

- $\limsup A_n = \bigcap_n B_n$，其中 $B_n = \bigcup_{k\ge n} A_k$ 单调递减
- $P(\limsup A_n) \le P(B_n) \le \sum_{k\ge n} P(A_k)$（可数次可加）
- 由 $\sum P(A_n) < \infty$ 得尾和 $\sum_{k\ge n} P(A_k) \xrightarrow[n\to\infty]{} 0$，夹逼即得。

无需独立性假设。

---

## 完整证明

**证明：**

记 $B_n := \bigcup_{k=n}^{\infty} A_k$，则 $B_1 \supset B_2 \supset \cdots$ 且 $\limsup_{n} A_n = \bigcap_{n=1}^{\infty} B_n$。

**步骤 1：单调性。** 由 $B_n \downarrow \bigcap_n B_n$ 且 $P$ 为有限测度，连续性从上可得

$$
P\left(\limsup_{n} A_n\right) = \lim_{n\to\infty} P(B_n).
$$

（注：需 $P(B_1) \le \sum_{k\ge1} P(A_k) < \infty$ 保证可应用连续性，此条件由假设满足；亦可直接用 $P(\bigcap B_n) \le P(B_n)$ 对任意 $n$ 取极限，避免连续性。）

**步骤 2：可数次可加界。** 对任意 $n$，

$$
P(B_n) = P\left(\bigcup_{k=n}^{\infty} A_k\right) \le \sum_{k=n}^{\infty} P(A_k),
$$

由概率的**可数次可加性**（countable subadditivity / Boole 不等式）。

**步骤 3：尾和趋零。** 设 $S := \sum_{k=1}^{\infty} P(A_k) < \infty$，记部分和 $S_n := \sum_{k=1}^{n} P(A_k)$。则 $S_n \uparrow S$，故尾和

$$
R_n := \sum_{k=n}^{\infty} P(A_k) = S - S_{n-1} \xrightarrow[n\to\infty]{} 0.
$$

**步骤 4：夹逼。** 综合得

$$
0 \le P\left(\limsup_{n} A_n\right) \le P(B_n) \le R_n \xrightarrow[n\to\infty]{} 0,
$$

故 $P(\limsup A_n) = 0$。

$\square$

> **注**：第二部分（逆命题，需独立性：若 $A_n$ 独立且 $\sum P(A_n)=\infty$ 则 $P(\limsup A_n)=1$）不属于本条，见后续条目。

---

## 注记与拓展

- **直观**：可和的概率质量不足以支撑无穷多次发生；类比实分析中“可和序列的通项必趋于 0”的加强版。
- **易错点**：不可误将 $P(\bigcup A_k)$ 等同于 $\sum P(A_k)$（需互斥才相等），此处仅用不等式。
- **推广**：对任意测度空间，若 $\sum \mu(A_n)<\infty$ 则 $\mu(\limsup A_n)=0$，概率仅为特例。
- **关联**：常与 Markov/Chebyshev 不等式联用证明强大数定律的收敛部分。

---

## 参考文献

1. Durrett, R. *Probability: Theory and Examples*, 5th ed., Cambridge Univ. Press, 2019. Theorem 2.3.1.
2. Billingsley, P. *Probability and Measure*, 3rd ed., Wiley, 1995. Sec. 4.
3. Wikipedia, "Borel–Cantelli lemma", https://en.wikipedia.org/wiki/Borel%E2%80%93Cantelli_lemma

---

## 复盘

- 难点：从 $\limsup$ 的集合定义到测度估计的转化
- 易错点：连续性从上需要 $P(B_1)<\infty$ 的验证
- 延伸：若去掉可和条件，仅知 $P(A_n)\to 0$，能否推出 $P(\limsup A_n)=0$？（否，反例：$A_n$ 循环覆盖）

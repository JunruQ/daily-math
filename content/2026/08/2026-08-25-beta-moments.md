---
title: "第一类 Beta 分布的 n 阶原点矩"
date: 2026-08-25
area: 概率论
tags: [Beta分布, 原点矩, Beta函数, Gamma函数, 上升阶乘]
difficulty: "★★☆"
statement: "若 X∼Beta(α,β)（第一类），α>0,β>0，则对任意整数 n≥0（更一般对实数 n>−α）有 E[X^n]=B(α+n,β)/B(α,β)=Γ(α+n)Γ(α+β)/(Γ(α)Γ(α+β+n))=α(α+1)⋯(α+n−1)/[(α+β)(α+β+1)⋯(α+β+n−1)]"
---

# 第一类 Beta 分布的 n 阶原点矩

> **结论（精确陈述）**：设 $X\sim\text{Beta}(\alpha,\beta)$ 为第一类 Beta 分布，参数 $\alpha>0,\ \beta>0$，其密度为
>
> $$
> f_{X}(x;\alpha,\beta)=\frac{1}{B(\alpha,\beta)}x^{\alpha-1}(1-x)^{\beta-1}\mathbf{1}_{(0,1)}(x),\quad B(\alpha,\beta)=\int_{0}^{1}t^{\alpha-1}(1-t)^{\beta-1}dt=\frac{\Gamma(\alpha)\Gamma(\beta)}{\Gamma(\alpha+\beta)}.
> $$
>
> 则对任意整数 $n\ge 0$（更一般地，对任意实数 $n>-\alpha$），$X$ 的 $n$ 阶原点矩存在且
>
> $$
> E[X^{n}]=\frac{B(\alpha+n,\beta)}{B(\alpha,\beta)}=\frac{\Gamma(\alpha+n)\Gamma(\alpha+\beta)}{\Gamma(\alpha)\Gamma(\alpha+\beta+n)}=\frac{\alpha^{\overline{n}}}{(\alpha+\beta)^{\overline{n}}},
> $$
>
> 其中 $\alpha^{\overline{n}}:=\alpha(\alpha+1)\cdots(\alpha+n-1)$ 为上升阶乘（$n=0$ 时约定为 $1$），$(\alpha+\beta)^{\overline{n}}$ 同理。特别地，
>
> $$
> E[X]=\frac{\alpha}{\alpha+\beta},\quad \operatorname{Var}(X)=\frac{\alpha\beta}{(\alpha+\beta)^{2}(\alpha+\beta+1)}.
> $$

---

## 证明思路（Sketch）

- **关键观察**：$E[X^{n}]=\int_{0}^{1}x^{n}f(x)dx$ 的被积函数恰好是 $x^{\alpha+n-1}(1-x)^{\beta-1}$，与 $B(\alpha+n,\beta)$ 的定义积分同形，只差归一化常数 $B(\alpha,\beta)$。
- **归约路径**：
  1. 验证积分收敛条件 $n>-\alpha$（保证 $0$ 端 $x^{\alpha+n-1}$ 可积），$\beta>0$ 保证 $1$ 端可积。
  2. 直接写出 $E[X^{n}]=B(\alpha+n,\beta)/B(\alpha,\beta)$，再用 $B(p,q)=\Gamma(p)\Gamma(q)/\Gamma(p+q)$ 化为 Gamma 比值。
  3. 对整数 $n$ 用 $\Gamma(z+1)=z\Gamma(z)$ 递推得上升阶乘连乘形式。
- **需引用**：Beta 函数定义与 $B(p,q)=\Gamma(p)\Gamma(q)/\Gamma(p+q)$（$p>0,q>0$）；Gamma 递推；上升阶乘记号。

---

## 完整证明

### 预备：Beta 函数与 Gamma 函数

**定义**：对 $p>0,q>0$，

$$
B(p,q):=\int_{0}^{1}t^{p-1}(1-t)^{q-1}dt,\qquad \Gamma(s):=\int_{0}^{\infty}y^{s-1}e^{-y}dy,\ s>0.
$$

**引理 1**：$B(p,q)=\dfrac{\Gamma(p)\Gamma(q)}{\Gamma(p+q)}$，$p>0,q>0$。

*引理证明概要*：由 Fubini，将 $\Gamma(p)\Gamma(q)=\int_{0}^{\infty}\int_{0}^{\infty}u^{p-1}v^{q-1}e^{-(u+v)}du\,dv$ 作变换 $u=rs,\ v=r(1-s)$（即 $r=u+v,\ s=u/(u+v)$），Jacobian $=r$，分离变量得 $\Gamma(p+q)B(p,q)$。标准教材均有完整证明，本文引用该结果。$\square$

**引理 2（Gamma 递推）**：$\Gamma(s+1)=s\Gamma(s)$，$s>0$。由分部积分 $ \Gamma(s+1)=\int_{0}^{\infty}y^{s}e^{-y}dy =[-y^{s}e^{-y}]_{0}^{\infty}+s\int_{0}^{\infty}y^{s-1}e^{-y}dy$，边界项为 $0$。

---

### 步骤 1：矩的存在性

设 $\alpha>0,\beta>0$，$n\in\mathbb{R}$。考虑

$$
E[X^{n}]=\int_{0}^{1}x^{n}\cdot\frac{1}{B(\alpha,\beta)}x^{\alpha-1}(1-x)^{\beta-1}dx = \frac{1}{B(\alpha,\beta)}\int_{0}^{1}x^{\alpha+n-1}(1-x)^{\beta-1}dx.
$$

积分在 $x\to0^{+}$ 行为 $\sim x^{\alpha+n-1}$，可积 iff $\alpha+n>0\iff n>-\alpha$；在 $x\to1^{-}$ 行为 $\sim (1-x)^{\beta-1}$，可积 iff $\beta>0$（已设）。被积函数在 $(0,1)$ 连续。故 $n>-\alpha$ 时积分绝对收敛，矩存在；$n\le -\alpha$ 时发散。对整数 $n\ge0$ 自动满足。

下设 $n>-\alpha$。

### 步骤 2：化为 Beta 比值

由定义，

$$
\int_{0}^{1}x^{\alpha+n-1}(1-x)^{\beta-1}dx = B(\alpha+n,\beta),\quad \text{因为 }\alpha+n>0,\ \beta>0.
$$

故

$$
E[X^{n}] = \frac{B(\alpha+n,\beta)}{B(\alpha,\beta)}. \tag{1}
$$

此式对任意实数 $n>-\alpha$ 成立，是最简洁的闭式。

### 步骤 3：化为 Gamma 比值

应用引理 1 于分子分母：

$$
B(\alpha+n,\beta)=\frac{\Gamma(\alpha+n)\Gamma(\beta)}{\Gamma(\alpha+\beta+n)},\qquad B(\alpha,\beta)=\frac{\Gamma(\alpha)\Gamma(\beta)}{\Gamma(\alpha+\beta)}.
$$

代入 (1)，消去 $\Gamma(\beta)$：

$$
E[X^{n}] = \frac{\Gamma(\alpha+n)/\Gamma(\alpha+\beta+n)}{\Gamma(\alpha)/\Gamma(\alpha+\beta)} = \frac{\Gamma(\alpha+n)\,\Gamma(\alpha+\beta)}{\Gamma(\alpha)\,\Gamma(\alpha+\beta+n)}. \tag{2}
$$

这对实数 $n>-\alpha$ 均成立（当 $n$ 非整数时 $\Gamma(\alpha+n)$ 由 Gamma 解析延拓定义，但此处 $\alpha+n>0$ 仍在经典积分定义域内）。

### 步骤 4：整数 $n$ 的上升阶乘形式

设 $n\in\mathbb{N}_{0}$。反复用引理 2：

$$
\Gamma(\alpha+n)=\Gamma(\alpha)\cdot\alpha(\alpha+1)\cdots(\alpha+n-1),\quad n\ge1,
$$

$$
\Gamma(\alpha+\beta+n)=\Gamma(\alpha+\beta)\cdot(\alpha+\beta)(\alpha+\beta+1)\cdots(\alpha+\beta+n-1).
$$

严格归纳：$n=1$ 时即 $\Gamma(\alpha+1)=\alpha\Gamma(\alpha)$；假设对 $n$ 成立，则 $\Gamma(\alpha+n+1)=(\alpha+n)\Gamma(\alpha+n)=(\alpha+n)\Gamma(\alpha)\alpha^{\overline{n}}=\Gamma(\alpha)\alpha^{\overline{n+1}}$。

代入 (2) 约去 $\Gamma(\alpha),\Gamma(\alpha+\beta)$：

$$
E[X^{n}] = \frac{\alpha(\alpha+1)\cdots(\alpha+n-1)}{(\alpha+\beta)(\alpha+\beta+1)\cdots(\alpha+\beta+n-1)} = \frac{\alpha^{\overline{n}}}{(\alpha+\beta)^{\overline{n}}}. \tag{3}
$$

约定空积为 $1$，故 $E[X^{0}]=1$ 自洽。$\square$

### 推论：均值与方差

由 (3)：

$$
E[X]=\frac{\alpha}{\alpha+\beta},\qquad E[X^{2}]=\frac{\alpha(\alpha+1)}{(\alpha+\beta)(\alpha+\beta+1)}.
$$

于是

$$
\operatorname{Var}(X)=E[X^{2}]-(E[X])^{2}= \frac{\alpha(\alpha+1)}{(\alpha+\beta)(\alpha+\beta+1)}-\frac{\alpha^{2}}{(\alpha+\beta)^{2}} = \frac{\alpha\beta}{(\alpha+\beta)^{2}(\alpha+\beta+1)}.
$$

计算：通分后分子 $=\alpha(\alpha+1)(\alpha+\beta)-\alpha^{2}(\alpha+\beta+1)=\alpha\beta$，分母 $(\alpha+\beta)^{2}(\alpha+\beta+1)$。

更一般地，中心矩可由原点矩二项展开得，但无如此简洁闭式。

---

## 注记与拓展

- **直观解释**：$X\sim\text{Beta}(\alpha,\beta)$ 可视为 $\alpha-1$ 次“成功”与 $\beta-1$ 次“失败”的相对权重。$E[X]=\alpha/(\alpha+\beta)$ 是成功占比的期望；$n$ 阶矩的连乘形式反映每次“再乘一个 $X$”相当于 $\alpha\to\alpha+1$ 的参数平移，这正是 Beta—二项共轭的代数体现。

- **与 Gamma 的构造联系**：若 $G_{1}\sim\text{Gamma}(\alpha,1),\ G_{2}\sim\text{Gamma}(\beta,1)$ 独立，则 $X:=G_{1}/(G_{1}+G_{2})\sim\text{Beta}(\alpha,\beta)$ 且 $G_{1}+G_{2}\perp X$。由此亦可求矩：$E[X^{n}]=E[G_{1}^{n}]E[(G_{1}+G_{2})^{-n}]$ 的某种形式，但直接 Beta 积分更简洁。见《统计推断》中 Beta-Gamma 关系。

- **第二类 Beta 分布**：若 $Y=X/(1-X)$ 则 $Y\sim\text{Beta}'(\alpha,\beta)$（第二类），密度 $\propto y^{\alpha-1}(1+y)^{-(\alpha+\beta)}$，$y>0$。其矩 $E[Y^{n}]=B(\alpha+n,\beta-n)/B(\alpha,\beta)$ 要求 $n<\beta$，否则发散，体现重尾差异。第一类支撑 $[0,1]$ 故任意 $n\ge0$ 矩有限，第二类则不然——易混淆。

- **实数阶矩**：(1)(2) 对任意实数 $n>-\alpha$ 成立，例如 $E[X^{-1/2}]$ 要求 $\alpha>1/2$。整数限制仅为得到连乘初等式；分数阶矩在估计与先验证明中亦常用。

- **常见误用/易错点**：
  - 误将 $E[X^{n}]$ 写成 $\Gamma(\alpha+n)/\Gamma(\alpha)$（漏分母 $(\alpha+\beta)^{\overline{n}}$）；量纲检验：$X\in[0,1]$ 无量纲，分子分母同阶才能保证 $0<E[X^{n}]<1$。
  - 混淆 $\text{Beta}(\alpha,\beta)$ 的两种参数化：本文 $\alpha,\beta$ 为形状参数（shape），另有均值-精度参数化 $\mu=\alpha/(\alpha+\beta),\ \phi=\alpha+\beta$，需注明。
  - 误认为 $E[(1-X)^{n}]=B(\alpha,\beta+n)/B(\alpha,\beta)$ 不成立——实际成立，由对称性 $1-X\sim\text{Beta}(\beta,\alpha)$。
  - 忽略存在条件 $n>-\alpha$，对负阶矩不加检验。

- **等价形式与推广**：
  - 对 $k\ge1$，阶乘矩 $E[X(X-1)\cdots]$ 无简洁式，但 $E[X^{n}(1-X)^{m}]=B(\alpha+n,\beta+m)/B(\alpha,\beta)$。
  - Dirichlet 推广：若 $(X_{1},\dots,X_{k})\sim\text{Dirichlet}(\alpha_{1},\dots,\alpha_{k})$，则 $E[\prod X_{i}^{n_{i}}]= \prod\Gamma(\alpha_{i}+n_{i})/\Gamma(\sum\alpha_{i}+\sum n_{i})\cdot\Gamma(\sum\alpha_{i})/\prod\Gamma(\alpha_{i})$。
  - 可用于证明矩生成函数不存在初等闭式，但矩序列唯一确定分布（$[0,1]$ 上矩问题确定）。

- **小练习**：
  1. 设 $X\sim\text{Beta}(2,3)$，求 $E[X^{3}]$（答案 $1/7$）。
  2. 用 Gamma 构造证明 $E[X^{n}]=B(\alpha+n,\beta)/B(\alpha,\beta)$（提示：$G_{1},G_{2}$ 独立 Gamma）。
  3. 证明 $\operatorname{Var}(X)\le 1/4$ 等号何时取得（提示：$\alpha=\beta\to0^{+}$ 趋近 Bernoulli(1/2)）。

---

## 参考文献

1. Casella, G. & Berger, R. L. *Statistical Inference*, 2nd ed., Duxbury, 2002. Sec. 3.3, Example 3.3.2 (Beta 分布), Thm. 3.3.1 (Beta-Gamma 关系).
2. Johnson, N. L., Kotz, S. & Balakrishnan, N. *Continuous Univariate Distributions*, Vol. 2, 2nd ed., Wiley, 1995. Chap. 25 (Beta 分布矩).
3. Billingsley, P. *Probability and Measure*, 3rd ed., Wiley, 1995. Chap. 21 (Gamma/Beta 函数).
4. Wikipedia, "Beta distribution", "Beta function", "Gamma function", 访问日期 2026-08-25.

---

## 复盘

- 难点：从 $E[X^{n}]$ 识别出 Beta 积分的平移 $α→α+n$；Gamma 比值到连乘的归纳需严谨处理 $n=0$ 空积。
- 易错点：支撑 $(0,1)$ 端点可积条件；$B(\alpha,\beta)$ 在分子分母中勿颠倒；第二类 Beta 的 $n<\beta$ 条件与第一类对比记忆。
- 延伸思考：Beta 矩的连乘结构如何直接推出后验 $ \text{Beta}(\alpha+x,\beta+n-x)$ 的均值？（共轭先验的矩更新即参数平移）

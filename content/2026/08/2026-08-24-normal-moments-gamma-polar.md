---
title: "三个常用分布计算：正态偶数阶矩、Gamma 积分与正态样本的极坐标独立性"
date: 2026-08-24
area: 概率论
tags: [正态分布, 矩母函数, Gamma函数, 极坐标变换, 独立性, Rayleigh分布, Cauchy分布]
difficulty: "★★☆"
statement: "① 若 X∼N(0,1) 则 E[X^{2k}]=(2k-1)!!=(2k)!/(2^k k!) 且 E[X^{2k-1}]=0；② 对 α>0, λ>0 有 ∫_0^∞ x^{α-1} e^{-λx} dx = Γ(α)/λ^α；③ 若 X1,X2 i.i.d.∼N(0,σ²) 则 X1/X2 与 √(X1²+X2²) 相互独立"
---

# 三个常用分布计算：正态偶数阶矩、Gamma 积分与正态样本的极坐标独立性

> **结论 1（标准正态偶数阶矩）**：设 $X \sim N(0,1)$，则对任意整数 $k \ge 0$，
>
> $$
> E[X^{2k}] = (2k-1)!! := (2k-1)(2k-3)\cdots 3\cdot 1 = \frac{(2k)!}{2^{k} k!},\quad E[X^{2k+1}]=0,
> $$
>
> 约定 $(-1)!! = 0!! = 1$。

> **结论 2（Gamma 积分的尺度变换）**：设 $\alpha > 0$, $\lambda > 0$，则
>
> $$
> \int_{0}^{\infty} x^{\alpha-1} e^{-\lambda x} \,dx = \frac{\Gamma(\alpha)}{\lambda^{\alpha}},\quad \text{其中 } \Gamma(\alpha)=\int_{0}^{\infty} y^{\alpha-1}e^{-y}dy.
> $$
>
> *注*：原命题常误写为 $\int_{-\infty}^{\infty} x^{\alpha-1}e^{-\lambda x}dx$，该写法在 $\alpha\notin\mathbb{N}$ 时 $x^{\alpha-1}$ 在 $(-\infty,0)$ 无实值定义且积分发散；正确积分域为 $[0,\infty)$。若 $\lambda$ 允许复数，则需 $\Re(\lambda)>0$。

> **结论 3（正态样本的比值与模独立）**：设 $X_{1},X_{2} \overset{i.i.d.}{\sim} N(0,\sigma^{2})$, $\sigma>0$，则
>
> $$
> U := \frac{X_{1}}{X_{2}} \quad \text{与} \quad V := \sqrt{X_{1}^{2}+X_{2}^{2}}
> $$
>
> 相互独立。等价地，极坐标半径 $R=V$ 与角度 $\Theta=\arctan(X_{2}/X_{1})$ 独立，且 $R\sim\text{Rayleigh}(\sigma)$, $\Theta\sim\text{Unif}[0,2\pi)$。

---

## 证明思路（Sketch）

- **命题一** 两条路径殊途同归：
  - *MGF 路径*：$M_{X}(t)=e^{t^{2}/2}$ 同时有两种展开——作为 $e^{t^{2}/2}$ 的幂级数与作为 $\sum E[X^{m}]t^{m}/m!$ 的矩母展开——对比 $t^{2k}$ 系数即得。关键在于 MGF 在全实轴存在从而幂级数可在 $t=0$ 邻域逐项对比。
  - *分部积分路径*：$E[X^{2k}] = \frac{1}{\sqrt{2\pi}}\int x^{2k}e^{-x^{2}/2}dx$ 中令 $u=x^{2k-1}$, $dv=xe^{-x^{2}/2}dx$，得递推 $E[X^{2k}]=(2k-1)E[X^{2k-2}]$，边界项因 $e^{-x^{2}/2}$ 压倒多项式而为 $0$，迭代即得双阶乘。

- **命题二** 本质是 Gamma 密度的归一化常数：作线性换元 $y=\lambda x$，则 $dx = dy/\lambda$，积分化为 $\lambda^{-\alpha}\int_{0}^{\infty}y^{\alpha-1}e^{-y}dy$，由 $\Gamma(\alpha)$ 定义即得。需验证 $\alpha>0$ 保证 $0$ 端可积，$\lambda>0$ 保证无穷端指数衰减。

- **命题三** 是二维各向同性正态的极坐标分解：$(X_{1},X_{2})$ 联合密度仅依赖 $r^{2}=x_{1}^{2}+x_{2}^{2}$，作 $(r,\theta)$ 变换 Jacobian $=r$，得 $f_{R,\Theta}(r,\theta)=f_{R}(r)f_{\Theta}(\theta)$ 分解为仅 $r$ 与仅 $\theta$ 的乘积，故 $R\perp\Theta$。而 $U=\cot\Theta$ 是 $\Theta$ 的可测函数，$V=R$ 是 $R$ 的可测函数，独立性保持。

---

## 完整证明

### 预备：奇数阶矩为零

对 $X\sim N(0,1)$，密度 $\varphi(x)=\frac{1}{\sqrt{2\pi}}e^{-x^{2}/2}$ 为偶函数，$x^{2k+1}\varphi(x)$ 为奇函数且 $\int |x|^{2k+1}\varphi(x)dx<\infty$，故 $E[X^{2k+1}]=0$。下仅证偶数阶。

---

### 命题一证法 A — 矩母函数对比系数

**引理（标准正态 MGF）**：$M_{X}(t)=E[e^{tX}]=e^{t^{2}/2}$, $t\in\mathbb{R}$。

*引理证明*：$E[e^{tX}]=\frac{1}{\sqrt{2\pi}}\int_{-\infty}^{\infty}e^{tx}e^{-x^{2}/2}dx = \frac{1}{\sqrt{2\pi}}\int e^{-(x-t)^{2}/2}e^{t^{2}/2}dx = e^{t^{2}/2}$，配方后利用正态密度积分为 $1$。$\square$

**步骤 1：$e^{t^{2}/2}$ 的幂级数展开。** 对任意 $u\in\mathbb{R}$，$e^{u}=\sum_{n=0}^{\infty}u^{n}/n!$ 全平面收敛。取 $u=t^{2}/2$，

$$
M_{X}(t)=e^{t^{2}/2}=\sum_{n=0}^{\infty}\frac{(t^{2}/2)^{n}}{n!}=\sum_{n=0}^{\infty}\frac{t^{2n}}{2^{n}n!},\quad \forall t\in\mathbb{R}. \tag{1}
$$

该级数仅含偶次幂。

**步骤 2：矩母函数的矩展开。** 若 MGF 在 $0$ 的某邻域 $(-\delta,\delta)$ 存在且有限，则它在该邻域内无穷可导且 $M_{X}^{(m)}(0)=E[X^{m}]$，从而有 Taylor 展开

$$
M_{X}(t)=\sum_{m=0}^{\infty}\frac{E[X^{m}]}{m!}t^{m},\quad |t|<\delta, \tag{2}
$$

且级数在收敛半径内唯一。由于 $X\sim N(0,1)$ 的 MGF 在全 $\mathbb{R}$ 存在，(2) 对所有 $t$ 成立（整函数）。严格论证可用控制收敛：$|X|^{m}e^{tX}$ 的期望有限，或直接引用 MGF 解析性定理。

**步骤 3：对比系数。** 幂级数展开唯一，故 (1) 与 (2) 中 $t^{m}$ 系数相等。

- 当 $m=2k+1$ 为奇数时，(1) 系数为 $0$，故 $E[X^{2k+1}]/(2k+1)!=0$，与预备一致。
- 当 $m=2k$ 为偶数时，

$$
\frac{E[X^{2k}]}{(2k)!}=\frac{1}{2^{k}k!} \implies E[X^{2k}]=\frac{(2k)!}{2^{k}k!}. \tag{3}
$$

**步骤 4：化为双阶乘。** 将 $(2k)!$ 分拆为偶数与奇数部分：

$$
(2k)! = \bigl[2k\cdot(2k-2)\cdots 2\bigr]\cdot\bigl[(2k-1)(2k-3)\cdots 1\bigr].
$$

偶数部分 $2k\cdot(2k-2)\cdots 2 = 2^{k}(k\cdot(k-1)\cdots 1)=2^{k}k!$，奇数部分即 $(2k-1)!!$。故

$$
(2k)! = 2^{k}k!\,(2k-1)!!,
$$

代入 (3) 约去 $2^{k}k!$ 得

$$
E[X^{2k}]=(2k-1)!!.
$$

$\square$

> **严谨性补注**：对比系数依赖幂级数唯一性。若 $f(t)=\sum a_{m}t^{m}=\sum b_{m}t^{m}$ 在 $0$ 的某邻域成立，则 $a_{m}=b_{m}=f^{(m)}(0)/m!$。此处 $M_{X}(t)$ 的两种表达式在 $\mathbb{R}$ 上相等，故系数必相等，无需额外交换求和与期望的论证，因为我们直接用已知的 $e^{t^{2}/2}$ 展开与 MGF 的 Taylor 定理，而非逐项取期望 $\sum E[X^{m}]t^{m}/m! = E[\sum X^{m}t^{m}/m!]$ 的交换。

---

### 命题一证法 B — 分部积分递推

**步骤 1：写成积分。**

$$
E[X^{2k}]=\frac{1}{\sqrt{2\pi}}\int_{-\infty}^{\infty}x^{2k}e^{-x^{2}/2}dx,\quad k\ge 1.
$$

积分绝对收敛：$|x|^{2k}e^{-x^{2}/2}$ 在无穷远指数衰减。

**步骤 2：构造 $u\,dv$。** 令

$$
u = x^{2k-1},\quad dv = x e^{-x^{2}/2}dx,
$$

则 $du=(2k-1)x^{2k-2}dx$, $v=-e^{-x^{2}/2}$（因 $\frac{d}{dx}e^{-x^{2}/2}=-xe^{-x^{2}/2}$）。

于是

$$
\begin{aligned}
E[X^{2k}] &= \frac{1}{\sqrt{2\pi}}\int_{-\infty}^{\infty} x^{2k-1}\cdot x e^{-x^{2}/2}dx \\
&= \frac{1}{\sqrt{2\pi}}\left[ -x^{2k-1}e^{-x^{2}/2}\right]_{-\infty}^{\infty} + \frac{1}{\sqrt{2\pi}}\int_{-\infty}^{\infty}(2k-1)x^{2k-2}e^{-x^{2}/2}dx.
\end{aligned}
\tag{4}
$$

**步骤 3：边界项为零。** 需证 $\lim_{|x|\to\infty}x^{2k-1}e^{-x^{2}/2}=0$。对 $x>0$，取对数 $\log(x^{2k-1}e^{-x^{2}/2})=(2k-1)\log x - x^{2}/2 \to -\infty$，故极限为 $0$；或反复用洛必达：$\lim_{x\to\infty}x^{n}/e^{x^{2}/2}=0$。由对称性负无穷亦为 $0$。故方括号项为 $0$。

**步骤 4：递推公式。** (4) 右端第二项恰为 $(2k-1)E[X^{2k-2}]$，故

$$
E[X^{2k}]=(2k-1)E[X^{2k-2}],\quad k\ge 1. \tag{5}
$$

**步骤 5：迭代。** $E[X^{0}]=1$（密度积分为 $1$）。反复应用 (5)：

$$
E[X^{2k}]=(2k-1)(2k-3)\cdots 3\cdot 1\cdot E[X^{0}]=(2k-1)!!.
$$

$\square$

*两种证法一致性检验*：$k=1$ 得 $E[X^{2}]=1$（方差），$k=2$ 得 $E[X^{4}]=3$（峰度 $=3$），符合已知结论。

---

### 命题二 — Gamma 积分

**定理陈述（校正版）**：对 $\alpha>0$, $\lambda>0$，

$$
I(\alpha,\lambda):=\int_{0}^{\infty}x^{\alpha-1}e^{-\lambda x}dx = \frac{\Gamma(\alpha)}{\lambda^{\alpha}}.
$$

*定义*：$\Gamma(\alpha):=\int_{0}^{\infty}y^{\alpha-1}e^{-y}dy$, $\alpha>0$。该积分在 $\alpha>0$ 时收敛：$y\to0^{+}$ 时 $y^{\alpha-1}$ 可积当且仅当 $\alpha>0$；$y\to\infty$ 时指数压倒幂。

**证明：**

作换元 $y=\lambda x$，则 $x=y/\lambda$, $dx=dy/\lambda$，当 $x:0\to\infty$ 时 $y:0\to\infty$（$\lambda>0$ 保序）。代入：

$$
\begin{aligned}
I(\alpha,\lambda) &= \int_{0}^{\infty} \left(\frac{y}{\lambda}\right)^{\alpha-1} e^{-y}\,\frac{dy}{\lambda} \\
&= \int_{0}^{\infty} \frac{y^{\alpha-1}}{\lambda^{\alpha-1}}\cdot e^{-y}\cdot\frac{dy}{\lambda} \\
&= \frac{1}{\lambda^{\alpha}}\int_{0}^{\infty} y^{\alpha-1}e^{-y}dy \\
&= \frac{\Gamma(\alpha)}{\lambda^{\alpha}}.
\end{aligned}
$$

$\square$

**注**：换元合法性由单调 $C^{1}$ 微分同胚保证，积分收敛性由 $\alpha>0,\lambda>0$ 保证。若允许 $\lambda\in\mathbb{C}$ 且 $\Re(\lambda)>0$，同式仍成立（路径积分或解析延拓）。若形式写 $\int_{-\infty}^{\infty}x^{\alpha-1}e^{-\lambda x}dx$，则：

- 当 $\alpha\notin\mathbb{Z}$ 时 $x^{\alpha-1}$ 在 $x<0$ 无实定义（需分支）；
- 当 $\alpha\le0$ 时 $0$ 点附近不可积；
- 当 $x\to -\infty$ 时 $e^{-\lambda x}=e^{|\lambda x|}\to\infty$ 发散。

故原写法必须校正为 $[0,\infty)$。这是 Gamma 积分最常见的笔误。

*推论（Gamma 分布归一化）*：密度 $f(x)=\frac{\lambda^{\alpha}}{\Gamma(\alpha)}x^{\alpha-1}e^{-\lambda x}\mathbf{1}_{x>0}$ 积分为 $1$，即 $X\sim\text{Gamma}(\alpha,\lambda)$（形状-速率参数化）。

---

### 命题三 — 比值与模的独立性

**设定**：$X_{1},X_{2}\overset{i.i.d.}{\sim} N(0,\sigma^{2})$，联合密度

$$
f_{X_{1},X_{2}}(x_{1},x_{2})=\frac{1}{2\pi\sigma^{2}}\exp\!\left(-\frac{x_{1}^{2}+x_{2}^{2}}{2\sigma^{2}}\right),\quad (x_{1},x_{2})\in\mathbb{R}^{2}. \tag{6}
$$

该密度仅依赖 $r^{2}=x_{1}^{2}+x_{2}^{2}$，具旋转不变性（各向同性）。

**极坐标变换**：定义

$$
X_{1}=R\cos\Theta,\quad X_{2}=R\sin\Theta,\quad R\ge0,\ \Theta\in[0,2\pi).
$$

逆变换在 $\mathbb{R}^{2}\setminus\{(0,0)\}$ 上为微分同胚，单点 $\{(0,0)\}$ 为零测集不影响分布。

**目标变量**：

$$
V=\sqrt{X_{1}^{2}+X_{2}^{2}}=R,\qquad U=\frac{X_{1}}{X_{2}}=\cot\Theta\quad (X_{2}\neq0).
$$

$\{X_{2}=0\}$ 概率为 $0$，可忽略。问题化为证 $R\perp \cot\Theta$。

**步骤 1：Jacobian。**

$$
J = \det\begin{pmatrix}
\frac{\partial x_{1}}{\partial r} & \frac{\partial x_{1}}{\partial\theta}\\
\frac{\partial x_{2}}{\partial r} & \frac{\partial x_{2}}{\partial\theta}
\end{pmatrix}
= \det\begin{pmatrix}
\cos\theta & -r\sin\theta\\
\sin\theta & r\cos\theta
\end{pmatrix}=r(\cos^{2}\theta+\sin^{2}\theta)=r.
$$

故 $|J|=r$。

**步骤 2：$(R,\Theta)$ 联合密度。** 由变量代换公式（在 $r>0$ 上），

$$
\begin{aligned}
f_{R,\Theta}(r,\theta) &= f_{X_{1},X_{2}}(r\cos\theta,r\sin\theta)\cdot|J|\\
&= \frac{1}{2\pi\sigma^{2}}\exp\!\left(-\frac{r^{2}}{2\sigma^{2}}\right)\cdot r,\quad r\ge0,\ \theta\in[0,2\pi). \tag{7}
\end{aligned}
$$

在 $r=0$ 或 $\theta$ 边界外密度为 $0$。

**步骤 3：分解为边缘乘积。** (7) 可写为

$$
f_{R,\Theta}(r,\theta)=\left[\frac{r}{\sigma^{2}}\exp\!\left(-\frac{r^{2}}{2\sigma^{2}}\right)\mathbf{1}_{r\ge0}\right]\cdot\left[\frac{1}{2\pi}\mathbf{1}_{0\le\theta<2\pi}\right] := f_{R}(r)\,f_{\Theta}(\theta).
$$

其中

$$
f_{R}(r)=\frac{r}{\sigma^{2}}e^{-r^{2}/(2\sigma^{2})}\mathbf{1}_{r\ge0}\quad\text{(Rayleigh 分布)},\qquad f_{\Theta}(\theta)=\frac{1}{2\pi}\mathbf{1}_{[0,2\pi)}(\theta)\quad\text{(均匀分布)}.
$$

需验证归一化：$\int_{0}^{\infty}\frac{r}{\sigma^{2}}e^{-r^{2}/(2\sigma^{2})}dr=1$（令 $u=r^{2}/(2\sigma^{2})$），$\int_{0}^{2\pi}\frac{1}{2\pi}d\theta=1$。

由联合密度可分解为仅 $r$ 与仅 $\theta$ 函数之乘积，且各自为密度，知

$$
R \perp \Theta.
$$

更形式地，对任意 Borel 集 $A\subset[0,\infty)$, $B\subset[0,2\pi)$，$P(R\in A,\Theta\in B)=\int_{A}f_{R}\int_{B}f_{\Theta}=P(R\in A)P(\Theta\in B)$。

**步骤 4：传递到 $(U,V)$。** $V=R$ 是 $R$ 的连续函数，$U=\cot\Theta$ 是 $\Theta$ 的可测函数（在 $\Theta\neq0,\pi$ 处连续，零测集可忽略）。由独立性保持：若 $R\perp\Theta$，则对任意可测 $g,h$ 有 $g(R)\perp h(\Theta)$。故

$$
V \perp U,\quad\text{即 }\sqrt{X_{1}^{2}+X_{2}^{2}}\perp \frac{X_{1}}{X_{2}}.
$$

$\square$

> **零测集细节**：$U$ 在 $X_{2}=0$（即 $\Theta=0,\pi$）无定义，但 $P(X_{2}=0)=0$ 且 $P(\Theta\in\{0,\pi\})=0$，不影响独立性定义（可任意定义 $U$ 在该零测集上的值）。严格写法可定义 $U=0$ 当 $X_{2}=0$，独立性不变。

---

## 注记与拓展

### A. 围绕命题一的拓展 — 为何要记 $(2k-1)!!$？

1. **记忆钩子**：$(2k-1)!!$ 是“奇数连乘”。$k=1,2,3,4$ 对应 $1,3,15,105$，增长极快，体现正态尾部虽轻但高阶矩仍爆炸。可用递推 $a_{k}=(2k-1)a_{k-1}$ 快速心算。

2. **与 Gamma 的联系**：由命题二可另得表达式
   $$
   E[|X|^{p}] = \frac{2^{p/2}}{\sqrt{\pi}}\Gamma\!\left(\frac{p+1}{2}\right),\quad p>-1,
   $$
   取 $p=2k$ 则 $E[X^{2k}] = \frac{2^{k}\Gamma(k+1/2)}{\sqrt{\pi}}$。利用 $\Gamma(k+1/2)=\frac{(2k)!}{4^{k}k!}\sqrt{\pi}$ 即回退到 $(2k-1)!!$。这说明**命题一是命题二的特例**，三命题内在统一。

3. **一般正态 $N(\mu,\sigma^{2})$**：若 $Y=\mu+\sigma X$，则 $E[Y^{n}]$ 可用二项展开 + 标准矩表示，或用 Hermite 多项式：$E[Y^{n}]=\sigma^{n}He_{n}(\mu/\sigma)$ 的某种形式。特别地，中心矩 $E[(Y-\mu)^{2k}]=\sigma^{2k}(2k-1)!!$，$E[(Y-\mu)^{2k+1}]=0$。方差 $\sigma^{2}$、四阶中心矩 $3\sigma^{4}$（故峰度 excess $=0$，正态为基准）。

4. **Isserlis/Wick 定理**：$(2k-1)!!$ 计数了 $2k$ 个高斯变量的配对方式数。对零均值联合正态 $(Z_{1},\dots,Z_{2k})$，$E[Z_{1}\cdots Z_{2k}]=\sum_{\text{pairings}}\prod E[Z_{i}Z_{j}]$，项数恰为 $(2k-1)!!$。当 $Z_{i}\equiv X$ 时每项为 $1$，求和即得 $E[X^{2k}]$。这是量子场论中 Wick 收缩的组合根源。

5. **矩母 vs 特征函数**：MGF 法依赖 $e^{t^{2}/2}$ 的整函数性；特征函数 $\varphi_{X}(t)=e^{-t^{2}/2}$ 恒存在，对任意分布可用，但 MGF 对重尾分布可能不存在（如 Cauchy）。正态的 MGF 全平面存在是其轻尾体现。

6. **易错点**：
   - 误将 $E[X^{2k}]=(2k-1)!!\,\sigma^{2k}$ 写成 $E[X^{2k}]=(2k-1)!!$ 对一般 $N(0,\sigma^{2})$（漏 $\sigma^{2k}$）；
   - 混淆 $X^{2k}$ 与 $|X|^{2k}$（对偶数阶无区别，奇数阶需绝对值）；
   - 双阶乘与普通阶乘混淆：$(2k)! \neq 2^{k}k!$，$2^{k}k!$ 仅为偶数部分。

7. **小练习（巩固）**：
   - 用分部积分法直接计算 $E[X^{4}]$ 并验证递推。
   - 证明 $\operatorname{Var}(X^{2})=2$，进而 $\chi^{2}_{1}$ 的方差为 $2$。
   - 设 $X\sim N(0,1)$，求 $E[e^{aX^{2}}]$ 存在的 $a$ 范围并计算（提示：积分收敛需 $a<1/2$）。

### B. 围绕命题二的拓展 — Gamma 积分的枢纽地位

1. **正态化常数的来源**：$\int_{-\infty}^{\infty}e^{-x^{2}/2}dx=\sqrt{2\pi}$ 本质是 $\Gamma(1/2)=\sqrt{\pi}$。令 $y=x^{2}/2$ 则 $dx = dy/\sqrt{2y}$，积分化为 $2\int_{0}^{\infty}e^{-y}y^{-1/2}dy/\sqrt{2}= \sqrt{2\pi}$。这再次体现命题二对正态归一化的支配。

2. **尺度变换的直观**：$f_{\lambda}(x)=\lambda^{\alpha}x^{\alpha-1}e^{-\lambda x}/\Gamma(\alpha)$ 是 $\text{Gamma}(\alpha,\lambda)$ 密度。$\lambda$ 为速率参数，$Y=\lambda X\sim\text{Gamma}(\alpha,1)$，故 $E[X^{k}]$ 的 $\lambda^{-\alpha}$ 因子是量纲分析的必然：$x$ 尺度 $\propto 1/\lambda$，积分测度 $x^{\alpha-1}dx$ 尺度 $\propto \lambda^{-\alpha}$。

3. **与 Beta 函数**：$B(p,q)=\frac{\Gamma(p)\Gamma(q)}{\Gamma(p+q)}=\int_{0}^{1}t^{p-1}(1-t)^{q-1}dt$，其证明依赖命题二的乘积积分 + 极坐标（与命题三同源）。三大命题再次闭环。

4. **常见误用**：
   - 积分限误写 $-\infty$（已校正）；
   - 记错指数：$\Gamma(\alpha)/\lambda^{\alpha}$ 而非 $\Gamma(\alpha)/\lambda^{\alpha-1}$（量纲检验：$x$ 量纲 $[L]$，$dx$ 量纲 $[L]$，左端量纲 $[L]^{\alpha}$，故右端必 $\lambda^{-\alpha}$）；
   - 混淆速率 vs 尺度参数化：若用尺度 $\theta=1/\lambda$，则积分 $=\Gamma(\alpha)\theta^{\alpha}$。

5. **推广**：
   - 不完全 Gamma：$\gamma(\alpha,\lambda x)$ 与 $\Gamma(\alpha,\lambda x)$；
   - 复参数：$\Re(\alpha)>0,\Re(\lambda)>0$ 时公式经解析延拓仍成立；
   - 多维：Dirichlet 积分 $\int_{x_{i}\ge0,\sum x_{i}=1}\prod x_{i}^{\alpha_{i}-1}dx = \prod\Gamma(\alpha_{i})/\Gamma(\sum\alpha_{i})$。

6. **小练习**：
   - 用命题二计算 $\int_{0}^{\infty}x^{n}e^{-x^{2}}dx$（令 $y=x^{2}$）。
   - 证明 $\Gamma(\alpha+1)=\alpha\Gamma(\alpha)$（分部积分，$k=1$ 情形与命题一递推同构）。
   - 设 $X\sim\text{Gamma}(\alpha,\lambda)$，求 $E[X]=\alpha/\lambda$, $\operatorname{Var}(X)=\alpha/\lambda^{2}$。

### C. 围绕命题三的拓展 — 独立性的几何与统计意义

1. **几何直观**：各向同性正态的等密度线是同心圆。半径反映“离原点多远”，角度反映“在哪个方向”。旋转不变性导致方向均匀且与距离无关。命题三是“方向与距离独立”的二维特例。

2. **分布识别**：
   - $R^{2}=X_{1}^{2}+X_{2}^{2}\sim \sigma^{2}\chi^{2}_{2}\sim\text{Exp}(\text{mean}=2\sigma^{2})$，密度 $f_{R^{2}}(y)=\frac{1}{2\sigma^{2}}e^{-y/(2\sigma^{2})}\mathbf{1}_{y>0}$；
   - $R\sim\text{Rayleigh}(\sigma)$，$E[R]=\sigma\sqrt{\pi/2}$, $\operatorname{Var}(R)=\sigma^{2}(2-\pi/2)$；
   - $U=X_{1}/X_{2}\sim\text{Cauchy}(0,1)$，密度 $f_{U}(u)=\frac{1}{\pi(1+u^{2})}$，与 $\sigma$ 无关（尺度消去）—— 这是**辅助统计量**的典型：分布不依赖参数 $\sigma$；
   - $\Theta\sim\text{Unif}[0,2\pi)$，$\cot\Theta$ 的 Cauchy 性可由均匀经 $\cot$ 变换直接推出。

3. **与 Basu 定理的联系**：对 $N(0,\sigma^{2})$ 样本，$V^{2}=X_{1}^{2}+X_{2}^{2}$ 是 $\sigma^{2}$ 的完备充分统计量，而 $U=X_{1}/X_{2}$（或等价地 $X_{1}^{2}/(X_{1}^{2}+X_{2}^{2})\sim\text{Beta}(1/2,1/2)$）是辅助统计量（分布与 $\sigma^{2}$ 无关）。Basu 定理断言完备充分与辅助独立，命题三是其 $n=2$ 的具体验证。推广到 $n$ 维：$\bar{X}$ 与样本方差独立、方向 $\mathbf{X}/\|\mathbf{X}\|$ 与 $\|\mathbf{X}\|$ 独立均属同族。

4. **Box-Muller 变换**：命题三的逆用即 Box-Muller 算法：若 $U_{1},U_{2}\overset{i.i.d.}{\sim}\text{Unif}(0,1)$，则 $R=\sqrt{-2\log U_{1}}$, $\Theta=2\pi U_{2}$，则 $R\cos\Theta,R\sin\Theta\overset{i.i.d.}{\sim}N(0,1)$。这正是极坐标分解的构造性证明。

5. **高维推广**：设 $\mathbf{X}\sim N_{n}(\mathbf{0},\sigma^{2}I_{n})$，则 $\|\mathbf{X}\|$ 与 $\mathbf{X}/\|\mathbf{X}\|$（单位球面均匀分布）独立，且 $\|\mathbf{X}\|^{2}/\sigma^{2}\sim\chi^{2}_{n}$。证明同样用 $n$ 维球坐标 Jacobian $r^{n-1}\times$ 角度因子。

6. **易错点**：
   - 误以为 $X_{1}/X_{2}$ 与 $X_{1}^{2}+X_{2}^{2}$ 的独立性对任意分布成立（否，极度依赖正态的球对称性；对 $t$ 分布等则不独立）；
   - 忽略零测集 $X_{2}=0$ 的处理，严格需说明 $P(X_{2}=0)=0$；
   - Jacobian 符号：面积元 $dx_{1}dx_{2}=r\,dr\,d\theta$，漏 $r$ 则得错误边缘；
   - 混淆 $\Theta\in[0,2\pi)$ 与 $[-\pi,\pi)$ 的均匀性（等价，仅区间平移）。

7. **小练习**：
   - 证明 $\frac{X_{1}^{2}}{X_{1}^{2}+X_{2}^{2}}\sim\text{Beta}(1/2,1/2)$（即反正弦分布）且与 $X_{1}^{2}+X_{2}^{2}$ 独立。
   - 设 $X_{1},X_{2}\overset{i.i.d.}{\sim}N(0,1)$，求 $P(X_{1}/X_{2}>1)$（利用 Cauchy 或角度均匀性，答案 $1/4$）。
   - 推广：对 $n=3$，说明球坐标中 $R$ 与方向独立，并写出 $R$ 的密度（Maxwell 分布）。

### D. 三命题的内在统一 — 一张图串联

```
命题二 Gamma 积分  ──→  正态归一化常数 √(2π)  ──→  命题一 矩计算中的 E[X^0]=1
      │                                              │
      └────→  χ²/Rayleigh 密度归一  ←──  命题三 极坐标 Jacobian r dr dθ
                     │
                     └────→  Beta/Cauchy 辅助统计量
```

换言之，Gamma 积分是“母积分”，正态矩与极坐标分解都是它的推论与应用。记住这一脉络，三个公式不再孤立。

---

## 参考文献

1. Durrett, R. *Probability: Theory and Examples*, 5th ed., Cambridge, 2019. Sec. 2.2 (MGF), Sec. 3.3 (Gaussian).
2. Billingsley, P. *Probability and Measure*, 3rd ed., Wiley, 1995. Chap. 21 (Gamma), Chap. 18 (变换公式).
3. Casella, G. & Berger, R. L. *Statistical Inference*, 2nd ed., Duxbury, 2002. Sec. 2.1 (Gamma/Beta), Sec. 5.6 (Basu 定理), Example 5.3.9 (Box-Muller).
4. Feller, W. *An Introduction to Probability Theory and Its Applications*, Vol. II, Wiley, 1971. Chap. VII (正态矩与配对组合).
5. Wikipedia, "Normal distribution", "Gamma function", "Rayleigh distribution", "Cauchy distribution", "Basu's theorem", 访问日期 2026-08-25.

---

## 复盘

- **难点**：
  - 命题一 MGF 法需点明幂级数唯一性而非形式对比，分部积分法需严格处理边界项 $x^{2k-1}e^{-x^{2}/2}\to0$。
  - 命题二看似平凡，但原命题积分限笔误是典型坑点，需从定义域与收敛性双重证伪。
  - 命题三 Jacobian 的 $r$ 因子遗漏会导致边缘非归一；零测集 $\{X_{2}=0\}$ 需显式说明不影响独立性。

- **易错点**：
  - 双阶乘 $(2k-1)!!$ 与 $(2k)!/(2^{k}k!)$ 互化时丢 $2^{k}$；
  - Gamma 积分指数 $\lambda^{\alpha}$ 在分子分母颠倒；
  - 误将 $R\perp\Theta \implies g(R)\perp h(\Theta)$ 当作显然，需引用“独立随机变量的可测函数仍独立”定理。

- **延伸思考**：
  - 若 $X_{1},X_{2}\sim N(0,\sigma^{2})$ 但相关系数 $\rho\neq0$，则 $X_{1}/X_{2}$ 与 $\sqrt{X_{1}^{2}+X_{2}^{2}}$ 是否仍独立？（否，联合密度等高线为椭圆，角度不再均匀）
  - 试用特征函数法重证 $X_{1}/X_{2}\sim\text{Cauchy}$：$E[e^{itX_{1}/X_{2}}|X_{2}]=e^{-\sigma^{2}t^{2}/(2X_{2}^{2})}$ 再对 $X_{2}$ 积分。
  - 对 $n$ 维样本，$\bar{X}$ 与 $S^{2}$ 独立的证明与本题有何同构之处？（正交变换 + 球对称性）


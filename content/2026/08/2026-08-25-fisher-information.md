---
title: "Fisher 信息量的两种等价形式及其推导"
date: 2026-08-25
area: 统计学
tags: [Fisher信息, 得分函数, 正则条件, Cramér-Rao]
difficulty: "★★☆"
statement: "在正则条件下，Fisher信息量满足 I(θ)=E_θ[(∂log f(X;θ)/∂θ)²]=−E_θ[∂²log f(X;θ)/∂θ²]；对定域参数向量，I(θ)_{ij}=E[∂_i l ∂_j l]=−E[∂²_{ij}l]；对i.i.d.样本 I_n(θ)=nI_1(θ)"
---

# Fisher 信息量的两种等价形式及其推导

> **结论（精确陈述）**：设参数族 $\{f(x;\theta):\theta\in\Theta\}$ 关于某 $\sigma$-有限测度 $\mu$（离散时为计数测度，连续时为 Lebesgue 测度）有密度 $f(x;\theta)$，$\Theta\subset\mathbb{R}$ 为开区间（向量情形 $\Theta\subset\mathbb{R}^{d}$ 开集）。记对数似然 $l(\theta;x):=\log f(x;\theta)$，得分函数（score）$S(\theta;x):=\partial l(\theta;x)/\partial\theta$。
>
> 在如下正则条件下：
> 1. **支撑无关**：$\{x:f(x;\theta)>0\}$ 不依赖 $\theta$；
> 2. **可微性**：对每个 $\theta$，$f(x;\theta)$ 关于 $\theta$ 二次连续可微，且 $l(\theta;x)$ 一阶、二阶偏导存在；
> 3. **可交换性**：积分与求导可交换，即 $\partial_{\theta}\int g(x;\theta)d\mu(x)=\int\partial_{\theta}g(x;\theta)d\mu(x)$ 对 $g=f$ 与 $g=\partial_{\theta}f$ 成立，且期望有限：$E_{\theta}[|S|]<\infty,\ E_{\theta}[S^{2}]<\infty,\ E_{\theta}[|\partial^{2}l|]<\infty$；
> 4. **可积控制**（充分条件）：存在可积控制函数使 Leibniz 积分号下求导合法（见注记）；
>
> 则 Fisher 信息量（单参数）的两种形式等价：
>
> $$
> \mathcal{I}(\theta):=E_{\theta}\!\left[S(\theta;X)^{2}\right]=E_{\theta}\!\left[\left(\frac{\partial}{\partial\theta}\log f(X;\theta)\right)^{2}\right] = -E_{\theta}\!\left[\frac{\partial^{2}}{\partial\theta^{2}}\log f(X;\theta)\right]=\operatorname{Var}_{\theta}(S(\theta;X)).
> $$
>
> 向量参数 $\boldsymbol{\theta}=(\theta_{1},\dots,\theta_{d})^{\top}$ 时，Fisher 信息矩阵
>
> $$
> \mathcal{I}(\boldsymbol{\theta})_{ij}=E_{\theta}[\partial_{i}l\,\partial_{j}l]=-E_{\theta}[\partial_{ij}^{2}l],\quad \partial_{i}:=\partial/\partial\theta_{i}.
> $$
>
> 对 $n$ 个 i.i.d. 样本 $\mathbf{X}=(X_{1},\dots,X_{n})$，$\mathcal{I}_{n}(\theta)=n\,\mathcal{I}_{1}(\theta)$。

---

## 证明思路（Sketch）

- **起点恒等式**：$\int f(x;\theta)d\mu(x)=1$ 对 $\theta$ 求导，利用“积分号下求导”得 $\int\partial_{\theta}f=0$，改写为得分均值为零：$E_{\theta}[S]=0$。
- **再求一次导**：对 $\int\partial_{\theta}f=0$ 再求导得 $\int\partial^{2}_{\theta}f=0$，将 $\partial^{2}f$ 用 $l=\log f$ 展开：$\partial^{2}f = f\big(\partial^{2}l+(\partial l)^{2}\big)$，积分后分离即得 $E[(\partial l)^{2}]=-E[\partial^{2}l]$。
- **关键点**：支撑无关保证求导不产生边界项；可交换性保证 $\int\partial f = \partial\int f$。向量与样本情形为直和推广。
- **需引用**：Leibniz 积分号下求导（控制收敛定理）、链式法则 $\partial f = f\,\partial l$。

---

## 完整证明

### 预备：记号与恒等式

记 $f_{\theta}(x):=f(x;\theta)$，$l_{\theta}(x):=\log f_{\theta}(x)$，定义域内 $f_{\theta}(x)>0$（支撑无关故可全支撑上取对数）。有

$$
S_{\theta}(x):=\partial_{\theta}l_{\theta}(x)=\frac{\partial_{\theta}f_{\theta}(x)}{f_{\theta}(x)},\quad \text{即 }\partial_{\theta}f_{\theta}=f_{\theta}S_{\theta}. \tag{*}
$$

二阶：

$$
\partial^{2}_{\theta}l_{\theta}= \partial_{\theta}\!\left(\frac{\partial_{\theta}f_{\theta}}{f_{\theta}}\right)=\frac{\partial^{2}_{\theta}f_{\theta}}{f_{\theta}}-\left(\frac{\partial_{\theta}f_{\theta}}{f_{\theta}}\right)^{2}= \frac{\partial^{2}_{\theta}f_{\theta}}{f_{\theta}}-S_{\theta}^{2}. \tag{**}
$$

故

$$
\partial^{2}_{\theta}f_{\theta}=f_{\theta}\big(\partial^{2}_{\theta}l_{\theta}+S_{\theta}^{2}\big). \tag{***}
$$

---

### 步骤 1：得分均值为零

由密度归一化，对任意 $\theta\in\Theta$，

$$
\int f_{\theta}(x)\,d\mu(x)=1. \tag{1}
$$

在正则条件 3 下，对 $\theta$ 求导并交换积分与求导：

$$
0=\partial_{\theta}1=\partial_{\theta}\int f_{\theta}d\mu = \int\partial_{\theta}f_{\theta}\,d\mu.
$$

用 (*) 代入 $\partial_{\theta}f_{\theta}=f_{\theta}S_{\theta}$：

$$
\int S_{\theta}(x)\,f_{\theta}(x)\,d\mu(x)=E_{\theta}[S_{\theta}(X)]=0. \tag{2}
$$

故 $\operatorname{Var}_{\theta}(S_{\theta})=E_{\theta}[S_{\theta}^{2}]-0=E_{\theta}[S_{\theta}^{2}]$，第一种形式即得分方差。

> **注**：若支撑依赖 $\theta$，则 $\int f_{\theta}=1$ 的求导会产生边界项，例如 $\text{Unif}(0,\theta)$ 的 $f_{\theta}(x)=\theta^{-1}\mathbf{1}_{(0,\theta)}(x)$，$\partial_{\theta}\int f$ 不能直接移入积分号，$E[S]\neq0$，Fisher 两种形式不等——正则条件 1 不可少。

### 步骤 2：二阶恒等式与两种形式相等

对 $\int\partial_{\theta}f_{\theta}d\mu=0$ 再关于 $\theta$ 求导（再次交换）：

$$
0=\partial_{\theta}\int\partial_{\theta}f_{\theta}d\mu = \int\partial^{2}_{\theta}f_{\theta}\,d\mu. \tag{3}
$$

将 (***) 代入：

$$
0=\int f_{\theta}(x)\big(\partial^{2}_{\theta}l_{\theta}(x)+S_{\theta}(x)^{2}\big)d\mu(x)=E_{\theta}[\partial^{2}_{\theta}l_{\theta}(X)]+E_{\theta}[S_{\theta}(X)^{2}].
$$

移项即得

$$
E_{\theta}[S_{\theta}(X)^{2}] = -E_{\theta}[\partial^{2}_{\theta}l_{\theta}(X)]. \tag{4}
$$

左端即定義 $\mathcal{I}(\theta)=E[S^{2}]$，右端为二阶形式。结合 (2) 亦有 $\mathcal{I}(\theta)=\operatorname{Var}(S_{\theta})$。

$\square$

---

### 推广 A：向量参数 Fisher 信息矩阵

设 $\boldsymbol{\theta}\in\mathbb{R}^{d}$，$l(\boldsymbol{\theta};x)=\log f(x;\boldsymbol{\theta})$，$\partial_{i}:=\partial/\partial\theta_{i}$。正则条件逐分量成立。同理

$$
\int f\,d\mu=1 \implies \int\partial_{i}f\,d\mu=0\implies E[\partial_{i}l]=0,
$$

$$
0=\partial_{j}\int\partial_{i}f\,d\mu=\int\partial^{2}_{ji}f\,d\mu.
$$

而

$$
\partial_{i}l=\frac{\partial_{i}f}{f},\quad \partial^{2}_{ji}l=\frac{\partial^{2}_{ji}f}{f}-\frac{\partial_{j}f}{f}\frac{\partial_{i}f}{f}= \frac{\partial^{2}_{ji}f}{f}-(\partial_{j}l)(\partial_{i}l),
$$

故 $\partial^{2}_{ji}f=f(\partial^{2}_{ji}l+(\partial_{j}l)(\partial_{i}l))$，积分得

$$
0=E[\partial^{2}_{ji}l]+E[(\partial_{j}l)(\partial_{i}l)],
$$

即

$$
\mathcal{I}(\boldsymbol{\theta})_{ij}:=E[(\partial_{i}l)(\partial_{j}l)]=-E[\partial^{2}_{ij}l]. \tag{5}
$$

矩阵对称半正定；正则时正定。对称性由 $l$ 二阶连续可微（Schwarz 定理）保证。

### 推广 B：i.i.d. 样本的可加性

设 $\mathbf{X}=(X_{1},\dots,X_{n})$ i.i.d. $\sim f(x;\theta)$，联合密度 $f_{n}(\mathbf{x};\theta)=\prod_{k=1}^{n}f(x_{k};\theta)$，联合对数似然

$$
l_{n}(\theta;\mathbf{X})=\sum_{k=1}^{n}l(\theta;X_{k}),\quad S_{n}(\theta)=\sum_{k=1}^{n}S(\theta;X_{k}),\quad \partial^{2}l_{n}=\sum_{k=1}^{n}\partial^{2}l(\theta;X_{k}).
$$

由独立同分布及 $E[S]=0$：

$$
\mathcal{I}_{n}(\theta)= \operatorname{Var}(S_{n}) = \sum_{k=1}^{n}\operatorname{Var}(S(\theta;X_{k})) = n\,\mathcal{I}_{1}(\theta),
$$

且

$$
-E[\partial^{2}l_{n}] = -\sum_{k=1}^{n}E[\partial^{2}l(\theta;X_{k})] = n(-E[\partial^{2}l]) = n\mathcal{I}_{1}(\theta).
$$

故两种形式均有 $\mathcal{I}_{n}=n\mathcal{I}_{1}$。向量情形同理 $\mathcal{I}_{n}=n\mathcal{I}_{1}$（矩阵）。

---

### 例：验证两种形式一致

**例 1 — Bernoulli**：$X\sim\text{Ber}(p)$，$f(x;p)=p^{x}(1-p)^{1-x}$，$x\in\{0,1\}$，$p\in(0,1)$。$l=x\log p+(1-x)\log(1-p)$，$S=x/p-(1-x)/(1-p)=(x-p)/[p(1-p)]$，$E[S^{2}]=E[(X-p)^{2}]/[p^{2}(1-p)^{2}]=p(1-p)/[p^{2}(1-p)^{2}]=1/[p(1-p)]$。二阶：$\partial^{2}l=-x/p^{2}-(1-x)/(1-p)^{2}$，$-E[\partial^{2}l]=E[X]/p^{2}+E[1-X]/(1-p)^{2}=1/[p(1-p)]$，一致。$\mathcal{I}_{n}=n/[p(1-p)]$。

**例 2 — 正态 $N(\mu,\sigma^{2})$ 已知 $\sigma^{2}$**：$l=-\tfrac12\log(2\pi\sigma^{2})-(x-\mu)^{2}/(2\sigma^{2})$，$S=(x-\mu)/\sigma^{2}$，$E[S^{2}]=1/\sigma^{2}$，$\partial^{2}l=-1/\sigma^{2}$，$-E[\partial^{2}l]=1/\sigma^{2}$。

**例 3 — 正态 $N(0,\sigma^{2})$ 未知 $\sigma^{2}$ 令 $\theta=\sigma^{2}$**：计算得 $\mathcal{I}(\theta)=1/(2\theta^{2})$。

**反例 — 非正则**：$X\sim\text{Unif}(0,\theta)$，$f_{\theta}(x)=\theta^{-1}\mathbf{1}_{(0,\theta)}$，支撑依赖 $\theta$，$l=-\log\theta$（在支撑内），$S=-1/\theta$，$E[S^{2}]=1/\theta^{2}$，但 $\partial^{2}l=0$，$-E[\partial^{2}l]=0\neq1/\theta^{2}$，等式失效。此时 Fisher 信息应通过 $\operatorname{Var}(S)$ 定义以外的方式或用更一般的定义。

---

## 注记与拓展

- **正则条件的严格表述（Leibniz 条件）**：交换 $\partial_{\theta}\int f_{\theta}=\int\partial_{\theta}f_{\theta}$ 需控制收敛定理。充分条件：存在 $\theta_{0}$ 邻域 $U$ 及可积函数 $g(x)$ 使 $|\partial_{\theta}f(x;\theta)|\le g(x)$ 且 $|\partial^{2}_{\theta}f(x;\theta)|\le g(x)$ 对 $\theta\in U$ 一致成立，且 $f_{\theta}$ 关于 $\theta$ 可微。连续情形常用“$f$ 二次连续可微且 $|\partial^{k}f|$ 被可积函数控制”。离散求和情形自动可交换（有限和）或需一致可和。

- **观测信息 vs 期望信息**：$J_{n}(\theta):=-\partial^{2}l_{n}(\theta)$ 称为观测 Fisher 信息（observed information），$\mathcal{I}_{n}(\theta)=E[J_{n}(\theta)]$ 为期望信息。大样本下 $J_{n}(\hat\theta)/n \xrightarrow{P}\mathcal{I}_{1}(\theta_{0})$，二者在渐近方差估计中可互换，但有限样本有别（Efron-Hinkley 争论）。

- **Cramér-Rao 下界**：正则下无偏估计 $T$ 满足 $\operatorname{Var}_{\theta}(T)\ge 1/\mathcal{I}_{n}(\theta)$（单参数），等号成立 iff $T$ 为得分的线性函数，即指数族的完备充分统计量。Fisher 信息越大，参数越易估计。

- **得分均值为零的统计意义**：$E[S]=0$ 意味着似然在真值处一阶平均无漂移；$\operatorname{Var}(S)=\mathcal{I}$ 量化了似然的平均曲率——二阶形式 $-E[\partial^{2}l]$ 正是平均曲率的负值，曲率越大信息越多。

- **常见误用/易错点**：
  - 漏验证支撑无关：对截断分布、均匀分布等直接套用 $-E[\partial^{2}l]$ 会得错误 Fisher 信息。
  - 混淆 $\mathcal{I}_{n}$ 与 $\mathcal{I}_{1}$：样本量 $n$ 因子易漏，导致渐近方差差 $n$ 倍。
  - 符号错误：$ \mathcal{I}=-E[\partial^{2}l]$ 有负号，$\partial^{2}l$ 本身通常为负（对数似然凹）。
  - 向量情形误将 $\mathcal{I}_{ij}=E[\partial_{i}l\,\partial_{j}l]$ 写成 $E[\partial^{2}_{ij}l]$（漏负号）。
  - 在非 i.i.d. 或非正则模型中强行用 $\mathcal{I}_{n}=n\mathcal{I}_{1}$。

- **与 KL 散度的联系**：$\mathcal{I}(\theta)$ 是 KL 散度 $D(f_{\theta}\|f_{\theta+\delta})$ 在 $\delta=0$ 处的二阶 Taylor 系数：$D\approx \tfrac12\delta^{\top}\mathcal{I}(\theta)\delta$。故 Fisher 信息是参数流形上的黎曼度量（信息几何）。

- **与下一条目的衔接**：MLE 渐近方差为 $\mathcal{I}_{n}^{-1}$，其推导同时用到两种形式——得分的方差（CLT）与 Hessian 的期望（LLN），二者相等正是推导自洽的关键。

- **小练习**：
  1. 设 $X\sim\text{Poisson}(\lambda)$，用两种形式分别计算 $\mathcal{I}_{1}(\lambda)$ 并验证相等（答案 $1/\lambda$）。
  2. 设 $X\sim\text{Exp}(\lambda)$（速率参数化），求 $\mathcal{I}_{1}(\lambda)=1/\lambda^{2}$。
  3. 构造一个支撑依赖 $\theta$ 但仍可定义 Fisher 信息的例子，说明需用 $L^{2}$ 导数定义而非本课形式。

---

## 参考文献

1. Casella, G. & Berger, R. L. *Statistical Inference*, 2nd ed., Duxbury, 2002. Sec. 7.3 (Fisher 信息, 正则条件), Thm. 7.3.9 (Cramér-Rao).
2. Lehmann, E. L. & Casella, G. *Theory of Point Estimation*, 2nd ed., Springer, 1998. Chap. 2.5–2.6 (得分与信息, 可加性).
3. Bickel, P. J. & Doksum, K. A. *Mathematical Statistics: Basic Ideas and Selected Topics*, Vol. 1, 2nd ed., Pearson, 2015. Sec. 3.3 (Leibniz 条件与信息等式).
4. Efron, B. & Hinkley, D. V. "Assessing the accuracy of the maximum likelihood estimator: Observed versus expected Fisher information", *Biometrika* 65(3), 1978.
5. Wikipedia, "Fisher information", "Score (statistics)", 访问日期 2026-08-25.

---

## 复盘

- 难点：严格区分“定义”与“等式”——$E[S^{2}]$ 是定义，$-E[\partial^{2}l]$ 是在正则下推出的等价形式，非定义本身；交换积分与求导是全部推导的唯一分析学支点。
- 易错点：支撑无关的检验常被省略；负号遗漏；$n$ 因子混淆。
- 延伸思考：若用 $L^{2}$ 可微（Hellinger 可微）定义 Fisher 信息，非正则模型的“信息”是否仍存在？与本课两种形式的差异何在？这通向 Le Cam 的局部渐近正态（LAN）理论。

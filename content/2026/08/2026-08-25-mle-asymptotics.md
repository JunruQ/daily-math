---
title: "MLE 的渐近正态性与渐近有效性"
date: 2026-08-25
area: 统计学
tags: [极大似然估计, 渐近正态性, Fisher信息, 中心极限定理, Slutsky]
difficulty: "★★★"
statement: "在 Cramér 正则条件下，i.i.d. 样本的 MLE 满足一致性与渐近正态性：√n(θ̂_n−θ_0)→ᵈ N(0, I_1(θ_0)⁻¹)；向量参数时 √n(θ̂_n−θ_0)→ᵈ N_d(0, I_1(θ_0)⁻¹)，达到 Cramér-Rao 下界，渐近有效"
---

# MLE 的渐近正态性与渐近有效性

> **结论（精确陈述）**：设 $X_{1},\dots,X_{n}\overset{i.i.d.}{\sim} f(x;\theta_{0})$，$\theta_{0}\in\Theta\subset\mathbb{R}^{d}$ 为真值，$\Theta$ 开集。记对数似然 $l_{n}(\theta)=\sum_{i=1}^{n}\log f(X_{i};\theta)$，得分 $S_{n}(\theta)=\nabla l_{n}(\theta)$，Hessian $H_{n}(\theta)=\nabla^{2}l_{n}(\theta)$，单样本 Fisher 信息 $\mathcal{I}_{1}(\theta)=E_{\theta}[\nabla\log f\,\nabla\log f^{\top}]=-E_{\theta}[\nabla^{2}\log f]$。
>
> 在 Cramér 正则条件下（见完整证明前）：
> 1. **一致性**：MLE $\hat\theta_{n}:=\arg\max_{\theta\in\Theta}l_{n}(\theta)$（或得分方程 $S_{n}(\hat\theta_{n})=0$ 的相合根）满足 $\hat\theta_{n}\xrightarrow{P_{\theta_{0}}}\theta_{0}$。
> 2. **渐近正态性**：
>
> $$
> \sqrt{n}\,(\hat\theta_{n}-\theta_{0})\xrightarrow{d} N_{d}\!\left(\mathbf{0},\ \mathcal{I}_{1}(\theta_{0})^{-1}\right),\qquad n\to\infty.
> $$
>
> 单参数时即 $\sqrt{n}(\hat\theta_{n}-\theta_{0})\xrightarrow{d}N(0,1/\mathcal{I}_{1}(\theta_{0}))$，且 $\operatorname{Var}(\hat\theta_{n})\approx 1/(n\mathcal{I}_{1}(\theta_{0}))$ 达到 Cramér-Rao 下界，称**渐近有效**。
>
> 等价表述：$\hat\theta_{n}\stackrel{a}{\sim}N(\theta_{0},\mathcal{I}_{n}(\theta_{0})^{-1})$，其中 $\mathcal{I}_{n}=n\mathcal{I}_{1}$；Wald 统计量 $(\hat\theta_{n}-\theta_{0})^{\top}\mathcal{I}_{n}(\hat\theta_{n})(\hat\theta_{n}-\theta_{0})\xrightarrow{d}\chi^{2}_{d}$。

---

## 证明思路（Sketch）

- **核心恒等式**：MLE 满足得分方程 $S_{n}(\hat\theta_{n})=0$。在真值 $\theta_{0}$ 处对 $S_{n}$ 作一阶 Taylor 展开：
  $$
  0=S_{n}(\hat\theta_{n})=S_{n}(\theta_{0})+H_{n}(\tilde\theta_{n})(\hat\theta_{n}-\theta_{0}),
  $$
  其中 $\tilde\theta_{n}$ 在 $\hat\theta_{n}$ 与 $\theta_{0}$ 之间（中值定理，逐分量或积分余项）。

- **变形**：
  $$
  \sqrt{n}(\hat\theta_{n}-\theta_{0})=\left(-\frac{1}{n}H_{n}(\tilde\theta_{n})\right)^{-1}\cdot\frac{1}{\sqrt{n}}S_{n}(\theta_{0}).
  $$

- **两大极限定理分别处理分子分母**：
  - **分子**：$S_{n}(\theta_{0})=\sum_{i=1}^{n}\nabla\log f(X_{i};\theta_{0})$ 为 i.i.d. 零均值和（由 $E[\nabla\log f]=0$），方差 $\mathcal{I}_{1}(\theta_{0})$，由**中心极限定理** $\frac{1}{\sqrt{n}}S_{n}(\theta_{0})\xrightarrow{d}N(0,\mathcal{I}_{1}(\theta_{0}))$。
  - **分母**：$-\frac1n H_{n}(\theta_{0})=-\frac1n\sum\nabla^{2}\log f(X_{i};\theta_{0})\xrightarrow{P}\mathcal{I}_{1}(\theta_{0})$ 由**大数定律**（因 $-E[\nabla^{2}\log f]=\mathcal{I}_{1}$，即 Fisher 第二形式）。再由一致性 $\tilde\theta_{n}\xrightarrow{P}\theta_{0}$ 与 Hessian 的一致连续性/控制条件，得 $-\frac1n H_{n}(\tilde\theta_{n})\xrightarrow{P}\mathcal{I}_{1}(\theta_{0})$。

- **Slutsky 合并**：$A_{n}^{-1}B_{n}\xrightarrow{d}\mathcal{I}_{1}^{-1}\cdot N(0,\mathcal{I}_{1})=N(0,\mathcal{I}_{1}^{-1})$。方差结构 $\mathcal{I}_{1}^{-1}\mathcal{I}_{1}\mathcal{I}_{1}^{-1}=\mathcal{I}_{1}^{-1}$。

- **关键衔接**：Fisher 两种形式 $E[S S^{\top}]=-E[H_{1}]$ 保证 CLT 的方差与 LLN 的极限恰为同一矩阵，推导自洽。

---

## 完整证明

### Cramér 正则条件（充分条件集）

为使上述交换与极限定理合法，假设：

- **(C1) 辨识性与内点**：$\theta_{0}\in\operatorname{int}\Theta$，$f(x;\theta)\neq f(x;\theta_{0})$ 当 $\theta\neq\theta_{0}$ 在正测集上，且 $\Theta$ 开集。
- **(C2) 光滑性**：对 $\mu$-a.e. $x$，$l(\theta;x)=\log f(x;\theta)$ 关于 $\theta$ 三次连续可微。
- **(C3) 积分可交换**：支撑 $\{f>0\}$ 与 $\theta$ 无关，且 $\int\partial_{\theta}f\,d\mu$、$\int\partial^{2}_{\theta}f\,d\mu$ 可交换（同前一条 Fisher 推导的正则条件），故 $E_{\theta_{0}}[\nabla l]=0$ 且 $\mathcal{I}_{1}(\theta_{0})=-E[\nabla^{2}l]$。
- **(C4) 矩与控制**：$\mathcal{I}_{1}(\theta_{0})$ 有限正定，且存在 $\theta_{0}$ 邻域 $U$ 与可积控制函数 $M(x)$ 使 $\sup_{\theta\in U}\|\partial^{3}l(\theta;x)\|\le M(x)$，$E_{\theta_{0}}[M(X)]<\infty$，且 $E_{\theta_{0}}[\|\nabla l\|^{2}]<\infty$, $E_{\theta_{0}}[\|\nabla^{2}l\|]<\infty$。
- **(C5) 一致性**：MLE 相合（在 (C1)–(C4) 及紧性/一致大数下可证，此处作为前提；完整一致性证明需 Wald 一致性定理，本文引用）。

> **注**：存在多种等价的正则条件表述（Lehmann-Casella, van der Vaart, Bickel-Doksum）。关键是保证 Taylor 余项可控与 Hessian 一致收敛。非正则模型（支撑依赖 $\theta$、真值在边界、信息奇异）不满足，渐近分布非正态（见注记）。

下设 $d=1$ 详证，向量情形末尾说明。

---

### 步骤 1：得分方程的 Taylor 展开

设 $\hat\theta_{n}$ 满足 $S_{n}(\hat\theta_{n})=0$（若似然在内部取极大；边界情形概率趋于 $0$）。由中值定理，存在 $\tilde\theta_{n}$ 介于 $\hat\theta_{n}$ 与 $\theta_{0}$ 之间（随机）使

$$
0=S_{n}(\hat\theta_{n})=S_{n}(\theta_{0})+H_{n}(\tilde\theta_{n})(\hat\theta_{n}-\theta_{0}), \tag{1}
$$

其中 $S_{n}(\theta)=\sum_{i=1}^{n}S(X_{i};\theta)$, $S(x;\theta)=\partial_{\theta}l(\theta;x)$, $H_{n}(\theta)=\sum_{i=1}^{n}H(X_{i};\theta)$, $H(x;\theta)=\partial^{2}_{\theta}l(\theta;x)$。

若 $\hat\theta_{n}$ 为向量，中值定理逐分量得到不同 $\tilde\theta_{n}^{(j)}$，或用积分余项 $H_{n}(\tilde\theta_{n})=\int_{0}^{1}H_{n}(\theta_{0}+t(\hat\theta_{n}-\theta_{0}))dt$，结论相同。

改写 (1)（当 $H_{n}(\tilde\theta_{n})\neq0$，该事件概率 $\to1$）：

$$
\sqrt{n}(\hat\theta_{n}-\theta_{0}) = \left(-\frac{1}{n}H_{n}(\tilde\theta_{n})\right)^{-1}\frac{1}{\sqrt{n}}S_{n}(\theta_{0}). \tag{2}
$$

目标：证明右端两因子分别依概率收敛与依分布收敛，再用 Slutsky。

### 步骤 2：得分的 CLT

记 $S_{i}:=S(X_{i};\theta_{0})=\partial_{\theta}\log f(X_{i};\theta_{0})$。由正则条件 (C3)，

$$
E_{\theta_{0}}[S_{i}]=0,\qquad \operatorname{Var}_{\theta_{0}}(S_{i})=E[S_{i}^{2}]=\mathcal{I}_{1}(\theta_{0})\ (\text{Fisher 第一形式}),
$$

且 $0<\mathcal{I}_{1}<\infty$。$\{S_{i}\}$ i.i.d. 零均值有限方差，由 Lindeberg-Lévy CLT：

$$
\frac{1}{\sqrt{n}}S_{n}(\theta_{0}) = \frac{1}{\sqrt{n}}\sum_{i=1}^{n}S_{i}\xrightarrow{d} N\!\left(0,\mathcal{I}_{1}(\theta_{0})\right). \tag{3}
$$

向量情形：$\mathbf{S}_{i}:=\nabla l(\theta_{0};X_{i})\in\mathbb{R}^{d}$，$E[\mathbf{S}_{i}]=0$, $\operatorname{Cov}(\mathbf{S}_{i})=\mathcal{I}_{1}(\theta_{0})$，多元 CLT 得 $\frac1{\sqrt{n}}\mathbf{S}_{n}\xrightarrow{d}N_{d}(0,\mathcal{I}_{1})$。

### 步骤 3：Hessian 的 LLN 及其在 $\tilde\theta_{n}$ 处的一致收敛

**在真值处**：$H_{i}:=H(X_{i};\theta_{0})$，$E[H_{i}]=E[\partial^{2}l(\theta_{0};X_{i})]=-\mathcal{I}_{1}(\theta_{0})$（Fisher 第二形式）。由 Kolmogorov SLLN / WLLN：

$$
-\frac1n H_{n}(\theta_{0}) = -\frac1n\sum_{i=1}^{n}H_{i}\xrightarrow{P} \mathcal{I}_{1}(\theta_{0}). \tag{4}
$$

**在 $\tilde\theta_{n}$ 处**：需证 $-\frac1n H_{n}(\tilde\theta_{n})\xrightarrow{P}\mathcal{I}_{1}(\theta_{0})$。利用三阶控制与一致性。

对任意 $\theta$ 在 $U$ 内，Taylor 展开 $H(\theta;x)$ 在 $\theta_{0}$ 处：

$$
H(\theta;x)=H(\theta_{0};x)+\partial^{3}l(\bar\theta;x)(\theta-\theta_{0}),
$$

其中 $\bar\theta$ 在 $\theta_{0}$ 与 $\theta$ 之间。由 (C4)，$|\partial^{3}l(\bar\theta;x)|\le M(x)$，故

$$
\left|\frac1n H_{n}(\tilde\theta_{n})-\frac1n H_{n}(\theta_{0})\right| \le \left(\frac1n\sum_{i=1}^{n}M(X_{i})\right)|\tilde\theta_{n}-\theta_{0}|.
$$

$\frac1n\sum M(X_{i})\xrightarrow{P}E[M]<\infty$（WLLN），且 $|\tilde\theta_{n}-\theta_{0}|\le|\hat\theta_{n}-\theta_{0}|\xrightarrow{P}0$（一致性且 $\tilde\theta_{n}$ 夹逼）。故右端 $\xrightarrow{P}0$，于是

$$
-\frac1n H_{n}(\tilde\theta_{n}) = -\frac1n H_{n}(\theta_{0}) + o_{P}(1)\xrightarrow{P}\mathcal{I}_{1}(\theta_{0}). \tag{5}
$$

严格需用 $o_{P}(1)$ 记号与 Slutsky；控制条件保证余项一致可积。此即 Hessian 的一致大数定律。

> **技术细节**：向量情形 $H_{n}$ 为矩阵，$\|H_{n}(\tilde\theta_{n})-H_{n}(\theta_{0})\|$ 用算子范数与 $M(x)$ 的矩阵控制同理可得。

### 步骤 4：Slutsky 合并得渐近正态

由 (2)(3)(5) 与 Slutsky 定理（若 $A_{n}\xrightarrow{P}A$ 可逆，$B_{n}\xrightarrow{d}B$，则 $A_{n}^{-1}B_{n}\xrightarrow{d}A^{-1}B$）：

$$
\sqrt{n}(\hat\theta_{n}-\theta_{0}) = A_{n}^{-1}B_{n},\quad A_{n}:=-\tfrac1n H_{n}(\tilde\theta_{n})\xrightarrow{P}\mathcal{I}_{1},\ B_{n}:=\tfrac1{\sqrt{n}}S_{n}(\theta_{0})\xrightarrow{d}N(0,\mathcal{I}_{1}),
$$

故

$$
\sqrt{n}(\hat\theta_{n}-\theta_{0})\xrightarrow{d} N\!\left(0,\ \mathcal{I}_{1}(\theta_{0})^{-1}\mathcal{I}_{1}(\theta_{0})\mathcal{I}_{1}(\theta_{0})^{-1}\right)=N\!\left(0,\mathcal{I}_{1}(\theta_{0})^{-1}\right).
$$

更直接：若 $B\sim N(0,\mathcal{I}_{1})$，则 $\mathcal{I}_{1}^{-1}B\sim N(0,\mathcal{I}_{1}^{-1}\mathcal{I}_{1}\mathcal{I}_{1}^{-1})=N(0,\mathcal{I}_{1}^{-1})$。

向量情形全同：

$$
\sqrt{n}(\hat{\boldsymbol\theta}_{n}-\boldsymbol\theta_{0})\xrightarrow{d}N_{d}\!\left(0,\mathcal{I}_{1}(\boldsymbol\theta_{0})^{-1}\right).
$$

$\square$

---

### 推论与等价形式

- **渐近方差**：$\operatorname{Var}(\hat\theta_{n})\approx \mathcal{I}_{n}(\theta_{0})^{-1}=1/(n\mathcal{I}_{1}(\theta_{0}))$，标准误 $\text{se}(\hat\theta_{n})\approx1/\sqrt{n\mathcal{I}_{1}(\hat\theta_{n})}$。

- **观测信息替换**：由 (5)，$-\frac1n H_{n}(\hat\theta_{n})\xrightarrow{P}\mathcal{I}_{1}(\theta_{0})$，故亦有 $-\frac1n H_{n}(\hat\theta_{n})$ 即观测信息 $J_{n}(\hat\theta_{n})/n$ 可替代 $\mathcal{I}_{1}(\hat\theta_{n})$ 作方差估计，二者渐近等价。

- **Wald 检验**：$W_{n}:=n(\hat\theta_{n}-\theta_{0})^{\top}\mathcal{I}_{1}(\theta_{0})(\hat\theta_{n}-\theta_{0})\xrightarrow{d}\chi^{2}_{d}$；实际中用 $\mathcal{I}_{1}(\hat\theta_{n})$ 或 $J_{n}(\hat\theta_{n})/n$ 替换。

- **渐近有效性**：Cramér-Rao 下界对无偏估计为 $\mathcal{I}_{n}^{-1}$，MLE 渐近达到该界，故渐近有效；且为渐近最小最大与渐近最优（Hajék-Le Cam 卷积定理）。

---

### 例

**例 1 — Bernoulli**：$X_{i}\sim\text{Ber}(p_{0})$，$\hat p_{n}=\bar X$，$\mathcal{I}_{1}(p)=1/[p(1-p)]$，故 $\sqrt{n}(\hat p_{n}-p_{0})\xrightarrow{d}N(0,p_{0}(1-p_{0}))$，与经典 De Moivre-Laplace CLT 一致。

**例 2 — Poisson**：$X_{i}\sim\text{Pois}(\lambda_{0})$，$\hat\lambda_{n}=\bar X$，$\mathcal{I}_{1}(\lambda)=1/\lambda$，故 $\sqrt{n}(\hat\lambda_{n}-\lambda_{0})\xrightarrow{d}N(0,\lambda_{0})$。

**例 3 — 正态 $N(\mu,\sigma^{2})$**：真值 $(\mu_{0},\sigma_{0}^{2})$，$\mathcal{I}_{1}=\operatorname{diag}(1/\sigma_{0}^{2},1/(2\sigma_{0}^{4}))$，故 $\sqrt{n}(\hat\mu-\mu_{0})\xrightarrow{d}N(0,\sigma_{0}^{2})$, $\sqrt{n}(\hat\sigma^{2}-\sigma_{0}^{2})\xrightarrow{d}N(0,2\sigma_{0}^{4})$，且二者渐近独立。

---

## 注记与拓展

- **与前两条的闭环**：
  - Beta 矩的计算中 $B(\alpha+n,\beta)/B(\alpha,\beta)$ 的推导依赖 Gamma/Beta 归一化，其正则性与 Fisher 推导中 $\int f=1$ 的求导同源；
  - Fisher 第二形式 $-E[H]=\mathcal{I}$ 正是 MLE 证明中 CLT 方差与 LLN 极限相等的支点——三条目内在统一于“积分号下求导与归一化”。

- **正则条件失效的情形**（重要反例）：
  - **支撑依赖参数**：$X\sim\text{Unif}(0,\theta)$，MLE $\hat\theta_{n}=\max X_{i}$，$n(\theta_{0}-\hat\theta_{n})\xrightarrow{d}\text{Exp}(\theta_{0})$，非正态，收敛速率 $n$ 而非 $\sqrt{n}$，Fisher 信息不存在（前一条反例）。
  - **真值在边界**：如 $\theta_{0}=0$ 且 $\Theta=[0,\infty)$，渐近为截断正态。
  - **信息奇异**：混合模型、可识别性丧失时 $\mathcal{I}_{1}$ 奇异，极限为非正态混合。
  - 这些属于非正则渐近，需用更一般的 $n$-相合与 LAN 理论。

- **Delta 方法衔接**：若 $\eta=g(\theta)$ 光滑，$g'$ 连续，则 $\sqrt{n}(g(\hat\theta_{n})-g(\theta_{0}))\xrightarrow{d}N(0,\nabla g^{\top}\mathcal{I}_{1}^{-1}\nabla g)$，用于构造变换后参数的置信区间。

- **三类经典检验的渐近等价**：Wald、得分（Rao）与似然比检验在大样本下等价：$W_{n},S_{n},L_{n}\xrightarrow{d}\chi^{2}_{d}$ 且差为 $o_{P}(1)$，均基于本定理的二次展开。

- **常见误用/易错点**：
  - 将 $\mathcal{I}_{n}$ 与 $\mathcal{I}_{1}$ 混淆，导致方差差 $n$ 倍（$\operatorname{Var}(\hat\theta_{n})\approx1/\mathcal{I}_{n}=1/(n\mathcal{I}_{1})$，非 $1/\mathcal{I}_{1}$）。
  - 误将观测信息 $J_{n}(\hat\theta_{n})$ 当作 $\mathcal{I}_{n}$ 的精确值而非估计；有限样本二者有别。
  - 忽略一致性前提：若似然多峰，$S_{n}=0$ 有多个根，需选相合根而非任意驻点。
  - 在非 i.i.d. 或误设模型下仍套用 $\mathcal{I}_{1}^{-1}$ 作方差——误设时极限方差为三明治 $A^{-1}BA^{-1}$（Huber-White）。

- **计算提示**：实际标准误取 $\widehat{\text{se}}=\sqrt{[\mathcal{I}_{n}(\hat\theta_{n})^{-1}]_{jj}}$ 或 $\sqrt{[J_{n}(\hat\theta_{n})^{-1}]_{jj}}$；置信区间 $\hat\theta_{n}\pm z_{1-\alpha/2}\cdot\widehat{\text{se}}$。

- **小练习**：
  1. 设 $X_{i}\sim\text{Exp}(\lambda_{0})$（速率），求 MLE $\hat\lambda_{n}=1/\bar X$ 的渐近分布（提示：$\mathcal{I}_{1}=1/\lambda_{0}^{2}$，用 Delta 方法或直接 Fisher）。
  2. 证明在指数族 $f(x;\theta)=h(x)\exp(\theta T(x)-A(\theta))$ 中 $\mathcal{I}_{1}(\theta)=A''(\theta)$，MLE 渐近方差为 $1/(nA''(\theta_{0}))$。
  3. 对 $\text{Unif}(0,\theta)$ 推导 MLE 的精确分布 $P(\hat\theta_{n}\le t)=(t/\theta_{0})^{n}$ 并说明为何不满足正规定理。

---

## 参考文献

1. Casella, G. & Berger, R. L. *Statistical Inference*, 2nd ed., Duxbury, 2002. Chap. 7.3 (Cramér-Rao), Chap. 10.1 (MLE 渐近性).
2. Lehmann, E. L. & Casella, G. *Theory of Point Estimation*, 2nd ed., Springer, 1998. Thm. 6.3.1 (MLE 渐近正态), Chap. 6.4 (正则条件).
3. van der Vaart, A. W. *Asymptotic Statistics*, Cambridge, 1998. Chap. 5 (Delta 方法, 渐近正态), Thm. 5.39 (MLE).
4. Bickel, P. J. & Doksum, K. A. *Mathematical Statistics*, Vol. 1, 2nd ed., Pearson, 2015. Sec. 5.2–5.3 (Fisher 信息与 MLE).
5. Ferguson, T. S. *A Course in Large Sample Theory*, Chapman & Hall, 1996. Chap. 18 (MLE 大样本).
6. Wikipedia, "Maximum likelihood estimation — Asymptotic normality", 访问日期 2026-08-25.

---

## 复盘

- 难点：从 $S_{n}(\hat\theta_{n})=0$ 到 (2) 的 Taylor 展开需区分 $H_{n}(\tilde\theta_{n})$ 与 $H_{n}(\theta_{0})$，$o_{P}(1)$ 的控制依赖三阶有界与一致性，这是正则条件 (C4) 的全部意义；CLT 与 LLN 的极限恰为同一 Fisher 矩阵是证明自洽的关键。
- 易错点：漏 $n$ 因子（$\mathcal{I}_{n}=n\mathcal{I}_{1}$）、误将观测信息当期望信息、忽略多根中选相合根、在非正则模型中强行套用正态极限。
- 延伸思考：误设模型下 MLE 收敛到 KL 投影 $\theta^{*}$，极限方差为何变为 $A^{-1}BA^{-1}$ 三明治？这与本定理中 $A=B=\mathcal{I}_{1}$ 的相等如何对应（信息矩阵等式）？

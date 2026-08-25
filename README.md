# Daily Math — 每日一证

> 一天一结论，一天一证明。数学 · 统计学 · 概率论 的每日精进仓库。

[![Daily Reminder](https://github.com/JunruQ/daily-math/actions/workflows/daily-reminder.yml/badge.svg)](https://github.com/JunruQ/daily-math/actions/workflows/daily-reminder.yml)
[![Update Index](https://github.com/JunruQ/daily-math/actions/workflows/update-index.yml/badge.svg)](https://github.com/JunruQ/daily-math/actions/workflows/update-index.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

本仓库以 **每日一更** 的节奏，记录一个精炼的数学/统计学小结论及其证明。每个条目自包含、可复现、可追溯，适合碎片化学习与长期积累。

---

## 📖 目录

<!-- INDEX:START -->
| 日期 | 结论 | 领域 | 难度 | 链接 |
|------|------|------|------|------|
| 2026-08-25 | 第一类 Beta 分布的 n 阶原点矩 | 概率论 | ★★☆ | [查看](content/2026/08/2026-08-25-beta-moments.md) |
| 2026-08-25 | Fisher 信息量的两种等价形式及其推导 | 统计学 | ★★☆ | [查看](content/2026/08/2026-08-25-fisher-information.md) |
| 2026-08-25 | MLE 的渐近正态性与渐近有效性 | 统计学 | ★★★ | [查看](content/2026/08/2026-08-25-mle-asymptotics.md) |
| 2026-08-24 | 三个常用分布计算：正态偶数阶矩、Gamma 积分与正态样本的极坐标独立性 | 概率论 | ★★☆ | [查看](content/2026/08/2026-08-24-normal-moments-gamma-polar.md) |
<!-- INDEX:END -->

> 索引由 `.github/workflows/update-index.yml` 自动维护，push 时扫描 `content/**/*.md` 生成。手动编辑请在锚点外进行。

---

## 🎯 仓库目标

- **持续性**：每晚 20:00（Asia/Shanghai）自动提醒，未完成则创建 Issue 推送到 GitHub 绑定邮箱
- **严谨性**：每个结论均有精确陈述 + 完整证明，允许先给 `Sketch` 但必须附完整证明
- **可检索**：统一 frontmatter + 标签体系，支持按领域/难度/时间筛选
- **可渲染**：GitHub 原生 MathJax，`$...$` 行内公式，`$$...$$` 块级公式

---

## 📁 目录结构

```
daily-math/
├── README.md                          # 本文件
├── AGENTS.md                          # 人 + Agent 协作工作流
├── content/
│   ├── template.md                    # 新条目模板（复制即用）
│   └── 2026/
│       └── 08/
│           └── 2026-08-24-borel-cantelli-lemma-1.md
├── .github/
│   ├── workflows/
│   │   ├── daily-reminder.yml         # 每晚 20:00 定时提醒
│   │   └── update-index.yml           # 自动更新 README 索引
│   └── ISSUE_TEMPLATE/
│       └── daily-math.md
└── scripts/
    └── new-entry.sh                   # 本地一键创建今日文件
```

---

## ✍️ 快速开始

### 方式一：本地脚本（推荐）

```bash
# 1. 克隆
git clone git@github.com:JunruQ/daily-math.git && cd daily-math

# 2. 创建今日条目（自动按日期命名）
./scripts/new-entry.sh "chebyshev-inequality"
# -> content/2026/08/2026-08-24-chebyshev-inequality.md

# 3. 编辑文件，填结论与证明
# 4. 提交
git add . && git commit -m "feat: 2026-08-24 - Chebyshev 不等式" && git push
```

不传参数时脚本会交互式询问标题，或直接生成 `content/YYYY/MM/DD.md` 空模板。

### 方式二：手动复制模板

```bash
TODAY=$(TZ='Asia/Shanghai' date +%Y-%m-%d)
cp content/template.md content/2026/08/$TODAY-my-topic.md
```

### 方式三：通过 Issue 提醒直接创建

每晚 20:00 若当日无更新，Actions 会创建标题为 `📐 Daily Math — YYYY-MM-DD 待完成` 的 Issue，内含 checklist 与一键创建指引。

---

## 📝 写作规范

### 1. 文件命名

```
content/YYYY/MM/YYYY-MM-DD-slug.md   # 推荐，按年/月分目录（脚本默认）
content/YYYY-MM-DD-slug.md           # 也兼容扁平结构

示例：
content/2026/08/2026-08-24-borel-cantelli-lemma-1.md
content/2026-08-25-lln-weak.md
```

`slug` 用英文 kebab-case，简短反映结论主题。

### 2. Frontmatter（YAML）

每篇开头必须包含：

```yaml
---
title: "Borel-Cantelli 引理（第一部分）"
date: 2026-08-24
area: 概率论          # 建议：分析/代数/概率论/统计学/优化/随机过程 等
tags: [Borel-Cantelli, 测度论]
difficulty: "★★☆"    # ★☆☆ 入门 / ★★☆ 进阶 / ★★★ 困难
statement: "若 sum P(A_n) < ∞，则 P(A_n 发生无穷多次) = 0"
---
```

`area` 和 `tags` 宽松管理，无需预注册，按需填写。

### 3. 正文结构（按模板顺序）

```md
## 结论陈述
> 精确陈述，条件与结论分离

## 证明思路（Sketch，可选）
> 关键想法、归约步骤，可配图

## 完整证明
> 严格证明，允许引用已证结论但需注明出处

## 注记与拓展
> 反例、等价形式、常见误用

## 参考文献
```

**要求**：可先写 `Sketch` 帮助理解，但必须随后给出 `完整证明`。若证明较长，可分引理。

### 4. 数学公式

- 行内：`$E[X] \le \sqrt{E[X^2]}$`
- 块级：
  ```md
  $$
  P\left(\limsup_{n\to\infty} A_n\right) = 0
  $$
  ```
- 编号、定理环境用 Markdown 标题 + 引用块即可，无需额外插件。

### 5. 提交信息

```
feat: 2026-08-24 - Borel-Cantelli 引理
fix:  2026-08-24 - 修正证明中可数可加性引用
docs: 更新 README 索引
```

---

## 🔔 提醒机制

| 项 | 配置 |
|---|------|
| 时间 | 每天 **20:00 Asia/Shanghai**（`cron: 0 12 * * *` UTC） |
| 触发 | `.github/workflows/daily-reminder.yml` 定时 + 可手动 `workflow_dispatch` |
| 逻辑 | 检查 `content/**/YYYY-MM-DD*.md` 是否存在；不存在则创建 Issue 并 assign 给你 |
| 推送 | GitHub 会自动邮件推送到你绑定的邮箱（需在 GitHub Settings → Notifications 开启 Issues 邮件通知） |
| 去重 | 同一天已存在条目则不创建；Issue 去重通过日期标题判断 |

> **确保收到邮件**：GitHub → Settings → Notifications → Email notification preferences 勾选 `Issues`；或在仓库页面 `Watch → Custom → Issues`。

手动测试：Actions 页 → Daily Reminder → Run workflow。

---

## 📊 连续打卡

- 索引表即打卡墙，`update-index.yml` 会在每次 push 后刷新
- 建议配合 GitHub Contributions 日历观察连续性
- 未来可扩展：`scripts/stats.py` 生成热力图 / 年度统计页

---

## 🤝 AGENTS 工作流

详见 [`AGENTS.md`](AGENTS.md)，定义了人 + AI Agent 的协作契约：选题 → 撰写 → 自检 → 提交 → 复盘。

一句话：**Agent 负责给选题与审稿，你负责定题与最终严谨性把关**。

---

## 📄 许可

MIT License，详见 [LICENSE](LICENSE)（待补充）。

---

## 🙏 致谢

灵感来自每日一题/每日一证的学习习惯。愿以微小而确定的积累，对抗遗忘曲线。

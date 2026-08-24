# AGENTS.md — 每日一证工作流契约

> 本文件定义 `daily-math` 仓库中 **人类（你） + AI Agent（OpenCode / Cursor / Codex 等）** 的协作方式。Agent 需严格遵守本契约。

---

## 1. 角色与职责

| 角色 | 职责 |
|------|------|
| **人类（Owner）** | 选题定题、最终严谨性把关、提交与发布 |
| **Agent** | 选题建议、资料检索、证明审稿、格式校对、索引维护 |

**原则**：
- Agent 不编造定理/结论，所有陈述需可追溯到可靠来源（教材/论文/维基需交叉验证）
- Agent 输出的 LaTeX 必须能在 GitHub MathJax 下正常渲染
- 证明允许先给 Sketch，但必须随后附 **完整证明**（这是硬性要求）

---

## 2. 每日工作流（SOP）

### 触发时机

- **自动**：每晚 20:00 `daily-reminder.yml` 创建 Issue 提醒（若当日无更新）
- **手动**：本地执行 `./scripts/new-entry.sh [slug]` 或直接响应 Issue

### 标准六步

```
[1] 选题  ──>  [2] 撰写  ──>  [3] 自检  ──>  [4] 提交  ──>  [5] 复盘  ──>  [6] 索引
```

#### Step 1 — 选题（5 分钟）

- Agent 根据 `content/` 已有条目去重，提供 **3 个候选结论**（含一句话陈述 + 来源 + 难度预估）
- 人类选定 1 个，或自行指定
- 候选应覆盖不同领域，避免连续多日同一分支

#### Step 2 — 撰写

1. 复制 `content/template.md` 到 `content/YYYY/MM/DD-slug.md`
2. 填写 frontmatter（见 README 规范）
3. 按顺序填：**结论陈述 → 证明思路（Sketch，可选） → 完整证明 → 注记与拓展 → 参考文献**
4. 语言以中文为主，术语首次出现可中英对照

#### Step 3 — 自检 Checklist

提交前逐项勾选：

- [ ] 结论陈述精确，条件与结论分离，无歧义
- [ ] Sketch 与完整证明分离，完整证明自包含且逻辑闭环
- [ ] 关键步骤有依据（引用定理/引理需注明名称或给出证明）
- [ ] LaTeX 在 GitHub 预览下无渲染错误
- [ ] frontmatter 完整（title/date/area/tags/difficulty）
- [ ] 文件命名符合 `YYYY-MM-DD-slug.md` 或 `YYYY/MM/DD-slug.md`
- [ ] 参考文献可追溯

Agent 需对此 checklist 进行自动审稿，指出不严谨处。

#### Step 4 — 提交

```bash
git add content/YYYY/MM/DD-slug.md
git commit -m "feat: YYYY-MM-DD - <结论标题>"
git push origin main
```

- 1 天 1 commit，避免批量补更（补更需注明 `feat: 2026-08-20 - ... (backfill)`）
- Issue 若存在，push 后可自动关闭（commit message 含 `Closes #<issue>`）或手动关闭

#### Step 5 — 复盘（可选，2 分钟）

- 在条目末尾 `## 复盘` 记录：难点、易错点、与既往条目的联系
- Agent 可追问 1 个延伸问题帮助巩固

#### Step 6 — 索引

- `update-index.yml` 自动刷新 `README.md` 索引表，无需手动操作
- 若自动更新失败，Agent 需手动修复

---

## 3. Agent 指令细则

### 3.1 选题建议 Prompt

当用户说“今天写什么”或 Issue 提醒触发时，Agent 应：

```
1. 扫描 content/**/*.md 的 title/tags/area，去重
2. 给出 3 选 1：
   - 标题 + 一句话结论 + 领域/难度 + 来源
   - 每个附 1 行 Sketch 预告
3. 询问用户选定或自定义
```

### 3.2 证明审稿标准

- **严格性**：每一步推理是否给出依据？是否默认了未证明的命题？
- **完整性**：Sketch 是否与完整证明一致？完整证明是否覆盖所有情况（边界、零测集等）？
- **可读性**：定义是否前置？符号是否一致？是否过度跳步？
- **正确性**：反例检验、量纲/测度可数可加性等易错点

发现问题时，Agent 应 **指出具体行号与修改建议**，而非直接重写证明。

### 3.3 格式校对

- 检查 frontmatter YAML 合法性
- 检查 LaTeX 定界符配对（`$` / `$$`）
- 检查文件路径与日期一致性
- 检查 README 索引是否需更新

### 3.4 禁止事项

- 禁止编造不存在的定理名或论文
- 禁止用“显然”“易知”跳过关键步骤（Sketch 中可用，但完整证明中需展开）
- 禁止一次生成多日内容（保持每日一更的节奏感）

---

## 4. 异常处理

| 情况 | 处理 |
|------|------|
| 当天太忙无法完成 | 在 Issue 下留言 `skip: 原因`，不创建空文件，保持 streak 诚实 |
| 需要补更 | 文件日期用结论实际归属日，commit 标注 `(backfill)`，不在当日 Issue 下关闭 |
| 发现历史条目错误 | 新建 `fix: YYYY-MM-DD - ...` commit 修正，并在原文末尾加 `勘误` 小节 |
| 选题重复 | Agent 需在选题阶段检索 `content/` 并提醒 |

---

## 5. 工具与命令

```bash
# 新建今日条目
./scripts/new-entry.sh [slug]

# 本地预览（可选，需安装 markdown 预览工具）
# VS Code: 打开 .md 按 Cmd+Shift+V

# 手动触发提醒工作流（测试用）
gh workflow run daily-reminder.yml
```

---

## 6. 演进

- 本契约随实践迭代，修改需同步更新 `README.md` 相关章节
- 重大变更需在 Issue 中讨论并记录

---

> 一句话总结：**Agent 是选题与审稿的副驾驶，你是最终对数学严谨性负责的机长。**

---
name: "Daily Math 提醒"
about: "每晚 20:00 自动创建的每日一证提醒"
title: "📐 Daily Math — YYYY-MM-DD 待完成"
labels: ["daily-math", "reminder"]
assignees: []
---

> ⏰ 每晚 20:00 自动提醒 — 若今日已完成请直接关闭本 Issue

## 今日任务

- [ ] 选题（让 Agent 推荐 3 选 1，或自定）
- [ ] 复制 `content/template.md` 到 `content/YYYY/MM/DD-slug.md`
- [ ] 填写：结论陈述 → Sketch（可选）→ **完整证明**（必须）→ 注记 → 参考文献
- [ ] 自检（见 `AGENTS.md` Checklist）
- [ ] 提交 `feat: YYYY-MM-DD - <标题>` 并 push

## 快速创建

```bash
./scripts/new-entry.sh "<slug>"
```

## 让 Agent 帮忙

在本 Issue 下评论：

> 今天写什么？

---

*由 `daily-reminder.yml` 自动创建，邮件已推送至 GitHub 绑定邮箱。*

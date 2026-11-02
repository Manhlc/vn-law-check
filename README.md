# vn-law-check

Checklist + rules cho AI coding agent audit sơ bộ pháp lý website Việt Nam: dữ liệu cá nhân, thương mại điện tử, an ninh mạng, bảo vệ người tiêu dùng, quảng cáo, giao dịch điện tử, minh bạch AI.

Không phải tư vấn pháp lý, xem [DISCLAIMER.md](./DISCLAIMER.md). Luật VN ở mảng này vừa đổi gần hết trong 2025–2026, nên tự xác minh lại trước khi dựa vào.

### Cài nhanh

```bash
curl -fsSL https://raw.githubusercontent.com/mhfed/vn-law-check/main/install.sh | bash
```

Lệnh này copy đúng bộ rules + checklist vào project hiện tại. Xong thì mở agent/IDE của bạn, bảo nó audit website theo checklist trong repo.

Dùng Claude: copy `SKILL.md` (đổi tên thư mục chứa nó, ví dụ `vn-law-check/`) vào `.claude/skills/` trong project hoặc `~/.claude/skills/` để Claude tự nhận biết lúc nào cần dùng, không phải nhắc tay.

### Vì sao làm cái này

Rules compliance có sẵn trên GitHub cho AI agent gần như toàn GDPR/CCPA. Chưa có cái nào theo luật Việt Nam — mà luật VN vừa thay gần hết: Luật Bảo vệ dữ liệu cá nhân 2025, Luật Thương mại điện tử 2025, Luật An ninh mạng 2025 đều mới có hiệu lực trong 2026, thay các nghị định cũ.

### Dùng với tool nào

Cùng một nội dung, đặt ở nhiều file để mỗi tool tự đọc đúng chỗ của nó, không cần config gì thêm:

- `AGENTS.md` — chuẩn chung (Cursor, Codex, Jules, Amp, Zed...)
- `CLAUDE.md` — Claude
- `SKILL.md` — Claude Skill, cho vào `.claude/skills/`
- `.cursor/rules/vn-legal-compliance.mdc` — Cursor
- `.windsurfrules` — Windsurf
- `.github/copilot-instructions.md` — GitHub Copilot
- `.clinerules` — Cline

`install.sh` tự copy hết các file này + 3 folder `checklists/`, `sources/`, `examples/` vào project của bạn. Không chạy script thì copy tay cũng được, chỉ cần giữ nguyên cấu trúc vì các rules file đều trỏ tới các folder đó.

### Cấu trúc

```
checklists/   8 checklist theo lĩnh vực (dữ liệu cá nhân, TMĐT, an ninh mạng, NTD, quảng cáo, giao dịch điện tử, AI, xử phạt)
sources/      văn bản pháp luật dẫn chiếu + tình trạng hiệu lực
examples/     mẫu báo cáo audit
```

### Tình trạng nội dung

Checklist dữ liệu cá nhân, TMĐT, an ninh mạng (01–03) đã research kỹ. Quảng cáo và AI (05, 07) còn sơ bộ, cần đọc thêm luật gốc trước khi tin hẳn. Một số nghị định hướng dẫn (Luật An ninh mạng 2025) vẫn đang ở dạng dự thảo tại thời điểm viết repo.

### Đóng góp

PR cập nhật văn bản, sửa sai sót đều được hoan nghênh — nhớ trích nguồn (số hiệu văn bản, link thuvienphapluat.vn/vbpl.vn) cho mỗi thay đổi.

MIT license cho phần code/cấu trúc repo. Văn bản pháp luật được dẫn chiếu là tài liệu công khai của Nhà nước, không thuộc phạm vi license này.

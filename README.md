# VN Web Compliance Audit

Bộ checklist + rules file giúp AI coding agent (Claude, Cursor, Windsurf, GitHub Copilot, Cline, ...) **rà soát sơ bộ** một website/sản phẩm theo các quy định pháp luật Việt Nam hiện hành: bảo vệ dữ liệu cá nhân, thương mại điện tử, an ninh mạng, bảo vệ người tiêu dùng, quảng cáo trực tuyến, giao dịch điện tử và minh bạch AI.

> ⚠️ **Không phải tư vấn pháp lý.** Đây là công cụ hỗ trợ rà soát ban đầu dựa trên văn bản pháp luật công khai. Đọc kỹ [DISCLAIMER.md](./DISCLAIMER.md) trước khi dùng. Luật Việt Nam về mảng này vừa trải qua một làn sóng thay đổi lớn (2025–2026) — repo cố gắng bám bản mới nhất nhưng **luôn tự xác minh lại**.

## Vì sao có repo này?

Tính đến 2026, hầu hết rules/checklist compliance có sẵn trên GitHub cho AI coding agent (Cursor rules, Claude skills, Copilot instructions...) chỉ hướng tới GDPR (EU) hoặc CCPA (Mỹ). Chưa có bộ rules nào tập trung vào khung pháp lý Việt Nam — vốn vừa thay đổi gần như toàn bộ: Luật Bảo vệ dữ liệu cá nhân 2025, Luật Thương mại điện tử 2025, Luật An ninh mạng 2025 đều mới có hiệu lực trong năm 2026, thay thế các Nghị định cũ (NĐ 13/2023, NĐ 52/2013, Luật ANM 2018...).

## Dùng được với agent/IDE nào?

Cùng một nội dung được đặt ở nhiều vị trí để mỗi tool tự đọc đúng file của mình — không cần cấu hình gì thêm, chỉ cần clone repo (hoặc copy các file vào project của bạn):

| Tool | File |
|---|---|
| Chuẩn chung (Cursor, Codex, Jules, Amp, Zed, ...) | [`AGENTS.md`](./AGENTS.md) |
| Claude Code / Claude | [`CLAUDE.md`](./CLAUDE.md) |
| Cursor (rules riêng, có thể bật/tắt theo @-mention) | [`.cursor/rules/vn-legal-compliance.mdc`](./.cursor/rules/vn-legal-compliance.mdc) |
| Windsurf | [`.windsurfrules`](./.windsurfrules) |
| GitHub Copilot | [`.github/copilot-instructions.md`](./.github/copilot-instructions.md) |
| Cline | [`.clinerules`](./.clinerules) |

Muốn dùng cho project đang có sẵn? Copy các file trên vào root project của bạn (và giữ nguyên folder `checklists/`, `sources/`, `examples/` — các rules file đều trỏ tới đó).

## Cấu trúc repo

```
.
├── AGENTS.md / CLAUDE.md / .cursor/rules/*.mdc / .windsurfrules / .github/copilot-instructions.md / .clinerules
│   → cùng nội dung: vai trò, nguyên tắc bắt buộc, quy trình audit
├── checklists/
│   ├── 01-personal-data-protection.md   Bảo vệ dữ liệu cá nhân (Luật 91/2025 + NĐ 356/2025)
│   ├── 02-ecommerce.md                   Thương mại điện tử (Luật 122/2025 + NĐ 248/2026)
│   ├── 03-cybersecurity.md               An ninh mạng (Luật 116/2025)
│   ├── 04-consumer-protection.md         Bảo vệ người tiêu dùng (Luật 2023 + NĐ 24/2025)
│   ├── 05-advertising.md                 Quảng cáo trực tuyến
│   ├── 06-electronic-transactions.md     Giao dịch điện tử / hợp đồng điện tử
│   ├── 07-ai-transparency.md             Minh bạch AI (Luật 134/2025 + NĐ 142/2026)
│   └── 08-penalties-reference.md         Khung xử phạt tham khảo
├── sources/legal-references.md           Toàn bộ văn bản pháp luật dẫn chiếu + tình trạng hiệu lực
├── examples/sample-audit-report.md       Mẫu báo cáo audit
├── DISCLAIMER.md
└── LICENSE (MIT — chỉ áp dụng cho cấu trúc/nội dung repo, không áp dụng cho văn bản luật)
```

## Cách dùng

1. Copy repo (hoặc chỉ các file rules + 3 folder `checklists/sources/examples`) vào project bạn muốn audit.
2. Mở agent/IDE tương ứng, yêu cầu ví dụ: *"Audit website này theo bộ checklist pháp lý VN trong repo"*.
3. Agent sẽ tự đọc `AGENTS.md`/`CLAUDE.md`/... rồi lần qua từng checklist, đối chiếu với code/nội dung thực tế của website (footer, trang chính sách, cookie banner, form thu thập dữ liệu...).
4. Kết quả trả về theo mẫu `examples/sample-audit-report.md`, luôn kèm khuyến nghị xác minh lại với luật sư.

## Trạng thái nội dung (quan trọng)

- ✅ Research kỹ: Bảo vệ dữ liệu cá nhân, Thương mại điện tử, An ninh mạng (checklist 01–03).
- ⚠️ Sơ bộ, cần research sâu thêm: Quảng cáo (05), Minh bạch AI (07) — văn bản mới, cần đọc trực tiếp nội dung luật trước khi coi là chính xác.
- 📌 Giai đoạn chuyển tiếp pháp lý: một số nghị định hướng dẫn (đặc biệt Luật An ninh mạng 2025) tại thời điểm viết repo (02/11/2026) vẫn ở dạng dự thảo — cần cập nhật khi chính thức ban hành.

## Đóng góp

PR cập nhật văn bản pháp luật, bổ sung checklist mới, hoặc sửa sai sót đều được hoan nghênh — đặc biệt từ luật sư/chuyên gia pháp lý. Khi PR, vui lòng trích dẫn nguồn (số hiệu văn bản, link thuvienphapluat.vn/vbpl.vn hoặc công báo) cho mỗi thay đổi.

## License

Cấu trúc và nội dung tổng hợp trong repo này dùng [MIT License](./LICENSE). Văn bản pháp luật được dẫn chiếu là tài liệu công khai của Nhà nước, không thuộc phạm vi license này.

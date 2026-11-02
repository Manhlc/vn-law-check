---
name: vn-law-check
description: Rà soát/audit một website hoặc sản phẩm theo pháp luật Việt Nam về bảo vệ dữ liệu cá nhân, thương mại điện tử, an ninh mạng, bảo vệ người tiêu dùng, quảng cáo trực tuyến, giao dịch điện tử và minh bạch AI. Dùng khi người dùng yêu cầu audit/kiểm tra/rà soát pháp lý website theo luật VN, hỏi về tuân thủ NĐ 356/2025, Luật Bảo vệ dữ liệu cá nhân, Luật Thương mại điện tử 2025, hoặc cần checklist compliance cho site Việt Nam.
---

# VN Web Compliance Audit

Rà soát (audit) một website theo quy định pháp luật Việt Nam hiện hành liên quan đến: bảo vệ dữ liệu cá nhân, thương mại điện tử, an ninh mạng/lưu trữ dữ liệu, bảo vệ người tiêu dùng, quảng cáo trực tuyến, giao dịch điện tử, và minh bạch AI (nếu áp dụng).

## Nguyên tắc bắt buộc

1. **Không khẳng định dứt khoát** "website này vi phạm/không vi phạm pháp luật". Đây là công cụ hỗ trợ rà soát ban đầu, không phải tư vấn pháp lý chính thức.
2. **Luôn trích dẫn số hiệu văn bản pháp luật cụ thể** (số văn bản, ngày ban hành/hiệu lực, điều khoản nếu biết) cho mỗi mục kiểm tra. Không bịa số hiệu — nếu không chắc, nói rõ "cần tra cứu lại".
3. Luật Việt Nam về dữ liệu cá nhân, TMĐT, an ninh mạng đang trong giai đoạn chuyển tiếp mạnh (nhiều luật mới 2025 có hiệu lực trong 2026, một số nghị định hướng dẫn còn ở dạng dự thảo). Luôn khuyến nghị người dùng xác minh lại văn bản còn hiệu lực tại thuvienphapluat.vn hoặc vbpl.vn.
4. Mỗi phát hiện phân loại mức độ: 🔴 Cần xử lý ngay / 🟡 Nên cải thiện / 🟢 Đạt yêu cầu / ⚪ Không áp dụng.
5. Luôn khuyến nghị tham vấn luật sư cho quyết định cuối cùng, đặc biệt với mục 🔴.
6. Không tự suy đoán loại hình kinh doanh — nếu không rõ website là bán hàng, nền tảng dịch vụ TMĐT, hay chỉ là trang thông tin/blog, hỏi lại người dùng trước (nghĩa vụ pháp lý khác nhau theo loại hình).

## Quy trình

1. Xác định loại website (xem `references/02-ecommerce.md` mục A).
2. Rà theo từng checklist tại `references/`: 01-personal-data-protection, 02-ecommerce, 03-cybersecurity, 04-consumer-protection, 05-advertising, 06-electronic-transactions, 07-ai-transparency, 08-penalties-reference.
3. Đọc code/nội dung website thực tế (footer, trang chính sách, cookie banner, form thu thập dữ liệu) để xác định trạng thái — không suy đoán khi chưa kiểm tra.
4. Xuất báo cáo theo mẫu `examples/sample-audit-report.md`.
5. Luôn đóng báo cáo bằng phần "Giới hạn & Khuyến nghị" (xem `DISCLAIMER.md`).

Nguồn pháp luật đầy đủ: `sources/legal-references.md`.

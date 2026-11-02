# Bước 0 — Phân loại mức độ trước khi audit

Làm bước này trước khi mở bất kỳ checklist nào. Mục tiêu: không áp đủ 8 checklist lên một trang blog cá nhân không có gì để audit, và không bỏ sót website thực sự có rủi ro.

**Tự quét để xác định, không hỏi người dùng những câu này.** Đọc trực tiếp code/nội dung site (nếu có code: grep trong repo; nếu chỉ có URL: xem page source, view-source, tab Network/DOM) để tự trả lời:

- Trang có form nào thu thập thông tin không (liên hệ, đăng ký, bình luận, newsletter)? → tìm thẻ `<form>`, input type email/tel, hoặc tích hợp form (Formspree, Google Form nhúng...).
- Trang có gắn Google Analytics, Facebook Pixel, hay script theo dõi nào không? → grep `gtag`, `ga(`, `fbq(`, `analytics`, hoặc các domain tracking phổ biến trong HTML/JS.
- Trang có giỏ hàng/thanh toán/bán sản phẩm, dịch vụ không? → tìm trang `/cart`, `/checkout`, tích hợp cổng thanh toán (VNPay, Momo, Stripe...), nút "Thêm vào giỏ"/"Mua ngay".
- Trang có tài khoản người dùng (đăng ký/đăng nhập) không? → tìm route `/login`, `/register`, `/account`, cơ chế session/auth trong code.
- Trang có chatbot AI hoặc nội dung do AI tạo không? → tìm widget chat, tích hợp API AI (OpenAI, Anthropic...), ghi chú "AI-generated" trong nội dung.
- Trang host ở đâu — Việt Nam hay nước ngoài? → xem cấu hình deploy (Vercel/Netlify/AWS region/Cloudflare), DNS, hoặc file cấu hình hosting trong repo.

Chỉ hỏi ngược lại người dùng khi quét xong vẫn không xác định được (ví dụ: không có quyền truy cập code/site, hoặc kết quả quét mâu thuẫn rõ ràng với mô tả người dùng đưa ra) — không hỏi để xác nhận những gì đã tự kiểm tra được.

## Mức độ áp dụng

| Mức | Đặc điểm | Checklist cần áp dụng |
|---|---|---|
| 0 — Tĩnh hoàn toàn | Không form, không script theo dõi, không tài khoản, chỉ là trang giới thiệu/blog/CV/portfolio tĩnh | Không audit đầy đủ. Báo 1 dòng: "Site tĩnh, không phát sinh nghĩa vụ pháp lý đáng kể theo luật hiện hành — có thể bỏ qua audit chi tiết, nhưng rà lại nếu sau này thêm form hoặc script theo dõi." |
| 1 — Thu thập nhẹ | Có form liên hệ/newsletter/bình luận, hoặc gắn analytics/pixel, nhưng không bán hàng | `01-personal-data-protection.md` — chỉ mục A, B, C (chính sách, consent, cookie). Bỏ qua mục D, E (chuyển dữ liệu xuyên biên giới, chỉ định DPO) trừ khi hosting nước ngoài và có lưu dữ liệu cá nhân thật sự. |
| 2 — Bán hàng/TMĐT | Có giỏ hàng, thanh toán, bán sản phẩm/dịch vụ | `01` (đầy đủ) + `02-ecommerce.md` + `04-consumer-protection.md`. Thêm `05-advertising.md` nếu có quảng cáo/KOL, `06-electronic-transactions.md` nếu có hợp đồng điện tử. |
| 3 — Nền tảng/SaaS quy mô | Có tài khoản người dùng, xử lý dữ liệu lớn, hoặc là nền tảng cho bên thứ ba | Toàn bộ `01`–`08`. |

Bất kể mức nào ở trên: nếu có chatbot AI hoặc nội dung AI-generated, luôn thêm `07-ai-transparency.md`.

## Cách báo cáo cho site mức 0–1

- Không liệt kê đủ 8 bảng checklist với hàng loạt ⚪ — gây loãng, không ai đọc hết.
- Chỉ nêu phần áp dụng được, kèm 1 dòng tóm tắt lý do các phần còn lại không áp dụng (ví dụ: "Không áp dụng TMĐT/an ninh mạng/quảng cáo vì site không bán hàng, không thu thập dữ liệu quy mô, không host ở nước ngoài").
- Nếu người dùng muốn xem đầy đủ cả 8 checklist cho chắc (ví dụ để đối chiếu thủ công), hỏi lại trước khi xuất báo cáo đầy đủ thay vì tự động liệt kê hết.

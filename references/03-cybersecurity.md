# Checklist 3 — An ninh mạng & lưu trữ dữ liệu

**Văn bản áp dụng (kiểm tra lại hiệu lực trước khi dùng):**
- Luật An ninh mạng 2025 (Luật số 116/2025/QH15, hiệu lực 01/07/2026) — hợp nhất và thay thế Luật An ninh mạng 2018 + Luật An toàn thông tin mạng 2015
- Nghị định hướng dẫn Luật An ninh mạng 2025 — tại thời điểm viết checklist này vẫn đang ở dạng **dự thảo lấy ý kiến** (công bố 13/02/2026 bởi Bộ Công an); **cần kiểm tra lại đã ban hành chính thức hay chưa trước khi áp dụng**.
- Nghị định 53/2022/NĐ-CP — hướng dẫn Luật An ninh mạng 2018, có khả năng bị thay thế/hết hiệu lực khi Luật ANM 2025 có hiệu lực; kiểm tra lại tình trạng hiệu lực.
- Nghị định 330/2026/NĐ-CP — xử phạt vi phạm trong lĩnh vực an ninh mạng và bảo vệ dữ liệu cá nhân.

> ⚠️ Đây là lĩnh vực đang chuyển tiếp pháp lý (luật mới có hiệu lực 01/07/2026 nhưng nghị định hướng dẫn có thể chưa ban hành chính thức). Khi audit, luôn ghi rõ "căn cứ dự thảo/luật mới, cần xác nhận lại nghị định hướng dẫn chính thức".

## A. Lưu trữ dữ liệu trong nước
- [ ] Xác định doanh nghiệp có thuộc nhóm phải lưu trữ dữ liệu tại Việt Nam không: thường áp dụng cho doanh nghiệp (trong và ngoài nước) cung cấp dịch vụ trên mạng viễn thông, Internet, dịch vụ gia tăng có hoạt động thu thập, khai thác, phân tích, xử lý dữ liệu người dùng tại Việt Nam.
- [ ] Nếu thuộc nhóm trên: có lưu trữ tại Việt Nam các loại dữ liệu theo quy định (thông tin cá nhân người dùng, dữ liệu về mối quan hệ người dùng, dữ liệu do người dùng tại VN tạo ra) hoặc đặt văn phòng đại diện/chi nhánh tại Việt Nam.
- [ ] Lưu ý: yêu cầu "đặt máy chủ" cứng đã được cân nhắc bỏ trong một số dự thảo gần nhất, thay bằng yêu cầu đặt văn phòng đại diện + lưu trữ dữ liệu — cần xác nhận quy định cuối cùng khi nghị định chính thức ban hành.

## B. Nhật ký hệ thống (log)
- [ ] Hệ thống lưu trữ nhật ký (log) phục vụ điều tra, xử lý vi phạm an ninh mạng tối thiểu 12 tháng theo quy định.
- [ ] Log có thể cung cấp cho cơ quan chuyên trách khi có yêu cầu hợp lệ.

## C. Biện pháp bảo vệ kỹ thuật
- [ ] Có biện pháp bảo mật tương xứng với dữ liệu xử lý (mã hóa dữ liệu nhạy cảm, kiểm soát truy cập, sao lưu, giám sát xâm nhập).
- [ ] Có quy trình ứng phó sự cố an ninh mạng, báo cáo sự cố theo quy định.

## D. Hợp tác với cơ quan quản lý
- [ ] Doanh nghiệp có quy trình xử lý yêu cầu từ cơ quan chuyên trách về an ninh mạng (xác minh, điều tra, phối hợp xử lý vi phạm liên quan đến người dùng dịch vụ tại Việt Nam).

## E. Nội dung bị cấm trên không gian mạng
- [ ] Rà soát nội dung do người dùng đăng tải (UGC), bình luận, livestream có cơ chế kiểm duyệt để tránh nội dung bị cấm theo Luật An ninh mạng (chống Nhà nước, xuyên tạc, kích động, tin giả gây hoang mang...).

# Checklist 1 — Bảo vệ dữ liệu cá nhân

**Văn bản áp dụng (kiểm tra lại hiệu lực trước khi dùng):**
- Luật Bảo vệ dữ liệu cá nhân 2025 (Luật số 91/2025/QH15, hiệu lực 01/01/2026)
- Nghị định 356/2025/NĐ-CP (hiệu lực 01/01/2026, thay thế Nghị định 13/2023/NĐ-CP)
- Nghị định 330/2026/NĐ-CP (xử phạt vi phạm, hiệu lực 19/8/2026)

> ⚠️ Nghị định 13/2023/NĐ-CP đã hết hiệu lực từ 01/01/2026, bị thay bằng Nghị định 356/2025/NĐ-CP. Nếu thấy tài liệu/code cũ dẫn chiếu NĐ 13, cần cảnh báo người dùng cập nhật.

## A. Chính sách & minh bạch
- [ ] Có trang "Chính sách bảo vệ dữ liệu cá nhân" / "Privacy Policy" công khai, dễ tìm (thường ở footer), nêu rõ: loại dữ liệu thu thập, mục đích, thời gian lưu trữ, bên thứ ba được chia sẻ.
- [ ] Chính sách phân biệt rõ dữ liệu cá nhân cơ bản và dữ liệu cá nhân nhạy cảm (tài chính, sức khỏe, tôn giáo, tín ngưỡng, danh tính điện tử, dữ liệu vị trí, dữ liệu trẻ em...).
- [ ] Có kênh liên hệ cụ thể (email/hotline) để chủ thể dữ liệu thực hiện quyền truy cập, chỉnh sửa, xóa, phản đối xử lý, khiếu nại.

## B. Thu thập sự đồng ý (consent)
- [ ] Có cơ chế xin đồng ý rõ ràng trước khi thu thập/xử lý dữ liệu cá nhân — không dùng checkbox mặc định tích sẵn, không gộp đồng ý xử lý dữ liệu với đồng ý điều khoản dịch vụ khác (bundled consent).
- [ ] Hệ thống lưu trữ được bằng chứng đồng ý: thời điểm đồng ý, nội dung đã đồng ý, có thể kiểm chứng lại khi cần (yêu cầu mới theo NĐ 356, chặt hơn NĐ 13 cũ).
- [ ] Có cơ chế cho phép rút lại sự đồng ý dễ dàng như lúc đồng ý.
- [ ] Với dữ liệu trẻ em: nếu thu thập dữ liệu/tiết lộ đời sống riêng tư của trẻ từ 7 tuổi trở lên, phải có đồng ý của cả trẻ và người đại diện theo pháp luật; dưới 7 tuổi chỉ cần người đại diện.

## C. Cookie & theo dõi (tracking)
- [ ] Banner cookie/consent xuất hiện trước khi set cookie không thiết yếu (analytics, ads, Facebook Pixel, Google Analytics, TikTok Pixel...).
- [ ] Người dùng có thể từ chối cookie không thiết yếu mà vẫn dùng được chức năng cốt lõi của site.
- [ ] Danh sách bên thứ ba nhận dữ liệu qua cookie/SDK được công bố trong chính sách.

## D. Chuyển dữ liệu xuyên biên giới
- [ ] Nếu dùng hosting/CDN/SaaS/cloud đặt server ngoài Việt Nam (AWS ngoài VN, Cloudflare, Google Cloud, Firebase, Mailchimp, CRM nước ngoài...) để lưu trữ/xử lý dữ liệu cá nhân người dùng VN → đây là "chuyển dữ liệu xuyên biên giới" theo nghĩa mở rộng của Luật 2025 (bao gồm cả dữ liệu đang lưu tại VN rồi gửi ra hệ thống lưu trữ ngoài lãnh thổ).
- [ ] Đã/cần lập hồ sơ đánh giá tác động chuyển dữ liệu cá nhân xuyên biên giới, gửi cơ quan chuyên trách (Bộ Công an) trong thời hạn quy định (60 ngày kể từ khi xử lý theo quy định dẫn chiếu).

## E. Tổ chức & trách nhiệm nội bộ
- [ ] Doanh nghiệp đã/cần chỉ định bộ phận hoặc nhân sự phụ trách bảo vệ dữ liệu cá nhân (tùy quy mô xử lý dữ liệu).
- [ ] Có quy trình nội bộ thông báo vi phạm/rò rỉ dữ liệu (data breach) tới cơ quan chuyên trách và chủ thể dữ liệu bị ảnh hưởng.
- [ ] Hồ sơ đánh giá tác động xử lý dữ liệu cá nhân (DPIA) được lập cho các hoạt động xử lý quy mô lớn hoặc dữ liệu nhạy cảm.

## F. Hành vi bị cấm (rà soát để tránh)
- [ ] Không mua/bán/trao đổi dữ liệu cá nhân trái phép.
- [ ] Không thu thập dữ liệu vượt quá mục đích đã công bố.
- [ ] Không có thỏa thuận ngầm yêu cầu chủ thể dữ liệu "từ bỏ quyền" lấy sự đồng ý — loại thỏa thuận này không có giá trị theo hướng diễn giải mới của Luật 2025.

## Mức phạt tham khảo
Theo Nghị định 330/2026/NĐ-CP: vi phạm về bảo vệ dữ liệu cá nhân có thể bị phạt đến 3 tỷ đồng, hoặc theo một số khung tới 1–5% doanh thu năm liền trước của doanh nghiệp vi phạm (xem thêm checklist 08).

# 10. Soạn chính sách bảo mật và form đồng ý từ kết quả audit

Dùng khi người dùng yêu cầu: "tạo/soạn/viết lại chính sách bảo mật", "làm form đồng ý", "sửa các mục 🔴 về dữ liệu cá nhân", hoặc khi audit phát hiện site thiếu chính sách (checklist 01-A) hay xin đồng ý sai cách (01-B, 01-C) và người dùng bảo sửa.

Mục tiêu: một bản **nháp** chính sách khớp với những gì site thật sự đang làm, cộng với code xin đồng ý đúng cách. Không phải văn bản copy chung chung.

## Nguyên tắc

1. **Chỉ viết những gì tìm được bằng chứng trong code.** Mỗi loại dữ liệu, mỗi bên thứ ba ghi trong chính sách phải truy được về một dòng code (form, script, SDK, API call). Không thêm "cho chắc" những thứ site không làm.
2. **Không bịa thông tin pháp nhân.** Tên đơn vị, mã số thuế/đăng ký kinh doanh, địa chỉ, email tiếp nhận yêu cầu, thời gian lưu trữ cụ thể: tìm trong site (footer, trang giới thiệu). Không tìm được thì để `[ĐIỀN: ...]`, không tự nghĩ ra.
3. **Không dẫn văn bản cũ.** Không dùng Nghị định 13/2023 (hết hiệu lực từ 01/01/2026). Căn cứ là Luật 91/2025/QH15 và NĐ 356/2025/NĐ-CP.
4. **Không cam kết thay chủ site.** Không viết "chúng tôi tuân thủ đầy đủ pháp luật", không hứa biện pháp bảo mật mà code không có (ví dụ "mã hóa đầu cuối" khi không thấy).
5. **Ghi rõ đây là bản nháp** ở đầu file và trong câu trả lời, khuyến nghị người dùng nhờ người làm luật xem lại trước khi đăng.
6. Thời hạn xử lý yêu cầu ghi trong chính sách phải đúng Điều 5 NĐ 356/2025 (xem checklist 01-A). Không rút ngắn hay kéo dài tùy ý.

## Bước 1: lập bảng dữ liệu từ code

Dựa vào output `scan.sh` và đọc thêm code, lập bảng trước khi viết (đưa bảng này cho người dùng xem cùng bản nháp):

| Dữ liệu | Thu ở đâu (file:dòng) | Mục đích | Gửi cho ai | Lưu ở đâu |
|---|---|---|---|---|
| Họ tên, SĐT, email | `form đặt hàng`, file:dòng | Giao hàng, liên hệ | [hãng vận chuyển nếu có] | [database/dịch vụ] |
| Hành vi duyệt web | Google Analytics, file:dòng | Thống kê | Google | Nước ngoài |

Nguồn để điền:
- **Loại dữ liệu:** các trường input của form (name, type, placeholder, label), field trong API/database schema, quyền app xin (camera, vị trí, danh bạ...).
- **Bên thứ ba:** script tracking (GA, Pixel, TikTok, Hotjar...), SDK (Firebase, AdMob, Sentry...), API gọi ra ngoài (OpenAI, Anthropic, Mailchimp, cổng thanh toán, vận chuyển), hosting.
- **Nơi lưu và chuyển ra nước ngoài:** host/database/dịch vụ đặt ở nước ngoài thì là chuyển dữ liệu xuyên biên giới theo Điều 20 khoản 1 Luật 91/2025. Ghi rõ trong chính sách và nhắc người dùng xem checklist 01-D về hồ sơ.
- **Dữ liệu nhạy cảm:** đối chiếu danh mục trong NĐ 356/2025 (vị trí, sinh trắc học, sức khỏe, tài chính/thẻ ngân hàng, hành vi trực tuyến...). Có thì tách mục riêng.
- **Trẻ em:** site/app hướng tới trẻ em hoặc có thể có người dùng dưới 18 tuổi thì thêm mục trẻ em (Điều 24 Luật 91/2025).

Mục đích mà code không cho thấy rõ (ví dụ thu SĐT để làm gì) thì suy từ ngữ cảnh form và ghi `[KIỂM TRA: mục đích suy ra từ form đặt hàng]` để người dùng xác nhận.

## Bước 2: soạn chính sách

Dùng khung `examples/privacy-policy-template.md`. Xóa các mục không áp dụng (không có tracking thì bỏ mục cookie; không chuyển ra nước ngoài thì bỏ mục đó), không để mục rỗng.

Viết bằng tiếng Việt dễ hiểu, câu ngắn. Người dùng cuối phải đọc hiểu được, không phải văn bản để đối phó.

Lưu file theo cấu trúc sẵn có của project (ví dụ `app/chinh-sach-bao-mat/page.tsx`, `pages/privacy.vue`, `chinh-sach-bao-mat.html`) và thêm link ở footer cùng tại các form thu thập dữ liệu. Nếu không rõ cấu trúc thì xuất file markdown và nói người dùng nơi nên đặt.

## Bước 3: sửa cách xin đồng ý

Chính sách đăng lên chưa đủ. Sửa luôn chỗ xin đồng ý theo mẫu phần "Form đồng ý" và "Banner cookie" trong `examples/privacy-policy-template.md`:

- **Form thu thập:** ô đồng ý không tích sẵn, có link tới chính sách, tách riêng ô cho mục đích marketing (Điều 9 khoản 4 điểm a, b và Điều 28 khoản 3 Luật 91/2025).
- **Bỏ câu kiểu "tiếp tục sử dụng là đồng ý"** (Điều 9 khoản 4 điểm d).
- **Script tracking/quảng cáo:** chỉ nạp sau khi người dùng bấm đồng ý. Từ chối vẫn dùng được site.
- **Lưu bằng chứng đồng ý:** thời điểm, nội dung/phiên bản chính sách, mục đích đã đồng ý (NĐ 356/2025 yêu cầu kiểm chứng được thời điểm và nội dung, số điều CHƯA XÁC MINH).
- **Rút lại đồng ý:** có cách rút dễ như lúc đồng ý (nút cài đặt cookie, link hủy đăng ký email, trang tài khoản) (Điều 10 Luật 91/2025).

## Bước 4: báo lại cho người dùng

Trả lời ngắn gọn:
1. Đã tạo/sửa những file nào.
2. Bảng dữ liệu ở bước 1.
3. Danh sách chỗ `[ĐIỀN: ...]` và `[KIỂM TRA: ...]` người dùng phải tự hoàn thiện.
4. Những việc chính sách không giải quyết được: hồ sơ chuyển dữ liệu xuyên biên giới, hồ sơ đánh giá tác động (checklist 01-D, 01-E), trừ khi thuộc diện miễn trừ.
5. Nhắc: đây là bản nháp, nên nhờ người làm luật xem lại trước khi đăng.

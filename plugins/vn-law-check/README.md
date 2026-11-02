# vn-law-check

Skill cho Claude giúp audit sơ bộ pháp lý website theo quy định Việt Nam hiện hành: bảo vệ dữ liệu cá nhân, thương mại điện tử, an ninh mạng, bảo vệ người tiêu dùng, quảng cáo trực tuyến, giao dịch điện tử, và minh bạch AI.

Khi plugin này được kích hoạt, Claude sẽ đọc code/nội dung website thực tế (footer, trang chính sách, cookie banner, form thu thập dữ liệu...), đối chiếu với 8 bộ checklist dựa trên văn bản pháp luật hiện hành, rồi xuất báo cáo phân loại mức độ rủi ro (cần xử lý ngay / nên cải thiện / đạt yêu cầu / không áp dụng). Mỗi phát hiện đều kèm số hiệu văn bản pháp luật cụ thể để người dùng tự xác minh lại.

Plugin không chạy MCP server, không gửi dữ liệu đi đâu, không cần cấu hình gì thêm — toàn bộ nội dung là file markdown tĩnh (checklist + rules) mà Claude đọc trực tiếp khi skill được gọi.

Lưu ý quan trọng: đây là công cụ hỗ trợ rà soát ban đầu, **không phải tư vấn pháp lý chính thức**. Luật Việt Nam về mảng này đang trong giai đoạn chuyển tiếp mạnh (nhiều luật mới 2025 có hiệu lực năm 2026). Xem thêm chi tiết và giới hạn tại `skills/vn-law-check/DISCLAIMER.md`.

Mã nguồn đầy đủ và tài liệu: https://github.com/mhfed/vn-law-check

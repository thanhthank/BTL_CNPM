# 🤖 QUY TẮC VÀ NHẬT KÝ SỬ DỤNG CÔNG CỤ AI HỖ TRỢ TRONG DỰ ÁN
> **Căn cứ:** Mục 1.8 (Chương 1) và Phụ lục Z (Tài liệu hướng dẫn BTL Công nghệ Phần mềm)  
> **Người chịu trách nhiệm giám sát:** Vũ Thị Thanh (rAI - Project Coordinator & Doc Lead)

---

## 📜 1. Mục 1.8: Quy tắc sử dụng công cụ AI hỗ trợ trong dự án

Trong dự án này, nhóm chúng em có sử dụng các công cụ Trí tuệ nhân tạo (AI) hỗ trợ trong quá trình nghiên cứu, thiết kế và phát triển. Chi tiết các công cụ và mục đích sử dụng như sau:

### 1.1. Bảng công cụ AI sử dụng theo từng pha:

| Pha dự án | Tên công cụ AI | Mục đích sử dụng |
|---|---|---|
| **Pha 1: Khảo sát & Yêu cầu** | ChatGPT (OpenAI) / Claude (Anthropic) / Gemini | Hỗ trợ gợi ý các câu hỏi khảo sát người dùng thực tế; hỗ trợ tra cứu các chuẩn quản lý bất động sản cho thuê; gợi ý cấu trúc tài liệu đặc tả Use Case. |
| **Pha 2: Thiết kế hệ thống** | PlantUML AI / Mermaid.js AI / ChatGPT | Hỗ trợ sinh cú pháp mã nguồn vẽ biểu đồ (Use Case Diagram, Activity Diagram, Class Diagram, Sequence Diagram) từ kịch bản phân tích nghiệp vụ của nhóm. |
| **Pha 3: Lập trình phát triển** | GitHub Copilot / Antigravity AI / Cursor | Gợi ý hoàn thiện mã nguồn lặp lại (boilerplate code), sinh hàm tiện ích (date formatter, currency formatter), hỗ trợ viết truy vấn SQL / ORM. |
| **Pha 4: Kiểm thử phần mềm** | ChatGPT / Claude | Hỗ trợ đề xuất các ca kiểm thử biên (Boundary Value Analysis) và kịch bản kiểm thử dữ liệu ngoại lệ cho bộ 30+ Test Cases. |
| **Pha 5: Báo cáo & Tài liệu** | Antigravity / Gemini | Hỗ trợ rà soát lỗi chính tả, chuẩn hóa văn phong học thuật, kiểm tra tính nhất quán giữa các chương mục của quyển báo cáo. |

---

### 1.2. Hệ thống các quy tắc tuân thủ (AUR - AI Usage Rules):

Việc sử dụng các công cụ AI trong toàn bộ dự án tuân thủ nghiêm ngặt các quy tắc sau:

* **AUR.01 (Quy tắc Liêm chính học thuật và Minh bạch):** Mọi nội dung, ý tưởng, biểu đồ hoặc đoạn mã có sự trợ giúp đáng kể từ công cụ AI đều phải được khai báo trung thực, rõ ràng trong Nhật ký sử dụng AI (Phụ lục Z) và không được ngụy tạo là sản phẩm hoàn toàn do cá nhân tự viết mà không có công cụ hỗ trợ *(Căn cứ: Chuẩn mực đạo đức học thuật của Trường/Khoa CNTT)*.
* **AUR.02 (Quy tắc Con người làm chủ và Kiểm chứng - Human-in-the-Loop):** AI chỉ đóng vai trò là trợ lý gợi ý (Assistant/Copilot). Mọi kết quả do AI sinh ra (mã nguồn, biểu đồ UML, công thức tính toán) bắt buộc phải được thành viên phụ trách của nhóm đọc hiểu, rà soát logic, chạy thử nghiệm thực tế và chịu trách nhiệm 100% về tính chính xác và an toàn của sản phẩm.
* **AUR.03 (Quy tắc Bảo mật và Ẩn danh dữ liệu - Privacy & Anonymization):** Nghiêm cấm đưa các thông tin nhạy cảm của người dùng thực tế được khảo sát (như số điện thoại thật, số CCCD, tài khoản ngân hàng thật) vào các câu lệnh nhắc (prompts) của các dịch vụ AI công cộng. Toàn bộ dữ liệu đưa vào AI phải được ẩn danh hóa trước.
* **AUR.04 (Quy tắc Không sao chép nguyên mẫu mù quáng):** Thành viên nhóm không được chấp nhận mã nguồn do AI tạo ra nếu chưa nắm vững cơ chế hoạt động. Trong các buổi bảo vệ đồ án, từng thành viên phải giải trình được chi tiết từng dòng lệnh hoặc thành phần biểu đồ mình nộp.
* **AUR.05 (Quy tắc Kiểm thử độc lập):** Các đoạn mã do AI hỗ trợ sinh ra bắt buộc phải trải qua quy trình kiểm thử đơn vị (Unit Test) và kiểm thử chức năng do thành viên QA (Nguyễn Đình Ước) thẩm định độc lập trước khi merge vào nhánh `develop`.
* **AUR.99 (Quy tắc Dẫn chiếu bằng Footnote):** Mỗi sản phẩm trong báo cáo này (đoạn văn, bảng phân tích, biểu đồ UML, đoạn code mẫu) nếu sử dụng sự hỗ trợ của AI thì **bắt buộc phải được ghi chú tại nơi trình bày sản phẩm đó bằng Footnote dẫn chiếu trực tiếp tới mục tương ứng trong PHỤ LỤC Z**.

---

## 📝 2. Mẫu Phụ lục Z: NHẬT KÝ SỬ DỤNG AI (Dùng cho quyển Báo cáo)

*Mỗi khi thành viên sử dụng AI để hoàn thành một phần việc, thành viên đó phải điền một dòng vào bảng nhật ký này:*

| STT | Ngày thực hiện | Thành viên sử dụng | Công cụ sử dụng | Mục đích & Câu lệnh nhắc (Prompt chính) | Sản phẩm AI tạo ra | Hành động rà soát & Hiệu chỉnh của con người | Mã định danh dẫn chiếu (Footnote ID) |
|:---:|:---:|---|---|---|---|---|:---:|
| 1 | 02/11/2026 | Vũ Thị Thanh | Claude 3.5 Sonnet | "Gợi ý các tiêu chí so sánh giữa việc quản lý phòng trọ bằng Excel và phần mềm PMS chuyên nghiệp" | Bản phác thảo bảng so sánh 4 tiêu chí | Chọn lọc lại các tiêu chí sát thực tế cơ sở khảo sát, bổ sung cột Đề tài đề xuất. | `[Z.01]` |
| 2 | 03/11/2026 | Bùi Phương Minh | ChatGPT | "Viết cú pháp PlantUML cho Activity Diagram quy trình chốt số điện nước và xuất hóa đơn cuối tháng" | Mã PlantUML sơ bộ | Sửa lại luồng rẽ nhánh khi khách thanh toán trả góp nhiều đợt, bổ sung bước kiểm tra chỉ số âm. | `[Z.02]` |
| 3 | 04/11/2026 | Nguyễn Đình Đức | Antigravity AI | "Gợi ý schema SQL cho bảng contracts có liên kết căn hộ và khách thuê kèm ràng buộc ngày tháng" | Khung lệnh CREATE TABLE | Bổ sung khóa ngoại `ON DELETE RESTRICT`, thêm chỉ mục index cho trường `room_id`. | `[Z.03]` |
| 4 | 05/11/2026 | Nguyễn Hoàng Long | GitHub Copilot | "Hàm tính tiền điện bậc thang theo biểu giá 6 bậc của EVN" | Đoạn mã JavaScript tính lũy tiến | Kiểm tra lại từng bậc giá khớp với biểu giá thực tế năm 2026, viết unit test đối chiếu. | `[Z.04]` |
| 5 | 06/11/2026 | Nguyễn Đình Ước | ChatGPT | "Đề xuất 10 ca kiểm thử biên cho form nhập chỉ số công tơ điện nước căn hộ" | Danh sách 10 test cases | Chọn 6 test cases phù hợp, bổ sung thêm 4 test cases kiểm tra trùng kỳ ghi nhận. | `[Z.05]` |

### 📌 Hướng dẫn đặt Footnote trong văn bản Word / Google Docs:
Tại vị trí trình bày bảng biểu đồ hoặc đoạn phân tích có AI hỗ trợ, gõ footnote (ví dụ: `¹`):
> *Footnote 1:* Xem chi tiết quá trình sử dụng AI, prompt và rà soát của nhóm tại **Phụ lục Z, Mục Z.01**.

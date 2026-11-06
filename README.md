# 🏢 Hệ Thống Quản Lý Cho Thuê Căn Hộ Dịch Vụ
> **Bài tập lớn môn học:** Công nghệ Phần mềm (CNPM)  
> **Mô hình phát triển:** Agile / Scrum (8 tuần — 4 Sprint)  
> **Quy mô nhóm:** 9 thành viên  
> **Nền tảng mục tiêu:** Web Responsive (Hỗ trợ đa thiết bị: PC, Laptop, Máy tính bảng, Điện thoại di động)

---

## 📌 1. Giới thiệu đề tài

Hoạt động cho thuê căn hộ dịch vụ bao gồm nhiều nghiệp vụ có mối liên hệ chặt chẽ: quản lý phòng/căn hộ, hồ sơ khách thuê, hợp đồng thuê, chỉ số điện nước, hóa đơn, thanh toán từng đợt và xử lý yêu cầu sửa chữa cơ sở vật chất. 

Hiện nay, nhiều cơ sở vẫn vận hành thủ công qua sổ sách, Excel hoặc tin nhắn Zalo/điện thoại riêng lẻ, dẫn tới các khó khăn:
- Tính phí dịch vụ và tiền thuê dễ nhầm lẫn, sai sót.
- Khó đối chiếu các khoản khách đã thanh toán nhiều lần và số tiền công nợ còn thiếu.
- Nhập chỉ số điện nước thủ công dễ sai lệch hoặc bỏ sót kỳ.
- Tiếp nhận và theo dõi tiến độ sửa chữa thiết bị phân tán, thiếu tập trung.
- Dữ liệu khách thuê, tình trạng phòng trống và hạn hợp đồng rời rạc.

**Mục tiêu của dự án:** Xây dựng phần mềm web tập trung toàn bộ dữ liệu nghiệp vụ, tự động hóa quy trình tính toán công nợ - điện nước, minh bạch hóa tiến độ sửa chữa và cung cấp báo cáo tài chính trực quan cho người quản lý lẫn khách thuê.

---

## 👥 2. Danh sách thành viên và phân vai (Roles)

Dự án áp dụng khung làm việc **Agile/Scrum**, phân định rõ vai trò và phối hợp liên chức năng:

| STT | Họ và tên | Vai trò Scrum / Nhóm | Nhiệm vụ chính phụ trách |
|:---:|---|:---:|---|
| 1 | **Vũ Thị Thùy Dung** | DT (Developer - Frontend) | Thiết kế giao diện UI/UX mẫu; xây dựng frontend Admin & Khách thuê; tối ưu Responsive (Desktop & Mobile). |
| 2 | **Nguyễn Đình Đức** | DT (Developer - Backend / DB) | Chủ trì thiết kế CSDL (ERD/Schema); xây dựng phân hệ Căn hộ, Khách thuê, Hợp đồng; phụ trách Class Diagram. |
| 3 | **Nguyễn Hoàng Long** | DT (Developer - Backend Finance) | Xây dựng phân hệ Điện nước, Tính phí, Hóa đơn tự động, Thanh toán nhiều lần, Theo dõi công nợ & Báo cáo tài chính. |
| 4 | **Ninh Văn Thành Trung** | DT (Developer - Backend & Security) | Xây dựng Đăng nhập, Xác thực, Phân quyền (RBAC); phân hệ Tiếp nhận & Xử lý Yêu cầu sửa chữa; Sequence Diagram. |
| 5 | **Nguyễn Đình Ước** | DT (QA / Test Lead) | Chủ trì lập kế hoạch kiểm thử (Test Plan); viết Test Cases; Test tự động & hồi quy; đóng gói bản chạy thử & Hướng dẫn sử dụng. |
| 6 | **Nguyễn Hải Long** | rAI (Business Analyst) | Khảo sát thực tế; đặc tả yêu cầu chức năng (FR); lập bảng đặc tả Use Case chi tiết phân hệ Căn hộ, Khách thuê, Hợp đồng. |
| 7 | **Bùi Phương Minh** | rAI (Business Analyst) | Phân tích nghiệp vụ tài chính (điện nước bậc thang, công nợ, hóa đơn); xây dựng Activity Diagram; tạo bộ dữ liệu kiểm thử (Golden dataset). |
| 8 | **Vũ Thị Thanh** | rAI (Project Coordinator & Doc Lead) | Khảo sát & so sánh hệ thống liên quan; ma trận phân quyền; yêu cầu phi chức năng (NFR); biên tập & chuẩn hóa toàn bộ báo cáo môn học; quản lý nhật ký AI. |
| 9 | **Nguyễn Tuyết Mai** | rAI (Business Analyst) | Khảo sát quy trình xử lý sự cố sửa chữa; lập Activity Diagram quy trình sửa chữa; kiểm tra và ẩn danh hóa dữ liệu khảo sát thực tế. |

*(Chú thích: **DT** = Development Team / Kỹ thuật phát triển; **rAI** = Phân tích nghiệp vụ, Đảm bảo chất lượng & Chuẩn hóa tài liệu/Báo cáo theo quy chuẩn)*.

---

## 🚀 3. Phạm vi tính năng cốt lõi (Core Features)

1. **Quản lý tài khoản & Phân quyền (RBAC):**
   - Đăng nhập, đăng xuất, đổi mật khẩu, phân quyền chặt chẽ giữa Quản trị viên/Chủ nhà và Khách thuê.
2. **Quản lý Căn hộ, Hồ sơ khách thuê & Hợp đồng:**
   - Theo dõi trạng thái căn hộ (Trống, Đang thuê, Đang sửa chữa, Cần dọn dẹp).
   - Quản lý thông tin cá nhân khách thuê, thông tin hợp đồng (ngày bắt đầu, ngày kết thúc, giá thuê, tiền cọc).
3. **Ghi nhận & Quản lý Điện nước:**
   - Nhập chỉ số điện nước theo từng phòng và từng kỳ; kiểm tra hợp lệ dữ liệu (chỉ số mới không được nhỏ hơn kỳ trước).
4. **Lập Hóa đơn, Ghi nhận Thanh toán & Công nợ:**
   - Tự động sinh hóa đơn hàng tháng dựa trên tiền phòng + số điện/nước sử dụng + dịch vụ phát sinh.
   - Hỗ trợ khách thanh toán nhiều đợt; tự động bù trừ và tính chính xác công nợ còn lại.
5. **Tiếp nhận & Xử lý Yêu cầu Sửa chữa:**
   - Khách thuê gửi yêu cầu kèm mô tả/ảnh; Quản lý cập nhật trạng thái (`Mới tiếp nhận` → `Đang xử lý` → `Đã hoàn thành`).
6. **Báo cáo & Thống kê tài chính:**
   - Tổng hợp số liệu: Tổng tiền phải thu, Thực thu trong tháng, Tổng công nợ tồn đọng.
   - Hỗ trợ xuất mẫu in hóa đơn/phiếu thu tiêu chuẩn.

---

## 📅 4. Lộ trình phát triển 4 Sprint (8 tuần)

```
[Tuần 1 - 2]  Sprint 1: Khảo sát nghiệp vụ, chốt phạm vi, thiết kế Mockup UI, khởi tạo Git & Base Project
     ↓
[Tuần 3 - 4]  Sprint 2: Thiết kế DB & Class Diagram, Auth RBAC, hoàn thiện phân hệ Căn hộ - Khách thuê - Hợp đồng
     ↓
[Tuần 5 - 6]  Sprint 3: Phân hệ Điện nước, Hóa đơn, Thanh toán nhiều lần, Công nợ, Yêu cầu Sửa chữa
     ↓
[Tuần 7 - 8]  Sprint 4: Báo cáo tài chính, Mẫu in, Responsive đa thiết bị, Kiểm thử toàn diện & Nghiệm thu
```

---

## 🛠️ 5. Cấu trúc thư mục dự án

```
BTL_CNPM/
├── .github/
│   ├── ISSUE_TEMPLATE/       # Mẫu tạo task công việc và báo lỗi bug
│   └── pull_request_template.md # Mẫu kiểm tra trước khi merge code
├── docs/
│   ├── surveys/              # Mẫu biểu và dữ liệu khảo sát thực tế (ẩn danh)
│   ├── uml/                  # Biểu đồ Use Case, Activity, Class, Sequence Diagrams
│   ├── test_plans/           # Kế hoạch kiểm thử, bộ 30+ Test Cases, Bug logs
│   └── reports/              # Bản thảo và tài liệu báo cáo đồ án
├── src/
│   ├── backend/              # Mã nguồn backend (APIs, Database, Business Logic)
│   └── frontend/             # Mã nguồn frontend (Giao diện web Responsive)
├── tests/                    # Unit tests, Integration tests, Test scripts
├── .gitignore                # Danh sách file/thư mục không commit lên Git
├── CONTRIBUTING.md           # Hướng dẫn quy tắc Git, commit convention, review code
├── PHAN_CONG_CONG_VIEC.md    # Bảng phân công chi tiết công việc cho 9 thành viên
├── QUY_TAC_SU_DUNG_AI.md     # Quy tắc sử dụng AI (Mục 1.8) và Nhật ký AI (Phụ lục Z)
└── README.md                 # Tài liệu giới thiệu tổng quan dự án
```

---

## 💻 6. Hướng dẫn khởi tạo và làm việc nhóm với Git

### Bước 1: Khởi tạo Git repo và đưa lên GitHub
Repository đã được tạo và đẩy lên GitHub:
🔗 **URL Repository:** [https://github.com/thanhthank/BTL_CNPM](https://github.com/thanhthank/BTL_CNPM)

```bash
# Clone dự án về máy:
git clone https://github.com/thanhthank/BTL_CNPM.git
cd BTL_CNPM
```

### Bước 2: Tạo nhánh phát triển `develop`
```bash
git checkout -b develop
git push -u origin develop
```

### Bước 3: Quy tắc tạo nhánh tính năng cho từng thành viên
Mỗi thành viên khi làm việc sẽ tách nhánh từ nhánh `develop`:
```bash
git checkout develop
git pull origin develop
git checkout -b feature/<ten-thanh-vien>/<ten-tinh-nang>
```
*Chi tiết quy tắc commit và pull request xem tại file [`CONTRIBUTING.md`](CONTRIBUTING.md).*

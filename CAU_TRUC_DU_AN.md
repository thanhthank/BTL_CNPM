# 🏗️ CẤU TRÚC CHI TIẾT DỰ ÁN BTL CÔNG NGHỆ PHẦN MỀM
## Đề tài: Hệ Thống Quản Lý Cho Thuê Căn Hộ Dịch Vụ (Service Apartment Rental Management System)

> **Mô hình kiến trúc:** 3-Tier Architecture (Client - Server - Database) & Modular Clean Architecture  
> **Áp dụng chuẩn:** Chuẩn thiết kế kiến trúc phần mềm môn CNPM (Chương 4)  
> **Ngôn ngữ / Nền tảng:** Web Responsive (Frontend: React/Vue/HTML5 CSS3 Responsive + Backend: Node.js/Python + CSDL Quan hệ)

---

## 🏛️ 1. Kiến trúc tổng thể 3 tầng (3-Tier Architecture)

```
┌────────────────────────────────────────────────────────────────────────────────────────┐
│                              TẦNG GIAO DIỆN (PRESENTATION TIER)                         │
│                    Web Responsive (Desktop, Laptop, Tablet, Mobile Web)                │
│                                Phụ trách: Vũ Thị Thùy Dung                             │
└───────────────────────────────────────────┬────────────────────────────────────────────┘
                                            │ HTTP / JSON RESTful APIs
┌───────────────────────────────────────────▼────────────────────────────────────────────┐
│                             TẦNG XỬ LÝ NGHIỆP VỤ (APPLICATION TIER)                    │
│   ┌───────────────────┬───────────────────┬───────────────────┬────────────────────┐   │
│   │    Auth & RBAC    │  Căn hộ & Hợp đồng│ Điện nước & Billing│   Yêu cầu Sửa chữa │   │
│   │    (Thành Trung)  │     (Đình Đức)    │   (Hoàng Long)    │     (Thành Trung)  │   │
│   └───────────────────┴───────────────────┴───────────────────┴────────────────────┘   │
└───────────────────────────────────────────┬────────────────────────────────────────────┘
                                            │ SQL Queries / Transactions
┌───────────────────────────────────────────▼────────────────────────────────────────────┐
│                               TẦNG DỮ LIỆU (DATA STORAGE TIER)                          │
│               Hệ quản trị CSDL Quan hệ (PostgreSQL / MySQL / SQLite demo)               │
│                                Phụ trách: Nguyễn Đình Đức                              │
└────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## 📁 2. Sơ đồ cây thư mục chi tiết (Complete Directory Tree)

```
BTL_CNPM/
├── .github/                                # Cấu hình GitHub & Quy trình cộng tác
│   ├── ISSUE_TEMPLATE/
│   │   ├── bug_report.md                   # Mẫu báo cáo lỗi cho tester
│   │   └── task_template.md                # Mẫu giao việc Sprint Backlog
│   └── pull_request_template.md            # Mẫu kiểm tra trước khi merge code
│
├── docs/                                   # Toàn bộ hồ sơ tài liệu BTL môn học
│   ├── architecture/                       # Tài liệu thiết kế kiến trúc (Chương 4)
│   ├── database/                           # Sơ đồ thực thể ERD, Data Dictionary
│   ├── reports/                            # Bản thảo Báo cáo môn học (Chương 1 -> 6)
│   │   └── PHU_LUC_Z_NHAT_KY_AI.md         # Nhật ký sử dụng AI theo quy chuẩn AUR
│   ├── surveys/                            # Dữ liệu khảo sát thực tế (ẩn danh hóa)
│   ├── test_plans/                         # Kế hoạch và kịch bản kiểm thử (Chương 5)
│   │   └── test_cases.md                   # Danh mục 31 Test Cases chi tiết
│   └── uml/                                # Biểu đồ mô hình hóa phần mềm chuẩn UML
│       ├── usecases/                       # Use Case Diagram tổng quan & chi tiết
│       ├── activity/                       # Activity Diagram quy trình nghiệp vụ
│       ├── class/                          # Class Diagram phân hệ dữ liệu
│       └── sequence/                       # Sequence Diagram các luồng chức năng
│
├── src/                                    # MÃ NGUỒN PHẦN MỀM
│   ├── backend/                            # MÃ NGUỒN BACKEND (RESTful APIs)
│   │   ├── config/                         # Cấu hình hệ thống (DB, JWT, Ports, Envs)
│   │   ├── database/                       # CSDL & Migrations
│   │   │   ├── schema.sql                  # Script DDL khởi tạo toàn bộ CSDL
│   │   │   └── seeders.sql                 # Dữ liệu mẫu ban đầu để chạy thử
│   │   ├── middlewares/                    # Bộ lọc trung gian
│   │   │   ├── auth.middleware.js          # Xác thực JWT Token
│   │   │   ├── rbac.middleware.js          # Kiểm tra quyền: Admin vs Tenant
│   │   │   └── error.middleware.js         # Bắt và xử lý lỗi tập trung
│   │   ├── modules/                        # CÁC PHÂN HỆ NGHIỆP VỤ CỐT LÕI
│   │   │   ├── auth/                       # Phân hệ Xác thực (Thành Trung)
│   │   │   │   ├── auth.controller.js
│   │   │   │   ├── auth.service.js
│   │   │   │   └── auth.routes.js
│   │   │   ├── apartments/                 # Phân hệ Quản lý Căn hộ (Đình Đức)
│   │   │   │   ├── apartment.controller.js
│   │   │   │   ├── apartment.service.js
│   │   │   │   └── apartment.routes.js
│   │   │   ├── tenants/                    # Phân hệ Hồ sơ Khách thuê (Đình Đức)
│   │   │   │   ├── tenant.controller.js
│   │   │   │   └── tenant.routes.js
│   │   │   ├── contracts/                  # Phân hệ Quản lý Hợp đồng (Đình Đức)
│   │   │   │   ├── contract.controller.js
│   │   │   │   └── contract.routes.js
│   │   │   ├── utilities/                  # Phân hệ Ghi số Điện Nước (Hoàng Long)
│   │   │   │   ├── utility.controller.js
│   │   │   │   └── utility.routes.js
│   │   │   ├── billing/                    # Phân hệ Tự động Lập Hóa đơn (Hoàng Long)
│   │   │   │   ├── billing.controller.js
│   │   │   │   └── billing.routes.js
│   │   │   ├── payments/                   # Phân hệ Thanh toán & Công nợ (Hoàng Long)
│   │   │   │   ├── payment.controller.js
│   │   │   │   └── payment.routes.js
│   │   │   ├── maintenance/                # Phân hệ Tiếp nhận Sửa chữa (Thành Trung)
│   │   │   │   ├── ticket.controller.js
│   │   │   │   └── ticket.routes.js
│   │   │   └── reports/                    # Phân hệ Báo cáo Tài chính (Hoàng Long)
│   │   │       ├── report.controller.js
│   │   │       └── report.routes.js
│   │   ├── utils/                          # Tiện ích chung (Date, Currency, Validator)
│   │   └── app.js / server.js              # Điểm khởi chạy Backend Server
│   │
│   └── frontend/                           # MÃ NGUỒN GIAO DIỆN (Thùy Dung)
│       ├── public/                         # Tài nguyên tĩnh (Favicon, Logo, Assets)
│       └── src/
│           ├── components/                 # Các UI Components tái sử dụng
│           │   ├── common/                 # Nút bấm, Ô nhập, Modal, Bảng dữ liệu
│           │   └── layout/                 # Thanh điều hướng (Navbar), Menu (Sidebar)
│           ├── pages/                      # CÁC MÀN HÌNH CHỨC NĂNG
│           │   ├── admin/                  # Giao diện dành cho Quản lý / Chủ nhà
│           │   │   ├── DashboardPage.jsx   # Thống kê tổng quan tình trạng phòng
│           │   │   ├── ApartmentPage.jsx   # Danh sách và sơ đồ căn hộ
│           │   │   ├── ContractPage.jsx    # Lập và theo dõi hợp đồng
│           │   │   ├── UtilityPage.jsx     # Bảng nhập chỉ số điện nước theo kỳ
│           │   │   ├── InvoicePage.jsx     # Danh sách hóa đơn và mẫu in phiếu thu
│           │   │   ├── PaymentPage.jsx     # Ghi nhận thanh toán trả góp & công nợ
│           │   │   ├── MaintenancePage.jsx # Điều phối và xử lý sự cố sửa chữa
│           │   │   └── ReportPage.jsx      # Biểu đồ doanh thu, thực thu, công nợ
│           │   └── tenant/                 # Giao diện dành cho Khách thuê
│           │       ├── MyRoomPage.jsx      # Xem thông tin phòng & hợp đồng của mình
│           │       ├── MyInvoicesPage.jsx  # Xem hóa đơn điện nước & tiền thuê
│           │       └── RequestRepair.jsx   # Form gửi phản ánh hỏng hóc kèm ảnh
│           ├── services/                   # Module gọi API xuống backend (Axios/Fetch)
│           ├── styles/                     # CSS / Tailwind tối ưu Responsive Desktop & Mobile
│           └── utils/                      # Hàm định dạng tiền tệ VNĐ, định dạng ngày
│
├── tests/                                  # HỒ SƠ KIỂM THỬ TỰ ĐỘNG & BỘ TEST (Đình Ước)
│   ├── unit/                               # Kiểm thử đơn vị các hàm tính toán, validator
│   ├── integration/                        # Kiểm thử tích hợp các luồng API liên phân hệ
│   └── fixtures/                           # Bộ dữ liệu mẫu chuẩn (Golden Dataset từ Minh)
│
├── .env.example                            # Mẫu thiết lập biến môi trường
├── .gitignore                              # Danh mục file bỏ qua không đưa lên Git
├── CONTRIBUTING.md                         # Quy định làm việc Git Flow & Review code
├── PHAN_CONG_CONG_VIEC.md                  # Bản phân công 9 thành viên (DT & rAI)
├── QUY_TAC_SU_DUNG_AI.md                   # Quy tắc sử dụng AI (AUR) và Phụ lục Z
└── README.md                               # Hướng dẫn tổng quan dự án
```

---

## 👥 3. Ma trận Ánh xạ: Thành viên ↔ Thư mục mã nguồn trên Git

Để tránh việc các thành viên dẫm chân lên nhau hoặc gây ra xung đột merge code (Conflict), từng thành viên được phân định không gian làm việc chính xác:

| Khối | Thành viên | Nhánh Git | Thư mục & Tệp tin chịu trách nhiệm trực tiếp |
|:---:|---|---|---|
| **DT** | **Vũ Thị Thùy Dung** | `feature/dung-ui` | `src/frontend/**` *(Components, Pages Admin & Tenant, Styles Responsive)* |
| **DT** | **Nguyễn Đình Đức** | `feature/duc-core` | `src/backend/database/schema.sql`, `src/backend/modules/apartments/`, `src/backend/modules/tenants/`, `src/backend/modules/contracts/`, `docs/uml/class/` |
| **DT** | **Nguyễn Hoàng Long** | `feature/long-finance` | `src/backend/modules/utilities/`, `src/backend/modules/billing/`, `src/backend/modules/payments/`, `src/backend/modules/reports/` |
| **DT** | **Ninh Văn Thành Trung** | `feature/trung-auth-repair` | `src/backend/middlewares/`, `src/backend/modules/auth/`, `src/backend/modules/maintenance/`, `docs/uml/sequence/` |
| **DT** | **Nguyễn Đình Ước** | `feature/uoc-test-release` | `tests/**`, `docs/test_plans/**`, tài liệu cài đặt & User Manual |
| **rAI**| **Nguyễn Hải Long** | `docs/hailong-ba` | `docs/surveys/core/`, `docs/uml/usecases/` |
| **rAI**| **Bùi Phương Minh** | `docs/minh-finance` | `docs/surveys/finance/`, `docs/uml/activity/`, `tests/fixtures/golden_data.json` |
| **rAI**| **Vũ Thị Thanh** | `docs/thanh-lead` | `docs/reports/**`, `docs/architecture/`, `QUY_TAC_SU_DUNG_AI.md`, Quyển Báo cáo môn học Word |
| **rAI**| **Nguyễn Tuyết Mai** | `docs/mai-survey` | `docs/surveys/maintenance/`, `docs/uml/activity/` |

---

## 🗄️ 4. Cấu trúc Mô hình Dữ liệu Cốt lõi (Database Entities)

Được thiết kế tại file [`src/backend/database/schema.sql`](file:///C:/Users/vutha/Desktop/BTL_CNPM/src/backend/database/schema.sql) với các bảng quan hệ chặt chẽ:
1. `roles`: Quản lý danh mục vai trò (`ADMIN`, `TENANT`).
2. `users`: Tài khoản đăng nhập hệ thống, mật khẩu hash, phân quyền RBAC.
3. `apartments`: Danh sách phòng, tầng, diện tích, giá thuê, trạng thái (`Trống`, `Đang thuê`, `Bảo trì`).
4. `tenants`: Thông tin cá nhân khách thuê, số CCCD, liên hệ khẩn cấp.
5. `contracts`: Hợp đồng thuê phòng, thời hạn bắt đầu/kết thúc, tiền cọc, giá thuê thỏa thuận.
6. `utility_records`: Chỉ số điện nước cũ/mới theo từng kỳ tháng, tự động tính số tiêu thụ.
7. `invoices`: Hóa đơn tiền nhà + điện nước + dịch vụ hàng tháng, tính tổng phải thu và dư nợ.
8. `payments`: Lịch sử các lần khách thanh toán (hỗ trợ thanh toán nhiều lần/trả góp).
9. `maintenance_tickets`: Phiếu phản ánh sự cố hư hỏng cơ sở vật chất từ khách thuê và tiến độ xử lý.

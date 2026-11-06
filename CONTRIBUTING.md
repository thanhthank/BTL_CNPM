# 🤝 QUY ĐỊNH LÀM VIỆC VỚI GIT VÀ ĐÓNG GÓP MÃ NGUỒN (CONTRIBUTING GUIDE)

Tài liệu này quy định các quy chuẩn bắt buộc áp dụng cho toàn bộ 9 thành viên trong nhóm phát triển dự án **"Hệ Thống Quản Lý Cho Thuê Căn Hộ Dịch Vụ"**.

---

## 🌳 1. Mô hình phân nhánh (Branching Strategy)

Dự án áp dụng mô hình chuẩn **Git Flow** rút gọn để đảm bảo mã nguồn luôn ổn định:

```
[main]          ───●───────────────────────────● (Release v1.0)
                   ↑                           ↑
[develop]       ───●──────────●────────●───────●
                   │          ↑        ↑
[feature/...]      └──●───●───┘        │
[bugfix/...]                           └──●────┘
```

### Các nhánh cố định:
- **`main`**: Nhánh lưu trữ mã nguồn ổn định nhất, dùng để bàn giao, nghiệm thu và chấm điểm bài tập lớn. Tuyệt đối **KHÔNG** commit hoặc push trực tiếp vào `main`.
- **`develop`**: Nhánh tích hợp mã nguồn chính của toàn đội. Mọi tính năng mới sau khi kiểm thử đạt yêu cầu sẽ được merge vào đây thông qua Pull Request (PR).

### Quy tắc đặt tên nhánh tạm thời (Feature / Bugfix):
Mỗi thành viên khi nhận nhiệm vụ từ Sprint Backlog sẽ tạo một nhánh riêng từ `develop`:

| Mục đích | Quy tắc đặt tên nhánh | Ví dụ |
|---|---|---|
| Phát triển tính năng mới | `feature/<tên-thành-viên>/<tên-chức-năng>` | `feature/dung/ui-apartment-list`<br>`feature/duc/api-contract`<br>`feature/long/billing-calculation` |
| Sửa lỗi phát sinh | `bugfix/<tên-thành-viên>/<mã-lỗi-hoặc-tên-lỗi>` | `bugfix/uoc/fix-vat-calculation`<br>`bugfix/trung/fix-token-expiration` |
| Viết tài liệu / UML | `docs/<tên-thành-viên>/<nội-dung>` | `docs/thanh/system-comparison`<br>`docs/mai/activity-maintenance` |

---

## 📝 2. Quy chuẩn thông điệp Commit (Commit Convention)

Áp dụng chuẩn **Conventional Commits** để lịch sử commit rõ ràng, phục vụ cho việc chấm điểm đóng góp cá nhân của giảng viên:

### Cú pháp:
```
<loại_commit>: <mô tả ngắn gọn bằng tiếng Việt không dấu hoặc tiếng Anh>
```

### Các loại commit (Types):
- `feat`: Thêm một chức năng mới (Feature)
- `fix`: Sửa một lỗi (Bug fix)
- `docs`: Cập nhật tài liệu, biểu đồ UML, báo cáo
- `style`: Chỉnh sửa định dạng code (khoảng trắng, formatting, không đổi logic)
- `refactor`: Tái cấu trúc code (không thêm chức năng mới, không sửa lỗi)
- `test`: Thêm hoặc chỉnh sửa các bộ kiểm thử (Test cases, Unit test)
- `chore`: Cập nhật cấu hình build, thêm thư viện, file `.gitignore`

### Ví dụ chuẩn:
```bash
git commit -m "feat: xay dung api tinh tien dien nuoc tu dong theo chi so"
git commit -m "fix: sua loi lam tron so tien con lai khi khach tra gop"
git commit -m "docs: cap nhat Class Diagram phan he hop dong thue"
git commit -m "test: bo sung 5 test case kiem tra nhap chi so dien nuoc am"
```

---

## 🔄 3. Quy trình làm việc hàng ngày (Daily Git Workflow)

### Bước 1: Đồng bộ nhánh `develop` về máy cá nhân
Trước khi bắt đầu làm bất kỳ việc gì:
```bash
git checkout develop
git pull origin develop
```

### Bước 2: Tạo nhánh tính năng mới
```bash
git checkout -b feature/duc/api-apartment
```

### Bước 3: Lập trình và commit theo từng mốc nhỏ
```bash
# Xem các file thay đổi
git status

# Thêm file vào vùng chờ (stage)
git add src/backend/modules/apartments/

# Commit với thông điệp rõ ràng
git commit -m "feat: bo sung api loc phong theo trang thai trong va da thue"
```

### Bước 4: Đẩy nhánh lên GitHub
```bash
git push -u origin feature/duc/api-apartment
```

### Bước 5: Tạo Pull Request (PR) trên GitHub
1. Mở giao diện GitHub của repository.
2. Bấm nút **Compare & pull request**.
3. Chọn Base: `develop` ← Compare: `feature/duc/api-apartment`.
4. Điền nội dung theo mẫu **Pull Request Template**.
5. Gán **Reviewers** (chỉ định ít nhất 1 thành viên kiểm tra code).
6. Khi reviewer duyệt (Approve) và không có xung đột (No conflict), người tạo hoặc trưởng nhóm sẽ merge code vào `develop`.

---

## ⚠️ 4. Cách giải quyết xung đột mã nguồn (Merge Conflict)

Nếu nhánh của bạn bị conflict với `develop`, xử lý như sau:

```bash
# 1. Chuyển về develop và cập nhật mã mới nhất
git checkout develop
git pull origin develop

# 2. Chuyển lại về nhánh tính năng của bạn
git checkout feature/duc/api-apartment

# 3. Kéo mã mới nhất từ develop gộp vào nhánh của bạn
git merge develop

# 4. Lúc này Git sẽ báo file bị conflict (ví dụ: src/app.js)
# Mở VS Code lên, bấm chọn:
# - Accept Current Change (giữ code của mình)
# - Accept Incoming Change (lấy code từ develop)
# - hoặc Accept Both Changes (kết hợp cả hai)

# 5. Lưu file, add và commit giải quyết xung đột
git add .
git commit -m "fix: resolve merge conflicts with develop"

# 6. Đẩy lại lên GitHub
git push origin feature/duc/api-apartment
```

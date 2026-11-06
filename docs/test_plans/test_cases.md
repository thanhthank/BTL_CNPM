# 🧪 DANH SÁCH TEST CASES KIỂM THỬ HỆ THỐNG (TỐI THIỂU 30 TEST CASES)
> **Chủ trì kiểm thử:** Nguyễn Đình Ước (DT - QA/QC Lead)  
> **Mục tiêu SMART:** Hoàn thành tối thiểu 30 ca kiểm thử, 100% ca kiểm thử nghiệp vụ cốt lõi đạt trước nghiệm thu.

---

## 📑 Bảng danh mục 30+ Test Cases phân theo phân hệ:

| Mã TC | Phân hệ | Tên ca kiểm thử | Loại kiểm thử | Dữ liệu đầu vào / Điều kiện | Kết quả mong đợi | Trạng thái | Người test |
|:---:|---|---|:---:|---|---|:---:|:---:|
| **TC01** | Auth | Đăng nhập thành công với tài khoản Quản lý | Happy path | Email: `admin@qlch.vn`, Mật khẩu đúng | Đăng nhập thành công, chuyển hướng đến Dashboard Quản lý | Chờ test | Ước |
| **TC02** | Auth | Đăng nhập thành công với tài khoản Khách thuê | Happy path | Email khách thuê, Mật khẩu đúng | Đăng nhập thành công, chuyển hướng đến Cổng thông tin khách | Chờ test | Ước |
| **TC03** | Auth | Đăng nhập với mật khẩu sai | Negative | Mật khẩu sai quá 5 lần | Báo lỗi "Sai tài khoản hoặc mật khẩu", không cho đăng nhập | Chờ test | Ước |
| **TC04** | Auth | Kiểm tra bảo mật URL nội bộ khi chưa đăng nhập | Security | Truy cập thẳng URL `/admin/billing` | Tự động chuyển hướng về trang `/login` | Chờ test | Ước |
| **TC05** | Auth | Khách thuê cố tình truy cập trang quản trị | Security | Khách thuê gõ URL `/admin/apartments` | Báo lỗi 403 Forbidden hoặc chuyển hướng về trang chủ khách | Chờ test | Ước |
| **TC06** | Căn hộ | Thêm mới căn hộ hợp lệ | Happy path | Mã phòng: P201, Tầng: 2, Giá: 4.500.000đ | Lưu thành công, phòng hiển thị trạng thái "Trống" | Chờ test | Ước |
| **TC07** | Căn hộ | Thêm mới căn hộ với mã phòng bị trùng lặp | Negative | Mã phòng đã tồn tại trong hệ thống | Báo lỗi "Mã phòng đã tồn tại", không lưu trùng | Chờ test | Ước |
| **TC08** | Căn hộ | Cập nhật giá thuê căn hộ có giá trị âm | Boundary | Giá thuê: -1.000đ | Báo lỗi "Giá thuê phải lớn hơn 0", từ chối lưu | Chờ test | Ước |
| **TC09** | Căn hộ | Lọc danh sách căn hộ theo trạng thái "Đang thuê" | Filter | Chọn bộ lọc: "Đang thuê" | Chỉ hiển thị các phòng hiện đang có hợp đồng hiệu lực | Chờ test | Ước |
| **TC10** | Khách thuê | Tiếp nhận hồ sơ khách thuê mới đầy đủ | Happy path | Tên, CCCD (12 số), Số điện thoại (10 số) | Hồ sơ lưu thành công vào CSDL | Chờ test | Ước |
| **TC11** | Khách thuê | Nhập số CCCD sai định dạng (chứa chữ cái) | Boundary | CCCD: `001234ABC99` | Báo lỗi "CCCD không hợp lệ, chỉ được chứa 12 chữ số" | Chờ test | Ước |
| **TC12** | Hợp đồng | Tạo hợp đồng thuê cho phòng đang còn trống | Happy path | Phòng trống, ngày bắt đầu < ngày kết thúc | Tạo hợp đồng thành công, trạng thái phòng chuyển sang "Đang thuê" | Chờ test | Ước |
| **TC13** | Hợp đồng | Tạo hợp đồng cho phòng đã có người đang thuê | Negative | Chọn phòng đang ở trạng thái "Đang thuê" | Báo lỗi "Phòng này hiện đang có khách thuê hiệu lực" | Chờ test | Ước |
| **TC14** | Hợp đồng | Ngày kết thúc hợp đồng nhỏ hơn ngày bắt đầu | Boundary | Bắt đầu: 01/12/2026, Kết thúc: 01/11/2026 | Báo lỗi "Ngày kết thúc phải sau ngày bắt đầu" | Chờ test | Ước |
| **TC15** | Hợp đồng | Thanh lý hợp đồng thuê trước hạn | Business | Bấm thanh lý hợp đồng P201 | Trạng thái hợp đồng đổi thành "Đã kết thúc", phòng đổi về "Trống" | Chờ test | Ước |
| **TC16** | Điện nước | Nhập chỉ số điện nước hợp lệ theo kỳ tháng | Happy path | Kỳ 11/2026, Điện cũ: 120, Điện mới: 165 | Lưu thành công, số điện tiêu thụ tính là 45 kWh | Chờ test | Ước |
| **TC17** | Điện nước | Nhập chỉ số mới nhỏ hơn chỉ số kỳ trước | Negative | Kỳ 11/2026, Điện cũ: 150, Điện mới: 130 | Báo lỗi "Chỉ số mới không được nhỏ hơn chỉ số kỳ trước" | Chờ test | Ước |
| **TC18** | Điện nước | Nhập chỉ số điện nước kỳ bị trùng lặp | Negative | Nhập lại chỉ số kỳ 11/2026 cho cùng phòng | Báo lỗi "Chỉ số kỳ này đã được ghi nhận trước đó" | Chờ test | Ước |
| **TC19** | Hóa đơn | Tự động lập hóa đơn hàng tháng đầy đủ các mục | Happy path | Tiền phòng + Điện + Nước + Rác + Dịch vụ | Hóa đơn sinh ra đúng tổng tiền = cộng các khoản con | Chờ test | Ước |
| **TC20** | Hóa đơn | Khách thuê xem hóa đơn thuộc phòng của mình | Happy path | Khách phòng P201 đăng nhập | Chỉ nhìn thấy hóa đơn của P201, không thấy phòng P202 | Chờ test | Ước |
| **TC21** | Thanh toán | Ghi nhận thanh toán toàn bộ hóa đơn một lần | Happy path | Hóa đơn 5.200.000đ, Thanh toán: 5.200.000đ | Trạng thái hóa đơn chuyển thành "Đã thanh toán", nợ = 0 | Chờ test | Ước |
| **TC22** | Thanh toán | Khách thanh toán trước một phần (trả góp) | Business | Hóa đơn 5.000.000đ, Trả đợt 1: 3.000.000đ | Hóa đơn đổi thành "Thanh toán một phần", công nợ còn: 2.000.000đ | Chờ test | Ước |
| **TC23** | Thanh toán | Khách thanh toán nốt phần tiền còn lại ở đợt 2 | Business | Nợ cũ: 2.000.000đ, Trả đợt 2: 2.000.000đ | Hóa đơn đổi thành "Đã thanh toán", công nợ cập nhật về 0đ | Chờ test | Ước |
| **TC24** | Thanh toán | Nhập số tiền thanh toán vượt quá số nợ còn lại | Boundary | Nợ: 1.000.000đ, Nhập trả: 1.500.000đ | Hệ thống cảnh báo hoặc ghi nhận số dư thừa sang kỳ sau | Chờ test | Ước |
| **TC25** | Sửa chữa | Khách thuê gửi yêu cầu sửa chữa kèm mô tả | Happy path | Tiêu đề: "Hỏng vòi sen", Nội dung: "Bị rò nước" | Yêu cầu lưu thành công, trạng thái: "Mới tiếp nhận" | Chờ test | Ước |
| **TC26** | Sửa chữa | Quản lý chuyển trạng thái yêu cầu sang "Đang xử lý" | Happy path | Chọn yêu cầu P201, cập nhật "Đang xử lý" | Trạng thái cập nhật, khách xem thấy trạng thái mới | Chờ test | Ước |
| **TC27** | Sửa chữa | Hoàn thành và lưu vết lịch sử sửa chữa | Happy path | Ghi chú: "Đã thay gioăng", bấm "Hoàn thành" | Yêu cầu đổi thành "Đã giải quyết", lưu rõ thời gian và người sửa | Chờ test | Ước |
| **TC28** | Báo cáo | Đối chiếu tổng tiền phải thu trong tháng | Business | Tổng tất cả hóa đơn phát sinh kỳ 11/2026 | Báo cáo hiển thị chính xác tổng tiền phải thu khớp dữ liệu | Chờ test | Ước |
| **TC29** | Báo cáo | Báo cáo công nợ lũy kế chính xác | Business | Lọc khách còn nợ tiền phòng | Liệt kê đúng danh sách khách nợ và số tiền nợ từng người | Chờ test | Ước |
| **TC30** | Đa thiết bị | Kiểm tra giao diện trên màn hình điện thoại (Mobile) | Responsive | Mở web trên trình duyệt điện thoại (375px - 414px) | Menu thu gọn vào hamburger, bảng cuộn ngang, nút bấm dễ chạm | Chờ test | Ước |
| **TC31** | Mẫu in | Kiểm tra chức năng xuất/in hóa đơn thu tiền | Export/Print | Bấm nút "In phiếu thu" | Hiển thị định dạng in chuẩn khổ A5/A4, có đầy đủ chữ ký 2 bên | Chờ test | Ước |

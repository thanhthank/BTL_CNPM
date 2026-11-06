-- ====================================================================
-- DATABASE SCHEMA: HỆ THỐNG QUẢN LÝ CHO THUÊ CĂN HỘ DỊCH VỤ
-- Phụ trách thiết kế CSDL: Nguyễn Đình Đức (DT)
-- Chuẩn hóa quan hệ & mô hình hóa: Bùi Phương Minh & Nguyễn Hải Long (rAI)
-- ====================================================================

-- 1. Bảng Vai trò người dùng (Roles)
CREATE TABLE IF NOT EXISTS roles (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,      -- 'ADMIN', 'TENANT', 'STAFF'
    description VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Bảng Tài khoản người dùng (Users)
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    role_id INT NOT NULL REFERENCES roles(id) ON DELETE RESTRICT,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Bảng Căn hộ / Phòng (Apartments)
CREATE TABLE IF NOT EXISTS apartments (
    id SERIAL PRIMARY KEY,
    room_number VARCHAR(20) UNIQUE NOT NULL,    -- Ví dụ: 'P101', 'P202'
    floor INT NOT NULL,
    area_sqm NUMERIC(5,2),                       -- Diện tích m2
    base_price NUMERIC(12,2) NOT NULL,           -- Giá thuê cơ bản (VNĐ)
    status VARCHAR(30) DEFAULT 'VACANT',        -- 'VACANT' (Trống), 'OCCUPIED' (Đang thuê), 'MAINTENANCE' (Bảo trì)
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. Bảng Hồ sơ Khách thuê (Tenants)
CREATE TABLE IF NOT EXISTS tenants (
    id SERIAL PRIMARY KEY,
    user_id INT UNIQUE REFERENCES users(id) ON DELETE SET NULL,
    full_name VARCHAR(100) NOT NULL,
    cccd_number VARCHAR(20) UNIQUE NOT NULL,    -- Căn cước công dân 12 chữ số
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(100),
    hometown VARCHAR(255),                      -- Quê quán / Địa chỉ thường trú
    emergency_contact VARCHAR(100),             -- Người liên hệ khẩn cấp
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 5. Bảng Hợp đồng Thuê (Contracts)
CREATE TABLE IF NOT EXISTS contracts (
    id SERIAL PRIMARY KEY,
    contract_number VARCHAR(50) UNIQUE NOT NULL, -- Số hợp đồng: 'HD-2026-P101'
    apartment_id INT NOT NULL REFERENCES apartments(id) ON DELETE RESTRICT,
    tenant_id INT NOT NULL REFERENCES tenants(id) ON DELETE RESTRICT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    monthly_rent NUMERIC(12,2) NOT NULL,         -- Giá thuê thỏa thuận hàng tháng
    deposit_amount NUMERIC(12,2) NOT NULL,       -- Tiền đặt cọc
    status VARCHAR(30) DEFAULT 'ACTIVE',         -- 'ACTIVE', 'EXPIRED', 'TERMINATED'
    note TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_dates CHECK (end_date > start_date)
);

-- 6. Bảng Ghi nhận Chỉ số Điện Nước theo Kỳ (Utility Records)
CREATE TABLE IF NOT EXISTS utility_records (
    id SERIAL PRIMARY KEY,
    apartment_id INT NOT NULL REFERENCES apartments(id) ON DELETE CASCADE,
    billing_month VARCHAR(7) NOT NULL,           -- Định dạng: 'YYYY-MM' (ví dụ: '2026-11')
    old_electric INT NOT NULL,                   -- Chỉ số điện cũ
    new_electric INT NOT NULL,                   -- Chỉ số điện mới
    electric_consumed INT GENERATED ALWAYS AS (new_electric - old_electric) STORED,
    old_water INT NOT NULL,                      -- Chỉ số nước cũ
    new_water INT NOT NULL,                      -- Chỉ số nước mới
    water_consumed INT GENERATED ALWAYS AS (new_water - old_water) STORED,
    recorded_date DATE NOT NULL DEFAULT CURRENT_DATE,
    recorded_by INT REFERENCES users(id),
    CONSTRAINT uk_apartment_period UNIQUE (apartment_id, billing_month),
    CONSTRAINT chk_electric CHECK (new_electric >= old_electric),
    CONSTRAINT chk_water CHECK (new_water >= old_water)
);

-- 7. Bảng Hóa đơn Hàng tháng (Invoices)
CREATE TABLE IF NOT EXISTS invoices (
    id SERIAL PRIMARY KEY,
    invoice_code VARCHAR(50) UNIQUE NOT NULL,   -- Mã hóa đơn: 'INV-202611-P101'
    contract_id INT NOT NULL REFERENCES contracts(id) ON DELETE RESTRICT,
    billing_month VARCHAR(7) NOT NULL,          -- 'YYYY-MM'
    room_charge NUMERIC(12,2) NOT NULL,          -- Tiền thuê phòng
    electric_charge NUMERIC(12,2) DEFAULT 0,     -- Tiền điện
    water_charge NUMERIC(12,2) DEFAULT 0,        -- Tiền nước
    service_charge NUMERIC(12,2) DEFAULT 0,      -- Phí vệ sinh, wifi, rác,...
    total_amount NUMERIC(12,2) NOT NULL,         -- Tổng tiền phải thu
    paid_amount NUMERIC(12,2) DEFAULT 0,         -- Số tiền thực thu (đã trả)
    debt_amount NUMERIC(12,2) NOT NULL,          -- Công nợ còn lại (= total - paid)
    due_date DATE NOT NULL,                      -- Hạn nộp tiền
    status VARCHAR(30) DEFAULT 'UNPAID',         -- 'UNPAID', 'PARTIALLY_PAID', 'PAID', 'OVERDUE'
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 8. Bảng Lịch sử Thanh toán Nhiều lần (Payments)
CREATE TABLE IF NOT EXISTS payments (
    id SERIAL PRIMARY KEY,
    invoice_id INT NOT NULL REFERENCES invoices(id) ON DELETE RESTRICT,
    payment_code VARCHAR(50) UNIQUE NOT NULL,    -- 'PAY-202611-001'
    amount_paid NUMERIC(12,2) NOT NULL,          -- Số tiền khách đóng đợt này
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(50) DEFAULT 'CASH',   -- 'CASH' (Tiền mặt), 'TRANSFER' (Chuyển khoản)
    transaction_ref VARCHAR(100),                -- Mã tham chiếu ngân hàng nếu CK
    note VARCHAR(255),
    received_by INT REFERENCES users(id)         -- Người thu tiền
);

-- 9. Bảng Tiếp nhận & Xử lý Sự cố Sửa chữa (Maintenance Tickets)
CREATE TABLE IF NOT EXISTS maintenance_tickets (
    id SERIAL PRIMARY KEY,
    ticket_code VARCHAR(50) UNIQUE NOT NULL,     -- 'TCK-2026-001'
    apartment_id INT NOT NULL REFERENCES apartments(id) ON DELETE CASCADE,
    tenant_id INT NOT NULL REFERENCES tenants(id) ON DELETE CASCADE,
    title VARCHAR(150) NOT NULL,                 -- Tiêu đề: 'Hỏng vòi sen nhà tắm'
    description TEXT NOT NULL,                   -- Mô tả chi tiết sự cố
    image_url VARCHAR(255),                      -- Ảnh chụp hiện trường
    priority VARCHAR(20) DEFAULT 'NORMAL',       -- 'LOW', 'NORMAL', 'URGENT'
    status VARCHAR(30) DEFAULT 'NEW',            -- 'NEW' (Mới), 'IN_PROGRESS' (Đang sửa), 'RESOLVED' (Đã xong), 'CANCELLED' (Hủy)
    technician_note TEXT,                        -- Ghi chú của thợ sửa
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    resolved_at TIMESTAMP
);

-- Seed Data ban đầu:
INSERT INTO roles (name, description) VALUES 
('ADMIN', 'Người quản trị / Chủ cơ sở căn hộ dịch vụ'),
('TENANT', 'Khách thuê căn hộ');

# 🚔 Crime Management System

**Crime Management System** là một dự án mô phỏng hệ thống quản lý tội phạm, xây dựng bằng Django và MySQL. Hệ thống hỗ trợ quản lý báo cáo tội phạm, quá trình điều tra, và tài khoản người dùng.

> 📦 Hỗ trợ triển khai:
> - [Docker](deploy_docker.md)
> - [Gunicorn + Nginx](deploy_nginx.md)

---

## 📋 Yêu cầu hệ thống

Trước khi bắt đầu, hãy đảm bảo bạn đã cài đặt:

- Python ≥ 3.13  
- MySQL  
- Git  
- pip  
- Virtual Environment (`venv`)

---

## 📦 Clone mã nguồn

```bash
git clone https://github.com/maiviet283/crime_investigation_system.git
cd crime_investigation_system
```

---

## 🗄️ Thiết lập cơ sở dữ liệu

### 1. Tạo database và người dùng MySQL

```sql
CREATE DATABASE crime_management_db;

-- Đăng nhập MySQL bằng quyền sudo
sudo mysql

-- Tạo user và cấp quyền
CREATE USER 'maiviet283'@'localhost' IDENTIFIED BY '12345678';
GRANT ALL PRIVILEGES ON *.* TO 'maiviet283'@'localhost';
FLUSH PRIVILEGES;
```

### 2. Import dữ liệu mẫu

Import file `crime_management.sql` bằng phpMyAdmin hoặc MySQL CLI.

### 3. Tạo file `.env`

```env
# Cấu hình database
DB_NAME=crime_management
DB_USER=root
DB_PASSWORD=12345678
DB_HOST=localhost
DB_PORT=3306

# Django settings
SECRET_KEY=your_secret_key_here
DEBUG=True
```

> ⚠️ **Lưu ý:** Không commit file `.env` lên repository công khai.

---

## ⚙️ Thiết lập môi trường ảo

```bash
python -m venv venv
```

**Kích hoạt môi trường:**

- Windows: `venv\Scripts\activate`  
- macOS/Linux: `source venv/bin/activate`

---

## 📥 Cài đặt dependencies

```bash
pip install -r requirements.txt
```

---

## 🚀 Khởi chạy ứng dụng

```bash
python manage.py runserver
```

Truy cập tại: [http://127.0.0.1:8000](http://127.0.0.1:8000)

---

## 🔐 Tài khoản đăng nhập

### 👤 Quản trị viên

- URL: `/admin`
- Username: `maiviet283`
- Password: `bigdreamer1`

### 👥 Người dùng thường

- URL: `/accounts/login/`
- Username: `admin.john`
- Password: `password123`

> 🔐 *Tất cả tài khoản người dùng đều dùng mật khẩu:* `password123`

---

## 🌐 Các trang chính

| Trang         | URL                                      |
|---------------|-------------------------------------------|
| 🔑 Login       | `/login/`                                 |
| 🏠 Homepage    | `/`                                       |
| 👤 Accounts    | `/accounts`                               |
| 🛠️ Admin Panel | `/admin`                                  |

---

## 💡 Ghi chú

- Đảm bảo MySQL đang chạy trước khi khởi động Django.  
- Luôn bảo mật `SECRET_KEY` trong môi trường production.  
- Có thể triển khai bằng Docker hoặc Nginx tùy theo nhu cầu.

---

## 📷 Screenshot (Tuỳ chọn)

> Bạn có thể thêm ảnh chụp màn hình giao diện đăng nhập, dashboard, hoặc trang báo cáo tại đây.

---

## 👨‍💻 Tác giả

- **Nhóm 4 - Mock Project Python**  
- 📁 [GitHub Repository](https://github.com/maiviet283/crime_investigation_system)
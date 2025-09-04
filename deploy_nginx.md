# 🚀 Hướng Dẫn Triển Khai Django với Gunicorn và Nginx trên Ubuntu

Triển khai ứng dụng Django sử dụng Gunicorn làm WSGI server và Nginx làm reverse proxy trên hệ điều hành Ubuntu.

---

## 📌 Bước 1: Tạo người dùng mới và cấp quyền sudo

```bash
sudo adduser maiviet283
sudo usermod -aG sudo maiviet283
su - maiviet283
```

---

## 📌 Bước 2: Cập nhật hệ thống và cài đặt các gói cần thiết

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install python3-pip python3-venv nginx git -y
sudo apt install pkg-config libmysqlclient-dev build-essential -y
```

---

## 📌 Bước 3: Clone mã nguồn từ GitHub

```bash
cd /home/maiviet283/
git clone https://github.com/maiviet283/crime_investigation_system.git
cd crime_investigation_system/
```

---

## 📌 Bước 4: Thiết lập môi trường ảo và cài đặt dependencies

```bash
python3 -m venv /home/maiviet283/venv
source /home/maiviet283/venv/bin/activate
pip install -r requirements.txt
```

---

## 📌 Bước 5: Thu thập file tĩnh

```bash
python3 manage.py collectstatic
sudo mkdir -p /home/maiviet283/crime_investigation_system/staticfiles
sudo chown -R www-data:www-data /home/maiviet283/crime_investigation_system/staticfiles
sudo chmod -R 755 /home/maiviet283/crime_investigation_system/staticfiles
```

---

# ⚙️ Cấu Hình Gunicorn

## 📌 Bước 6: Tạo file socket cho Gunicorn

```bash
sudo nano /etc/systemd/system/gunicorn.socket
```

**Nội dung:**

```ini
[Unit]
Description=Gunicorn socket for Django

[Socket]
ListenStream=/run/gunicorn.sock

[Install]
WantedBy=sockets.target
```

---

## 📌 Bước 7: Tạo service cho Gunicorn

```bash
sudo nano /etc/systemd/system/gunicorn.service
```

**Nội dung:**

```ini
[Unit]
Description=Gunicorn daemon
Requires=gunicorn.socket
After=network.target

[Service]
User=maiviet283
Group=www-data
WorkingDirectory=/home/maiviet283/crime_investigation_system
ExecStart=/home/maiviet283/venv/bin/gunicorn \
          --access-logfile - \
          --workers 3 \
          --bind unix:/run/gunicorn.sock \
          crime_management.wsgi:application

[Install]
WantedBy=multi-user.target
```

---

## 📌 Bước 8: Khởi động và kiểm tra Gunicorn

```bash
sudo systemctl daemon-reload
sudo systemctl start gunicorn
sudo systemctl enable gunicorn
sudo systemctl status gunicorn
```

---

# 🌐 Cấu Hình Nginx

## 📌 Bước 9: Tạo file cấu hình Nginx cho project

```bash
sudo nano /etc/nginx/sites-available/crime_investigation_system
```

**Nội dung:**

```nginx
server {
    listen 80;
    server_name 172.21.252.90;

    location = /favicon.ico { access_log off; log_not_found off; }

    location /static/ {
        alias /home/maiviet283/crime_investigation_system/staticfiles/;
        try_files $uri =404;
        access_log off;
        expires 30d;
        add_header Cache-Control "public";
    }

    location /media/ {
        alias /home/maiviet283/crime_investigation_system/media/;
        autoindex off;
    }

    location / {
        proxy_pass http://unix:/run/gunicorn.sock;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_read_timeout 60s;
        client_max_body_size 20m;
    }

    add_header X-Content-Type-Options nosniff;
    add_header X-Frame-Options DENY;
    add_header Referrer-Policy strict-origin-when-cross-origin;
}
```

---

## 📌 Bước 10: Kích hoạt cấu hình Nginx

```bash
sudo ln -s /etc/nginx/sites-available/crime_investigation_system /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx
```

---

# 🔐 Cấp Quyền và Kiểm Tra

## 📌 Bước 11: Cấp quyền thư mục

```bash
sudo chmod 755 /home/maiviet283
sudo find /home/maiviet283/crime_investigation_system/staticfiles/ -type d -exec chmod 755 {} \;
```

---

## 📌 Bước 12: Kiểm tra Gunicorn socket

```bash
ls -l /run/gunicorn.sock
```

➡ Nếu file tồn tại, Gunicorn đang hoạt động đúng.

---

# ✅ Hoàn Tất

Bạn có thể truy cập website bằng địa chỉ IP hoặc tên miền đã cấu hình.

🔗 Ví dụ: [http://172.21.252.90](http://172.21.252.90)

---

✍️ **Tác giả:** [Mai Viet](https://github.com/maiviet283)  
📌 **Project:** Crime Investigation System

# 🚔 Crime Management System (Django Project)

This is a mock project for managing crime reports, investigations, and user accounts using Django and MySQL.

[How to deploy Docker if you want](How_Deploy_Docker.md)

---

## 🔧 Requirements

* Python 3.13+
* MySQL
* Git
* Virtual Environment (`venv`)
* pip

---

## 📦 Clone Project

```bash
git clone https://github.com/maiviet283/crime_investigation_system.git
cd crime_investigation_system
```

---

## 🗄️ Setup Database

1. **Create a MySQL database:**

   ```sql
   CREATE DATABASE crime_management_db;
   ```

2. **Import schema and sample data:**
   Open MySQL (e.g., via phpMyAdmin or CLI) and import the file:

   ```
   crime_management.sql
   ```

3. **Configure `.env` file:**

   Create a `.env` file in the root directory with the following (edit if needed):

   ```env
   # Database settings
   DB_NAME=crime_management
   DB_USER=root
   DB_PASSWORD=12345678
   DB_HOST=localhost
   DB_PORT=3306

   # Django secret key
   SECRET_KEY=

   # Debug mode
   DEBUG=True
   ```

---

## ⚙️ Setup Virtual Environment

```bash
python -m venv venv
# Activate environment
# Windows
venv\Scripts\activate
# macOS/Linux
source venv/bin/activate
```

---

## 📥 Install Dependencies

```bash
pip install -r requirements.txt
```

---

## 🚀 Run the Project

```bash
python manage.py runserver
```

By default, it will run at:
🔗 [http://127.0.0.1:8000](http://127.0.0.1:8000)

---

## 🔐 Login Credentials

### 👤 Admin:

* URL: [http://127.0.0.1:8000/admin](http://127.0.0.1:8000/admin)
* **Username:** `maiviet283`
* **Password:** `bigdreamer1`

### 👥 Regular User:

* URL: [http://127.0.0.1:8000/accounts/login/](http://127.0.0.1:8000/accounts/login/)
* **Username:** `admin.john`
* **Password:** `password123`

🔐 *All user accounts use the password:* `password123`

---

## 🌐 Site Pages

* 🔑 **Login**: [http://127.0.0.1:8000/login/](http://127.0.0.1:8000/login/)
* 🏠 **Homepage**: [http://127.0.0.1:8000/](http://127.0.0.1:8000/)
* 👤 **Accounts**: [http://127.0.0.1:8000/accounts](http://127.0.0.1:8000/accounts)
* 🛠️ **Admin Panel**: [http://127.0.0.1:8000/admin](http://127.0.0.1:8000/admin)

---

## 💡 Notes

* Make sure MySQL is running and accessible before starting the server.
* The `.env` file is required to connect to your database. Never commit it to public repositories.
* Customize the `SECRET_KEY` in production.

---

## 📷 Screenshot (Optional)

> You can add screenshots here to show login page, dashboard, or report views.

---

## 👨‍💻 Authors

* **Nhóm 4 - Mock Project Python**
* [GitHub Repository](https://github.com/maiviet283/crime_investigation_system)
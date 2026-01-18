CREATE DATABASE IF NOT EXISTS stockmaster_db;
USE stockmaster_db;

CREATE TABLE users (
                       user_id INT AUTO_INCREMENT PRIMARY KEY,
                       username VARCHAR(50) NOT NULL UNIQUE,
                       password_hash VARCHAR(255) NOT NULL,
                       role ENUM('ADMIN', 'CASHIER') NOT NULL,
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categories (
                            category_id INT AUTO_INCREMENT PRIMARY KEY,
                            category_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE products (
                          product_id INT AUTO_INCREMENT PRIMARY KEY,
                          sku VARCHAR(50) NOT NULL UNIQUE,
                          product_name VARCHAR(150) NOT NULL,
                          category_id INT,
                          cost_price DECIMAL(10, 2) NOT NULL,
                          selling_price DECIMAL(10, 2) NOT NULL,
                          quantity_in_stock INT NOT NULL DEFAULT 0,
                          min_stock_level INT DEFAULT 5,
                          FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE SET NULL
);

CREATE TABLE sales (
                       sale_id INT AUTO_INCREMENT PRIMARY KEY,
                       user_id INT,
                       total_amount DECIMAL(10, 2) NOT NULL,
                       tax_amount DECIMAL(10, 2) NOT NULL,
                       sale_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE sale_items (
                            item_id INT AUTO_INCREMENT PRIMARY KEY,
                            sale_id INT,
                            product_id INT,
                            quantity INT NOT NULL,
                            unit_price DECIMAL(10, 2) NOT NULL,
                            subtotal DECIMAL(10, 2) NOT NULL,
                            FOREIGN KEY (sale_id) REFERENCES sales(sale_id) ON DELETE CASCADE,
                            FOREIGN KEY (product_id) REFERENCES products(product_id)
);
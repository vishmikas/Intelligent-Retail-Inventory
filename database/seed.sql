INSERT INTO users (username, password_hash, role)
VALUES ('admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'ADMIN');

INSERT INTO categories (category_name) VALUES ('Electronics'), ('Groceries'), ('Stationery');

INSERT INTO products (sku, product_name, category_id, cost_price, selling_price, quantity_in_stock)
VALUES ('LAP001', 'Gaming Laptop', 1, 800.00, 1200.00, 10),
       ('MOU002', 'Wireless Mouse', 1, 15.00, 30.00, 50),
       ('PEN003', 'Blue Ballpoint Pen', 3, 0.20, 1.00, 200);
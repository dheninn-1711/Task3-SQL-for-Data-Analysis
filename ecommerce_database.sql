CREATE DATABASE ecommerce_db;
USE ecommerce_db;

-- Create tables
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert categories
INSERT INTO categories (category_id, category_name) VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Books'),
(4, 'Home'),
(5, 'Beauty');

-- Insert customers
INSERT INTO customers (customer_id, customer_name, email, city) VALUES
(1, 'Alice Smith', 'alice@example.com', 'New York'),
(2, 'Bob Johnson', 'bob@example.com', 'Los Angeles'),
(3, 'Carol White', 'carol@example.com', 'Chicago'),
(4, 'David Brown', 'david@example.com', 'Houston'),
(5, 'Eve Davis', 'eve@example.com', 'Phoenix'),
(6, 'Frank Moore', 'frank@example.com', 'Philadelphia'),
(7, 'Grace Taylor', 'grace@example.com', 'San Antonio'),
(8, 'Henry Anderson', 'henry@example.com', 'San Diego'),
(9, 'Irene Thomas', 'irene@example.com', 'Dallas'),
(10, 'Jack Wilson', 'jack@example.com', 'San Jose'),
(11, 'Karen Young', 'karen@example.com', 'Austin'),
(12, 'Liam King', 'liam@example.com', 'Jacksonville'),
(13, 'Mia Scott', 'mia@example.com', 'Fort Worth'),
(14, 'Noah Green', 'noah@example.com', 'Columbus'),
(15, 'Olivia Adams', 'olivia@example.com', 'Charlotte'),
(16, 'Paul Baker', 'paul@example.com', 'Indianapolis'),
(17, 'Quinn Hall', 'quinn@example.com', 'San Francisco'),
(18, 'Ruby Allen', 'ruby@example.com', 'Seattle'),
(19, 'Sam Wright', 'sam@example.com', 'Denver'),
(20, 'Tina Lewis', 'tina@example.com', 'Boston');

-- Insert products
INSERT INTO products (product_id, product_name, price, category_id) VALUES
(1, 'Smartphone', 699.99, 1),
(2, 'Laptop', 999.99, 1),
(3, 'T-shirt', 19.99, 2),
(4, 'Novel', 12.99, 3),
(5, 'Headphones', 199.99, 1),
(6, 'Air Fryer', 89.99, 4),
(7, 'Face Cream', 24.99, 5),
(8, 'Jeans', 49.99, 2),
(9, 'Cookbook', 29.99, 3),
(10, 'Smartwatch', 149.99, 1),
(11, 'Gaming Console', 399.99, 1),
(12, 'Hoodie', 35.99, 2),
(13, 'LED Lamp', 22.99, 4),
(14, 'Desk Chair', 139.99, 4),
(15, 'Sunscreen', 14.99, 5),
(16, 'Mystery Novel', 9.99, 3),
(17, 'Monitor', 189.99, 1),
(18, 'Backpack', 59.99, 2),
(19, 'Skincare Kit', 49.99, 5),
(20, 'Bluetooth Speaker', 89.99, 1);

-- Insert orders
INSERT INTO orders (order_id, customer_id, order_date) VALUES
(1, 1, '2024-11-01'),
(2, 2, '2024-11-03'),
(3, 3, '2024-11-05'),
(4, 4, '2024-11-07'),
(5, 5, '2024-11-09'),
(6, 6, '2024-11-11'),
(7, 7, '2024-11-13'),
(8, 8, '2024-11-15'),
(9, 9, '2024-11-17'),
(10, 10, '2024-11-19'),
(11, 11, '2024-11-21'),
(12, 12, '2024-11-23'),
(13, 13, '2024-11-25'),
(14, 14, '2024-11-27'),
(15, 15, '2024-11-29'),
(16, 16, '2024-12-01'),
(17, 17, '2024-12-03'),
(18, 18, '2024-12-05'),
(19, 19, '2024-12-07'),
(20, 20, '2024-12-09'),
(21, 1, '2024-12-11'),
(22, 2, '2024-12-13'),
(23, 3, '2024-12-15'),
(24, 4, '2024-12-17'),
(25, 5, '2024-12-19'),
(26, 6, '2024-12-21'),
(27, 7, '2024-12-23'),
(28, 8, '2024-12-25'),
(29, 9, '2024-12-27'),
(30, 10, '2024-12-29');

-- Insert order_items (100 rows)
INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES
(1, 1, 1, 1), (2, 1, 4, 2), (3, 2, 2, 1), (4, 2, 6, 1),
(5, 3, 3, 1), (6, 3, 7, 1), (7, 4, 5, 1), (8, 4, 8, 2),
(9, 5, 10, 1), (10, 5, 9, 1), (11, 6, 11, 1), (12, 6, 12, 2),
(13, 7, 13, 1), (14, 7, 15, 1), (15, 8, 14, 1), (16, 8, 3, 1),
(17, 9, 17, 1), (18, 9, 5, 2), (19, 10, 20, 1), (20, 10, 6, 1),
(21, 11, 18, 1), (22, 11, 19, 1), (23, 12, 13, 2), (24, 12, 14, 1),
(25, 13, 1, 1), (26, 13, 11, 1), (27, 14, 8, 1), (28, 14, 7, 2),
(29, 15, 12, 1), (30, 15, 3, 1), (31, 16, 17, 1), (32, 16, 5, 1),
(33, 17, 19, 1), (34, 17, 20, 1), (35, 18, 2, 2), (36, 18, 6, 1),
(37, 19, 10, 1), (38, 19, 9, 1), (39, 20, 16, 1), (40, 20, 4, 2),
(41, 21, 3, 1), (42, 21, 7, 1), (43, 22, 5, 1), (44, 22, 8, 2),
(45, 23, 13, 1), (46, 23, 15, 1), (47, 24, 14, 1), (48, 24, 3, 1),
(49, 25, 17, 1), (50, 25, 5, 2), (51, 26, 20, 1), (52, 26, 6, 1),
(53, 27, 18, 1), (54, 27, 19, 1), (55, 28, 13, 2), (56, 28, 14, 1),
(57, 29, 1, 1), (58, 29, 11, 1), (59, 30, 8, 1), (60, 30, 7, 2);
-- (More rows can be generated if needed)


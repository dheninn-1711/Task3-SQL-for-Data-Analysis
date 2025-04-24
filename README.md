# 📊 SQL for Data Analysis – Ecommerce Database

This project demonstrates SQL querying and data analysis techniques using a sample **ecommerce database**. It includes data extraction, filtering, aggregation, joins, subqueries, views, and indexing.

---

## 📁 Dataset Overview

Tables used:
- `customers`
- `orders`
- `products`
- `categories`
- `order_items`

---

## 🔍 Queries & Analysis

### 1. 📦 SELECT – All Products
```sql
SELECT * FROM products;
```
![1  SELECT](https://github.com/user-attachments/assets/ddb681a5-f3d0-4f13-b11d-07d480ab19b4)

### 2. 👤 Select Customer Info
```sql
SELECT customer_name, email FROM customers;
```
![2  SELECT](https://github.com/user-attachments/assets/8d26565a-ef9c-4a41-8658-fb4bbc8855b3)

### 3. 📆 WHERE – Orders After Jan 1, 2024
```sql
SELECT * FROM orders
WHERE order_date > '2024-01-01';
```
![3  WHERE](https://github.com/user-attachments/assets/8e58b687-be20-4263-ab4f-aa429af9a1e5)

### 4. 💸 WHERE – Products Under $50
```sql
SELECT * FROM products
WHERE price < 50;
```
![4  WHERE](https://github.com/user-attachments/assets/2cc7ee8e-a80c-4e50-9fdd-4b0e04cb0ae8)

### 5.🔠 ORDER BY – Customers by Name Desc
```sql
SELECT * FROM customers
ORDER BY customer_name DESC;
```
![5  ORDER BY](https://github.com/user-attachments/assets/1a2bdcd8-2ec2-4909-b0de-7c399fda4100)

### 6. 📊 GROUP BY – Orders per Customer
```sql
SELECT customer_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id;
```
![6  GROUP BY](https://github.com/user-attachments/assets/91bf89f9-e95d-4b26-92ef-678a860a5d90)

### 7. 🔗 INNER JOIN – Orders with Customers
```sql
SELECT o.order_id, o.order_date, c.customer_name
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id;
```
![7  INNER JOIN](https://github.com/user-attachments/assets/8a7b1643-65ad-4b12-8ae1-a097258e0a47)

### 8. 🔗 LEFT JOIN – Products + Category
```sql
SELECT p.product_name, c.category_name
FROM products p
LEFT JOIN categories c ON p.category_id = c.category_id;
```
![8  LEFT JOIN](https://github.com/user-attachments/assets/902e1b50-6815-4df6-8762-a20b1d82579f)

### 9. 🔁 RIGHT JOIN – All Categories
```sql
SELECT p.product_name, c.category_name
FROM products p
RIGHT JOIN categories c ON p.category_id = c.category_id
ORDER BY category_name;
```
![9  RIGHT JOIN](https://github.com/user-attachments/assets/c073cefc-e906-48f6-9984-9a9d6d350c5c)

### 10. 🔝 AGGREGATE FUNCTION - Top 5 Ordered Products
```sql
SELECT p.product_name, SUM(oi.quantity) AS total_quantity
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC
LIMIT 5;
```
![10  AGGREGATE FUNCTION](https://github.com/user-attachments/assets/7a2015ba-db26-4cc2-8cb6-6ab1d428c91a)

### 11. 👁 VIEW – Customer Order Summary
```sql
CREATE VIEW customer_order_summary AS
SELECT c.customer_id, c.customer_name, COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

SELECT * FROM customer_order_summary;
```
![11  VIEW](https://github.com/user-attachments/assets/09c5a478-1ed8-49bd-9c54-de96c8029003)

### 12. 💰 SUBQUERY – Total Sales per Product
```sql
SELECT p.product_id, p.product_name, SUM(p.price * oi.quantity) AS total_sales
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sales DESC;
```
![12  SUBQUERY](https://github.com/user-attachments/assets/c0b3e883-af47-41db-bbb6-ad70d2c5655d)

### 13.⚡ INDEX – On Order Date
```sql
CREATE INDEX idx_order_date ON orders(order_date);
SHOW INDEXES FROM orders;
```
![13  INDEX](https://github.com/user-attachments/assets/349e9ddf-6bac-4db7-96bb-93c92644f386)

### 14. ⚡ INDEX – On Customer ID
```sql
CREATE INDEX idx_customer_id ON customers(customer_id);
SHOW INDEXES FROM customers;
```
![14  INDEX](https://github.com/user-attachments/assets/9e4d70f9-94c4-49e4-b698-01a451c01932)

# ✅ Outcome
**You now will understand how to:**

- `Query and manipulate data using SQL`

- `Apply filters, sorting, and grouping`

- `Use joins and subqueries`

- `Create views for simplified reporting`

- `Optimize performance with indexes`

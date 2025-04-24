-- SELECT
-- Select all products
SELECT * FROM products;

-- Select customer names and emails
SELECT customer_name, email FROM customers;

-- WHERE
-- Get orders made after Jan 1, 2024
SELECT * FROM orders
WHERE order_date > '2024-01-01';

-- Products under $50
SELECT * FROM products
WHERE price < 50;

-- ORDER BY
-- List of all customers ordered by name
SELECT * FROM customers
ORDER BY customer_name DESC;

-- GROUP BY
-- Total number of orders per customer
SELECT customer_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id;

-- Get total sales amount per product
SELECT p.product_id, p.product_name, SUM(p.price * oi.quantity) AS total_sales
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sales DESC;

-- Find the top 5 most ordered products
SELECT p.product_name, SUM(oi.quantity) AS total_quantity
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC
LIMIT 5;

-- JOINS
-- INNER JOIN: Orders with customer details
SELECT o.order_id, o.order_date, c.customer_name
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id;

-- LEFT JOIN: All products with category names
SELECT p.product_name, c.category_name
FROM products p
LEFT JOIN categories c ON p.category_id = c.category_id;

-- RIGHT JOIN: All categories, including those with no products
SELECT p.product_name, c.category_name
FROM products p
RIGHT JOIN categories c ON p.category_id = c.category_id
ORDER BY category_name;

-- SUBQUERY
-- Products above average price
SELECT product_name, price
FROM products
WHERE price > (SELECT AVG(price) FROM products);

-- VIEW
-- Create a view of customer order summaries
CREATE VIEW customer_order_summary AS
SELECT c.customer_id, c.customer_name, COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;
SELECT * FROM customer_order_summary;

-- INDEX
-- Create an index on order_date
CREATE INDEX idx_order_date ON orders(order_date);
SHOW INDEXES FROM orders;

-- Index on customer_id
CREATE INDEX idx_customer_id ON customers(customer_id);
SHOW INDEXES FROM customers;

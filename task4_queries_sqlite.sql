-- Task 3: SQL for Data Analysis (SQLite Compatible)
-- Dataset: sample_dataset.sql

/* Q1: Difference between WHERE and HAVING */
-- WHERE filters before aggregation
SELECT * FROM orders WHERE order_amount > 500;

-- HAVING filters after aggregation
SELECT customer_id, SUM(order_amount) AS total_spent
FROM orders
GROUP BY customer_id
HAVING total_spent > 500;

/* Q2: Types of Joins */
-- INNER JOIN
SELECT c.name, o.order_id
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;

-- LEFT JOIN
SELECT c.name, o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- RIGHT JOIN alternative in SQLite (swap tables in LEFT JOIN)
SELECT c.name, o.order_id
FROM orders o
LEFT JOIN customers c ON c.customer_id = o.customer_id;

/* Q3: Average Revenue Per User */
SELECT AVG(total_spent) AS avg_revenue_per_user
FROM (
    SELECT customer_id, SUM(order_amount) AS total_spent
    FROM orders
    GROUP BY customer_id
) AS revenue_table;

/* Q4: Subqueries */
SELECT name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING SUM(order_amount) > (
        SELECT AVG(order_amount) FROM orders
    )
);

/* Q5: Optimize SQL Queries with Indexes */
-- Create an index on order_date
CREATE INDEX IF NOT EXISTS idx_order_date ON orders(order_date);

-- Create a composite index on customer_id and order_date
CREATE INDEX IF NOT EXISTS idx_customer_date ON orders(customer_id, order_date);

-- Show all indexes for orders and customers
PRAGMA index_list('orders');
PRAGMA index_list('customers');

/* Q6: Create View */
CREATE VIEW IF NOT EXISTS customer_spending AS
SELECT customer_id, SUM(order_amount) AS total_spent
FROM orders
GROUP BY customer_id;

SELECT * FROM customer_spending WHERE total_spent > 500;

/* Q7: Handling NULL Values */
SELECT COALESCE(city, 'Unknown') AS customer_city
FROM customers;

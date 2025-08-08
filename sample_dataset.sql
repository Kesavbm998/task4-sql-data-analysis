
-- Create Customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100)
);

-- Create Orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Insert data into Customers
INSERT INTO customers (customer_id, name, city) VALUES
(1, 'Alice', 'New York'),
(2, 'Bob', 'Los Angeles'),
(3, 'Charlie', NULL),
(4, 'David', 'Chicago'),
(5, 'Eva', 'Houston');

-- Insert data into Orders
INSERT INTO orders (order_id, customer_id, order_amount, order_date) VALUES
(101, 1, 250.00, '2025-07-01'),
(102, 2, 150.00, '2025-07-03'),
(103, 1, 400.00, '2025-07-10'),
(104, 3, 120.00, '2025-07-12'),
(105, 4, 800.00, '2025-07-15'),
(106, 2, 300.00, '2025-07-20'),
(107, 5, 500.00, '2025-07-22');

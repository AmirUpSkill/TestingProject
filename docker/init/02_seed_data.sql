-- 02_seed_data.sql

-- Insert Sample Customers
INSERT INTO customers (first_name, last_name, email, phone_number)
VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890'),
('Jane', 'Smith', 'jane.smith@example.com', '098-765-4321');

-- Insert Sample Orders
INSERT INTO orders (customer_id, total_amount, status)
VALUES
(1, 150.00, 'Completed'),
(1, 200.50, 'Pending'),
(2, 99.99, 'Completed');

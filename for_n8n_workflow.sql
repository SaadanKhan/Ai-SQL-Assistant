CREATE DATABASE IF NOT EXISTS ai_sql_demo;
USE ai_sql_demo;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    segment VARCHAR(30),
    registration_date DATE
);

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    customer_id INT,
    transaction_date DATE,
    amount DECIMAL(12,2),
    status VARCHAR(20),
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

INSERT INTO customers VALUES
(1, 'Ali Khan', 'Karachi', 'Retail', '2026-09-02'),
(2, 'Sara Ahmed', 'Lahore', 'Business', '2026-09-05'),
(3, 'Usman Shah', 'Karachi', 'Retail', '2026-09-12'),
(4, 'Ayesha Malik', 'Islamabad', 'Business', '2026-08-25'),
(5, 'Hamza Iqbal', 'Lahore', 'Retail', '2026-09-20');

INSERT INTO transactions VALUES
(101, 1, '2026-09-03', 1500.00, 'SUCCESS'),
(102, 1, '2026-09-15', 2500.00, 'SUCCESS'),
(103, 2, '2026-09-10', 5000.00, 'SUCCESS'),
(104, 3, '2026-09-18', 700.00, 'FAILED'),
(105, 4, '2026-09-22', 3500.00, 'SUCCESS'),
(106, 5, '2026-09-25', 1200.00, 'SUCCESS');



CREATE USER 'ai_demo_reader'@'localhost'
IDENTIFIED BY 'saadan_ai_demo';

GRANT SELECT ON ai_sql_demo.*
TO 'ai_demo_reader'@'localhost';



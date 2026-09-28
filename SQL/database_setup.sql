-- ============================================================
-- E-COMMERCE SALES & CUSTOMER ANALYTICS
-- Database Setup Script
-- ============================================================

CREATE DATABASE ecommerce_project;
USE ecommerce_project;

-- 1. CUSTOMERS
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50),
    signup_date DATE
);

INSERT INTO customers VALUES
(1, 'Aarav Sharma', 'aarav@gmail.com', 'Delhi', '2025-01-10'),
(2, 'Riya Mehta', 'riya@gmail.com', 'Mumbai', '2025-01-15'),
(3, 'Karan Singh', 'karan@gmail.com', 'Bangalore', '2025-02-05'),
(4, 'Sneha Gupta', 'sneha@gmail.com', 'Delhi', '2025-02-20'),
(5, 'Aditya Verma', 'aditya@gmail.com', 'Pune', '2025-03-12'),
(6, 'Neha Kapoor', 'neha@gmail.com', 'Mumbai', '2025-03-25'),
(7, 'Rahul Jain', 'rahul@gmail.com', 'Delhi', '2025-04-10'),
(8, 'Ananya Roy', 'ananya@gmail.com', 'Kolkata', '2025-04-18'),
(9, 'Vikram Rao', 'vikram@gmail.com', 'Hyderabad', '2025-05-01'),
(10, 'Pooja Malhotra', 'pooja@gmail.com', 'Delhi', '2025-05-15');

-- 2. CATEGORIES
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

INSERT INTO categories VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Home & Kitchen'),
(4, 'Beauty'),
(5, 'Books');

-- 3. PRODUCTS
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    price DECIMAL(10,2),
    stock INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

INSERT INTO products VALUES
(101, 'Wireless Headphones', 1, 1999.00, 50),
(102, 'Smart Watch', 1, 2999.00, 35),
(103, 'Bluetooth Speaker', 1, 1499.00, 40),
(104, 'Men T-Shirt', 2, 799.00, 100),
(105, 'Women Kurti', 2, 1199.00, 70),
(106, 'Running Shoes', 2, 2499.00, 45),
(107, 'Coffee Maker', 3, 3499.00, 20),
(108, 'Non-Stick Pan', 3, 1299.00, 60),
(109, 'Face Serum', 4, 899.00, 80),
(110, 'Sunscreen', 4, 699.00, 90),
(111, 'Atomic Habits', 5, 599.00, 50),
(112, 'The Psychology of Money', 5, 499.00, 65);

-- 4. ORDERS
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders VALUES
(1001, 1, '2025-05-01', 'Delivered'),
(1002, 2, '2025-05-03', 'Delivered'),
(1003, 3, '2025-05-05', 'Shipped'),
(1004, 1, '2025-05-10', 'Delivered'),
(1005, 4, '2025-05-12', 'Cancelled'),
(1006, 5, '2025-05-15', 'Delivered'),
(1007, 6, '2025-05-18', 'Delivered'),
(1008, 7, '2025-05-20', 'Shipped'),
(1009, 2, '2025-05-22', 'Delivered'),
(1010, 8, '2025-05-25', 'Processing'),
(1011, 9, '2025-06-01', 'Delivered'),
(1012, 10, '2025-06-03', 'Delivered'),
(1013, 3, '2025-06-05', 'Cancelled'),
(1014, 1, '2025-06-08', 'Delivered'),
(1015, 5, '2025-06-10', 'Shipped');

-- 5. ORDER ITEMS
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_items VALUES
(1,1001,101,1),
(2,1001,110,2),
(3,1002,102,1),
(4,1002,111,1),
(5,1003,103,1),
(6,1003,104,2),
(7,1004,106,1),
(8,1004,109,1),
(9,1005,105,1),
(10,1006,107,1),
(11,1006,108,2),
(12,1007,104,2),
(13,1007,110,1),
(14,1008,101,1),
(15,1008,112,1),
(16,1009,102,1),
(17,1009,106,1),
(18,1010,105,1),
(19,1010,109,2),
(20,1011,103,2),
(21,1011,108,1),
(22,1012,107,1),
(23,1012,111,2),
(24,1013,101,1),
(25,1014,102,1),
(26,1014,110,2),
(27,1015,106,1),
(28,1015,112,2);

-- 6. PAYMENTS
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    payment_method VARCHAR(30),
    amount DECIMAL(10,2),
    payment_status VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO payments VALUES
(501,1001,'2025-05-01','UPI',3397.00,'Paid'),
(502,1002,'2025-05-03','Credit Card',3598.00,'Paid'),
(503,1003,'2025-05-05','UPI',3097.00,'Paid'),
(504,1004,'2025-05-10','Debit Card',3398.00,'Paid'),
(505,1005,'2025-05-12','UPI',1199.00,'Refunded'),
(506,1006,'2025-05-15','Credit Card',6097.00,'Paid'),
(507,1007,'2025-05-18','UPI',2297.00,'Paid'),
(508,1008,'2025-05-20','Debit Card',2498.00,'Paid'),
(509,1009,'2025-05-22','UPI',5498.00,'Paid'),
(510,1010,'2025-05-25','Credit Card',2997.00,'Paid'),
(511,1011,'2025-06-01','UPI',4297.00,'Paid'),
(512,1012,'2025-06-03','Debit Card',4697.00,'Paid'),
(513,1013,'2025-06-05','UPI',1999.00,'Refunded'),
(514,1014,'2025-06-08','Credit Card',4397.00,'Paid'),
(515,1015,'2025-06-10','UPI',3497.00,'Paid');

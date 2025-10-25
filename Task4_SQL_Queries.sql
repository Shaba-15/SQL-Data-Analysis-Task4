Enter password: *********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 12
Server version: 8.0.44 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE ecommerce_db;
ERROR 1007 (HY000): Can't create database 'ecommerce_db'; database exists
mysql> DATABASE ecommerce_db;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DATABASE ecommerce_db' at line 1
mysql> CREATE DATABASE ecommerce_db;
ERROR 1007 (HY000): Can't create database 'ecommerce_db'; database exists
mysql> USE ecommerce_db;
Database changed
mysql> CREATE TABLE orders (
    ->     order_id INT PRIMARY KEY,
    ->     customer_name VARCHAR(50),
    ->     product_category VARCHAR(50),
    ->     order_date DATE,
    ->     quantity INT,
    ->     price DECIMAL(10,2),
    ->     region VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql>
mysql> INSERT INTO orders VALUES
    -> (1, 'Amit', 'Electronics', '2024-01-15', 2, 25000, 'North'),
    -> (2, 'Sara', 'Clothing', '2024-02-20', 3, 1200, 'West'),
    -> (3, 'Rohan', 'Furniture', '2024-03-05', 1, 5500, 'South'),
    -> (4, 'Neha', 'Clothing', '2024-04-10', 5, 2000, 'East'),
    -> (5, 'Ali', 'Electronics', '2024-05-02', 1, 18000, 'North'),
    -> (6, 'Zara', 'Furniture', '2024-06-21', 2, 7500, 'South');
Query OK, 6 rows affected (0.01 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql>
mysql> SELECT * FROM orders;
+----------+---------------+------------------+------------+----------+----------+--------+
| order_id | customer_name | product_category | order_date | quantity | price    | region |
+----------+---------------+------------------+------------+----------+----------+--------+
|        1 | Amit          | Electronics      | 2024-01-15 |        2 | 25000.00 | North  |
|        2 | Sara          | Clothing         | 2024-02-20 |        3 |  1200.00 | West   |
|        3 | Rohan         | Furniture        | 2024-03-05 |        1 |  5500.00 | South  |
|        4 | Neha          | Clothing         | 2024-04-10 |        5 |  2000.00 | East   |
|        5 | Ali           | Electronics      | 2024-05-02 |        1 | 18000.00 | North  |
|        6 | Zara          | Furniture        | 2024-06-21 |        2 |  7500.00 | South  |
+----------+---------------+------------------+------------+----------+----------+--------+
6 rows in set (0.00 sec)

mysql> SELECT * FROM orders;
+----------+---------------+------------------+------------+----------+----------+--------+
| order_id | customer_name | product_category | order_date | quantity | price    | region |
+----------+---------------+------------------+------------+----------+----------+--------+
|        1 | Amit          | Electronics      | 2024-01-15 |        2 | 25000.00 | North  |
|        2 | Sara          | Clothing         | 2024-02-20 |        3 |  1200.00 | West   |
|        3 | Rohan         | Furniture        | 2024-03-05 |        1 |  5500.00 | South  |
|        4 | Neha          | Clothing         | 2024-04-10 |        5 |  2000.00 | East   |
|        5 | Ali           | Electronics      | 2024-05-02 |        1 | 18000.00 | North  |
|        6 | Zara          | Furniture        | 2024-06-21 |        2 |  7500.00 | South  |
+----------+---------------+------------------+------------+----------+----------+--------+
6 rows in set (0.00 sec)

mysql> SELECT * FROM orders WHERE region = 'North';
+----------+---------------+------------------+------------+----------+----------+--------+
| order_id | customer_name | product_category | order_date | quantity | price    | region |
+----------+---------------+------------------+------------+----------+----------+--------+
|        1 | Amit          | Electronics      | 2024-01-15 |        2 | 25000.00 | North  |
|        5 | Ali           | Electronics      | 2024-05-02 |        1 | 18000.00 | North  |
+----------+---------------+------------------+------------+----------+----------+--------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM orders ORDER BY price DESC;
+----------+---------------+------------------+------------+----------+----------+--------+
| order_id | customer_name | product_category | order_date | quantity | price    | region |
+----------+---------------+------------------+------------+----------+----------+--------+
|        1 | Amit          | Electronics      | 2024-01-15 |        2 | 25000.00 | North  |
|        5 | Ali           | Electronics      | 2024-05-02 |        1 | 18000.00 | North  |
|        6 | Zara          | Furniture        | 2024-06-21 |        2 |  7500.00 | South  |
|        3 | Rohan         | Furniture        | 2024-03-05 |        1 |  5500.00 | South  |
|        4 | Neha          | Clothing         | 2024-04-10 |        5 |  2000.00 | East   |
|        2 | Sara          | Clothing         | 2024-02-20 |        3 |  1200.00 | West   |
+----------+---------------+------------------+------------+----------+----------+--------+
6 rows in set (0.00 sec)

mysql> SELECT product_category, SUM(price) AS total_sales
    -> FROM orders
    -> GROUP BY product_category;
+------------------+-------------+
| product_category | total_sales |
+------------------+-------------+
| Electronics      |    43000.00 |
| Clothing         |     3200.00 |
| Furniture        |    13000.00 |
+------------------+-------------+
3 rows in set (0.00 sec)

mysql> SELECT region, AVG(price) AS avg_sales
    -> FROM orders
    -> GROUP BY region;
+--------+--------------+
| region | avg_sales    |
+--------+--------------+
| North  | 21500.000000 |
| West   |  1200.000000 |
| South  |  6500.000000 |
| East   |  2000.000000 |
+--------+--------------+
4 rows in set (0.00 sec)

mysql> SELECT customer_name, price
    -> FROM orders
    -> WHERE price > (SELECT AVG(price) FROM orders);
+---------------+----------+
| customer_name | price    |
+---------------+----------+
| Amit          | 25000.00 |
| Ali           | 18000.00 |
+---------------+----------+
2 rows in set (0.00 sec)

mysql> CREATE TABLE customers (
    ->     customer_name VARCHAR(50),
    ->     city VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql>
mysql> INSERT INTO customers VALUES
    -> ('Amit', 'Delhi'),
    -> ('Sara', 'Mumbai'),
    -> ('Rohan', 'Chennai'),
    -> ('Neha', 'Kolkata'),
    -> ('Ali', 'Delhi'),
    -> ('Zara', 'Hyderabad');
Query OK, 6 rows affected (0.00 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM customers;
+---------------+-----------+
| customer_name | city      |
+---------------+-----------+
| Amit          | Delhi     |
| Sara          | Mumbai    |
| Rohan         | Chennai   |
| Neha          | Kolkata   |
| Ali           | Delhi     |
| Zara          | Hyderabad |
+---------------+-----------+
6 rows in set (0.00 sec)

mysql> SELECT o.order_id, o.customer_name, o.product_category, c.city
    -> FROM orders o
    -> INNER JOIN customers c
    -> ON o.customer_name = c.customer_name;
+----------+---------------+------------------+-----------+
| order_id | customer_name | product_category | city      |
+----------+---------------+------------------+-----------+
|        1 | Amit          | Electronics      | Delhi     |
|        2 | Sara          | Clothing         | Mumbai    |
|        3 | Rohan         | Furniture        | Chennai   |
|        4 | Neha          | Clothing         | Kolkata   |
|        5 | Ali           | Electronics      | Delhi     |
|        6 | Zara          | Furniture        | Hyderabad |
+----------+---------------+------------------+-----------+
6 rows in set (0.00 sec)

mysql> CREATE VIEW high_value_orders AS
    -> SELECT customer_name, product_category, price
    -> FROM orders
    -> WHERE price > 10000;
Query OK, 0 rows affected (0.01 sec)

mysql> SELECT * FROM high_value_orders;
+---------------+------------------+----------+
| customer_name | product_category | price    |
+---------------+------------------+----------+
| Amit          | Electronics      | 25000.00 |
| Ali           | Electronics      | 18000.00 |
+---------------+------------------+----------+
2 rows in set (0.01 sec)

mysql>
Task 4: SQL for Data Analysis
🎯 Objective

Use SQL queries to extract and analyze data from an E-commerce database.

🧠 Tools Used

MySQL Command Line Client

📊 Dataset

Created two sample tables:

Orders

Customers

🪜 Queries Performed

SELECT & WHERE – Filter orders by region.

ORDER BY – Sort orders by price.

GROUP BY & SUM() – Total sales by category.

AVG() – Average sales by region.

Subquery – Find customers who spent above average.

JOIN – Combine orders with customer cities.

VIEW – Create reusable high-value order view.

🖼️ Deliverables

SQL file: Task4_SQL_Queries.sql

Screenshots of queries and results

💡 Outcome

Learned to query structured data using SQL, apply joins, subqueries, and create views for analysis.

🗂️ Interview Questions and Answers
1️⃣ What is the difference between WHERE and HAVING?

WHERE filters rows before grouping (with GROUP BY).

HAVING filters groups after grouping.
Example:
SELECT region, SUM(price)
FROM orders
GROUP BY region
HAVING SUM(price) > 10000;
2️⃣ What are the different types of JOINS?

INNER JOIN – returns matching rows from both tables.

LEFT JOIN – returns all rows from the left table and matching ones from the right.

RIGHT JOIN – returns all rows from the right table and matching ones from the left.

FULL JOIN – returns all rows when there is a match in either table.
3️⃣ How do you calculate average revenue per user in SQL?
SELECT customer_name, AVG(price) AS avg_revenue
FROM orders
GROUP BY customer_name;


This calculates the average amount each customer spends.

4️⃣ What are subqueries?

A subquery is a query inside another query.
It’s used when you need to use results from one query in another.
Example:

SELECT customer_name, price
FROM orders
WHERE price > (SELECT AVG(price) FROM orders);

5️⃣ How do you optimize a SQL query?

Use indexes on frequently searched columns.

Avoid SELECT *; choose only required columns.

Use joins instead of multiple subqueries where possible.

Analyze query performance with EXPLAIN.

6️⃣ What is a VIEW in SQL?

A View is a saved virtual table based on a query.
It helps simplify complex queries and improve readability.
Example:

CREATE VIEW high_value_orders AS
SELECT customer_name, price FROM orders WHERE price > 10000;

7️⃣ How would you handle NULL values in SQL?

Use IS NULL or IS NOT NULL to check for nulls.

Replace NULLs with another value using COALESCE() or IFNULL().
Example:

SELECT COALESCE(price, 0) FROM orders;

🌟 Summary

This task helped me:

Create and manage databases in MySQL.

Use key SQL commands (SELECT, WHERE, GROUP BY, JOINS, VIEWS).

Analyze structured data efficiently and interpret business insights.

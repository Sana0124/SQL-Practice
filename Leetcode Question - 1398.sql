--Customers Who Bought Products A and B but Not C.
  
--Table: Customers

+---------------------+---------+
| Column Name         | Type    |
+---------------------+---------+
| customer_id         | int     |
| customer_name       | varchar |
+---------------------+---------+
--customer_id is the column with unique values for this table.
--customer_name is the name of the customer.
 

--Table: Orders

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| order_id      | int     |
| customer_id   | int     |
| product_name  | varchar |
+---------------+---------+
--order_id is the column with unique values for this table.
--customer_id is the id of the customer who bought the product "product_name".
 

--Write a solution to report the customer_id and customer_name of customers who bought products "A", "B" but did not buy the product "C" since we want to recommend them to purchase this product.

--Return the result table ordered by customer_id.


--Solving with Subquery in SQL
SELECT c.customer_id, c.customer_name
FROM customers c
WHERE c.customer_id IN (
    SELECT o.customer_id
    FROM orders o
    WHERE o.product_name IN ('A', 'B')
    GROUP BY o.customer_id
    HAVING COUNT(DISTINCT o.product_name) = 2
)
AND c.customer_id NOT IN (
    SELECT o.customer_id
    FROM orders o
    WHERE o.product_name = 'C'
);



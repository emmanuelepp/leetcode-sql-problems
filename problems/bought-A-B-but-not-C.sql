--* 1398. Customers Who Bought Products A and B but *--

-- Table: Customers

-- +---------------------+---------+
-- | Column Name         | Type    |
-- +---------------------+---------+
-- | customer_id         | int     |
-- | customer_name       | varchar |
-- +---------------------+---------+
-- customer_id is the column with unique values for this table.
-- customer_name is the name of the customer.


-- Table: Orders

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | order_id      | int     |
-- | customer_id   | int     |
-- | product_name  | varchar |
-- +---------------+---------+
-- order_id is the column with unique values for this table.
-- customer_id is the id of the customer who bought the product "product_name".


-- Write a solution to report the customer_id and customer_name of customers who bought products "A", "B" but did not buy the product "C" since we want to recommend them to purchase this product.

--* Solution *--

SELECT customer_id, customer_name
FROM Customers AS Cus
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders AS Ord 
    WHERE Ord.customer_id = Cus.customer_id
    AND Ord.product_name = 'C'  
)
AND EXISTS (
    SELECT 1
    FROM Orders AS Ord 
    WHERE Ord.customer_id = Cus.customer_id
    AND Ord.product_name = 'A' 
)
AND EXISTS (
    SELECT 1
    FROM Orders AS Ord 
    WHERE Ord.customer_id = Cus.customer_id
    AND Ord.product_name = 'B'   
)
--* 183. Customers Who Never Order *--

-- Table: Customers

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- +-------------+---------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table indicates the ID and name of a customer.


-- Table: Orders

-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | id          | int  |
-- | customerId  | int  |
-- +-------------+------+
-- id is the primary key (column with unique values) for this table.
-- customerId is a foreign key (reference columns) of the ID from the Customers table.
-- Each row of this table indicates the ID of an order and the ID of the customer who ordered it.


-- Write a solution to find all customers who never order anything.

--* Solution *--

--WITHOUT JOIN
SELECT Name as Customers
FROM Customers as Cus
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders AS Ord
    WHERE Ord.CustomerId = Cus.Id
)


--JOIN

SELECT Name as Customers
FROM Customers as Cus
LEFT JOIN Orders AS Ord on Ord.customerId  = Cus.Id
WHERE Ord.Id IS NULL

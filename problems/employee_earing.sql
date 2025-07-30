--* 181. Employees Earning More Than Their Managers *--

-- Table: Employee

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- | salary      | int     |
-- | managerId   | int     |
-- +-------------+---------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table indicates the ID of an employee, their name, salary, and the ID of their manager.
 

-- Write a solution to find the employees who earn more than their managers.

--* Solution *--

-- WITHOUT JOIN
SELECT NAME AS EMPLOYEE
FROM EMPLOYEE EMP
WHERE SALARY > (
    SELECT SALARY
    FROM EMPLOYEE
    WHERE ID = EMP.MANAGERID
)


-- JOIN

SELECT EMP.NAME AS EMPLOYEE
FROM EMPLOYEE AS EMP
JOIN EMPLOYEE AS MAN ON EMP.MANAGERID = MAN.ID
WHERE EMP.SALARY > MAN.SALARY
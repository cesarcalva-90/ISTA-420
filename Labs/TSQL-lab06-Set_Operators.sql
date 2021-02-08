-- Name: Cesar Calva
-- File: lab06-calva.sql
-- Date: February 8, 2021

-- 1. Find employees who had orders in both January, 2016 AND February, 2016.

SELECT o.empid
FROM Sales.Orders o
WHERE o.orderdate like '2016-01-%'
INTERSECT
SELECT o1.empid
FROM Sales.Orders o1
WHERE o1.orderdate like '2016-02-%';

-- 2. Find employees who had orders in both January, 2016 OR February, 2016.

SELECT o.empid
FROM Sales.Orders o
WHERE o.orderdate like '2016-01-%'
UNION
SELECT o1.empid
FROM Sales.Orders o1
WHERE o1.orderdate like '2016-02-%';

-- 3. Find employees who had orders in January, 2016 but NOT February, 2016.

SELECT o.empid
FROM Sales.Orders o
WHERE o.orderdate like '2016-01-%'
EXCEPT
SELECT o1.empid
FROM Sales.Orders o1
WHERE o1.orderdate like '2016-02-%';

-- 4. Cities and Countries where we have both customers and employees

SELECT e.city, e.country
FROM HR.Employees e
INTERSECT
SELECT c.city, c.country
FROM Sales.Customers c;

-- 5. Cities and Countries where we have either customers and employees

SELECT e.city, e.country
FROM HR.Employees e
UNION
SELECT c.city, c.country
FROM Sales.Customers c;

-- 6. Cities and Countries where we have customers but not employees

SELECT c.city, c.country
FROM Sales.Customers c
EXCEPT
SELECT e.city, e.country
FROM HR.Employees e;

-- 7. Cities and Countries where we have customers but not employees

SELECT e.city, e.country
FROM HR.Employees e
EXCEPT
SELECT c.city, c.country
FROM Sales.Customers c;

-- 8. Cities and Countries where we have employees but not customers and
--Cities and Countries where we have customers but not employees

(SELECT e.city, e.country
FROM HR.Employees e
UNION
SELECT c.city, c.country
FROM Sales.Customers c)
EXCEPT
(SELECT e.city, e.country
FROM HR.Employees e
INTERSECT
SELECT c.city, c.country
FROM Sales.Customers c)



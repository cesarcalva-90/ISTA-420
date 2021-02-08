<<<<<<< HEAD
.echo on
.headers on
--	Name: Cesar
--  File: lab2a-Cesar
--	Date: 19 January 2021

-- 1. What are the regions?
select * from region;

-- 2. what are the cities?
select * from territories;

-- 3. what are the cities in the southern region?
select * from territories where RegionID = 4;

-- 4. how do you run this query with the fully qualified column name?
select territories.TerritoryID, territories.TerritoryDescription, 
territories.RegionID from territories where RegionID = 4;

-- 5. how do you run this query with a table alias?
select T.TerritoryID, T.TerritoryDescription, 
T.RegionID from territories T where RegionID = 4;

-- 6. what is the contact name, telephone number, and city for each customer?
select ContactName, Phone, city from customers;

-- 7. what are the products currently out of stock?
select productid, productname from products where unitsinstock = 0;

-- 8. what are the ten products currently in stock with the least amount on hand?
select productid, productname, unitsinstock from products where unitsinstock > 0 
order by Unitsinstock limit 10;

-- 9. what are the five most expensive products in stock?
select productid, productname, unitsinstock, unitprice from products where 
unitsinstock > 0 order by unitprice desc limit 5;

-- 10. how many products does northwind have? how many customers? how many suppliers?
select count(productid) from products;
select count(customerid) from customers;
=======
.echo on
.headers on
--	Name: Cesar
--  File: lab2a-Cesar
--	Date: 19 January 2021

-- 1. What are the regions?
select * from region;

-- 2. what are the cities?
select * from territories;

-- 3. what are the cities in the southern region?
select * from territories where RegionID = 4;

-- 4. how do you run this query with the fully qualified column name?
select territories.TerritoryID, territories.TerritoryDescription, 
territories.RegionID from territories where RegionID = 4;

-- 5. how do you run this query with a table alias?
select T.TerritoryID, T.TerritoryDescription, 
T.RegionID from territories T where RegionID = 4;

-- 6. what is the contact name, telephone number, and city for each customer?
select ContactName, Phone, city from customers;

-- 7. what are the products currently out of stock?
select productid, productname from products where unitsinstock = 0;

-- 8. what are the ten products currently in stock with the least amount on hand?
select productid, productname, unitsinstock from products where unitsinstock > 0 
order by Unitsinstock limit 10;

-- 9. what are the five most expensive products in stock?
select productid, productname, unitsinstock, unitprice from products where 
unitsinstock > 0 order by unitprice desc limit 5;

-- 10. how many products does northwind have? how many customers? how many suppliers?
select count(productid) from products;
select count(customerid) from customers;
>>>>>>> 88acc1ea9e6a51f0c4f379b32dd58f813782f048
select count(supplierid) from suppliers;
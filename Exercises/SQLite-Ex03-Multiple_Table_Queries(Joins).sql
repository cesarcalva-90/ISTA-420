.echo on
.headers on
.mode csv

--
--
--

-- 1. We have noticed that certain customers prefer to make their orders with certain employees. We want
-- to increase business by encouraging the customer/employee pairs that are more productive, and to
-- channel the pairs that are less productive into other relationships. To this end, we have ordered this
-- query and the following three. First, I need the customer ID, the customer contact name, the employee
-- ID, the employee name, the order ID, the number of orders, and the total amount of each order, where
-- the customer/employee pair has produced five or more orders between them, ordered by the dollar
-- amount of the order from highest to lowest. The output needs to be in a comma separated format
-- with strings that include spaces and commas delimited by double quotes. The dollar amount should
-- be formatted as a decimal number with two decimal places. Here is the output.
select c.customerid, c.contactname, e.employeeid, e.firstname || ' ' ||  e.lastname as emp_name, o.orderid , count(od.orderid) as num_orders, sum(od.unitprice * od.quantity) as order_total 

from customers c join orders o on c.customerid = o.customerid 
join employees e on e.employeeid = o.employeeid join order_details od on o.orderid = od.orderid 

group by o.orderid having num_orders >= 5 order by order_total desc;

-- 2. Second, I want the least productive pairs with the same columns. The total of orders should be less
-- than three, the dollar amount of the order is less than $50.00, and the orders are ranked by increasing
-- dollar amounts, starting with the least order. Here is the expected output.
select c.customerid, c.contactname, e.employeeid, e.firstname || ' ' ||  e.lastname as emp_name, o.orderid , count(od.orderid) as num_orders, sum(od.unitprice * od.quantity) as order_total 

from customers c join orders o on c.customerid = o.customerid 
join employees e on e.employeeid = o.employeeid join order_details od on o.orderid = od.orderid 

group by o.orderid having num_orders < 3 and order_total < 50 order by order_total;

-- 3. Third, I need the most productive pairs as in the First report above, omitting the order ID but ranked
-- by the average amount from highest to lowest of all orders by the customer/employee pair. Include
-- only pairs where the amount of the average exceeds $2,500.00. Here is the expected output.
select c.customerid, c.contactname, e.employeeid, e.firstname || ' ' ||  e.lastname as emp_name, o.orderid , count(od.orderid) as num_orders, avg(od.unitprice * od.quantity) as order_average 

from customers c join orders o on c.customerid = o.customerid 
join employees e on e.employeeid = o.employeeid join order_details od on o.orderid = od.orderid 

group by o.orderid having order_average  > 2500 order by order_average  desc;

-- Finally, I need the least productive pairs as ranked by average order amount, from lowest to highest,
-- formatted as above. Omit the order ID. Include only pairs where the average order amount is less than
-- $50.00. Here is the expected output.
select c.customerid, c.contactname, e.employeeid, e.firstname || ' ' ||  e.lastname as emp_name, o.orderid , count(od.orderid) as num_orders, avg(od.unitprice * od.quantity) as order_average 

from customers c join orders o on c.customerid = o.customerid 
join employees e on e.employeeid = o.employeeid join order_details od on o.orderid = od.orderid 

group by o.orderid having order_average  < 50 order by order_average;

-- 5. Please create a report with the order ID, the customer ID, the customer name, the customer country,
-- and the dollar amount of the order, sorted alphabetically by country and numerically from highest to
-- lowest by the dollar amount of the order, where the order total exceeds $5,000.00. Here is the output.
select o.orderid, c.customerid, c.companyname, c.country, sum(od.unitprice * od.quantity) as total_order

from customers c 
join orders o on c.customerid = o.customerid 
join order_details od on o.orderid = od.orderid 

group by o.orderid having total_order > 5000 order by c.country, total_order desc;


-- 6. I want to know the unique (distinct) cities, regions, and postal codes: (a) where we have both customers
-- and employees, (b) where we have customers but no employees AND both customers and employees,
-- and (c) where we have employees but no customers AND both customers and employees. Write three
-- queries, using inner and outer joins. Report the results of the queries. There is no need for any further
-- reporting.

select distinct c.customerid, e.employeeid, c.city, c.region, c.postalcode from customers as c join employees as e on c.city = e.city group by c.postalcode;

--b. customers but no employees AND both customers and employees

select distinct c.city, c.region, c.postalcode from customers as c left join employees as e on c.city = e.city group by c.postalcode;

--c. employees but no customers AND both customers & employees

select distinct c.city, c.region, c.postalcode from employees as e left join customers as c on c.city = e.city group by c.postalcode;

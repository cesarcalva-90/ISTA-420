--1. Use a derived table to build a query that returns the number of distinct products per year that each
--customer ordered. Use internal aliasing. Use a variable to set the customer number. For example, if
--the customer ID is 1234, the query should report the number of distinct products ordered by customer
--1234 for the years 2014, 2015, and 2016.
select  sq.custid as customer_number, sq.number_of_unique_products, sq.year_of_order
from		(select count(distinct od.productid) as number_of_unique_products, o.custid, year(o.orderdate) as year_of_order
			from sales.orderDetails as od
			join sales.orders as o on od.orderid = o.orderid
			group by year(o.orderdate), o.custid) as sq
order by sq.custid;

--2. Use multiple common table expressions to build a query that returns the number of distinct products
--per year that each country's customers ordered. Use external aliasing. Use a variable to set the country
--name. For example, if the country name is France, the query should report the number of distinct
--products ordered by French customers for the years 2014, 2015, and 2016.
with unique_products_by_country_each_year as
(
			select count(distinct od.productid) as number_of_unique_products, year(o.orderdate) as year_of_order, c.country
			from sales.orderDetails as od
			join sales.orders as o on od.orderid = o.orderid
			join sales.customers as c on c.custid = o.custid
			group by year(o.orderdate), c.country)
select * 
from unique_products_by_country_each_year

--3. Create a view that shows, for each year, the total dollar amount spent by customers in each country
--for all the years in the database.drop view if exists TotalPricePerOrder;go create view Sales.TotalPricePerOrder as	select year(o.orderdate) as year, sum(od.unitprice * od.qty) as total_price, c.country	from sales.orderdetails as od	join sales.orders as o on od.orderid = o.orderid	join sales.customers as c on c.custid = o.custid	group by c.country, year(o.orderdate);
go

--4. Create an inline table valued function that accepts as a parameter a country name and returns a table
--with the distinct products ordered by customers from that country. Products are to be identied by
--both product ID and product name.use TSQLV4;drop function if exists dbo.GetMoneyByYearPerCountry;gocreate function dbo.GetMoneyByYearPerCountry 	(@country as nvarchar(25)) returns tableasreturn	select c.country, od.productid, p.productname
	from sales.orderDetails as od
	join sales.orders as o on od.orderid = o.orderid
	join sales.customers as c on c.custid = o.custid
	join production.products as p on p.productid = od.productid
	where c.country = @country
	group by c.country, od.productid, p.productname;goselect * from dbo.GetMoneyByYearPerCountry('USA')order by productid;
--5. Use the CROSS APPLY operator to create a query showing the top three products shipped to customers
--in each country. Your report should contain the name of the country, the product id, the product name,
--and the number of products shipped to customers in that country.
select distinct d.country, A.*
from sales.customers as d
cross apply(
			select top (3) count(od.productid) as NumOfProducts, c.country, od.productid, p.productname
			from sales.orderDetails as od
			join sales.orders as o on od.orderid = o.orderid
			join sales.customers as c on c.custid = o.custid
			join production.products as p on p.productid = od.productid
			where d.country = c.country 
			group by c.country, od.productid, p.productname
			order by NumOfProducts desc) as A


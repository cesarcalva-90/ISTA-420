.echo on
.headers on

--name: Cesar Calva
--file: Exercise02Cesar.db
--date: January 23 2021

-- 1. List the company name, the contact name and the country of 
-- all customers in Poland.
select companyname, contactname from customers where country like "%Poland%";

-- 2. List the order Id, the order date, and the destination city 
-- of all orders shipped to Berlin.
select orderid, orderdate, shipcity from orders where shipcity like "%Berlin%";

-- 3. How many boxes of Filo Mix do we have 
-- in stock?
select productid, productname, unitsinstock from products where productname like "%Filo%";

-- 4. List the telephone numbers of all of our shippers.
select companyname, phone from shippers;

-- 5. Who is our oldest employee? Who is our youngest employee?
select firstname, lastname, max(birthdate) from employees;
select firstname, lastname, min(birthdate) from employees;

-- 6. List the suppliers where the owner of the supplier is also the 
-- sales contact.
select contactname, contacttitle from suppliers where contacttitle like "%own%";

-- 7. Mailing Labels
-- From the Northwind database we used in class and SQLite, create mailing labels for 
-- customer representatives. Each label should consist of six, and exactly six, lines. 
-- The mailing labels should be suitable for printing on sticky label paper, specifically 
-- Avery 8160 labels. The format should be as follows:

select contacttitle || '' || contactname||'
'||companyname||'
' 
|| address || '
'
|| city || '' || region || '' || postalcode || '' || country || '


'
as mailing_lables from customers;

-- 8. Telephone Book
-- From the Northwind database we used in class and SQLite, create a telephone book 
-- for customer representatives. Each line in the telehone book should consist of the 
-- representative last name, representative first name, company name, and telephone number.
-- Each row should look like this.

select contactname || '			' || companyname || '  		    ' ||phone 
as telephone_book from customers


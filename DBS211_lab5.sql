SET AUTOCOMMIT ON;
-- Q1 SOLUTION --
//a. ANSI-89
SELECT
   employeenumber,
   firstname,
   lastname,
   city,
   phone,
   postalcode 
FROM
   dbs211_employees,
   dbs211_offices 
WHERE
   dbs211_employees.officecode = dbs211_offices.officecode 
   AND LOWER(dbs211_offices.country) = 'france';
//b. ANSI-92
SELECT
   employeenumber,
   firstname,
   lastname,
   city,
   phone,
   postalcode 
FROM
   dbs211_employees 
   INNER JOIN
      dbs211_offices 
      ON dbs211_employees.officecode = dbs211_offices.officecode 
WHERE
   LOWER(dbs211_offices.country) = 'france';

-- Q2 SOLUTION --
/*Create a query that displays all payments made by customers from Canada.   
Sort the output by Customer Number.   
Only display the Customer Number, Customer Name, Payment Date and Amount.   
Make sure the date is displayed clearly to know what date it is. (i.e. what date is 02-04-19??? иC Feb 4, 2019, April 2, 2019, April 19, 2002, бн.) */
SELECT
   c.customernumber,
   c.customername,
   to_char(p.paymentdate, 'DD-MON-YYYY'),
   p.amount
FROM
   dbs211_customers c
   INNER JOIN
      dbs211_payments p
      ON c.customernumber = p.customernumber 
WHERE
    LOWER(c.country) = 'canada'
ORDER BY
   c.customernumber;
   
-- Q3 SOLUTION --
SELECT
   c.customernumber,
   c.customername 
FROM
   dbs211_customers c
   LEFT OUTER JOIN
      dbs211_payments p
      ON c.customernumber = p.customernumber 
WHERE
   p.customernumber IS NULL 
   AND LOWER(c.country) = 'usa' 
ORDER BY
   c.customernumber;

-- Q4 SOLUTION --
CREATE view vwcustomerorder AS 
SELECT
   o.customernumber,
   o.ordernumber,
   o.orderdate,
   p.productname,
   od.quantityordered,
   od.priceeach 
FROM
   dbs211_orders o 
   LEFT OUTER JOIN
      dbs211_orderdetails od 
      ON o.ordernumber = od.ordernumber 
   LEFT OUTER JOIN
      dbs211_products p 
      ON od.productcode = p.productcode;
DESCRIBE vwcustomerorder;
SELECT * FROM vwcustomerorder;

-- Q5 SOLUTION --
SELECT
   * 
FROM
   vwcustomerorder v 
   LEFT OUTER JOIN
      dbs211_orderdetails od 
      ON v.ordernumber = od.ordernumber 
WHERE
   v.customernumber = 124 
ORDER BY
   v.ordernumber,
   od.orderlinenumber;
   
-- Q6 SOLUTION --
SELECT
   c.customernumber,
   c.contactfirstname,
   c.contactlastname,
   c.phone,
   c.creditlimit 
FROM
   dbs211_customers c 
   LEFT OUTER JOIN
      vwcustomerorder v 
      ON c.customernumber = v.customernumber 
WHERE
   v.customernumber IS NULL;
   
-- Q7 SOLUTION --
CREATE view vwemployeemanager AS 
SELECT
   e.*,
   m.firstname AS "manager firstname",
   m.lastname AS "manager lastname" 
FROM
   dbs211_employees e 
   LEFT OUTER JOIN
      dbs211_employees m 
      ON e.reportsto = m.employeenumber;
DESCRIBE vwemployeemanager;
SELECT * FROM vwemployeemanager;
      
-- Q8 SOLUTION --
CREATE 
OR replace view vwemployeemanager AS 
SELECT
   e.*,
   m.firstname AS "manager firstname",
   m.lastname AS "manager lastname" 
FROM
   dbs211_employees e 
   LEFT OUTER JOIN
      dbs211_employees m 
      ON e.reportsto = m.employeenumber 
WHERE
   e.reportsto IS NOT NULL;
SELECT * FROM vwemployeemanager;
   
-- Q9 SOLUTION --
DROP view vwemployeemanager;
DESCRIBE vwemployeemanager;

DROP view vwcustomerorder;
DESCRIBE vwcustomerorder;
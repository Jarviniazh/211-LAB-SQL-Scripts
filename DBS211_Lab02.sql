/**************************************
Name: Jarvinia Zhao
ID: 143013233
Date:
Purpose: Lab 02 DBS211
***************************************/


//1. Display the data for all offices. Display office code, city, state, country, and phone for all offices.
//SOLUTION
SELECT
   officecode,
   city,
   state,
   country,
   phone 
FROM
   dbs211_offices 
ORDER BY
   officecode;

//2. Display employee number, first name, last name, and extension for all employees whose office code is 1. Sort the result based on the employee number.
//SOLUTION
SELECT
   employeenumber,
   firstname,
   lastname,
   extension 
FROM
   dbs211_employees 
WHERE
   officecode = 1 
ORDER BY
   employeenumber;

//3. Display customer number, customer name, contact first name and contact last name, and phone for all customers in Paris.
//SOLUTION
SELECT
   customernumber,
   customername,
   contactfirstname,
   contactlastname,
   phone 
FROM
   dbs211_customers 
WHERE
   city IN 
   (
      'Paris',
      'paris'
   )
ORDER BY
   customernumber;

//4. Repeat the previous Query with a couple small changes: 
//  a. The contact¡¯s first and last name should be in a single column in the format ¡°lastname, firstname¡±. 
//  b. Show customers who are in Canada 
//  c. Sort the result based on the customer name. 
//SOLUTION
SELECT
   customernumber AS "Customer Number",
   customername AS "Customer Name",
   contactlastname || ', ' || contactfirstname AS "Contact Name",
   phone AS "Phone" 
FROM
   dbs211_customers 
WHERE
   country IN 
   (
      'Canada',
      'canada'
   )
ORDER BY
   customername;

//5. Display customer number for customers who have payments.  Do not included any repeated  values. Sort the result based on the customer number.
//SOLUTION
SELECT DISTINCT
   customernumber 
FROM
   dbs211_payments 
ORDER BY
   customernumber FETCH next 10 ROWS ONLY;

//6. List customer numbers, check number, and amount for customers whose payment amount is not in the range of $1,500 to $120,000. Sort the output by top payments amount first.
//SOLUTION
SELECT
   customernumber,
   checknumber,
   amount 
FROM
   dbs211_payments 
WHERE
   amount NOT BETWEEN 1500 AND 120000 
ORDER BY
   amount DESC;

//7. Display order number, order date, status, and customer number for all orders that are cancelled. Sort the result according to order date. 
//SOLUTION
SELECT
   ordernumber,
   orderdate,
   status,
   customernumber 
FROM
   dbs211_orders 
WHERE
   status = 'Cancelled' 
ORDER BY
   orderdate;

//8. The company needs to know the percentage markup for each product sold.  Produce a query that outputs the ProductCode, ProductName, BuyPrice, MSRP in addition to 
//  a. The difference between MSRP and BuyPrice (i.e. MSRP-BuyPrice) called markup 
//  b. The percentage markup (100 * calculated by difference / BuyPrice) called percmarkup rounded to 1 decimal place. 
//  c. Sort the result according to percmarkup. 
//  d. Show products with percmarkup greater than 140. 
//SOLUTION
SELECT
   productcode,
   productname,
   buyprice,
   msrp,
   msrp - buyprice AS markup,
   round(100 * (msrp - buyprice) / buyprice, 1) AS percmarkup 
FROM
   dbs211_products 
WHERE
   100 * (msrp - buyprice) / buyprice > 140 
ORDER BY
   100 * (msrp - buyprice) / buyprice;

//9. Display product code, product name, and quantity in stock the information of all products with string ¡®co¡¯ in their product name. (c and o can be lower or upper case). Sort the result according to quantity in stock. 
//SOLUTION
SELECT
   productcode,
   productname,
   quantityinstock 
FROM
   dbs211_products 
WHERE
   LOWER(productname) LIKE '%co%' 
ORDER BY
   quantityinstock;

//10.Display customer number, contact first name, contact last name for all customers whose contact first name starts with letter s (both lowercase and uppercase) and includes letter e (both lowercase and uppercase). Sort the result according to customer number. 
//SOLUTION
SELECT
   customernumber,
   contactfirstname,
   contactlastname 
FROM
   dbs211_customers 
WHERE
   LOWER(contactfirstname) LIKE 's%' 
   AND LOWER(contactfirstname) LIKE '%e%' 
ORDER BY
   customernumber;
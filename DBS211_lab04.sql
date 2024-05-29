Drop table employee2;

SET AUTOCOMMIT ON;
//1
CREATE TABLE employee2 AS
(
   SELECT
      * 
   FROM
      dbs211_employees
)
;

SELECT
   * 
FROM
   employee2;
DESCRIBE employee2;

//2
ALTER TABLE employee2 ADD username VARCHAR(30);
DESCRIBE employee2;

//3
DELETE
FROM
   employee2;
SELECT
   COUNT(*) 
FROM
   employee2;
   
//4   
INSERT INTO
   employee2 (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle) 
   SELECT
      * 
   FROM
      dbs211_employees;
SELECT
   * 
FROM
   employee2;
   
//5   
SELECT
   MAX(employeenumber) 
FROM
   dbs211_employees; // 1702 
INSERT INTO employee2 (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle, username) 
VALUES(1703, 'Zhao', 'Jarvinia', 'x2222', 'jzhao169@myseneca.ca', 4, 1088, 'Cashier', NULL);
SELECT
   * 
FROM
   employee2;
   
//6   
SELECT
   * 
FROM
   employee2 
WHERE
   employeenumber = 1703;
   
//7.   
UPDATE
   employee2 
SET
   jobtitle = 'Head Cashier' 
WHERE
   employeenumber = 1703;
SELECT
   * 
FROM
   employee2 
WHERE
   employeenumber = 1703;
// 8 
INSERT INTO employee2 (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle, username) 
VALUES(1704, 'Kim', 'Fleta', 'x823', 'fleta@myseneca.ca', 4, 1073, 'Cashier', NULL);
SELECT
   * 
FROM
   employee2
WHERE
   employeenumber = 1704;

// 9. 
DELETE
FROM
   employee2 
WHERE
   employeenumber = 1703;
SELECT
   * 
FROM
   employee2;
// 10. 
DELETE
FROM
   employee2 
WHERE
   employeenumber = 1704; //Delete fake employee 
DELETE
FROM
    employee2 
WHERE
    employeenumber = 1703; //Delete my data again
SELECT
   * 
FROM
   employee2;
   
// 11 
INSERT ALL
INTO employee2 VALUES (1703, 'Zhao', 'Jarvinia', 'x2222',  'jzhao169@myseneca.ca', 4, 1088,  'Cashier', NULL)
INTO employee2 VALUES (1704, 'Kim', 'Fleta', 'x823', 'fleta@myseneca.ca', 4, 1088, 'Cashier', NULL)
SELECT
   * 
FROM
   DUAL;

SELECT
   * 
FROM
   employee2;
// 12 
DELETE
FROM
   employee2 
WHERE
   employeenumber = 1703 
   OR employeenumber = 1704;
SELECT
   * 
FROM
   employee2;
// 13 
UPDATE
   employee2 
SET
   username = LOWER(concat(substr(firstname, 1, 1), substr(lastname, 1, 10)));
SELECT
   firstname,
   lastname,
   username 
FROM
   employee2;
// 14 
DELETE
FROM
   employee2 
WHERE
   officecode = 4;
SELECT
   employeenumber,
   officecode 
FROM
   employee2;
// 15 
DROP TABLE employee2;
-- Q2 SOLUTION --
create table newEmployees (
"EMPLOYEENUMBER" NUMBER(*,0), 
	"LASTNAME" VARCHAR(30) NOT NULL, 
	"FIRSTNAME" VARCHAR(30) NOT NULL, 
	"EXTENSION" VARCHAR(10) NOT NULL, 
	"EMAIL" VARCHAR(100) NOT NULL ENABLE, 
	"OFFICECODE" VARCHAR(10) NOT NULL, 
	"REPORTSTO" NUMBER(*,0) DEFAULT NULL, 
	"JOBTITLE" VARCHAR(20) NOT NULL, 
	 PRIMARY KEY ("EMPLOYEENUMBER")
);
describe newEmployees;

-- Q3 SOLUTION --
SET AUTOCOMMIT OFF;
SET TRANSACTION READ WRITE;

-- Q4 SOLUTION --
INSERT ALL
    INTO newemployees VALUES(100, 'Patel', 'Ralph', '22333', 'rpatel@mail.com', '1', NULL, 'Sales Rep')
    INTO newemployees VALUES(101, 'Denis', 'Betty', '33444', 'bdenis@mail.com', '4', NULL, 'Sales Rep')
    INTO newemployees VALUES(102, 'Biri', 'Ben', '44555', 'bbirir@mail.com', '2', NULL, 'Sales Rep')
    INTO newemployees VALUES(103, 'Newman', 'Cha', '66777', 'cnewman@mail.com', '3', NULL, 'Sales Rep')
    INTO newemployees VALUES(104, 'Ropeburn', 'Audrey', '77888', 'aropebur@mail.com', '1', NULL, 'Sales Rep')
    SELECT * FROM dual;

-- Q5 SOLUTION --
SELECT * FROM newemployees;
SELECT COUNT(*) FROM newemployees; 
//5 rows are selected

-- Q6 SOLUTION --
ROLLBACK;
SELECT * FROM newemployees;
SELECT COUNT(*) FROM newemployees; 
//0 rows are selected

-- Q7 SOLUTION --
INSERT ALL
    INTO newemployees VALUES(100, 'Patel', 'Ralph', '22333', 'rpatel@mail.com', '1', NULL, 'Sales Rep')
    INTO newemployees VALUES(101, 'Denis', 'Betty', '33444', 'bdenis@mail.com', '4', NULL, 'Sales Rep')
    INTO newemployees VALUES(102, 'Biri', 'Ben', '44555', 'bbirir@mail.com', '2', NULL, 'Sales Rep')
    INTO newemployees VALUES(103, 'Newman', 'Cha', '66777', 'cnewman@mail.com', '3', NULL, 'Sales Rep')
    INTO newemployees VALUES(104, 'Ropeburn', 'Audrey', '77888', 'aropebur@mail.com', '1', NULL, 'Sales Rep')
    SELECT * FROM dual;
COMMIT;    
SELECT * FROM newemployees;
SELECT COUNT(*) FROM newemployees;
//5 rows are selected

-- Q8 SOLUTION --
UPDATE newemployees SET jobtitle = 'unknown';
SELECT * FROM newemployees;

-- Q9 SOLUTION --
COMMIT;  

-- Q10 SOLUTION --
ROLLBACK;
//a.
SELECT * 
FROM newemployees
WHERE LOWER(jobtitle) = 'unknown';
//5 rows are selected
//b. Rollback command is not effective

//c. This task run COMMIT query in Q9 to make all changes before it permanent not like Task6

-- Q11 SOLUTION --
COMMIT;
DELETE FROM newemployees;
SELECT * FROM newemployees;

-- Q12 SOLUTION --
CREATE VIEW vwNewEmps AS
    SELECT * 
    FROM newemployees;
DESCRIBE vwNewEmps;    

-- Q13 SOLUTION --
ROLLBACK;
//a.
SELECT * FROM newemployees;
SELECT COUNT(*) FROM newemployees;
//0 row is selected
//b. CREATE VIEW is a DDL statement, it automatically triggers an auto-commit of the current transaction and starts a new transaction.

-- Q14 SOLUTION --
COMMIT;
INSERT ALL
    INTO newemployees VALUES(100, 'Patel', 'Ralph', '22333', 'rpatel@mail.com', '1', NULL, 'Sales Rep')
    INTO newemployees VALUES(101, 'Denis', 'Betty', '33444', 'bdenis@mail.com', '4', NULL, 'Sales Rep')
    INTO newemployees VALUES(102, 'Biri', 'Ben', '44555', 'bbirir@mail.com', '2', NULL, 'Sales Rep')
    INTO newemployees VALUES(103, 'Newman', 'Cha', '66777', 'cnewman@mail.com', '3', NULL, 'Sales Rep')
    INTO newemployees VALUES(104, 'Ropeburn', 'Audrey', '77888', 'aropebur@mail.com', '1', NULL, 'Sales Rep')
    SELECT * FROM dual;
SELECT * FROM newemployees;    
    
-- Q15 SOLUTION --
SAVEPOINT insertion;

-- Q16 SOLUTION --
UPDATE newemployees SET jobtitle = 'unknown';
SELECT * FROM newemployees;

-- Q17 SOLUTION --
ROLLBACK TO insertion;
SELECT * FROM newemployees;
//Job title back to 'Sales Rep'

-- Q18 SOLUTION --
ROLLBACK;
SELECT * FROM newemployees;
//No data was inserted to table newEmployees

-- Q19 SOLUTION --
REVOKE ALL ON newemployees FROM public;

-- Q20 SOLUTION --
GRANT SELECT ON newemployees TO 'classmate'@'dbs';

-- Q21 SOLUTION --
GRANT INSERT, UPDATE, DELETE ON newemployees TO 'classmate'@'dbs';

-- Q22 SOLUTION --
REVOKE ALL ON newemployees FROM 'classmate'@'dbs';

-- Q23 SOLUTION --
DROP VIEW vwNewEmps;
DROP TABLE newemployees;
COMMIT;
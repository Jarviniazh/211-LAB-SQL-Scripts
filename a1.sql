
//1.	Display employee number, employee full name, phone, extension, city, manager ID, and manager name for employees who do not report to a manager. 
SELECT e.employeenumber as "Employee Number", e.lastname || ', ' || e.firstname as "Employee Name", o.phone as "Phone", e.extension as "Extension", o.city as "City", COALESCE(CAST(e.reportsto AS VARCHAR(10)),'Unknown') AS "Manager ID", 
    COALESCE(
        CASE
            WHEN m.lastname IS NULL AND m.firstname IS NULL THEN 'Unknown'
            WHEN m.lastname IS NOT NULL AND m.firstname IS NOT NULL THEN m.lastname || ', ' || m.firstname
            WHEN m.lastname IS NULL THEN m.firstname
            ELSE m.lastname
        END,
    'Unknown') AS "Manager Name"
From dbs211_employees e 
left join dbs211_offices o on e.officecode = o.officecode
left join dbs211_employees m on m.employeenumber = e.reportsto;

//2.	Display employee number, employee full name, phone, extension, and city for employees who work in NYC, Tokyo, and Paris. Sort the result based on the city and the employee number. 
SELECT e.employeenumber as "Employee Number", e.firstname || ' ' || e.lastname as "Employee Name", o.phone as "Phone", e.extension as "Extension", o.city as "City"
From dbs211_employees e 
left join dbs211_offices o on e.officecode = o.officecode
WHERE LOWER(city) in ('nyc', 'paris', 'tokyo')
Order by city, employeenumber;

//3.	Modify the query in Question 2 to display the manager ID and the manager name for the employees returned by the previous query. Sort the result based on the city and the employee number. 
SELECT e.employeenumber as "Employee Number", e.lastname || ', ' || e.firstname as "Employee Name", o.phone as "Phone", e.extension as "Extension", o.city as "City", COALESCE(CAST(e.reportsto AS VARCHAR(10)),'Unknown') AS "Manager ID", 
    COALESCE(
        CASE
            WHEN m.lastname IS NULL AND m.firstname IS NULL THEN 'Unknown'
            WHEN m.lastname IS NOT NULL AND m.firstname IS NOT NULL THEN m.firstname || ' ' || m.lastname
            WHEN m.lastname IS NULL THEN m.firstname
            ELSE m.lastname
        END,
    'Unknown') AS "Manager Name"
From dbs211_employees e 
left join dbs211_offices o on e.officecode = o.officecode
left join dbs211_employees m on m.employeenumber = e.reportsto
WHERE LOWER(city) in ('nyc', 'paris', 'tokyo')
Order by o.city, e.employeenumber;

//4.	For all managers, display manager ID, manager name, country, and the person who the manager reports to. See the following output. Sort the result according to the manager ID. 
Select m.employeenumber as "Manager ID", m.firstname || ' ' || m.lastname as "Manager Name", o.country,
        CASE
            WHEN m.reportsto IS NULL THEN 'Dese not report to anyone'
            WHEN m.reportsto IS NOT NULL then 'Reports to ' || l.firstname || ' ' || l.lastname || ' (' || l.jobtitle ||')'
        END
     AS "Reports to"
From dbs211_employees m
left join dbs211_offices o on m.officecode = o.officecode
left join dbs211_employees l on m.reportsto = l.employeenumber
Where m.employeenumber IN (
        Select e.reportsto 
        From dbs211_employees e 
        Where e.reportsto IS NOT NULL)
    OR m.reportsto IS NULL
order by m.employeenumber;



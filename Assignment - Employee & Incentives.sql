---------EMPLOYEE & INCENTIOVES------

---1. Write create table syntax for employee table and Incentive table
CREATE TABLE employee(
       emp_id NUMBER PRIMARY KEY,
       first_name VARCHAR2(40),
       last_name VARCHAR2(40),
       salary NUMBER,
       joining_date DATE,
       department VARCHAR2(40)
);

SELECT*FROM employee;

CREATE TABLE incentives(
       employee_ref_id NUMBER,
       incentive_date DATE,
       incentive_amount NUMBER
);

SELECT*FROM incentives;

-- 2. Write syntax for insert data into table of employee table and Incentive table

INSERT INTO employee VALUES (1,'John', 'Abraham', 1000000, TO_DATE('01-JAN-2013','DD-MON-YYYY'), 'Banking');
INSERT INTO employee VALUES (2, 'Michael', 'Clarke', 800000, TO_DATE('01-JAN-2013', 'DD-MON-YYYY'), 'Insurance');
INSERT INTO employee VALUES (3, 'Roy', 'Thomas', 700000, TO_DATE('01-FEB-2013', 'DD-MON-YYYY'), 'Banking');
INSERT INTO employee VALUES (4, 'Tom', 'Jose', 600000, TO_DATE('01-FEB-2013', 'DD-MON-YYYY'), 'Insurance');
INSERT INTO employee VALUES (5, 'Jerry', 'Pinto', 650000, TO_DATE('01-FEB-2013', 'DD-MON-YYYY'), 'Insurance');
INSERT INTO employee VALUES (6, 'Philip', 'Mathew', 750000, TO_DATE('01-JAN-2013', 'DD-MON-YYYY'), 'Services');

INSERT INTO incentives VALUES (1, TO_DATE('01-FEB-2013', 'DD-MON-YYYY'), 5000);
INSERT INTO incentives VALUES (2, TO_DATE('01-Feb-2013', 'DD-MON-YYYY'), 3000);
INSERT INTO incentives VALUES (3, TO_DATE('01-Feb-2013', 'DD-MON-YYYY'), 4000);
INSERT INTO incentives VALUES (1, TO_DATE('01-Jan-2013', 'DD-MON-YYYY'), 4500);
INSERT INTO incentives VALUES (2, TO_DATE('01-Jan-2013', 'DD-MON-YYYY'), 3500);

Delete from incentives;
TRUNCATE TABLE incentives;
DROP TABLE incentives;

--- 3.Get all employee details from the employee table
SELECT * FROM employee;

--- 4. Get First_Name,Last_Name from employee table
SELECT First_Name,Last_Name from employee;

---5. Get First_Name from employee table using alias name “Employee Name”
SELECT First_Name AS "Employee Name" from employee;

---6. Get First_Name from employee table in upper case
SELECT upper(first_name) from employee;

---7. Select first 3 characters of FIRST_NAME from EMPLOYEE
SELECT substr(first_name,1,3)from employee;

---8. Get position of 'o' in name 'John' from employee table
SELECT INSTR('John','o') from employee
WHERE first_name = 'John';

---9. Get FIRST_NAME from employee table after removing white spaces from right side.
SELECT RTRIM(first_name) FROM employee;

---10. Get First_Name from employee table after replacing 'o' with '$'
SELECT REPLACE(first_name,'o','$') FROM employee;

---11. Get First_Name and Last_Name as single column from employee table separated by a '_'
SELECT first_name||' '||last_name from employee;
SELECT first_name||' '||last_name AS "FULL NAME" from employee;

---12. Get FIRST_NAME, Joiningyear, Joining Month and Joining Date from employee table
SELECT first_name, extract(YEAR FROM joining_date) AS "Joining Year", extract(MONTH FROM joining_date) AS "Joining Month", extract(DAY FROM joining_date) AS "Joining Day" FROM employee;

--- 13. Get all employee details from the employee table order by First_Name Ascending

SELECT * FROM employee
ORDER BY first_name;

--- 14. Get all employee details from the employee table order by First_Name Ascending and Salary Descending? 
--(it did work but but as per first condition if it had common first condition it would use the second order by command)
SELECT * FROM employee
ORDER BY first_name ASC, salary DESC;


SELECT * FROM employee
ORDER BY salary DESC, first_name ASC ;

DROP TABLE employee;

--15. Get employee details from employee table whose employee name is “John”
SELECT * FROM employee
WHERE first_name = 'John';

SELECT * FROM employee
WHERE first_name IN('John');


--- 16. Get employee details from employee table whose employee name are “John” and “Roy”
SELECT * FROM employee
WHERE first_name = 'John' OR first_name = 'Roy' ;

SELECT * FROM employee
WHERE first_name IN('John', 'Roy');

--- 17. Get employee details from employee table whose employee name are not “John” and “Roy”.

SELECT * FROM employee
WHERE first_name <> 'John' AND first_name <> 'Roy' ;

SELECT * FROM employee
WHERE first_name NOT IN('John', 'Roy');

--- 18. Get employee details from employee table whose first name starts with 'J'.
SELECT * FROM employee
WHERE first_name LIKE('J%');

--- 19. Get employee details from employee table whose first name contains 'o'.
SELECT * FROM employee
WHERE first_name LIKE('%o%');

--- 20. Get employee details from employee table whose first name ends with 'n'.
SELECT * FROM employee
WHERE first_name LIKE('%n');

--- 21. Get employee details from employee table whose first name ends with 'n' and name contains 4 letters.
SELECT * FROM employee
WHERE first_name LIKE('___n');

---- 22. Get employee details from employee table whose first name starts with 'J' and name contains 4 letters.
SELECT * FROM employee
WHERE first_name LIKE('J___');

--- 23. Get employee details from employee table who’s Salary greater than 600000.
SELECT * FROM employee
WHERE salary > 60000;

-- 24. Get employee details from employee table whose joining year is “2013”.
SELECT * FROM employee
WHERE EXTRACT(YEAR FROM joining_date) = 2013;

--- 25. Get employee details from employee table whose joining month is “January”.
SELECT * FROM employee
WHERE EXTRACT(MONTH FROM joining_date) = 01;

--- 26. Get employee details from employee table who joined before January 1st 2013.
SELECT * FROM employee
WHERE joining_date < to_date('01-01-2013','MM-DD-YYYY');

---27. Get employee details from employee table who joined after January 31st
SELECT * FROM employee
WHERE joining_date > to_date('01-31-2013','MM-DD-YYYY');

--- 28. Get Joining Date and Time from employee table
SELECT first_name,TO_CHAR(joining_date,'DD-MM-YYYY HH24:MI:SS')
FROM employee;

-- 29. Get Joining Date, Time including milliseconds from employee table
SELECT first_name,TO_CHAR(joining_date,'DD-MM-YYYY HH24:MI:SS:SS')
FROM employee;



commit;


-- 30. Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table.
SELECT Emp_id, First_name, last_name, Incentive_amount, Joining_date - Incentive_date
FROM Employee, Incentives
WHERE Emp_id = Employee_ref_id;

select i.incentive_date - e.joining_date as "Diff" from employee e, incentives i
where e.emp_id = i.Employee_ref_id


--31. Get department, total salary with respect to a department from employee table.

SELECT department,sum(salary) AS "Total Salary" FROM employee
GROUP BY department;

-- 32. Get department, total salary with respect to a department from employee table order by total salary descending.

SELECT department,sum(salary) AS "Total Salary" FROM employee
GROUP BY department
ORDER BY  sum(salary) DESC;

-- 33. Get department, no of employees in a department, total salary with respect to a department from employee table order by total salary descending.

SELECT department,COUNT(first_name) AS "No of Employee" , sum(salary) AS "Total Salary" FROM employee
GROUP BY department
ORDER BY  sum(salary) DESC;

-- 34. Get department wise average salary from employee table order by salary ascending?

SELECT department,Round(AVG(salary),2) AS "Average Salary" FROM employee
GROUP BY department
ORDER BY  AVG(salary) ;

-- 35. Get department wise maximum salary from employee table order by salary ascending?
SELECT department,MAX(salary) AS "Maximum Salary" FROM employee
GROUP BY department
ORDER BY  MAX(salary);

-- 36. Get department wise minimum salary from employee table order by salary ascending?
SELECT department,MIN(salary) AS "Minimum Salary" FROM employee
GROUP BY department
ORDER BY  MIN(salary);

--37. Select no of employees joined with respect to year and month from employee table. <------
SELECT joining_date, count(first_name) AS "no of employee" from employee
GROUP BY joining_date;

-- 38. Select department,total salary with respect to a department from employee table where total salary greater than 800000 order by Total_Salary descending
SELECT department,SUM(salary) AS "Total Salary" FROM employee
GROUP BY department
HAVING SUM(salary)> 800000
ORDER BY SUM(salary) DESC;

--- 39. Select employee details from employee table if data in incentive table?

SELECT *
FROM employee 
where Emp_id IN(select Employee_ref_id from Incentives);

-- 40. Select 20 % of salary from John, 10% of Salary for Roy and for other 15 % of salary from employee table
SELECT first_name, salary, 
CASE 
 WHEN first_name = 'John' THEN  salary * 20/100
  WHEN first_name = 'Roy' THEN salary * 10/100
  ELSE salary * 15/100
END as updated_salary
from employee;

-- 41. Select Banking as 'Bank Dept', Insurance as 'Insurance Dept' and Services as    'Services Dept' from employee table.

SELECT emp_id, first_name, last_name, salary, joining_date,
CASE
  WHEN department = 'Banking' THEN 'Bank Dept'
    WHEN department = 'Insurance' THEN 'Insurance Dept'
      WHEN department = 'Services' THEN 'Services Dept'
END AS updated_departments
FROM employee;

-- 42. Delete employee data from employee table who got incentives in incentive table

select employee_ref_id from incentives;

delete from employee
where emp_id IN()
--combine these two queries ----- subquery used in WHERE
delete from employee
where emp_id IN(select employee_ref_id from incentives);

select * from employee;

rollback;


-- 43. Select first_name, incentive amount from employee and incentives table for those employees who have incentives.
SELECT first_name, incentive_amount
FROM Employee , Incentives 
WHERE Emp_id = Employee_ref_id ;

---- 44. Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
SELECT first_name, incentive_amount
FROM Employee , Incentives 
WHERE Emp_id = Employee_ref_id AND incentive_amount > 3000;


--- 45.Select first_name, incentive amount from employee and incentives table for all employees even if they didn't get incentives
SELECT first_name, incentive_amount
FROM Employee 
LEFT JOIN Incentives 
ON Emp_id = Employee_ref_id;

--- 46. Select first_name, incentive amount from employee and incentives table for all employees even if they didn't get incentives and set incentive amount as 0 for those employees who didn't get incentives.
SELECT first_name, NVL(Incentive_amount,0)
FROM Employee 
LEFT JOIN Incentives 
ON Emp_id = Employee_ref_id;


--- 47. Select first_name, incentive amount from employee and incentives table for all employees who got incentives using left join
SELECT first_name,Incentive_amount
FROM Employee 
LEFT JOIN Incentives 
ON Emp_id = Employee_ref_id
WHERE Incentive_amount IS NOT NULL;

--- 48. Select max incentive with respect to employee from employee and incentives table using sub query.


SELECT e.First_name, 

(SELECT MAX(Incentive_amount) 
FROM Incentives i  
WHERE i.Employee_ref_id = e.Emp_id) AS Max_Incentive 
FROM Employee e;

--- subquery used in select

commit;

SELECT MAX(Incentive_amount) 
FROM Incentives  
WHERE Employee_ref_id = Emp_id;






----PRACTICE AGAIN


--01
--02
--03
SELECT * FROM EMPLOYEE;
--04
SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEE;
--05
SELECT FIRST_NAME AS "Employee Name" FROM EMPLOYEE;
--06
SELECT UPPER(FIRST_NAME) FROM EMPLOYEE;
--07. Select first 3 characters of FIRST_NAME from EMPLOYEE
SELECT SUBSTR(FIRST_NAME,0,3) FROM EMPLOYEE;

--08. Get position of 'o' in name 'John' from employee table
select INSTR('John','o') from employee
where FIRST_NAME = 'John'
--09 . Get FIRST_NAME from employee table after removing white spaces from right side.
select rtrim(first_name) from employee

--10. Get First_Name from employee table after replacing 'o' with '$'
select replace(first_name,'o','$') from employee;

--11
select first_name ||' '|| last_name as "full Name" from employee

--12
select first_name, extract(year from joining_date)as "Year",extract(month from joining_date)as "Month",extract(Day from joining_date)as "Day" from employee
--13
select * from employee
order by First_name;
--14
select * from employee
order by First_name asc, salary DESC
--15
select * from employee
where First_name = 'John';

--17.
select * from employee
WHERE first_name Not IN ('John','Roy')

--18. 
select * from employee
where first_name like'J%'
--19

select * from employee
where first_name like'%o%'
--20
select * from employee
where first_name like'%n'

--21
select * from employee
where first_name like'___n'

--23
select * from employee
where salary > 600000
--24
select * from employee
where extract(year from Joining_date) = 2013;
--25
select * from employee
where extract(month from Joining_date) = 01;

--26
select * from employee
where joining_date < to_date('01/01/2013','DD/MM/YYYY')

--27
select * from employee
where joining_date > to_date('31/01/2013','DD/MM/YYYY')

--28 Get Joining Date and Time from employee table
select TO_CHAR(JOINING_DATE,'DD-MM-YYYY HH24:MM:SS') AS "DATE & TIME" from employee

--29. Get Joining Date, Time including milliseconds from employee table
select TO_CHAR(JOINING_DATE,'DD-MM-YYYY HH24:MM:SS:SS') AS "DATE & TIME" from employee

--30 Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table.
select i.incentive_date - e.joining_date as "Diff" from employee e, incentives i
where e.emp_id = i.Employee_ref_id

--31.Get department, total salary with respect to a department from employee table.

select department, sum(salary) as "Total Salary" from employee
GROUP BY Department

--32. Get department, total salary with respect to a department from employee table order by total salary descending.
select department, sum(salary) as "Total Salary" from employee
GROUP BY Department
order by "Total Salary" DESC

--33.Get department, no of employees in a department, total salary with respect to a department from employee table order by total salary descending.
select department, count(first_name)as "number of empployees" ,sum(salary) as "Total Salary" from employee
GROUP BY Department
order by "Total Salary" DESC

--34.Get department wise average salary from employee table order by salary ascending?
select department, AVG(Salary)as "AVG SALARY"  from employee
GROUP BY Department
order by "AVG SALARY"  ASC

--37. Select no of employees joined with respect to year and month from employee table.
SELECT JOINING_DATE, COUNT(FIRST_NAME)AS "NUMBER OF EMPLOYEES" FROM EMPLOYEE
GROUP BY JOINING_DATE

--38
select department, sum(salary) as "Total Salary" from employee
GROUP BY Department
HAVING  sum(salary)> 800000
order by "Total Salary" DESC

--39 Select employee details from employee table if data in incentive table?
SELECT * FROM EMPLOYEE 
WHERE EMP_ID IN (
      SELECT EMPLOYEE_REF_ID FROM INCENTIVES )

--40. Select 20 % of salary from John, 10% of Salary for Roy and for other 15 % of salary from employee table
SELECT First_name,
CASE
  WHEN FIRST_NAME = 'John' then 0.20 *salary
    when FIRST_NAME = 'Roy' then 0.10*salary
      else 0.15*salary
end as Updated_Salary
from employee;

--42. Delete employee data from employee table who got incentives in incentive table
Delete FROM EMPLOYEE 
WHERE EMP_ID NOT IN (
      SELECT EMPLOYEE_REF_ID FROM INCENTIVES )

rollback
select * from employee

--43
select e.First_name,i.incentive_amount from employee e
left join incentives i
on e.emp_id = i.employee_ref_id
where incentive_amount is NOT NULL

--44
select e.First_name,i.incentive_amount from employee e
left join incentives i
on e.emp_id = i.employee_ref_id
where incentive_amount > 3000

--45
select e.First_name,NVL(i.incentive_amount,0) from employee e
left join incentives i
on e.emp_id = i.employee_ref_id

--48
SELECT E.First_name, 
       (SELECT MAX(Incentive_amount) 
       FROM Incentives I WHERE I.Employee_ref_id = E.Emp_id) 
       AS Max_Incentive
FROM Employee E;

commit;









select Max(salary)from employee
where salary < (select max(salary) from employee)

select * from employee

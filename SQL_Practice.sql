--DDL-- Data Defination Language -- create, alter, drop, truncate, rename
--DML-- Data Manipulation Language -- insert, update, delele, merge
--DRL-- Data Retrival Language -= Select
--DCL/TCL-- Data Control Language/ Trasanction Control Language -- commit, rollback

-----------------------DDL Commands------------------------------
---Create Table Command
create table student
(stuid number,
 FNAME varchar2(20),
 LNAME varchar2(20),
 CITY varchar2(10)
);

---Drop Command
drop table student;  -- its remove the table also remove the structure of the table

---Truncate Command
truncate table student; -- its remove the all the data from table but dont remove the structure of the table.

---Alter Table
alter table student
add contact number; -- To add the new column in existing table.

alter table student
modify city not null; -- To give the constraints for existing column.

---Alter Table add two or more coloumn
alter table student
add( DOB date,
     email varchar2(30)
   ); 

rollback;

----------------------DML Commands-------------------------------
---Insert Command
insert into student values(1001,'Ram','Pande','Nagpur');
insert into student values(1002,'Ankit','Patil','Mumbai');
insert into student values(1003,'Jivan','Kumar','Pune');
insert into student values(1004,'Karan','Johar','Goa');
insert into student values(1005,'Priya','Nair','Surat');

--Update Command
update student
set city='satara'
where stuid=1005;

-- delete Command
delete from student where stuid=1005;

-------Difference between char, varchar, varchar2--------------------------------
--char- Memory Wastage-- Static Memory -- Number of length we provide that much of length occupied 
--varchar- Dynamic Memory -- Memory manage as per our charecters and remaining memory does not occupied.
--varchar2- same as varchar it os only advanced version of varchar its memory of storing data is more than varchar suppose varchar stored 2000 so varchar stored 4000
--------------------------------------------------------------------------------------

-------------------------------------CONSTRINTS-----------------------------------
--Constrints = Some sort of restriction on column used to enforce the integrity of the data.

--enforce the integrity of the data = means ensuring data remains accurate, complete, consistent, and trustworthy throughout its entire lifecycle, preventing unauthorized changes or corruption, and maintaining its original state using rules, validation, and controls

--Unique -- null value is allowed.
--Primary -- null value is NOT allowed.
--Foreign -- 
--Check -- A CHECK constraint in SQL is used to enforce data integrity by ensuring that all data in a column or columns meets a specific condition or set of conditions.
--Notnull -- 
--default(It is not a constraint it is like keyword)
-----------------------------------------------------------------------------------------

---No Dulicates Primary key

create table emp
(Eid number Primary key,
 FNAME varchar2(20),
 LNAME varchar2(20),
 CITY varchar2(10),
 salary number check (salary >0 AND salary <> 0) --- Check Constraints
);
-----
create table demo(
demo_id number,
demo_name varchar2(10),
contact number check(length(contact)=10));

insert into demo values(1001,'Abc',1234567890);
select * from demo; --check constraints for 10 digit mobile number.
---

select * from student;

select * from emp;

insert into emp values(1001,'ram','B','Pune',10202);

--------------------------------------------------------------------------------------------------------------

--Date DataType

select sysdate from dual; -- It gives current date and time.

create table employee_detail(
employee_id number,
employee_name varchar2(10),
joining_date date
);

--Date Format
insert into employee_detail (employee_id, employee_name, joining_date)
values (1003,'Ankit D',to_date('17/12/2025','dd/mm/yyyy'));

insert into employee_detail (employee_id, employee_name, joining_date)
values (1001,'Ramesh P',sysdate);  --------sysdate for current date.

---------date format change in current table-----------
alter session set nls_date_format = 'dd/mon/yyyy';

select * from employee_detail;
---------------------------------------------------------------------------------------------
----------------------------------TABLES FOR RACTICE PURPOSE----------------------------------------------

select * from hr.employees;

select * from hr.departments;

select * from hr.LOCATIONS;

select * from hr.countries;

select * from hr.regions;

------------------------------------------DRL COMMANDS-----------------------------------------------
select ROWID, employee_id, first_name,salary,hire_date from hr.employees 
where department_id=90;      -- ROWID is a sudo column which containing the address of data or address of row in hexadecimal format.

---------------------------------------------OPERATORS------------------------------------------------------
select * from hr.employees
where department_id=90;

--Show the employee whose department ID is greater than 90
select * from hr.employees
where department_id>90;

--Extract those employee deatial whose salary is greater than 15000
select * from hr.employees
where salary>15000;

--Extract Employee name and departmentId which belong from department ID(10,60,90) 
select * from hr.employees
where department_id in (10,60,90);

--Extract Employees whose not belong to departmentID (50,70,10)
select * from hr.employees
where department_id not in (50,70,10);



--Extract Employees name in acending order 
select first_name, Last_name from hr.employees
order by Last_name desc;

--between
select * from hr.employees
where hire_date between '01-jan-2005' AND '31-jan-2005' order by hire_date asc; 

--Concat firstName and LastName by employeeName and arrange in acending manner
select First_name ||' '|| Last_name as Employee_name from hr.employees order by employee_name asc;


--We can create dummy table for practice
create table dumy_employee as 
select * from hr.employees;

select * from dumy_employee;

--We cn crete structure only 
create table stru_employee as 
select * from hr.employees
where 1=2;         --We can create structure of the table only if the condition is false 
                   --if the condition is true then data also shown in table 
                   --if condition is false then only structure created


select * from stru_employee;

-------------------------------------------constrints check-------------------------------------

select * from all_constraints
where owner='HR'
and table_name='EMPLOYEES';  ----Always put table name in capital only.

select * from all_constraints
where owner='SYS'
and table_name='DUMY_EMPLOYEE';

------------------------------------
select * from all_tables
where table_name='EMP';--- TO CHECK THE TABLES PRESENT IN OUR DATABASE.
-------------------------------------------------------------------------------------------------

--------------------------------------ORDER_BY CLAUSE-------------------------------------------

SELECT FIRST_NAME||''||lAST_NAME AS FULL_NAME FROM HR.EMPLOYEES
ORDER BY FIRST_NAME ASC;

---------------------------------------------------------------
SELECT FIRST_NAME||''||lAST_NAME AS FULL_NAME,SALARY,COMMISSION_PCT, SALARY+COMMISSION_PCT AS TOTAL_SALARY FROM DUMY_EMPLOYEE;

--------------------------------NVL Function--------------------------------------------------
SELECT FIRST_NAME||''||lAST_NAME AS FULL_NAME,SALARY,COMMISSION_PCT, SALARY+COMMISSION_PCT AS TOTAL_SALARY FROM DUMY_EMPLOYEE; --WITHOUT NVL

--NVL FUNCTION IS USED IF THEIR IS NULL PRESENT IN ANY ROW THEN IT REPLACE IT WITH 0 OR ANY NUMBER WE WANT SO WE CAN PERFORM ARTMATIC OPRATIONS ON IT
--IF THEIR IS NULL THEN IT SHOWS ONLY NULL OS WE NEED TO REPLACE THAT NULL WITH 0 HENCE NVL FUNCTION IS USED.

SELECT FIRST_NAME||''||lAST_NAME AS FULL_NAME,SALARY,NVL(COMMISSION_PCT,0), SALARY+NVL(COMMISSION_PCT,0) AS TOTAL_SALARY FROM DUMY_EMPLOYEE; --- WITH NVL FUNCTION WE HAVE TO GIVE THE NUMBER WHICH WE WANT TO REPLACE WITH NULL JUST LIKE 0.
-----------------------------------------------------------------------------------------------------------------

SELECT * FROM DUMY_EMPLOYEE;

--Extract the data of emplyees commission for each employee
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, NVL(COMMISSION_PCT,0), NVL (SALARY*COMMISSION_PCT/100, 0) AS TOTAL_COMMISSION FROM DUMY_EMPLOYEE;

--Extract total salary of each employee with commission.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, NVL(COMMISSION_PCT,0), NVL (SALARY*COMMISSION_PCT/100, 0) AS TOTAL_COMMISSION, SALARY+NVL (SALARY*COMMISSION_PCT/100, 0) AS TOTAL_SALARY FROM DUMY_EMPLOYEE;



--------------------------------------------------------------------------------------------------------------------------------------

----------------------------------------LIKE OPERATOR-------------------------------------------------------------

SELECT * FROM HR.EMPLOYEES WHERE FIRST_NAME LIKE 'St%'; --after St % means any charecters it means give first_name which contains 'St' at starting

SELECT * FROM HR.EMPLOYEES WHERE FIRST_NAME LIKE 'St__%'; --means 4 charecters are must then 'St' and __, %-means can be anything

Select * from hr.employees where first_name like '%en'; --it means first_name end with 'en' before en % means any charecter.

select * from hr.employees where first_name like 'S_____'; --It means give me those names which is strat with 'S' and after s they have only 5 charecters. means no of underscore only that much of char will give to you if it is present 
--suppose we put only 3 underscore after 'S' it such name is not present in table then it not showing that name.

select * from hr.employees where first_name like '____en'; --before 'en' only  charecters are allowed. 
------------------------------------------------------------------------------------------------------------------------

---------------------------IS NULL-------------------------------------
select * from hr.employees
where department_id = null; --Here =sign is not working with null so need to use 'is' instead of =.

select * from hr.employees
where department_id is null;

------------------------------------------------DUAL, ROWID, ROWNUM-------------------------------------------------------------

-- Dual Table -- The DUAL table is a special system-defined table in Oracle and other SQL dialects. It has a single column, DUMMY, and a single row with the value 'X'. It is used to select pseudocolumns like ROWNUM and ROWID, or to execute a function without referencing actual user tables [1, 2]. 
-- ROWID - is a permanent, physical address for a row,
-- ROWNUM - is a temporary, sequential number assigned to each row in a query's result set. it runs with <= or < only. 


-----------------------------------DISTINCT KEYWORD-----------------------------------------
select DISTINCT first_name from hr.employees; --use to eliminate duplicates 
-----------------------------------------------------------------------------------------------


-------------------------------------------------------FUNCTION'S---------------------------------------------- 
--= Functions help us to manuplate data more efficiently.

--String Function
--Date Function
--Numeric Function
--Aggregate Function
--Analytical Functions

---------------------------------------------------STRNG FUNCTIONS--------------------------------------------------------
 
--ASCII() -- Returen Ascii code for the charecter

select ascii('S') from dual;

select ascii(9)from dual;

select ascii (' ') from dual;

select first_name, ascii(first_name) from hr.employees; --it gives only first charecter ascii value.

--CONCAT() -- Concatnate is used to combine 2 string

select concat('A','BC') from dual;

select first_name,last_name,concat(first_name,last_name) from hr.employees; --suppose here we want to add space in between names then again we have to use concat function in function so it will little bit complicated so go with concat operator

select first_name,last_name,first_name||' '||last_name from hr.employees; -- If we concatnate more than 2 strings then just go with concatnate operator.

--INITCAP() -- It converts first latter of each string into capital. 
select initcap('Antariksh') from dual;
select first_name,last_name,email,initcap(email) from hr.employees; --email is already in capital but it will make only initial letter in capital.

--UPPER() --It converts all the string into capital.
select upper('antariksh') from dual;
select first_name,upper(first_name),last_name from hr.employees;

--LOWER() --It converts all the string into small letters.
select lower('ANTARIKSH') from dual;
select first_name,email,lower(email),last_name from hr.employees;

--LENGTH() -How many number of charecters is specified into perticular string.
select length('ANTARIKSH') from dual;
select employee_id,first_name, length(first_name),last_name from hr.employees;

--INSTER() - used to find the starting position of a specified substring within a larger string.
select instr('Antariksh', 'r') from dual; --Antariksh is string and 'r' is substring so it will show the position of substring from that string.
select instr('This is a playlist', 'is') from dual;

select instr('This is a playlist', 'is',1,1), instr('This is a playlist', 'is',1,2), instr('This is a playlist', 'is',1,3) from dual; 
     --INSTR(string, substring, start_position, occurrence)
-------------## EXPLANATION ##------------     
--Parameter     -	      Meaning
--string        -	  The main text where we search
--substring     -	  The text to find
--start_position -	Position to start searching from
--occurrence     -	Which occurrence of the substring to find 
----------------------------------------------


select length('ANTARIKSH') from dual;
SELECT INSTR('ANTARIKSH', 9)FROM DUAL;

--SUBSTR() - used to extract a specific portion (substring) of characters from a larger string.
Select substr('This is a playlist',2,5) from dual; --2 is starting point and from that 2 upto given length which is 5
     --SUBSTR(string, start_position, length)
     
select SUBSTR('fatkarantariksh0603@gmail.com', INSTR('fatkarantariksh0603@gmail.com','@',2))from dual;
--Extract string from @.
select instr('rahul.bhujbal396@gmail.com','@')from dual; --first find the position of @
select substr('rahul.bhujbal396@gmail.com',17)from dual; --Now from this position take out substring
select substr('rahul.bhujbal396@gmail.com', instr('rahul.bhujbal396@gmail.com','@'))from dual; --Final Qury

--LPAD() --string manipulation function used to left-pad a string with a specific set of characters to reach a desired total length.
select LPAD('Ram',6,'#')from dual;
select employee_id, first_name,lpad(first_name,10,'!')from hr.employees;

--RPAD() --same as LPAD but it extend desired length of string from right side
select RPAD('Ram',6,'#')from dual;
select employee_id, first_name,rpad(first_name,10,'!')from hr.employees;

--LTRIM() --Remove Unwanted space from left side of string
select LTRIM('     ANTARIKSH')from dual;

--RTRIM() --Remove Unwanted space from right side of string
select RTRIM('Antariksh      ')from dual;

--TRIM() --Remove unwanted space form string
select TRIM('   Ram     ')from dual;

--REPLACE() -- used to replace the string with another string/ Relapce whole string at a time
select replace('This is a playList','is','IS')from dual; -- here small 'is' is replace with 'IS'

--TRANSLATE() --similar as replace but Replace character by character
select translate('This:is:string:',':',' ')from dual;  --here ':' is replaced by ' '(space). 

--"This is a palylist" replace only 2nd is with IS 
 --function in function is not work here so for that their is another function that is REGEXP_REPLACE()

--
select substr('This is a playlist',1,instr('This is a playlist','is',1,2)-1)--Here we take string from place 1 to before 1 position of 2nd is means 'This '
||'IS' -- here we concat capital is with above 'This '
||substr('This is a playlist',instr('This is a playlist','is',1,2)+2)--Here we continue the string from after 2nd is ' a playlist' and +2 for it shift the 2 place after from 2nd 'i'

from dual; 

--------------

select 'This is a playlist', substr('This is a playlist',1,instr('This is a playlist','is',1,2)-1)
|| 'IS'
||substr('This is a playlist',instr('This is a playlist','is',1,2)+2)as result

from dual;
--------
SELECT REGEXP_REPLACE(
         'This is a playlist',
         'is',
         'IS',
         1,
         2
       ) AS result
FROM dual;

----------------------------------------- NUMERIC FUNCTON-----------------------------------

--ABS() --Absolute Function change - sign to +
select abs(-2) from dual;

--CEIL() -- roundoff to nearest largest number. if here we take 25.01 then this function return 26. --Returns the smallest integer that is greater than or equal to the specified number (rounds up to the nearest integer).
select ceil(25.23) from dual;

--FLOOR() -- roundoff to nearest smallest number. --Returns the largest integer that is less than or equal to the specified number (rounds down to the nearest integer).
select floor(12.51), floor(12.99) from dual;

--ROUND() --simly roundoff function also we can round of decimal place 
select round(12.49), round(12.50), round(12.51) from dual;

select round(15.6524, 2) from dual; --here suppose we want to round of last 2 decimal place then pass the paremeter 2 after number then it returns 15.65.

--TRUNC() --function is used to remove the decimal portion of a number without rounding. It truncates the number to the specified number of decimal places.
select trunc(12.5125), trunc(12.9725,2) from dual;

--MOD() --function returns the remainder of a division operation (i.e., it computes the modulus). This function is useful for tasks like determining even/odd numbers or finding remainders in mathematical operations.
select mod(12 , 5), mod(12, 2) from dual;

    --Extract EVEN Employee_ID from Employee Table.
    select employee_id as Even_EMP_ID, first_name from hr.employees where mod(employee_id, 2)=0 order by employee_id asc;

--POWER() --power function it returns the power of number we put the number and what power we want in parameter 2 is number and 3 is power. 
select power(2,3) from dual;

--SQRT() --Square root function
select sqrt(16) from dual;

--BITAND() -- 
select bitand(20,4) from dual;

---------------------------------------------------------DATE FUNCTION----------------------------------------------------

--ADD_MONTHS() --We can add or reduce month from date
select sysdate,add_months(sysdate, 1)as NEXT_MONTH from dual;

--Add next month date in current hire date of employee table
select employee_id, first_name, salary, hire_date, add_months(hire_date,2)as Next2Monts from hr.employees;

select employee_id, first_name, salary, hire_date, add_months(hire_date,-2)as Next2Monts from hr.employees;

--CURRENT_DATE() 
select sysdate,current_date from dual;

--Q- What is difference between SYSDATE and CURRENT DATE.
--SYSDATE returns the date and time of the operating system on which the database server resides., 
--reflecting its time zone, while CURRENT_DATE provides the date in the user's session time zone, 
--CURRENT_DATE returns the current date and time in the user's session time zone. This time zone is determined by the client (user's application or system) connecting to the database. 
--making CURRENT_DATE session-aware and SYSDATE server-dependent. For example, 
--if the server is in UTC and the user in London, SYSDATE shows UTC time, but CURRENT_DATE shows London time
------------------------------

--EXTRACT() --Byusing extract function we can extract the any part of the data.
select extract(MONTH FROM to_date('31-Dec-1999', 'DD-MON-YYYY'))MON from dual;

--EXTRACT Years fr
select employee_id, first_name,salary,hire_date, extract(YEAR from hire_date)YEAR from Hr.employees;

select extract(DAY from to_date('31-Dec-1995 14:12:48', 'DD-MON-YYYY HH24:MI:SS'))DAY from dual; --Extract dat form given date

--Extract Employees whose is hire in march month only
select employee_id, first_name, salary, hire_date, extract(MONTH from hire_date) March_month from hr.employees where extract(MONTH from hire_date)=3;


--To_date is used to convert string into date format
select to_date('2025-12-31' , 'YYYY-MM-DD') as Converted_date from dual;
select to_date('31/12/2025' , 'DD/MM/YYYY') as Converted_date from dual;
select to_date('31-DEC-2025' , 'DD-MON-YYYY') as Converted_date from dual;

--LAST_DAY() --it returns Last Day of the date which you provide

--Extract data of employee who join on last day of any month;
select employee_id, first_name, last_day(hire_date) as Last_date_Employee from hr.employees;  

--Find firstday of next month from sysdate
select last_day(sysdate)+1 from dual;

--NEXT_DAY() -- We can find next day form the given date
select next_day(sysdate,'Thursday')from dual;

select next_day(date '2000-03-06', 'monday')from dual;

--to_char()
select sysdate, to_char(sysdate,'dd-mon-yyyy'), to_char(sysdate,'YYYY-MON-Day')from dual;--to_char no need same string format as date format it can run in any format.
select sysdate, to_date(sysdate,'dd-mon-yyyy'), to_date(sysdate,'YYYY-MON-Day')from dual; --To_date need same string format as similar to date format.


--------------------------------Assignment-----------------------------------
--Write create table syntax for employee table and Incentive table
create table Employee
( Emp_id number,
First_name varchar2(15),
Last_name varchar2(15),
Salary number,
Joining_date date,
Department varchar(20)
);

--Writesyntax forinsert data into table of employee table and Incentive table
insert into Employee values(1,'John','Abraham',1000000,to_date('01-JAN-13','DD-MON-YY'),'Banking');
insert into Employee values(2,'Michael','Clarke',800000,to_date('01-JAN-13','DD-MON-YY'),'Insurance');
insert into Employee values(3,'Roy','Thomas',700000,to_date('01-FEB-13','DD-MON-YY'),'Banking');
insert into Employee values(4,'Tom','Jose',600000,to_date('01-FEB-13','DD-MON-YY'),'Insurance');
insert into Employee values(5,'Jerry','Pinto',650000,to_date('01-FEB-13','DD-MON-YY'),'Insurance');
insert into Employee values(6,'Philip','Mathew',750000,to_date('01-JAN-13','DD-MON-YY'),'Services');

select * from Employee;

---------------------------------------------------------------------------------------
-------------------------------------------AGGREGATE FUNCTIONS-----------------------------------------

--AVG()
--COUNT()
--MAX()
--MIN()
--SUM()
-----------------

--AVG()
select AVG(salary) from hr.employees;

--MIN()
select MIN(salary) from hr.employees;

--MAX()
select MAX(salary) from hr.employees;

--SUM()
select SUM(salary) from Hr.employees;

--COUNT()
select count(*) from hr.employees; -- count(*) count the missing values as well as actual value.
select count(commission_pct) from hr.employees; --when we use count on perticular column then it will show only actual values not missing values

       --COUNT(*) ‚Üí counts rows

       --COUNT(column) ‚Üí ignores NULLs

       --COUNT(DISTINCT column) ‚Üí ignores NULLs and duplicates
       
       
------------------------------GRUOP BY CLAUSE--------------------------------
select department_id,count(*),sum(salary),round(avg(salary),2) from hr.employees group by department_id;

--The column which we take in select except function that all column need to be present in group by clause

-----------------------------------HAVING CLAUSE------------------------------

--After group by clause we can't use where clause and suppose we need to put any condition so need to use HAVING CLAUSE

--If we want to put filter on aggregation result then we have to use only having clause

--extract those department ID which contain more than 10 employees
SELECT department_id, count(*) as total
FROM HR.EMPLOYEES
GROUP BY department_id
HAVING count(*) > 10;

--Difference between where and Having clause?

-------------------------------------------------------------------------------------

-----------------------------------------------------------
--SEQUENCE OF SQL QUERY (HOW SQL QUERRY RUN)
--1 FROM
--2 WHERE
--3 GROUP BY
--4 HAVING
--5 SELECT
--6 DISTINCT
--7 ORDER BY
--8 OFFSET
----------------------------------------------------------

--------------------------------SPECIAL FUNCTON------------------------------------------------

--NVL() --If 1st parameter is NULL then it will return 2nd parameter.
        --If 1st parameter is NOT NULL then it will return 1st parameter only.

select employee_id, first_name, salary, commission_pct, nvl(commission_pct,0) from hr.employees;

select employee_id, first_name, salary, commission_pct, nvl(commission_pct,0), department_id, nvl(department_id,'NA') from hr.employees; --This query is no run Bcoz we pass 'NA' as string and data type is number

select employee_id, first_name, salary, commission_pct, nvl(commission_pct,0), department_id, nvl(to_char(department_id),'NA') from hr.employees; --This query is no run Bcoz we pass 'NA' as string and data type is number
--Obseervation for query is 
-- If the datatype is number then it showing on right side of the column and if the datatype is string then it showing left side of the column see last two column from above query.
----------------------------

--NVL2() -- need 3 parameters
--If 1st parameter is NOT NULL then it will return 2nd parameter
select NVL2(100,200,300) from dual;
--If 1st parameter is NULL then it will return 3rd parameter
select NVL2(null,200,300) from dual;

--Differencr between NVL() and NVL2() 


--NULLIF() --
--If both parameter are same then only it will return NULL value
select NULLIf(100,100) from dual;
--If parameter are not same then it will return 1st parameter only.
select NULLIf(100,200) from dual;


--Extract your age (days, months, years, ) from current date 
select 
trunc(sysdate-to_date('06-03-2000','dd-mm-yy')) as total_days, 
trunc(Months_between(sysdate, to_date('06-03-2000', 'dd-mm-yy'))/12) as total_years,
trunc(
from dual;
      
SELECT
  TRUNC(MONTHS_BETWEEN(SYSDATE, DATE '2000-03-06') / 12) AS YEARS,
  TRUNC(MOD(MONTHS_BETWEEN(SYSDATE, DATE '2000-03-06'), 12)) AS MONTHS,
  TRUNC(
    SYSDATE -
    ADD_MONTHS(
      DATE '2000-03-06',
      TRUNC(MONTHS_BETWEEN(SYSDATE, DATE '2000-03-06'))
    )
  ) AS DAYS
FROM DUAL;

---coalesce()  --It returns first NOT NULL value we can pass n number of parameters
select coalesce(null,10,null,20) from dual;
select coalesce(20,10,null,20) from dual;
select coalesce(null,null,null,20) from dual;

---------------------------------------CASE STATEMENT------------------------------
--It is like IF_ELSE

SELECT employee_id,first_name,last_name,salary,
case
  when salary >= 10000 THEN 'HIGH Salary'
  when salary between 000 and 9999 THEN 'MEDIUM Salary'
  when salary < 5000 THEN 'LOW Salary'
ELSE
  'Not specified'
END  as Salary_Distribution
from hr.employees;

--same query we can used for update also used this queery with new table 
--dont used on hr.employee

SELECT employee_id,first_name,last_name,salary,
case
  when salary >= 10000 THEN 1.5
  when salary between 000 and 9999 THEN 1.0
  when salary < 5000 THEN 0.5
ELSE
 0.1
END  as commission_pct
from hr.employees;

------------------------------DECODE------------------------------
--It is simlilar to case statement
--IT is compareason operator it will compare 1 and 2 then it will give result from parameters only
select decode(1,1,'one') from dual;
select decode(1,2,'one','not equal') from dual;
select decode(7,1,'one',2,'two',3,'is three',4,'is four','not matching') from dual; --It will check the value of 7 if its matching then it will return otherwise it will show not matching

-------------------------------------------------------------

---------------------------ANALYTICAL FUNCTONS/WINDOW FUNCTION----------------------------
--Analytical functon is not used n where clause 
--Ex--
SELECT employee_id, first_name, last_name, salary, department_id,
RANK() OVER(order by salary desc) as RANK_FUNC
FROM hr.employees
WHERE RANK() OVER(ORDER BY salary desc)=2; 

--Agar kisi bhi comun ke alias name ko agar hume filter condition me likhna hai to o statement ko hume inside the from clause to another select clause


--RANK() --used OVER() for on which column we want to use rank function that is written in over function

SELECT employee_id, first_name, last_name, salary, department_id,
RANK() OVER(order by salary desc) as RANK_FUNC
FROM hr.employees;

--Extract details of employee having 2nd highest salary
SELECT * FROM (SELECT employee_id, first_name, last_name, salary, department_id,
RANK() OVER(order by salary desc) as RANK_FUNC --HERE RANK_FUNC is alias and we have to use that alais in filter condition so we need to write that whole statement instead of table name in query and this is known as INLINE VIEW
FROM hr.employees)
WHERE RANK_FUNC =2;


--DENSE_RANK()

SELECT employee_id, first_name, last_name, salary, department_id,
RANK() OVER(order by salary desc) as RANK_FUNC,
DENSE_RANK() OVER(order by salary desc) as DRank_FUNC
FROM hr.employees;

--ROW_NUMBER()
--------------------------------------------
SELECT employee_id, first_name, last_name, salary, department_id,
RANK() OVER(order by salary desc) as RANK_FUNC,
DENSE_RANK() OVER(order by salary desc) as DRank_FUNC,
ROW_NUMBER() OVER(order by salary desc) as RNum_FUNC
FROM hr.employees;

--partition By
select * from (SELECT employee_id, first_name, last_name, salary, department_id,
RANK() OVER(partition by department_id order by salary desc) as RANK_FUNC,
DENSE_RANK() OVER(partition by department_id order by salary desc) as DRank_FUNC,
ROW_NUMBER() OVER(partition by department_id order by salary desc) as RNum_FUNC
FROM hr.employees)
where DRank_FUNC=1; --DEPARTMENT WISE HIGHEST SALARY



-----INLINE VEWS----------------
--Query in which after from instead of table name we write query that is inlinw view

--Extract details of employee having 2nd highest salary
SELECT * FROM (SELECT employee_id, first_name, last_name, salary, department_id,
RANK() OVER(order by salary desc) as RANK_FUNC --HERE RANK_FUNC is alias and we have to use that alais in filter condition so we need to write that whole statement instead of table name in query and this is known as INLINE VIEW
FROM hr.employees)
WHERE RANK_FUNC =2;
----------------------------------------------------------------------------- 
--Extract year from hire_date make partition by year and find highest salary year wise step by step query
select * from hr.employees;

--1step-first extract year from table
SELECT employee_id, first_name, last_name, salary, department_id, hire_date, to_char(hire_date, 'yyyy') as YEAR from hr.employees;

--2step- Now our alias is treated as column
SELECT employee_id, first_name, last_name, salary, department_id, hire_date, YEAR
FROM( SELECT employee_id, first_name, last_name, salary, department_id, hire_date, to_char(hire_date, 'yyyy') as YEAR 
FROM hr.employees);

--3step- Now apply partition by clause on year
SELECT employee_id, first_name, last_name, salary, department_id, hire_date, YEAR,
RANK() OVER(partition by YEAR order by salary desc) as RANK_FUNC,
DENSE_RANK() OVER(partition by YEAR order by salary desc) as DRank_FUNC,
ROW_NUMBER() OVER(partition by YEAR order by salary desc) as RNum_FUNC
FROM( SELECT employee_id, first_name, last_name, salary, department_id, hire_date, to_char(hire_date, 'yyyy') as YEAR 
FROM hr.employees);

--4step- Now we want year wise salary
SELECT * FROM(SELECT employee_id, first_name, last_name, salary, department_id, hire_date, YEAR,
RANK() OVER(partition by YEAR order by salary desc) as RANK_FUNC,
DENSE_RANK() OVER(partition by YEAR order by salary desc) as DRank_FUNC,
ROW_NUMBER() OVER(partition by YEAR order by salary desc) as RNum_FUNC
FROM( SELECT employee_id, first_name, last_name, salary, department_id, hire_date, to_char(hire_date, 'yyyy') as YEAR 
FROM hr.employees))
WHERE DRank_FUNC=1;

RANK() OVER(partition by department_id order by salary desc) as RANK_FUNC,
DENSE_RANK() OVER(partition by department_id order by salary desc) as DRank_FUNC,
ROW_NUMBER() OVER(partition by department_id order by salary desc) as RNum_FUNC
FROM hr.employees)
---------------------------------------------------------------


--Difference between ANALYTICAL FUNCTION and AGGREGATE FUNCTION

------------------------------------JOINS - JOINS are used to retrive data from two or more table----------------------------------------

--Types --INNER JOIN -- Return matching records on some euality condition
        --LEFT OUTER JOIN -- Return matching record on some equality condition also return remaining record form LEFT table.
        --RIGHT OUTER JOIN-- Return matching record on some equality condition also return remaining record from RIGHT table.
        --FULL OUTER JOIN -- Return matching record on some equality condition also return remaining records from BOTH Right and Left table.
        --CROSS JOIN --
        --SELF JOIN
        
------------------------------------INNER JOIN----------------------------------------
select employee_id, first_name,last_name,salary, e.department_id, department_name 
from hr.employees e, hr.departments d
where e.department_id = d.department_id;

select employee_id, first_name,last_name,salary, e.department_id, department_name 
from hr.employees e inner join hr.departments d
on e.department_id = d.department_id;

-------------------------------------LEFT OUTER JOIN-----------------------------------------
select employee_id, first_name,last_name,salary, e.department_id, department_name 
from hr.employees e left outer join hr.departments d
on e.department_id = d.department_id;

--Anothe way to write left outer join qurey
select employee_id, first_name,last_name,salary, e.department_id, department_name 
from hr.employees e , hr.departments d
where e.department_id = d.department_id(+); --Here (+) sign means Jiske samne (+) laga ho us table ka data na lekar uske opposite tabel ka data lena hai

-------------------------------------RIGHT OUTER JOIN-----------------------------------------
select employee_id, first_name, last_name, salary, e.department_id, department_name
from hr.employees e Right Outer Join hr.departments d
on e.department_id = d.department_id;

--Anothe way to write RIGHT OUTER join qurey
select employee_id, first_name,last_name,salary, e.department_id, department_name 
from hr.employees e , hr.departments d
where e.department_id (+) = d.department_id; --Here (+) sign showas don't take remaining information of that table who have (+) sign in frot of that that table name.

----------------------------------FULL OUTER JOIN--------------------------------------------
select employee_id, first_name, last_name, salary, e.department_id, department_name
from hr.employees e Full Outer Join hr.departments d
on e.department_id = d.department_id;

------------JOIN MORE THAT 2 TABLE
SELECT employee_id, first_name, last_name, salary, e.department_id, department_name,city
FROM hr.employees e INNER JOIN hr.departments d
ON e.department_id = d.department_id
INNER JOIN hr.locations l 
ON d.location_id = l.location_id;

-----------------------------------------CROSS JOIN-----------------------------------------
--Each column of first table is join with each column of 2nd table.

SELECT employee_id, first_name, last_name, salary, e.department_id, department_name
FROM hr.employees e CROSS JOIN hr.departments d;

-----------------------------------------SELF JOIN--------------------------------------
--joining 1 column to another column of same table then it is call self join.

SELECT * FROM hr.employees e1, hr.employees e2
WHERE e1.employee_id = e2.manager_id;

SELECT e2.manager_id, e1.first_name as manager_name, e2.employee_id, e2.first_name 
FROM hr.employees e1, hr.employees e2
WHERE e1.employee_id = e2.manager_id

SELECT manager_name, count(*) FROM (SELECT e2.manager_id, e1.first_name as manager_name, e2.employee_id, e2.first_name 
FROM hr.employees e1, hr.employees e2
WHERE e1.employee_id = e2.manager_id)
GROUP BY manager_name;

----------------------------------NOTES----------------------------------
SELECT *
FROM orders
WHERE amt > ANY (   -- > ANY ‚Üí at least one || > ALL ‚Üí every value
    SELECT amt
    FROM orders
    WHERE TRUNC(odate) = TO_DATE('06-OCT', 'DD-MON')
);

-----------------------------------------------------------------



--SET OPERATORS

CREATE TABLE DEMO
(ID_no number,
AMOUNT NUMBER);

INSERT INTO DEMO VALUES('101',500); 
INSERT INTO DEMO VALUES('102',600); 
INSERT INTO DEMO VALUES('103',700);  

SELECT * FROM DEMO;


SELECT TO_CHAR(id_no) AS id_no, amount
FROM demo

UNION ALL

SELECT 'sum' AS id_no, SUM(amount)
FROM demo;

----------------------- ### EXISTS ### -----------------------------

‚ùì Why do we use SELECT 1 in subqueries?
Short logic:

Ì†ΩÌ±â Because EXISTS does not care what you select ‚Äî it only checks whether rows exist.

Ì†æÌ∑† How EXISTS works internally

When Oracle sees this:

WHERE EXISTS (subquery)


It simply asks:

‚ÄúDoes this subquery return at least one row?‚Äù

‚úî YES ‚Üí condition is TRUE

‚ùå NO ‚Üí condition is FALSE

Ì†ΩÌ±â It never looks at the actual column values
------------------------xxxxxxxxxxxxxxxxxxxxxxxxxxx-------------------------------------





     

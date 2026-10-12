
---Q1: Write a query to display the Full name only those employees whose first name start with ‘S’ character.
select employee_id,first_name || ' '||' '|| last_name as Full_name, salary, hire_date from hr.employees
where first_name like 'S%'


SELECT employee_id,
       SUBSTR(first_name, 1, 1) || '.' || last_name AS "Full Name",
       salary,
       hire_date
FROM hr.employees
WHERE first_name LIKE 'S%';

--- Q2. Find the highest, lowest, sum, and average salary of all employees. 
--Label the columns Maximum,Minimum, Sum, and Average, respectively. Round your results to the nearest whole number. 

select round(max(salary)) Maximun,round(max(salary)) Minimum,round(sum(salary)) sum,round(avg(salary)) average from hr.employees



--Q3. Display following output .
---Employee Details
--------------------------------------------------------------------------------------
---King earns $24,000.00 monthly but wants $72,000.00.
---Kochhar earns $20,000.00 monthly but wants $60,000.00.
---De Haan earns $17,000.00 monthly but wants $51,000.00.
---Hunold earns $9,000.00 monthly but wants $27,000.00.
---Ernst earns $6,000.00 monthly but wants $18,000.00.
---Austin earns $4,800.00 monthly but wants $14,400.00.

select last_name || 'earns '|| to_char(Salary,'$9999999.00') || ' monthly but wants '|| to_char(3* salary,'$9999999.00') from hr.employees




SELECT last_name||' '||' earns'||to_char(salary,'$99999.00')||' '||'but wants'||' '||(to_char(salary*3,'$99999.00'))
FROM hr.employees;

--Q4. Determine the number of managers without listing them. Label the column  Number of Managers 
--Hint: Use the MANAGER_ID column to determine the number of managers. 

select count(manager_id)as number_of_managers from hr.employees


---Q5. Find the difference between the highest and lowest salaries. Label the column DIFFERENCE
select (max(salary) - min(salary)) Difference from hr.employees


--Q6. Display how many employees joined in each month
--Hint: Grouping by month and count the employees .use TO_CHAR functions also

select to_char(hire_date,'Month')month, count(employee_id) number_of_employee 
from hr.employees 
group by to_char(hire_date,'Month') 
order by month
select * from hr.employees



--Q7. Display employee id , full name of employees and their hire date only those employees that has greater than 10 year experience in company.


select * from hr.employees


select employee_id, first_name ||' ' || last_name, hire_date 
from hr.employees
where (sysdate - hire_date) > (365*10)



--Q8. Write a query to multipley  salary to commission and calculate the average salary of employees.-Hint: Commission column contain null values

select round(avg(nvl(commission_pct,'0')* salary + salary),2) Avg_earning from hr.employees


---Q9.Write a query to display department_id and number of manager under the particular department exclude the null department. 
--Hint: Grouping on department id

select department_id department, count(manager_id)number_of_managers from hr.employees
where department_id is not null
group by department_id


---Q10.Display job title and number of employees working those job and number of manager they perform job.
select * from hr.employees
select * from hr.jobs


SELECT count(employee_id),count(manager_id),j.job_title
FROM hr.employees e, hr.jobs j
WHERE e.job_id=j.job_id and manager_id is not null
group by j.job_title;

---Q11. Display employee full name and pad both side asterisk sing 10 time . Example 

select LPAD(first_name || ' ' || last_name, LENGTH(first_name || ' ' || last_name) + 10, '*' )from hr.employees


SELECT 
    RPAD(LPAD(first_name || ' ' || last_name, LENGTH(first_name || ' ' || last_name) + 10, '*'), 
         LENGTH(first_name || ' ' || last_name) + 20, '*') AS padded_name
FROM hr.employees;

---Q12. Display following output. (Hint: Use Months_between Function)

SELECT employee_id,last_name,hire_date,round(months_between(sysdate,hire_date)/7) weeks,
round(months_between(sysdate,hire_date)) months,
round(months_between(sysdate,hire_date)/12) years
FROM hr.employees;


commit;

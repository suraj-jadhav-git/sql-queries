


----Q1. Write a query to generate following output.
select employee_id, first_name|| ' '||last_name as Full_name, Email,to_char(salary,'$99,999.00')salary from hr.employees



---Q2.Write a query to display job_id and number of manager under particular job. Show only those jobs that have more than one manager.


select job_id, Count(manager_id)as number_of_managers from hr.employees group by job_id having Count(manager_id)> 1


---Q3. Display the country name and number of employees those working in particular city that count of employee is greater than 30.
----(Hint: Using Equijoin and Group by )
select * from hr.employees
select * from hr.departments
select * from hr.locations
select * from hr.countries 

FROM hr.employees e,hr.departments d,hr.locations l,hr.countries c

select c.country_name,l.city,count(e.employee_id) from hr.employees e,hr.departments d,hr.locations l,hr.countries c 
where e.department_id = d.department_id and d.location_id = l.location_id and l.country_id = c.country_id
group by l.city,c.country_name
having count(e.employee_id) > 30


--Q4. Display cities name and number of departments present those cities. And exculde departments there are no any employees.
select l.city,count(d.department_id) from hr.employees e,hr.departments d, hr.locations l
where e.department_id = d.department_id and d.location_id = l.location_id and e.employee_id is not null
group by l.city


--Q5. Display the salary range and number of employees how are salary in between of range. 
(Hint : Job_Grade table , Equijoin , Group by )


select e.job_id,j.min_salary,j.max_salary, count(e.employee_id) from hr.employees e, hr.jobs j
where e.job_id = j.job_id
group by e.job_id,j.min_salary,j.max_salary

select * from  hr.employees

select * from hr.jobs -- ans without jobs table
select salary_range, count(employee_id) from 
(select employee_id, first_name, salary, 
case
  when salary < 10000 then 'Low salary'
    when salary >= 10000 and salary < 20000 then 'Avg salary'
      else 'High salary'
end as salary_range
from hr.employees) salary_table
group by salary_range






----Q6. Display Year list and number of Employees join in particular year.
(Hint: Group by and To_Char Function)


SELECT to_char(hire_date,'yyyy'),count(employee_id)
FROM hr.employees
group by to_char(hire_date,'yyyy')
order by 1;


--Q7. Display Manager_id , Manager Full Name and Under number of employees only those managers how have more than 5 employees under working. 
--Result sort by manager_ID

SELECT 
    m.employee_id AS Manager_ID, 
    m.first_name || ' ' || m.last_name AS Manager_Full_Name, 
    COUNT(e.employee_id) AS Employees_Count
FROM 
    hr.employees e       
JOIN 
    hr.employees m     
ON 
    e.manager_id = m.employee_id
GROUP BY 
    m.employee_id, 
    m.first_name || ' ' || m.last_name
HAVING 
    COUNT(e.employee_id) > 5
ORDER BY 
    m.employee_id;

commit

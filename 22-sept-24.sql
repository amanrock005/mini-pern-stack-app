
-- 1. find the number of employees in each department
   select count(*) as num_of_employee
   from employees
   group by department_id;
-- 2. join the first and the last name
   select first_name||' '||last_name as full_name
   from employees;
-- 3. find employees who are manager
   select distinct e.employee_id, e.first_name, e.last_name
   from employees e
   where e.employee_id in (select manager_id from employees where manager_id is not null);
-- 4. find employees who are hired in the month of may
   select *
   from employees
   where extract(month from hire_date) = 5;
-- 5. find employees who are hired in the the year 2007
   select *
   from employees
   where extract(year from hire_date) = 2007;
-- 6. find the highest and minimum salary from the employees table;
   select max(salary),min(salary)
   from employees;
-- 7. display employee_id, fullname, and salary in descending order
   select employee_id, first_name||' '||last_name as full_name, salary
   from employees
   order by salary desc;
-- 8. display employee_id, fullname, and salary in descending order of salary and ascending order of fullname
   select employee_id, first_name||' '||last_name as full_name, salary
   from employees
   order by salary desc, full_name asc;
   
-- 9. find employees who are hired between 31-mar-2006 to 31-mar2007
   select * 
   from employees
   where hire_date >= '31-mar-2006' and hire_date <= '31-mar-2007';

-- 10. find the 4th highest salary
   select salary
   from (
    select salary, row_number() over (order by salary desc) as rn
    from employees
   )
   where rn = :n;


-- 1. find the highest salary earner in each department
-- 2. find the department with the highest and lowest average salary
-- 3. find the employees whose commission is null
-- 4. find the average salary for each department
-- 5. write a query to insert an employee in the employees table 
First Name: Sarah
Last Name: Connor
Email: SCONNOR
Phone Number: 123.456.7890
Job ID: HR_REP
Salary: 12000
Department ID: 60

-- 6. write a query to update the salary of Sarah connor by 10%
-- 7. write a query to display the count of employees in each deparmtent along with department name
-- 8. display employees who have joined before 2007 and the data format should be yyyy-mm-dd
-- 9. split job id as role and department 
-- 10. display the 3rd highest salary 


-- 1. display the names of employees who are reporting to lex
-- 2. find the employees who are managers using joins
-- 3. find the list of managers and also display how many people are reporting to each manager
-- 4. display the employee name and along with manager name who is earning more than their manager


-- 1. find the highest salary earner in each department
   select employee_id, first_name, last_name, department_id, salary
   from (
    select employee_id, first_name, last_name, department_id, salary,
    rank() over (partition by department_id order by salary desc) as salary_rank
    from employees
   ) where salary_rank = 1;
   
-- 2. find the department with the highest and lowest average salary
   select department_id, avg_salary
   from (
    select department_id, avg(salary) as avg_salary
    from employees
    group by department_id
    order by avg_salary desc
   )
   where rownum = 1;
-- 3. find the employees whose commission is null
   select * 
   from employees
   where commission_pct is not null;
-- 4. find the average salary for each department
   select department_id, avg(salary)
   from employees
   where department_id is null
   group by department_id;
-- 5. write a query to create a replicate of employee table called xx_employee
   create table xx_employees as
   select * from employees where 1=1;

-- 6. write a query to update the salary of employee id 202 by 10%
   update xx_employees
   set salary = salary + salary * 0.1
   where employee_id = 202;
 
-- 7. write a query to display the count of employees in each deparmtent along with department name
   select count(*) as num_of_emp, e.department_id, d.department_name
   from employees e
   join department d
   on e.department_id = d.department_id;
-- 8. display employees who have joined before 2007 
   select *
   from employees 
   where hire_date < '01-01-2007';
-- 9. split job id as role and department  
   select 
    substr(job_id, 1, instr(job_id,'_')-1) as dept_short_form,
    substr(job_id, instr(job_id, '_')+1) as designation 
   from employees;
-- 10. display the 3rd highest salary 
   select salary 
   from (
    select salary, row_number() over (order by salary desc) as row_num
    from employees
   ) 
   where row_num=3;
   
   select salary
   from (
    select salary, dense_rank() over (order by salary desc) as rank
    from employees
   )
   where rank=3;

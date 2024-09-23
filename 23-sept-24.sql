 what is the order of execution of a sql query 
   
SELECT department_id, COUNT(*)
FROM employees
WHERE salary > 5000
GROUP BY department_id
HAVING COUNT(*) > 5
ORDER BY department_id;

 cummulative running sum
 delete the duplicate records
    delete employees
    where rowid not in (
     select max(rowid)
     from employees
     group by emp_id, ename, job, sal, deptno);

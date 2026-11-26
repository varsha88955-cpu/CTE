-- 1. Display employees whose salary is greater than 50,000.
with emp_cte as (select * from employee where salary > 50000)
select * from emp_cte;


-- 2. Display employees earning more than the overall average salary.
with avg_cte as (select avg(salary) as avg_salary from employee)
select employee_name, department_name, salary from employee where salary > (select avg_salary from avg_cte);


-- 3. Calculate the average salary and display employees earning above it.
with avg_cte as (select avg(salary) as avg_salary from employee)
select * from employee where salary > (select avg_salary from avg_cte);


-- 4. Calculate the total salary paid in each department.
with total_cte as (select department_name, sum(salary) as total_salary from employee group by department_name)
select * from total_cte;


-- 5. Display departments whose average salary is greater than 60,000.
with avg_cte as (select department_name, avg(salary) as avg_salary from employee group by department_name)
select * from avg_cte where avg_salary > 60000;


-- 6. Find the highest-paid employee.
with max_cte as (select max(salary) as max_salary from employee)
select * from employee where salary = (select max_salary from max_cte);


-- 7. Find the lowest-paid employee.
with min_cte as (select min(salary) as min_salary from employee)
select * from employee where salary = (select min_salary from min_cte);


-- 8. Find employees receiving the maximum salary in each department.
with max_cte as (select department_name, max(salary) as max_salary from employee group by department_name)
select e.* from employee e join max_cte m on e.department_name = m.department_name and e.salary = m.max_salary;


-- 9. Find employees receiving the minimum salary in each department.
with min_cte as (select department_name, min(salary) as min_salary from employee group by department_name)
select e.* from employee e join min_cte m on e.department_name = m.department_name and e.salary = m.min_salary;


-- 10. Display departments having more than five employees.
with count_cte as (select department_name, count(*) as emp_count from employee group by department_name)
select * from count_cte where emp_count > 5;


-- 11. Display all employees with their department's average salary.
with avg_cte as (select department_name, avg(salary) as avg_salary from employee group by department_name)
select e.employee_name, e.department_name, e.salary, a.avg_salary from employee e join avg_cte a on e.department_name = a.department_name;


-- 12. Display employees belonging to departments with total salary greater than 500,000.
with total_cte as (select department_name, sum(salary) as total_salary from employee group by department_name)
select e.* from employee e join total_cte t on e.department_name = t.department_name where t.total_salary > 500000;


-- 13. Find employees earning more than their department's average salary.
with avg_cte as (select department_name, avg(salary) as avg_salary from employee group by department_name)
select e.* from employee e join avg_cte a on e.department_name = a.department_name where e.salary > a.avg_salary;


-- 14. Display employee name, salary, department, average salary, and salary difference.
with avg_cte as (select department_name, avg(salary) as avg_salary from employee group by department_name)
select e.employee_name, e.salary, e.department_name, a.avg_salary, e.salary-a.avg_salary as salary_difference from employee e join avg_cte a on e.department_name = a.department_name;


-- 15. Find employees belonging to the department with the highest average salary.
with avg_cte as (select department_name, avg(salary) as avg_salary from employee group by department_name)
select e.* from employee e join avg_cte a on e.department_name = a.department_name where a.avg_salary = (select max(avg_salary) from avg_cte);


-- 16. Display department-wise employee count and average salary.
with dept_cte as (select department_name, count(*) as emp_count, avg(salary) as avg_salary from employee group by department_name)
select * from dept_cte;


-- 17. Find employees earning above their department's average salary in descending salary order.
with avg_cte as (select department_name, avg(salary) as avg_salary from employee group by department_name)
select e.* from employee e join avg_cte a on e.department_name = a.department_name where e.salary > a.avg_salary order by e.salary desc;


-- 18. Display departments having a salary range greater than 30,000.
with range_cte as (select department_name, max(salary)-min(salary) as salary_range from employee group by department_name)
select * from range_cte where salary_range > 30000;


-- 19. Find employees belonging to the department with the highest total salary.
with total_cte as (select department_name, sum(salary) as total_salary from employee group by department_name)
select e.* from employee e join total_cte t on e.department_name = t.department_name where t.total_salary = (select max(total_salary) from total_cte);


-- 20. Display departments having more than three employees and average salary greater than 50,000, with minimum and maximum salaries.
with dept_cte as (select department_name, count(*) as emp_count, min(salary) as min_salary, max(salary) as max_salary, avg(salary) as avg_salary from employee group by department_name)
select * from dept_cte where emp_count > 3 and avg_salary > 50000;

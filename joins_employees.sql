
-- 1.	Use the employees database.
use employees;
-- 2.	Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.
select dept_name as "department_name", concat(first_name, " ", last_name) as "manager_name" 

from departments as d

join dept_manager using(dept_no)

join employees using(emp_no)

where to_date = "9999-01-01"

order by department_name;

-- 14.	Find the name of all departments currently managed by women.
select dept_name as "department_name", concat(first_name, " ", last_name) as "manager_name" 

from departments as d

join dept_manager using(dept_no)

join employees using(emp_no)

where (to_date = "9999-01-01") and (gender = "F")

order by department_name;

-- 21.	Find the current titles of employees currently working in the Customer Service department.
select t.title, count(*)

from employees as e

join dept_emp using(emp_no)

join departments using(dept_no)

join titles as t using(emp_no)

join salaries as s using(emp_no)

where (dept_name = "Customer Service") and (t.to_date = "9999-01-01") and (s.to_date = "9999_01_01")

group by title

order by title asc;

-- 31.	Find the current salary of all current managers.

select d.dept_name, concat(e.first_name, " ", e.last_name) as "manager_name", s.salary

from dept_manager as dm

join employees as e using(emp_no)

join salaries as s using(emp_no)

join departments as d using(dept_no)

where (dm.to_date = "9999_01_01") and (s.to_date = "9999_01_01")

order by dept_name;
-- 43.	Find the number of current employees in each department.

select d.dept_no, d.dept_name, count(*)

from employees as e

join dept_emp as de using(emp_no)

join departments as d using(dept_no)

join salaries as s using(emp_no)

where (s.to_date = "9999_01_01") and (de.to_date = "9999_01_01")

group by d.dept_name

order by d.dept_no asc;


-- 57.	Which department has the highest average salary? Hint: Use current not historic information.
select dept_name, avg(salary) as "highest_salary"

from salaries as s

join employees as e using(emp_no)

join dept_emp as de using(emp_no)

join departments as d using(dept_no)

where (s.to_date = "9999_01_01") and (de.to_date = "9999_01_01")

group by dept_name

order by avg(salary) desc

limit 1;

-- 63.	Who is the highest paid employee in the Marketing department?
select concat(first_name, " ", last_name) as "highest_paid_employee", salary

from dept_emp as de 

join employees using(emp_no)

join salaries as s using(emp_no)

join departments as d using(dept_no)

where (s.to_date = "9999_01_01") and (de.to_date = "9999_01_01") and (d.dept_name = "Marketing")

order by salary desc

limit 1;

-- 69.	Which current department manager has the highest salary?
select first_name, last_name, salary, dept_name

from dept_manager as dm

join employees using(emp_no)

join salaries as s using(emp_no)

join dept_emp as de using(emp_no)

join departments as d on de.dept_no = d.dept_no

where (s.to_date = "9999_01_01") and (de.to_date = "9999_01_01") and (dm.to_date = "9999_01_01");

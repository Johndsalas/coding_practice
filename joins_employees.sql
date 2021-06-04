
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
-- 57.	Which department has the highest average salary? Hint: Use current not historic information.
-- 63.	Who is the highest paid employee in the Marketing department?
-- 69.	Which current department manager has the highest salary?
-- 75.	Bonus Find the names of all current employees, their department name, and their current manager's name.
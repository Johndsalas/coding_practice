-- Create a file named subqueries_exercises.sql and craft queries to return the results for the following criteria:
-- 1.	Find all the current employees with the same hire date as employee 101010 using a sub-query.
select concat(e.first_name, " ", e.last_name) as "employee_name", hire_date

from employees as e

join salaries as s using(emp_no)
join dept_emp as de using(emp_no)

where hire_date in (select hire_date
					from employees
				  where emp_no = "101010")
				  
and (de.to_date = "9999-01-01") and (s.to_date = "9999-01-01");
-- 2.	Find all the titles ever held by all current employees with the first name Aamod.
select distinct t.title

from titles as t

join salaries as s using(emp_no)

where title in (select title 		     
				from employees 				
			  join titles using(emp_no)
			  where first_name = "Aamod")
			  
and (s.to_date = "9999-01-01");
			  
-- 3.	How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
select count(emp_no) as "attrition"
from employees
where emp_no in (select distinct emp_no 
					from employees
				  join salaries as s using(emp_no)
				   join dept_emp as de using(emp_no)
				   where (s.to_date != "9999-01-01"));
-- 4.	Find all the current department managers that are female. List their names in a comment in your code.
select dept_name, concat(e.first_name, " ", e.last_name) as "female_department_managers"

from departments 
 -- 5.	Find all the employees who currently have a higher salary than the companies overall, historical average salary.
-- 6.	How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?
-- BONUS
-- 1.	Find all the department names that currently have female managers.
-- 2.	Find the first and last name of the employee with the highest salary.
-- 3.	Find the department name that the employee with the highest salary works in.

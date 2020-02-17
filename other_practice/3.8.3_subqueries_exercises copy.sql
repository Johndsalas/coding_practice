-- Find all the employees with the same hire date as employee 101010 using a sub-query.

select concat(first_name, ' ', last_name) as "Full Name"

from employees as e

where hire_date in (select hire_date
					from employees
					where emp_no = 101010);



-- Find all the titles held by all employees with the first name Aamod.

select title as "Title"

from titles

where emp_no in (select emp_no
					 from employees
					 where first_name = "Aamod");

-- How many people in the employees table are no longer working for the company?
select * from dept_emp;

select count(emp_no)

from employees

where emp_no not in (	select emp_no
		  				from dept_emp
		  				where to_date = '9999-01-01');


-- Find all the current department managers that are female.

select first_name as "First Name", last_name as "Last Name"

from employees

where gender = "F" and emp_no in( 	select emp_no
									from dept_manager
								  	where to_date > now() );
-- Find all the employees that currently have a higher than average salary

select e.first_name as "First Name", e.last_name as "Last Name", s.salary as "Salary", avgs.avg_sal as "Average Salary"

from employees e

join salaries s
on e.emp_no = s.emp_no

join (select avg(salary) as avg_sal from salaries) as avgs
				
where salary > avg_sal and s.to_date > now();			
				
-- How many current salaries are within 1 standard deviation of the highest salary?

SELECT COUNT(*)

FROM salaries

WHERE to_date > NOW() AND salary > (SELECT MAX(salary) - STDDEV(salary) 
									FROM salaries);

-- BONUS

-- Find all the department names that currently have female managers.

select dept_name

from departments

where dept_no in (	select dept_no 
					from dept_manager
					where emp_no in (select emp_no
									 from employees
									 where gender = "F")
				);

-- Find the first and last name of the employee with the highest salary.

select first_name, last_name

from employees

where emp_no in(
				select emp_no
				from salaries
				where salary in( 
								select max(salary) 
								from salaries
								where to_date > now()
								)
				);


-- Find the department name that the employee with the highest salary works in.

select dept_name

from departments

where dept_no in(
				select dept_no
				from dept_emp
				where emp_no in(
								select emp_no
								from employees
								where emp_no in(
												select emp_no
												from salaries
												where salary in( 
																select max(salary) 
																from salaries
																where to_date > now()
															   )
												)
								)
				);
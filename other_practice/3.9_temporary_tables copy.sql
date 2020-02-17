-- Using the example from the lesson, re-create the employees_with_departments table.

CREATE TEMPORARY TABLE employees_with_departments AS
SELECT emp_no, first_name, last_name, dept_no, dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
LIMIT 100;

select * from employees_with_departments;


-- Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns

ALTER TABLE employees_with_departments ADD full_name VARCHAR(30);

-- Update the table so that full name column contains the correct data

UPDATE employees_with_departments
SET full_name = CONCAT(first_name, last_name);

-- Remove the first_name and last_name columns from the table.

ALTER TABLE employees_with_departments DROP COLUMN first_name;
ALTER TABLE employees_with_departments DROP COLUMN last_name;

-- What is another way you could have ended up with this same table?

CREATE TEMPORARY TABLE employees_with_departments_again AS
SELECT emp_no, dept_no, dept_name, concat(first_name, ' ', last_name) as full_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
LIMIT 100;

select * from employees_with_departments_again;

-- Create a temporary table based on the payment table from the sakila database.

CREATE TEMPORARY TABLE sakila_payment AS
SELECT *
FROM sakila.payment;

select * from sakila_payment;
-- Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.

alter table sakila_payment add cent_amount int unsigned;

update sakila_payment
set cent_amount = amount * 100;

select * from sakila_payment;

-- Find out how the average pay in each department compares to the overall average pay. In order to make the comparison easier, you should use the Z-score for salaries. In terms of salary, what is the best department to work for? The worst?

use employees;

SELECT a.dept_name, AVG(a.salary_z_score)

FROM(
		SELECT d.dept_name, (s.salary-a.average_salary)/(a.salary_stdev) AS salary_z_score
		FROM dept_emp AS de
		
		JOIN departments AS d 
		ON (de.dept_no=d.dept_no) AND de.to_date='9999-01-01'

		JOIN salaries as s 
		ON (de.emp_no=s.emp_no) AND s.to_date='9999-01-01'

		JOIN (
				SELECT d.dept_name, AVG(s.salary) AS average_salary, STDDEV(s.salary) AS salary_stdev
		
				FROM departments as d
		
				JOIN dept_emp AS de 
				ON (d.dept_no=de.dept_no)

				JOIN employees AS e 
				ON (de.emp_no=e.emp_no)

				JOIN salaries AS s 
				ON (e.emp_no=s.emp_no)

				WHERE de.to_date='9999-01-01' AND s.to_date='9999-01-01'

				GROUP BY d.dept_name
				
			  ) AS a 
				ON (a.dept_name=d.dept_name)
		
	) AS a

GROUP BY a.dept_name;

























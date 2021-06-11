
drop temporary table bayes_828.employees_with_departments;
-- 1.	Using the example from the lesson, create a temporary table called employees_with_departments that contains first_name, last_name, and dept_name for employees currently with that department.

use employees;
CREATE TEMPORARY TABLE bayes_828.employees_with_departments AS
SELECT first_name, last_name, dept_name
FROM employees
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
LIMIT 100;

select * from bayes_828.employees_with_departments;
-- a.	Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns

ALTER TABLE bayes_828.employees_with_departments add full_name varchar(30);

-- b.	Update the table so that full name column contains the correct data

update bayes_828.employees_with_departments
set full_name = concat(first_name, ' ', last_name);

-- c.	Remove the first_name and last_name columns from the table.

alter table bayes_828.employees_with_departments 
drop column first_name;

alter table bayes_828.employees_with_departments 
drop column last_name;
-- d.	What is another way you could have ended up with this same table?
-- 2.	Create a temporary table based on the payment table from the sakila database.
-- Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.
-- 3.	Find out how the current average pay in each department compares to the overall, historical average pay. In order to make the comparison easier, you should use the Z-score for salaries. In terms of salary, what is the best department right now to work for? The worst?

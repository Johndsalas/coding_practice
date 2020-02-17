#Update your queries for employees whose names start and end with 'E'. Use concat() to combine their first and last name together as a single column named full_name.

SELECT concat(first_name, ' ', last_name)
FROM employees
WHERE first_name in ('Irena', 'Vidya', 'Maya')
ORDER BY first_name DESC;


#Convert the names produced in your last query to all uppercase.

SELECT UPPER(concat(first_name, ' ', last_name))
FROM employees
WHERE first_name in ('Irena', 'Vidya', 'Maya')
ORDER BY first_name DESC;

#For your query of employees born on Christmas and hired in the 90s, use datediff() to find how many days they have been working at the company (Hint: You will also need to use NOW() or CURDATE())

SELECT first_name, last_name, DATEDIFF(NOW(),hire_date)/365 as years
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
AND hire_date LIKE '%-12-25';

#Find the smallest and largest salary from the salaries table.

SELECT MAX(salary) as 'Max Salary', MIN(salary) as 'Min Salary', MAX(salary)-MIN(salary) as 'Salary Range'
FROM salaries;


#Use your knowledge of built in SQL functions to generate a username for all of the employees. A username should be all lowercase, and consist of the first character of the employees first name, the first 4 characters of the employees last name, an underscore, the month the employee was born, and the last two digits of the year that they were born. Below is an example of what the first 10 rows will look like:

SELECT first_name, last_name, birth_date, LOWER(
												concat(
														SUBSTR(first_name,1,1),SUBSTR(last_name,1,4),'_',SUBSTR(birth_date,6,2),SUBSTR(birth_date,3,2)
												       )
											    )
FROM employees;
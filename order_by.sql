





-- 1.	Copy the order by exercise and save it as functions_exercises.sql.
-- 2.	Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
select * from employees where first_name in ('Irena', 'Vidya', 'Maya');
-- 3.	Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
select * from employees where first_name in ('Irena', 'Vidya', 'Maya') order by first_name, last_name;
-- 4.	Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
select * from employees where first_name in ('Irena', 'Vidya', 'Maya') order by last_name, first_name;
-- 5.	Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.
select * from employees where last_name like "%e" order by emp_no;
-- 6.	Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest emmployee.
select * from employees where last_name like "E%" order by hire_date asc;
-- 7.	Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest emmployee who was hired first.
select * from employees where (hire_date between "1990-01-01" and "1999-12-31") and (birth_date like "%-12-25") order by hire_date desc;

-- 2.	Write a query to to find all employees whose last name starts and ends with 'E'. Use concat() to combine their first and last name together as a single column named full_name.
select concat(first_name, ' ', last_name) as full_name from employees where last_name like "E%" order by hire_date asc;
-- 3.	Convert the names produced in your last query to all uppercase.
select upper(concat(first_name, ' ', last_name)) as full_name from employees where last_name like "E%" order by hire_date asc;
-- 4.	Find all employees hired in the 90s and born on Christmas. Use datediff() function to find how many days they have been working at the company (Hint: You will also need to use NOW() or CURDATE()),
select datediff(curdate(),hire_date) as "days_worked"
from employees 
where (hire_date between "1990-01-01" and "1999-12-31") and (birth_date like "%-12-25") 
order by hire_date desc;
-- 5.	Find the smallest and largest current salary from the salaries table.
select max(salary) as "Largest", min(salary) as "Smallest" from salaries;
-- 6.	Use your knowledge of built in SQL functions to generate a username for all of the employees. A username should be all lowercase, and consist of the first character of the employees first name, the first 4 characters of the employees last name, an underscore, the month the employee was born, and the last two digits of the year that they were born. Below is an example of what the first 10 rows will look like:

select first_name, last_name, birth_date, lower(concat(substring(first_name,1,1),
															         substring(last_name,1,4),
												             "_",
												               substring(birth_date,6,2),
												               substring(birth_date,3,2))) as user_name
from employees;				
											
																								
																	
									
																
																
																
																
																
																
																
																
																
																
																
																
																
																


-- 2.	Write a query to to find all employees whose last name starts and ends with 'E'. Use concat() to combine their first and last name together as a single column named full_name.

select concat(first_name, ' ', last_name) as full_name 

from employees 

where (last_name like "E%") and (last_name like "%e") 

order by hire_date asc;

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
							
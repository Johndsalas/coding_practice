-- 1.	Create a new file named group_by_exercises.sql
-- 2.	In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? Answer that in a comment in your SQL file.
select distinct title from titles;
-- 3.	Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.
select last_name from employees 
where (last_name like "E%") and (last_name like "%e")
group by last_name;
-- 4.	Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.
select first_name, last_name
from employees
where (last_name like "E%") and (last_name like "%e")
group by first_name, last_name;
-- 5.	Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.
select last_name
from employees
where (last_name like "%q%" or "%Q%") and (last_name not like "%qu%" or "%Qu%")
group by last_name;
-- 6.	Add a COUNT() to your results (the query above) to find the number of employees with the same last name.
select last_name, count(last_name)
from employees
where (last_name like "%q%" or "%Q%") and (last_name not like "%qu%" or "%Qu%")
group by last_name;
-- 7.	Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.
select first_name, gender, count(first_name) as "names_per_gender"
from employees
where first_name in ('Irena', 'Vidya', 'Maya')
group by first_name, gender;
-- 8.	Using your query that generates a username for all of the employees, generate a count employees for each unique username. Are there any duplicate usernames? BONUS: How many duplicate usernames are there?
select lower(concat(substring(first_name,1,1),
							  substring(last_name,1,4),
		                "_",
		                substring(birth_date,6,2),
		                substring(birth_date,3,2))) as user_name, count(*) as dupes
from employees
group by user_name;		



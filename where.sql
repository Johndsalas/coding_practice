

-- 1.	Create a file named where_exercises.sql. Make sure to use the employees database.

use employees;

-- 2.	Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned.

select * from employees where first_name in ('Irena', 'Vidya', 'Maya');

-- 3.	Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2?

select * from employees where first_name = 'Irena' or 'Vidya' or 'Maya';

-- 4.	Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned.

select * from employees where (first_name = 'Irena' or 'Vidya' or 'Maya') and (gender = "M");

-- 5.	Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E.

select * from e where last_name like "E%";

-- 6.	Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with 

select * from employees where (last_name like "E%") or (last_name like "%e");

-- E. How many employees have a last name that ends with E, but does not start with E?

select * from employees where (last_name not like "E%") and (last_name like "%e");

-- 7.	Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E.

select * from employees where (last_name like "E%") and (last_name like "%e");

--  How many employees' last names end with E, regardless of whether they start with E?

select * from employees where (last_name like "%e");

-- 8.	Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.

select * from employees where hire_date between "1990-01-01" and "1999-12-31";

-- 9.	Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.

select * from employees where birth_date like "%-12-25";

-- 10.	Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.

select * from employees where (hire_date between "1990-01-01" and "1999-12-31") and (birth_date like "%-12-25");

-- 11.	Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned.

select * from employees where last_name like "%q%" or "%Q%";

-- 12.	Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found?

select * from employees where (last_name like "%q%" or "%Q%") and (last_name like "%qu%" or "%Qu%");



















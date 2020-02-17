-- Use the join_example_db. Select all the records from both the users and roles tables.

describe roles;
describe users;

SELECT *
FROM roles as r
JOIN users as s
ON r.id = s.id;

-- Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.

SELECT *
FROM roles as r
left JOIN users as s
ON r.id = s.id;

SELECT *
FROM roles as r
right JOIN users as s
ON r.id = s.id;

-- Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of roles along with the number of users that has the role. Hint: You will also need to use group by in the query.

SELECT distinct role_id , count(role_id)
FROM roles as r
JOIN users as s
ON r.id = s.id
group by role_id;

-- Use the employees database.

use employees;

-- Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.

describe current_dept_emp;
describe departments;
describe dept_emp;
describe dept_emp_latest_date;
describe dept_manager;
describe employees;
describe titles;
describe salaries;

select distinct title from titles;

SELECT dept_name as Dertment_Name, concat(first_name, ' ', last_name) as Manager_Name

FROM departments as d

JOIN dept_manager as dm
ON d.dept_no = dm.dept_no

JOIN titles as t
ON dm.emp_no = t.emp_no

JOIN employees as e
ON e.emp_no = t.emp_no

WHERE t.title = 'Manager' and dm.to_date > now()

ORDER BY d.dept_name asc;

-- Find the name of all departments currently managed by women.

select gender from employees;

SELECT dept_name as Dertment_Name, concat(first_name, ' ', last_name) as Manager_Name

FROM departments as d

JOIN dept_manager as dm
ON d.dept_no = dm.dept_no

JOIN titles as t
ON dm.emp_no = t.emp_no

JOIN employees as e
ON e.emp_no = t.emp_no

WHERE t.title = 'Manager' and dm.to_date > now() and e.gender = "F"

ORDER BY d.dept_name asc;



-- Find the current titles of employees currently working in the Customer Service department.

SELECT distinct title as Title, count(*) as Count

FROM departments as d

JOIN dept_emp as de
ON d.dept_no = de.dept_no

JOIN titles as t
ON de.emp_no = t.emp_no

JOIN employees as e
ON e.emp_no = t.emp_no

WHERE dept_name = "Customer Service" and de.to_date > now() and t.to_date > now()

GROUP BY t.title asc;

-- Find the current salary of all current managers.

SELECT dept_name as Dertment_Name, concat(first_name, ' ', last_name) as 'Name', salary as Salary

FROM departments as d

JOIN dept_manager as dm
ON d.dept_no = dm.dept_no

JOIN titles as t
ON dm.emp_no = t.emp_no

JOIN employees as e
ON e.emp_no = t.emp_no

JOIN salaries as s
ON s.emp_no = t.emp_no

WHERE t.title = 'Manager' and dm.to_date > now() and s.to_date > now()

ORDER BY d.dept_name asc;

-- Find the number of employees in each department.

SELECT d.dept_no, d.dept_name, count(*) as num_employees

FROM departments as d

JOIN dept_emp as de
ON d.dept_no = de.dept_no

WHERE de.to_date > now()

GROUP BY d.dept_no asc;

-- Which department has the highest average salary?

SELECT distinct dept_name, avg(salary) as ave_salary

FROM departments as d

JOIN current_dept_emp as cde
ON d.dept_no = cde.dept_no

JOIN salaries as s
ON cde.emp_no = s.emp_no

WHERE s.to_date > now() and cde.to_date > now()

GROUP BY dept_name
ORDER BY ave_salary desc
LIMIT 1;

-- Who is the highest paid employee in the Marketing department?

SELECT first_name, last_name

FROM departments as d

JOIN current_dept_emp as cde
ON d.dept_no = cde.dept_no

JOIN salaries as s
ON cde.emp_no = s.emp_no

join employees as e
on e.emp_no = s.emp_no

WHERE s.to_date > now() and cde.to_date > now() and dept_name = 'Marketing '

ORDER BY salary desc
LIMIT 1;

-- Which current department manager has the highest salary?

SELECT first_name, last_name, salary, dept_name

FROM departments as d

JOIN current_dept_emp as cde
ON d.dept_no = cde.dept_no

JOIN salaries as s
ON cde.emp_no = s.emp_no

join employees as e
on e.emp_no = s.emp_no

join dept_manager as dm
on dm.emp_no = s.emp_no

WHERE s.to_date > now() and cde.to_date > now() and dm.to_date > now() and dept_name = 'Marketing '

ORDER BY salary desc
LIMIT 1;


-- Bonus Find the names of all current employees, their department name, and their current manager's name.

use employees;

select concat(e.first_name, ' ', e.last_name) as employee_name, mn.dept_name as department_name, mn.dept_mgr as department_manager

from employees as e

join current_dept_emp as cde
on e.emp_no = cde.emp_no
and cde.to_date > now()

join departments as d
on d.dept_no = cde.dept_no

join (	select concat(e.first_name, ' ', e.last_name) as dept_mgr, d.dept_no, d.dept_name
	  	from employees as e
		join dept_manager dm
		on  e.emp_no = dm.emp_no
		and dm.to_date > now()

		join departments as d
		on dm.dept_no = d.dept_no
									) as mn

on d.dept_no = mn.dept_no

order by e.last_name, e.first_name;


-- Bonus Find the highest paid employee in each department.

SELECT e.first_name, e.last_name, d.dept_name, max_sal.max_salary

FROM employees AS e

JOIN dept_emp AS de 
ON (e.emp_no=de.emp_no)

JOIN departments AS d 
ON(d.dept_no=de.dept_no)

JOIN salaries AS s 
ON (s.emp_no=e.emp_no) AND s.to_date='9999-01-01'

JOIN(
	
	SELECT d.dept_name, MAX(s.salary) as max_salary
	FROM departments as d
	
	JOIN dept_emp AS de 
	ON (d.dept_no=de.dept_no)
	
	JOIN employees AS e 
	ON (de.emp_no=e.emp_no)

	JOIN salaries AS s 
	ON (e.emp_no=s.emp_no)
	
	WHERE de.to_date='9999-01-01' AND s.to_date='9999-01-01'
	
	GROUP BY d.dept_name
	
	) AS max_sal 
ON max_sal.dept_name=d.dept_name AND max_sal.max_salary=s.salary
	
	
	
WHERE de.to_date='9999-01-01' AND s.to_date='9999-01-01';









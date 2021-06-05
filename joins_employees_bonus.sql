-- 75.	Bonus Find the names of all current employees, their department name, and their current manager's name.

select concat(e1.first_name, " ", e1.last_name) as "Employee Name", d.dept_name as "Department Name", concat(e2.first_name, " ", e2.last_name) as "Manager Name"

from employees as e1

join dept_emp as de using(emp_no)

join salaries as s using(emp_no)

join departments as d using (dept_no)

join dept_manager as dm using (dept_no)

join employees as e2 on dm.emp_no = e2.emp_no

where (de.to_date = "9999-01-01") and (dm.to_date = "9999-01-01") and (s.to_date = "9999-01-01");

-- Bonus Who is the highest paid employee within each department.

select concat(e.first_name, " ", e.last_name) as "highest_paid_employee", d.dept_name, s.salary

from employees as e

join dept_emp as de using(emp_no)

join departments as d using (dept_no)

join salaries as s using(emp_no)

right join (select d1.dept_name, max(salary) as "salary"

			from salaries as s1
			
			join employees as e1 using(emp_no)
			
			join dept_emp as de1 using(emp_no)
			
			join departments as d1 using(dept_no) 
			
			where (s1.to_date = "9999-01-01") and (de1.to_date = "9999-01-01")
		
		   group by dept_name) as dt using(dept_name,salary);


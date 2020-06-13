--Salary by employee
SELECT emp.emp_no,
	emp.last_name,
	emp.first_name,
	emp.gender,
	sal.salary
FROM employees AS emp INNER JOIN salaries AS sal
ON emp.emp_no= sal.emp_no;

--Employees hired in 1986
SELECT first_name,
	last_name,
	EXTRACT (YEAR FROM hire_date) As YEAR
FROM employees
WHERE hire_date > '12/31/1985'
AND hire_date < '01/01/1987';

--Manager of each department
SELECT dm.dept_no,
	dp.dept_name,
	emp.emp_no,
	emp.last_name,
	emp.first_name,
	dm.from_date,
	dm.to_date
FROM dept_manager AS dm JOIN employees AS emp
ON dm.emp_no= emp.emp_no
JOIN departments AS dp ON dp.dept_no= dm.dept_no;

--Department of each employee
SELECT emp.emp_no,
	emp.last_name,
	emp.first_name,
	dp.dept_name
FROM employees AS emp JOIN dept_emp AS de
ON emp.emp_no= de.emp_no
JOIN departments AS dp
ON dp.dept_no= de.dept_no;

--Employees whose first name is "Hercules" and last name begins with "B"
SELECT first_name,
	last_name
FROM employees
WHERE first_name= 'Hercules' 
AND last_name like 'B%';

--Employees in Sales department
SELECT emp.emp_no,
	emp.last_name,
	emp.first_name,
	dp.dept_name
FROM employees AS emp JOIN dept_emp AS de
ON emp.emp_no= de.emp_no
JOIN departments as dp
ON dp.dept_no= de.dept_no
WHERE dp.dept_name= 'Sales';

--Employees in the Sales and Development departments
SELECT emp.emp_no,
	emp.last_name,
	emp.first_name,
	dp.dept_name
FROM employees AS emp JOIN dept_emp AS de
ON emp.emp_no= de.emp_no
JOIN departments as dp
ON dp.dept_no= de.dept_no
WHERE dp.dept_name= 'Sales' OR dp.dept_name= 'Development';

--The frequency of employee last names
SELECT last_name,
	COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name);
-- Data Analysis

-- 1. List the employee number, last name, first name, sex, and salary of each employee.

SELECT e.emp_no, 
	e.last_name, 
	e.first_name, 
	e.sex, 
	s.salary
	
FROM employees as e
JOIN salaries as s ON 
e.emp_no = s.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT e.first_name,
	e.last_name,
	e.hire_date
	
FROM employees as e
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31'

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT dm.dept_no,
	dep.dept_name,
	e.emp_no,
	e.last_name,
	e.first_name
	
FROM dept_manager as dm
	
JOIN departments as dep ON
dm.dept_no = dep.dept_no
	
JOIN employees as e ON
dm.emp_no = e.emp_no;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT e.emp_no,
	e.last_name,
	e.first_name,
	dep.dept_name
	
From employees as e
	
JOIN dept_emp ON
dept_emp.emp_no = e.emp_no

JOIN departments as dep ON
dept_emp.dept_no = dep.dept_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name,
	last_name,
	sex

FROM employees
WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.

SELECT dep.dept_name, 
	e.emp_no, 
	e.last_name, 
	e.first_name

FROM employees as e
	
JOIN dept_emp ON 
dept_emp.emp_no = e.emp_no

JOIN departments as dep ON
dept_emp.dept_no = dep.dept_no
	
WHERE dept_name = 'Sales';

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT dep.dept_name,
	e.emp_no,
	e.last_name,
	e.first_name

FROM employees as e

JOIN dept_emp ON
dept_emp.emp_no = e.emp_no

JOIN departments as dep ON
dept_emp.dept_no = dep.dept_no

WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
-- group the last names by their frequency (descending from frequency not last name)

SELECT last_name, COUNT(last_name) as "last_name_count"

FROM employees

GROUP BY last_name
ORDER BY "last_name_count" DESC;
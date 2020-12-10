--list the employee details.
SELECT employees.emp_no, 
employees.last_name,
employees.first_name,
employees.gender,
salaries.salary
FROM employees
LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no
ORDER BY emp_no;

--list employees who were hired in 1986.
SELECT * FROM employees
WHERE DATE_PART('year',hire_date) = 1986
ORDER BY emp_no;

--list the manager of each department with details.
SELECT dept_manager.dept_no, 
departments.dept_name,
dept_manager.emp_no,
employees.last_name, 
employees.first_name
FROM dept_manager
LEFT JOIN departments
ON dept_manager.dept_no = departments.dept_no
LEFT JOIN employees 
ON dept_manager.emp_no = employees.emp_no
ORDER BY emp_no;

--list the department of each employee with details.
SELECT
employees.emp_no,
employees.last_name,
employees.first_name,
dept_emp.dept_no,
departments.dept_name
FROM employees 
INNER JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON departments.dept_no=dept_emp.dept_no
order by emp_no;

--list all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%';

-- list all employees in the Sales department with details.
SELECT 
employees.emp_no, 
employees.last_name, 
employees.first_name,
dept_emp.dept_no
FROM employees 
LEFT JOIN dept_emp 
ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments 
ON departments.dept_no=dept_emp.dept_no
WHERE departments.dept_name='Sales';

--list all employees in the Sales and Development departments with details
SELECT 
employees.emp_no, 
employees.last_name, 
employees.first_name,
dept_emp.dept_no
FROM employees 
LEFT JOIN dept_emp 
ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments 
ON departments.dept_no=dept_emp.dept_no
WHERE departments.dept_name in ('Sales', 'Development');

--list the frequency count of employee last names > DESC
SELECT last_name, COUNT(*) AS freq_count
FROM employees
GROUP BY last_name
ORDER BY freq_count DESC;
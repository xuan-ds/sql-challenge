-- Data Analysis

-- 1.List the employee number, last name, first name, sex, and salary of each employee.
SELECT employee.emp_no,
		employee.first_name,
		employee.last_name,
		employee.sex,
		salary.salary
FROM employee 
INNER JOIN salary on 
employee.emp_no = salary.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT emp_no, last_name, first_name, hire_date 
FROM employee
WHERE EXTRACT(year FROM hire_date) = 1986;

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT department.dept_no,
		department.dept_name,
		dept_manager.emp_no,
		employee.first_name,
		employee.last_name
FROM dept_manager 
INNER JOIN department on 
dept_manager.dept_no = department.dept_no
INNER JOIN employee on
dept_manager.emp_no = employee.emp_no;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT dept_emp.emp_no,
		employee.first_name,
		employee.last_name,
		dept_emp.dept_no,
		department.dept_name
FROM dept_emp 
INNER JOIN department on 
dept_emp.dept_no = department.dept_no
INNER JOIN employee on
dept_emp.emp_no = employee.emp_no
ORDER BY emp_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employee
WHERE employee.first_name = 'Hercules' AND employee.last_name like 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT department.dept_name, 
		dept_emp.emp_no, 
		employee.first_name, 
		employee.last_name
		department
FROM department
INNER JOIN dept_emp ON
department.dept_no=dept_emp.dept_no
INNER JOIN employee ON
dept_emp.emp_no=employee.emp_no
WHERE department.dept_name = 'Sales'
ORDER BY emp_no;

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT department.dept_name, 
		dept_emp.emp_no, 
		employee.first_name, 
		employee.last_name
FROM department
INNER JOIN dept_emp ON
department.dept_no=dept_emp.dept_no
INNER JOIN employee ON
dept_emp.emp_no=employee.emp_no
WHERE department.dept_name = 'Sales' or department.dept_name = 'Development'
ORDER BY dept_name, emp_no;

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(last_name) AS frequency 
FROM employee
GROUP BY last_name
ORDER BY frequency DESC;

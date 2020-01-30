--Query all employees number, first and last name, gender, and salary
SELECT e.emp_no, e.first_name,e.last_name,e.gender, s.salary 
FROM employees AS e
LEFT JOIN salaries AS s
ON s.emp_no=e.emp_no;

--Query all employees hired in 1986
ALTER TABLE employees ALTER COLUMN hire_date TYPE DATE USING hire_date::DATE;
SELECT * FROM employees
WHERE hire_date BETWEEN '1985-12-31' and '1987-1-1';

--Query managers emp_no, name, start and end employment dates, dept_no and department name
SELECT  e.emp_no, e.first_name,e.last_name, m.from_date, m.to_date,m.dept_no, d.dept_name 
FROM employees AS e
INNER JOIN dept_manager AS m
ON m.emp_no=e.emp_no
INNER JOIN departments AS d
ON d.dept_no=m.dept_no
;

--Query employees number, name and department name
SELECT e.emp_no, e.first_name,e.last_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp as de
ON de.emp_no=e.emp_no
INNER JOIN departments AS d
ON d.dept_no=de.dept_no;

--Query all employees that have the first name Hercules and last name starts with a B
SELECT * FROM employees
WHERE  first_name='Hercules' AND POSITION('B' in last_name)=1;

--Query employees number and name in Sales department
SELECT e.emp_no, e.first_name,e.last_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp as de
ON de.emp_no=e.emp_no
INNER JOIN departments AS d
ON d.dept_no=de.dept_no
WHERE d.dept_name='Sales';

--Query employees number and name in Sales and Development department
SELECT e.emp_no, e.first_name,e.last_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp as de
ON de.emp_no=e.emp_no
INNER JOIN departments AS d
ON d.dept_no=de.dept_no
WHERE d.dept_name='Sales' OR d.dept_name='Development';

--Query employees that share last name and order the count by descending values
SELECT last_name,COUNT(last_name) AS "count"
FROM employees
GROUP BY last_name
ORDER BY "count" DESC;
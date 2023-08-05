/*
--DELETE SCHEMA
DROP TABLE department;
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE salaries;
DROP TABLE employees;
DROP TABLE titles;



--INITIATE SCHEMA
CREATE TABLE titles (
						title_id VARCHAR(5) NOT NULL PRIMARY KEY,
						title VARCHAR(100) NOT NULL
						);
CREATE TABLE employees (
						emp_no INT NOT NULL PRIMARY KEY,
						emp_title VARCHAR(5) NOT NULL,
						FOREIGN KEY (emp_title) REFERENCES titles(title_id),
						birth_date VARCHAR(10) NOT NULL,
						first_name VARCHAR(100) NOT NULL,
						last_name VARCHAR(100) NOT NULL,
						sex VARCHAR(1) NOT NULL,
						hire_date VARCHAR(10) NOT NULL
						);
CREATE TABLE dept_emp (
						emp_no INT NOT NULL,
						FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
						dept_no VARCHAR(4) NOT NULL
						);
CREATE TABLE dept_manager (
						dept_no VARCHAR(4) NOT NULL,
						emp_no INT NOT NULL,
						FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
						);
CREATE TABLE salaries (
						emp_no INT NOT NULL,
						FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
						salary INT NOT NULL
						);
CREATE TABLE department (
						dept_no VARCHAR(4) NOT NULL,
						dept_name VARCHAR(100) NOT NULL
						)
						
*/
/*
CREATE VIEW all_data AS
SELECT titles.title_id, titles.title,
		employees.emp_no,employees.birth_date,employees.first_name,employees.last_name,employees.sex,employees.hire_date,
		salaries.salary,
		department.dept_name,
		dept_emp.emp_no AS employee_number,
		dept_manager.emp_no AS manager_number
FROM titles
	INNER JOIN employees ON titles.title_id=employees.emp_title
	INNER JOIN salaries ON employees.emp_no=salaries.emp_no
	INNER JOIN dept_emp ON dept_emp.emp_no=employees.emp_no
	INNER JOIN department ON department.dept_no=dept_emp.dept_no
	INNER JOIN dept_manager ON dept_manager.dept_no=department.dept_no
*/
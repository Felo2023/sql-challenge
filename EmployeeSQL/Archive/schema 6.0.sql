/*
--DELETE SCHEMA
IF EXISTS department DROP TABLE department;
IF EXISTS dept_emp DROP TABLE dept_emp;
IF EXISTS dept_manager DROP TABLE dept_manager;
ID EXISTS salaries DROP TABLE salaries;
IF EXISTS employees DROP TABLE employees;
IF EXISTS titles DROP TABLE titles;


--INITIATE SCHEMA
CREATE TABLE employees (
						emp_no INT NOT NULL PRIMARY KEY,
						emp_title VARCHAR(5) NOT NULL,
						birth_date VARCHAR(10) NOT NULL,
						first_name VARCHAR(100) NOT NULL,
						last_name VARCHAR(100) NOT NULL,
						sex VARCHAR(1) NOT NULL,
						hire_date VARCHAR(10) NOT NULL
						);
CREATE TABLE titles (
						title_id VARCHAR(5) NOT NULL,
						title VARCHAR(100) NOT NULL
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


--DELETE VIEW
DROP VIEW employees_salaries_join ;

--List the employee number, last name, first name, sex, and salary of each employee
CREATE VIEW employees_salaries_join AS
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex,
		salaries.salary
FROM employees
INNER JOIN salaries ON employees.emp_no=salaries.emp_no;

--DISPLAY DATA
SELECT * FROM employees_salaries_join



/*
--DELETE VIEW
IF EXISTS employees_salaries_join DROP VIEW employees_salaries_join ;

--Convert varchar to date
SELECT CONVERT (varchar,employees.hire_date,101)

--List the first name, last name, and hire date for the employees who were hired in 1986.
CREATE VIEW employees_1986 AS
SELECT employees.first_name, employees.last_name,  employees.hire_date,
FROM employees
WHERE employees.hire_date = 1986

--DISPLAY DATA
SELECT * FROM employees_salaries_join

*/
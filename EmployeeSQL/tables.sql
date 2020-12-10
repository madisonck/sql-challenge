DROP table if exists departments;

CREATE table departments (
	dept_no VARCHAR(10) NOT NULL,
	dept_name VARCHAR(10) NOT NULL,
);

SELECT * from departments;

DROP table if exists dept_emp;

CREATE table dept_emp (
	emp_no INT NOT NULL, 
	dept_no VARCHAR(10) NOT NULL,
	CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no","dept_no")
);

SELECT * from dept_emp;

DROP table if exists dept_manager

CREATE table dept_manager (
	dept_no VARCHAR(10) NOT NULL,
	emp_no INT NOT NULL,
	CONSTRAINT "pk_dept_manager" PRIMARY KEY ("emp_no")
);

SELECT * from dept_manager;

DROP table if exists employees

CREATE table employees (
	emp_no INT NOT NULL, 
	emp_title_id VARCHAR(10) NOT NULL,
	birth_date DATE NOT NULL, 
	first_name VARCHAR(10) NOT NULL,
	last_name VARCHAR(10) NOT NULL,
	gender VARCHAR(1) NOT NULL,
	hire_date Date NOT NULL, 
	CONSTRAINT pk_employees PRIMARY KEY (emp_no)

);

SELECT * from employees;

DROP table if exists salaries;

CREATE table salaries (
	emp_no INT NOT NULL, 
	salary INT NOT NULL,
	CONSTRAINT "pk_salaries" PRIMARY KEY ("emp_no")
);

SELECT * from salaries;

DROP table if exists titles;

CREATE table titles (
	title_id VARCHAR NOT NULL,
	title VARCHAR(300) NOT NULL,
	CONSTRAINT "pk_titles" PRIMARY KEY ("title_id")

);

SELECT * from titles



ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");


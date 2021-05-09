CREATE TABLE titles (
  emp_no INT NOT NULL,
  title VARCHAR(40) NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no, from_date, title)	
);

SELECT * FROM titles;

-- Retirement Titles
SELECT em.emp_no,
    em.first_name,
    em.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees as em
LEFT JOIN titles as ti
ON em.emp_no = ti.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

SELECT * FROM retirement_titles;

-- Unique Titles
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles 
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles;

-- Retiring titles
SELECT COUNT (title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;
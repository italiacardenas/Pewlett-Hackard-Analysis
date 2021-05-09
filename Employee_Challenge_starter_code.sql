CREATE TABLE titles (
  emp_no INT NOT NULL,
  title VARCHAR(40) NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL
);

SELECT * FROM titles;

SELECT DISTINCT ON (titles) emp_no,
title,
from_date,
to_date
INTO new_titles
FROM titles
ORDER BY titles, to_date DESC

SELECT * FROM new_titles;


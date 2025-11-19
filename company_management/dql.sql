SELECT current_database();
----------------------------------
-- Find names of all employees currently not working in any projects.
-- (Use joins)

SELECT name
FROM employees e LEFT JOIN assigns a
    ON e.id = a. emp_id AND a.type = 'current'
WHERE emp_id IS NULL;

--------------------------------------
-- Find all employees who have exposure to HTML, Javascript and IOS.

SELECT e.id, e.name
FROM (assigns a JOIN technologies t
    ON a.project_id = t.project_id
    AND t.name IN ('HTML', 'JavaScript', 'IOS')) x
    JOIN employees e
    ON e.id = x.emp_id
GROUP BY e.id, e.name
HAVING COUNT(DISTINCT(x.name)) = 3;

-------------------------------------------------
--  Find the technologies in which a particular employee(Say B) has expertise(3 or more projects)
-- userB let's say

SELECT t.name
FROM employees e JOIN assigns a
    ON e.id = a.emp_id
    JOIN technologies t
    ON t.project_id = a.project_id
WHERE e.name = 'userA'
GROUP BY t.name
HAVING COUNT(a.project_id) >= 3;

------------------------------------------
-- Find the employee who has done most no of projects in android
-- (do this using variable also).

-- without variable

WITH tb1 AS (
    SELECT a.emp_id, COUNT(a.id) AS c
    FROM
    technologies t JOIN assigns a
    ON t.project_id = a.project_id
WHERE t.name = 'Android'
GROUP BY emp_id
)
SELECT emp_id, c
FROM tb1
WHERE c = (SELECT MAX(c) FROM tb1);

-- with variable

-- using variable ( will work on psql cmd line)

-- \set technology_name 'Android'

/*

WITH tb1 AS (
    SELECT a.emp_id, COUNT(a.id) AS c
    FROM
    technologies t JOIN assigns a
    ON t.project_id = a.project_id
WHERE t.name : 'technology_name'
GROUP BY emp_id
)
SELECT emp_id, c
FROM tb1
WHERE c = (SELECT MAX(c) FROM tb1);

*/
----------------------------------------------
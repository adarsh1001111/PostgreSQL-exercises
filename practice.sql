CREATE TABLE a(
    id INT
);
id 1,2,3,4,5

CREATE TABLE b(
    a_id INT REFERENCES a(id)
);

A B

inner join on condition 
A INTERSECTION B

OUTER JOIN 
LEFT OUTER JOIN
on condition

A

right outerjoin 

B

full outer join 
A U B

cross join

Employees
1 Apekshit
2 Adarsh
3 Tanmay
n rows

id employee_id
1 2
2 2
3 2
4 1

SELECT id FROM Employees WHERE name = 'Adarsh';

CREATE INDEX name_index ON Employees(name);
tree x children log n base x

ON

WHERE
group by 
HAVING

EXPLAIN .. query

DROP INDEX IF EXISTS amount_index, salary_index;

-----------------------------------------------------------
--i. Find the employee who gets the highest total commission.

CREATE INDEX amount_index ON commissions(amount);

SELECT employee_id
FROM commissions
WHERE amount = (SELECT MAX(amount) FROM commissions);
------------------------------------------------------------
--ii. Find employee with 4th Highest salary from employee table.

CREATE INDEX salary_index ON employees(salary DESC);
-- this way we can just do index-only scan over salary ordering and we don't need to see heap table.

SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 3;



------------------------------------------------------------
--iii. Find department that is giving highest commission.

WITH tb1 AS (
    SELECT d.id dept_id , MAX(amount) maxm_comission_amount
    FROM employees e JOIN commissions c
        ON e.id = c.employee_id
        JOIN departments d
        ON d.id = e.department_id
    GROUP BY d.id
)

SELECT dept_id  
FROM tb1
WHERE maxm_comission_amount = (SELECT MAX(maxm_comission_amount) FROM tb1);

----------------------------------------------------------------
--iv. Find employees getting commission more than 3000
    --Display Output in following pattern:  
      --Chris Gayle, Rahul Dravid  4000
-- also in my opinion the sample output given is wrong cause Gayle had 9000 total commission coming from commission id 1,4
-- i thought of logic that we should first find the sum total of every employees commission and then
-- filter the total commissions > 3000 and then grouping by total commissions will group the names in that particular commission
-- then we can just do string_agg(on name column of employee) to match the format of the display output.

SELECT string_agg(name, ',') names, total_commission_amount
FROM (
    SELECT e.id, e.name, SUM(amount) total_commission_amount
    FROM employees e JOIN commissions c
        ON e.id = c.employee_id
    GROUP BY e.id, e.name
    HAVING SUM(amount) > 3000
    )
GROUP BY total_commission_amount;

---------------------------------------------------------------
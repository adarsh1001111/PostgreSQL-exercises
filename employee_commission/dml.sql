INSERT INTO departments (name) VALUES
    ('Banking'), ('Insurance'), ('Services')
RETURNING *;

INSERT INTO employees (name, salary, department_id) VALUES
    ('Chris Gayle', 1000000, 1),
    ('Michael Clarke', 800000, 2),
    ('Rahul Dravid', 700000, 1),
    ('Ricky Pointing', 600000, 2),
    ('Albie Morkel', 650000, 2),
    ('Wasim Akram', 750000, 3)
RETURNING *;

INSERT INTO commissions (employee_id, amount) VALUES
    (1, 5000),
    (2, 3000),
    (3, 4000),
    (1, 4000),
    (2, 3000),
    (4, 2000),
    (5, 1000),
    (6, 5000)
RETURNING *;
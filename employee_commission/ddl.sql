DROP TABLE IF EXISTS departments , employees, commissions;

CREATE TABLE departments(
    id SERIAL PRIMARY KEY,
    name text NOT NULL UNIQUE
);

CREATE TABLE employees(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    salary DECIMAL DEFAULT 0.0 CHECK (salary >= 0.0),
    department_id INT REFERENCES departments ON DELETE CASCADE
);

CREATE TABLE commissions(
    id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES employees ON DELETE CASCADE,
    amount DECIMAL DEFAULT 0.0 CHECK (amount >= 0.0)
);
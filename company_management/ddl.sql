/*
DROP DATABASE IF EXISTS company;
CREATE DATABASE company;
*/
/*
Connect to company database
\c company;
*/

DROP TABLE IF EXISTS employees, projects, assigns, technologies;

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name text NOT NULL
);

CREATE TABLE projects (
    id SERIAL PRIMARY KEY,
    name text UNIQUE NOT NULL
);

CREATE TABLE technologies (
    id SERIAL PRIMARY KEY,
    name text NOT NULL,
    project_id INT REFERENCES projects ON DELETE CASCADE,
    UNIQUE(name, project_id)
);

CREATE TABLE assigns (
    id SERIAL PRIMARY KEY,
    emp_id INT REFERENCES employees ON DELETE CASCADE,
    project_id INT REFERENCES projects ON DELETE CASCADE,
    type text CHECK (type IN ('current', 'finished')),
    UNIQUE(emp_id, project_id)
);
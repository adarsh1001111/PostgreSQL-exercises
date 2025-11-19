/*
DROP DATABASE IF EXISTS company;
CREATE DATABASE company;
*/
/*
Connect to company database
\c company;
*/

DROP TABLE IF EXISTS employees, projects, assigns, technologies CASCADE;

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name text NOT NULL
);

CREATE TABLE projects (
    id SERIAL PRIMARY KEY,
    name text UNIQUE NOT NULL
);

CREATE TABLE technologies (
    name text NOT NULL,
    project_id INT REFERENCES projects ON DELETE CASCADE,
    PRIMARY KEY (project_id, name)
);

CREATE TYPE work_status AS ENUM ('completed', 'ongoing');

CREATE TABLE Enrollments (
    id SERIAL PRIMARY KEY,
    emp_id INT REFERENCES Employees(id) ON DELETE CASCADE,
    project_id INT REFERENCES Projects(id) ON DELETE CASCADE,
    status work_status
);
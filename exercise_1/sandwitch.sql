DROP TABLE IF EXISTS TASTES, LOCATIONS, SANDWICHES;

CREATE TABLE TASTES(
    name VARCHAR(10),
    filling VARCHAR(20),
    PRIMARY KEY(name, filling)
);

CREATE TABLE LOCATIONS(
    lname VARCHAR(20) PRIMARY KEY,
    phone NUMERIC,
    address TEXT
);

CREATE TABLE SANDWICHES(
    location VARCHAR(20) REFERENCES LOCATIONS(lname),
    bread VARCHAR(10),
    filling VARCHAR(20),
    price DECIMAL,
    PRIMARY KEY(location, bread, filling)
);

INSERT INTO TASTES VALUES
  ('Brown', 'Turkey'),
  ('Brown', 'Beef'),
  ('Brown', 'Ham'),
  ('Jones', 'Cheese'),
  ('Green', 'Beef'),
  ('Green', 'Turkey'),
  ('Green', 'Cheese');

INSERT INTO LOCATIONS VALUES
  ('Lincoln', 6834523, 'Lincoln Place'),
  ('O''Neill''s', 6742134, 'Pearse St'),
  ('Old Nag', 7678132, 'Dame St'),
  ('Buttery', 7023421, 'College St');

INSERT INTO SANDWICHES VALUES
  ('Lincoln', 'Rye', 'Ham', 1.25),
  ('O''Neill''s', 'White', 'Cheese', 1.20),
  ('O''Neill''s', 'Whole', 'Ham', 1.25),
  ('Old Nag', 'Rye', 'Beef', 1.35),
  ('Buttery', 'White', 'Cheese', 1.00),
  ('O''Neill''s', 'White', 'Turkey', 1.35),
  ('Buttery', 'White', 'Ham', 1.10),
  ('Lincoln', 'Rye', 'Beef', 1.35),
  ('Lincoln', 'White', 'Ham', 1.30),
  ('Old Nag', 'Rye', 'Ham', 1.40);

SELECT location
FROM SANDWICHES
WHERE filling IN (
  SELECT filling
  FROM Tastes
  WHERE name = 'Jones'
);

SELECT location
FROM TASTES NATURAL JOIN SANDWICHES
WHERE name = 'Jones';

SELECT location,COUNT(DISTINCT name)
FROM (TASTES NATURAL JOIN SANDWICHES)
GROUP BY location;

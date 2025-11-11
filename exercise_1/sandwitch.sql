DROP TABLE IF EXISTS Tastes, Locations, Sandwiches;

CREATE TABLE Tastes(
    name VARCHAR(10),
    filling VARCHAR(20),
    PRIMARY KEY(name, filling)
);

CREATE TABLE Locations(
    lname VARCHAR(20) PRIMARY KEY,
    phone NUMERIC,
    address TEXT
);

CREATE TABLE Sandwiches(
    location VARCHAR(20) REFERENCES Locations(lname),
    bread VARCHAR(10),
    filling VARCHAR(20),
    price DECIMAL,
    PRIMARY KEY(location, bread, filling)
);

INSERT INTO Tastes VALUES
  ('Brown', 'Turkey'),
  ('Brown', 'Beef'),
  ('Brown', 'Ham'),
  ('Jones', 'Cheese'),
  ('Green', 'Beef'),
  ('Green', 'Turkey'),
  ('Green', 'Cheese');

INSERT INTO Locations VALUES
  ('Lincoln', 6834523, 'Lincoln Place'),
  ('O''Neill''s', 6742134, 'Pearse St'),
  ('Old Nag', 7678132, 'Dame St'),
  ('Buttery', 7023421, 'College St');

INSERT INTO Sandwiches VALUES
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

SELECT *
  FROM Locations
    WHERE lname IN (
        SELECT location
          FROM Sandwiches
            WHERE filling IN (
                SELECT filling
                  FROM Tastes
                    WHERE name = 'Jones'
            )
    );

SELECT l.*
  FROM (Tastes NATURAL JOIN Sandwiches) AS s
    JOIN Locations l ON l.lname = s.location AND
      s.name = 'Jones';

SELECT temp.lname, COUNT(DISTINCT temp.name)
  FROM (Locations l LEFT JOIN
    (Tastes NATURAL JOIN Sandwiches) temp1 ON
    l.lname = temp1.location
    ) temp
  GROUP BY temp.lname;

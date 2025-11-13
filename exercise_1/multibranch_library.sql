DROP TABLE IF EXISTS BRANCHES, TITLES, HOLDINGS;

CREATE TABLE BRANCHES(
    code CHAR(2) PRIMARY KEY,
    librarian VARCHAR(20),
    address TEXT
);

CREATE TABLE TITLES(
    title VARCHAR(20) PRIMARY KEY,
    author VARCHAR(20),
    publisher VARCHAR(20)
);

CREATE TABLE HOLDINGS(
    branch CHAR(2) REFERENCES Branches,
    title VARCHAR(20) REFERENCES Titles,
    copies INT
);

INSERT INTO BRANCHES (code, librarian, address) VALUES
  ('B1', 'John Smith', '2 Anglesea Rd'),
  ('B2', 'Mary Jones', '34 Pearse St'),
  ('B3', 'Francis Owens', 'Grange X');

INSERT INTO TITLES (title, author, publisher) VALUES
  ('Susannah', 'Ann Brown', 'Macmillan'),
  ('How to Fish', 'Amy Fly', 'Stop Press'),
  ('A History of Dublin', 'David Little', 'Wiley'),
  ('Computers', 'Blaise Pascal', 'Applewoods'),
  ('The Wife', 'Ann Brown', 'Macmillan');

INSERT INTO HOLDINGS (branch, title, copies) VALUES
  ('B1', 'Susannah', 3),
  ('B1', 'How to Fish', 2),
  ('B1', 'A History of Dublin', 1),
  ('B2', 'How to Fish', 4),
  ('B2', 'Computers', 2),
  ('B2', 'The Wife', 3),
  ('B3', 'A History of Dublin', 1),
  ('B3', 'Computers', 4),
  ('B3', 'Susannah', 3),
  ('B3', 'The Wife', 1);

SELECT title FROM TITLES WHERE publisher = 'Macmillan';

SELECT DISTINCT branch
FROM HOLDINGS
WHERE title IN(
  SELECT title
  FROM TITLES
  WHERE author = 'Ann Brown'
  );

SELECT DISTINCT branch
FROM TITLES NATURAL JOIN HOLDINGS
WHERE author = 'Ann Brown';

SELECT branch, sum(copies) AS total_copies
FROM HOLDINGS
GROUP BY branch;
DROP TABLE IF EXISTS Branches, Titles, Holdings;

CREATE TABLE Branches(
    b_code CHAR(2) PRIMARY KEY,
    librarian VARCHAR(20),
    address TEXT
);

CREATE TABLE Titles(
    title VARCHAR(20) PRIMARY KEY,
    author VARCHAR(20),
    publisher VARCHAR(20)
);

CREATE TABLE Holdings(
    branch CHAR(2) REFERENCES Branches(b_code),
    title VARCHAR(20) REFERENCES Titles(title),
    copies INT 
);

INSERT INTO Branches (b_code, librarian, address) VALUES
('B1', 'John Smith', '2 Anglesea Rd'),
('B2', 'Mary Jones', '34 Pearse St'),
('B3', 'Francis Owens', 'Grange X');

INSERT INTO Titles (title, author, publisher) VALUES
('Susannah', 'Ann Brown', 'Macmillan'),
('How to Fish', 'Amy Fly', 'Stop Press'),
('A History of Dublin', 'David Little', 'Wiley'),
('Computers', 'Blaise Pascal', 'Applewoods'),
('The Wife', 'Ann Brown', 'Macmillan');

INSERT INTO Holdings (branch, title, copies) VALUES
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

SELECT title FROM Titles WHERE publisher = 'Macmillan';

SELECT DISTINCT branch FROM Holdings
  WHERE title IN(
    SELECT title FROM Titles
      WHERE author = 'Ann Brown'
  );

SELECT DISTINCT branch
  FROM (
    Titles NATURAL JOIN Holdings
  )
  WHERE author = 'Ann Brown';

SELECT branch, sum(copies) AS total_copies
  FROM Holdings
  GROUP BY branch;
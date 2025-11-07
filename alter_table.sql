DROP TABLE IF EXISTS testing_table;

CREATE TABLE testing_table(
  name varchar(20) NOT NULL,
  contact_name varchar(20),
  roll_no varchar(10) PRIMARY KEY
);

ALTER TABLE testing_table
DROP name;

ALTER TABLE testing_table
RENAME COLUMN contact_name TO username;

ALTER TABLE testing_table
ADD COLUMN first_name varchar(10),
ADD COLUMN last_name varchar(10);

-- here since we are altering the data type of a column,
-- the best practice is to remove any constraints on that column first,
-- then alter the column and then add the constraints afterwards to prevent possible ambiguities.
ALTER TABLE testing_table
ALTER COLUMN roll_no TYPE integer USING roll_no::integer;
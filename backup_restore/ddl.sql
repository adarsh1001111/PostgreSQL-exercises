/*
open psql using

psql -U postgres

CREATE DATABASE my_db;
-- created database 

\c my_db

CREATE TABLE test1(
    id INT );

-- connected to my_db and created a test table
--------------------------------

-- \q we need to quit the psql to run pg_dump cmds

pg_dump -U postgres -d my_db > my_db_backup.sql

dumped/ backed up the database my_db in file my_db_backup.sql (we can now send this file to anyone).

---------------------------------------------------

-- connected to psql again to create database named restored

 psql -U postgres

 CREATE DATABASE restored;

\q quit to run psql restore command

-- also to restore the .sql dump file it must be in UTF8 encoding ( so i needed to save it using the notepad in the UTF8 encoding).
-- also < operator is reserved in powershell , so i used cmd ( command prompt ) to restore the dump file




psql -U postgres -d restored < my_db_backup.sql
Password for user postgres: 

OUTPUT OBTAINED
---------------

SET
SET
SET
SET
SET
SET
 set_config
------------

(1 row)

SET
SET
SET
SET
SET
SET
CREATE TABLE
ALTER TABLE
COPY 0
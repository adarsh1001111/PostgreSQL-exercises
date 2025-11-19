/*
DROP DATABASE IF EXISTS bank;
CREATE DATABASE bank;
*/
/*
Connect to bank database
\c bank;
*/

DROP TABLE IF EXISTS users, accounts CASCADE;

CREATE TABLE accounts(
    id SERIAL PRIMARY KEY,
    account_number NUMERIC UNIQUE NOT NULL,
    balance DECIMAL NOT NULL DEFAULT 0.0
);

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    account_number NUMERIC UNIQUE NOT NULL REFERENCES accounts(account_number) ON DELETE CASCADE
);
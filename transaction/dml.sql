INSERT INTO accounts(account_number, balance) VALUES
    (1001, 300.00),
    (1002, 400.00),
    (1004, 500.00),
    (1005, 450.00)
    RETURNING *;

INSERT INTO users (name, email, account_number) VALUES
    ('userA', 'user1@gmail.com', 1002),
    ('userB', 'user2@gmail.com', 1004),
    ('userC', 'user3@gmail.com', 1005)
    RETURNING *;

---------------------------------------

----------------------------
-- userA is depositing 1000 Rs. his account

-- in postgreSQL any single query is in autocommit mode
--(if we don't specify BEGIN - COMMMIT OR BEGIN - ROLLBACK)

--using BEGIN - COMMIT 
BEGIN;

UPDATE accounts
SET balance = balance + 1000
WHERE account_number = (
    SELECT account_number
    FROM users
    WHERE name = 'userA')
    RETURNING *;

COMMIT;

--without using BEGIN- COMMIT

UPDATE accounts
SET balance = balance + 1000
WHERE account_number = (
    SELECT account_number
    FROM users
    WHERE name = 'userA')
RETURNING *;

------------------------------------
-- userA is withdrawing 500 Rs.

-- using BEGIN - COMMIT 

BEGIN;

UPDATE accounts
SET balance = balance - 500
WHERE account_number = (
    SELECT account_number
    FROM users
    WHERE name = 'userA')
RETURNING *;

COMMIT;

-- without BEGIN - COMMIT

UPDATE accounts
SET balance = balance - 500
WHERE account_number = (
    SELECT account_number
    FROM users
    WHERE name = 'userA')
RETURNING *;

-----------------------------------------

-- userA is transferring 200 Rs to userB's account

-- 2 separate query (would need BEGIN - COMMIT
-- to encapsulate them in 1 transaction)

BEGIN;

UPDATE accounts
SET balance = balance - 200
WHERE account_number = (
    SELECT account_number
    FROM users
    WHERE name = 'userA')
RETURNING *;

UPDATE accounts
SET balance = balance + 200
WHERE account_number = (
    SELECT account_number
    FROM users
    WHERE name = 'userB')
RETURNING *;

COMMIT;

-- IF I write single query ( BEGIN - COMMIT won't be needed).

UPDATE accounts a
SET balance = ( CASE
    WHEN u.name ='userA' THEN
        balance - 200
    WHEN u.name = 'userB' THEN
        balance + 200
    END
    )
FROM users u
WHERE a.account_number = u.account_number
    AND u.name IN ('userA', 'userB')
RETURNING *;

--------------------------------------------------
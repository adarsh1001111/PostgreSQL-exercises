--1.)
EXPLAIN SELECT name
        FROM users
        WHERE id > 100;

/*
                       QUERY PLAN
--------------------------------------------------------
 Seq Scan on users  (cost=0.00..18.50 rows=900 width=8)
   Filter: (id > 100)
(2 rows)
*/

EXPLAIN SELECT name
        FROM users
        WHERE id = 100;

/*
                               QUERY PLAN
------------------------------------------------------------------------
 Index Scan using users_pkey on users  (cost=0.28..8.29 rows=1 width=8)
   Index Cond: (id = 100)
(2 rows)

*/

-- the query planner decided to sequentially scan for because the query was to fetch
-- all ids with value > 100, it had to fetch all sequentially and not seeing index for
-- each individual id value, index scan would be slow in this case

-- but when i want a particular id to be fetched, it can just look into the index to find the id = 100
-- very fast with low cost.

/*
Different types of scans possible are:
Seq scan: Goes through every row sequentially. Used when either table is small and seq scan is faster or no matching index exists.
Index scan: Use index to iterate through required entries.
Index only scan: Same as index scan but does not touch the table heap.
Bitmap index scan: Finds matching row locations in the index and creates a bitmap of row positions.
Bitmap Heap scan: Followed by bitmap heap scan. Retrieves actual values from the table.
 	
	cost=0.28..8.29
	First value: Initial cost
	Last value: Final estimated cost
	(works on random sample so data may vary on running same query multiple times)

	rows=1 width=8
	Estimates the number of affected rows and width (in bytes) of each row.

	Index Cond: (id = 100)
	Retrieves based on the given condition
*/

---------------------------------------------------------
-- 2.1
EXPLAIN SELECT * FROM comments
        WHERE user_id = 100;

/*
vinsol=# EXPLAIN SELECT * FROM comments
vinsol-#         WHERE user_id = 100;
                        QUERY PLAN
-----------------------------------------------------------
 Seq Scan on comments  (cost=0.00..219.00 rows=9 width=41)
   Filter: (user_id = 100)
(2 rows)
*/
-- query planner had to iterate the comments table to find user_id =100
-- since there is not existing index on that table col.

-- now i am indexing on user_id of commments
CREATE INDEX comments_user_id_idx ON comments(user_id);
-- 2.2
/*
                                    QUERY PLAN
-----------------------------------------------------------------------------------
 Bitmap Heap Scan on comments  (cost=4.35..32.11 rows=9 width=41)
   Recheck Cond: (user_id = 100)
   ->  Bitmap Index Scan on comments_user_id_idx  (cost=0.00..4.35 rows=9 width=0)
         Index Cond: (user_id = 100)
(4 rows)

-- after indexing the cost improved ( time required to do search is reduced ) with the help of index created.
*/

------------------------------------------------------------------------
-- 3.)
EXPLAIN SELECT *
        FROM comments
        WHERE commentable_id = 99 and
              commentable_type = 'Article';

-- without indexing on id and type
/*
                                 QUERY PLAN
----------------------------------------------------------------------------
 Seq Scan on comments  (cost=0.00..244.00 rows=45 width=42)
   Filter: ((commentable_id = 99) AND (commentable_type = 'Article'::text))
(2 rows)
*/

-- indexing on id and type 
CREATE INDEX id_type_index ON comments(commentable_id, commentable_type);

EXPLAIN SELECT *
        FROM comments
        WHERE commentable_id = 99 and
              commentable_type = 'Article';

/*
                                     QUERY PLAN
--------------------------------------------------------------------------------------
 Bitmap Heap Scan on comments  (cost=4.75..83.78 rows=45 width=42)
   Recheck Cond: ((commentable_id = 99) AND (commentable_type = 'Article'::text))
   ->  Bitmap Index Scan on id_type_index  (cost=0.00..4.74 rows=45 width=0)
         Index Cond: ((commentable_id = 99) AND (commentable_type = 'Article'::text))
(4 rows)
*/
-- multicolumn indexing on commentable id and type optimizes the query.

------------------------------------------------------------------------------------------------------------------
-- 4.)

EXPLAIN SELECT * FROM comments c
        JOIN users u
        ON c.user_id = u.id;

/*
                               QUERY PLAN
------------------------------------------------------------------------
 Hash Join  (cost=28.50..248.86 rows=10000 width=54)
   Hash Cond: (c.user_id = u.id)
   ->  Seq Scan on comments c  (cost=0.00..194.00 rows=10000 width=42)
   ->  Hash  (cost=16.00..16.00 rows=1000 width=12)
         ->  Seq Scan on users u  (cost=0.00..16.00 rows=1000 width=12)
(5 rows)

Query planner first iterates through smaller table, i.e. users, and creates hash corresponding to hash condition. It then sequentially reads all rows in comments table.
Joins the tables on the basis of hash condition.
-- they are not using indexes and using sequential scan beacuse query planner thought it is cheaper than index-scan.
*/
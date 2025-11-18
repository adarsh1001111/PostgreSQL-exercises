--------------------
--Find image that has been tagged most no of times.
SELECT image_id
FROM tags
GROUP BY image_id
ORDER BY COUNT(tagged) DESC
LIMIT 1;

--------------------
--Find all images belonging to the friends of a particular user.
--for user with name = 'user1'

EXPLAIN SELECT i.*
FROM images i JOIN friends f 
    ON i.owner = f.friend_id
    JOIN users u ON u.id = f.user_id AND u.name = 'user1';

/*
                                   QUERY PLAN                                   
--------------------------------------------------------------------------------
 Hash Join  (cost=61.85..104.06 rows=109 width=8)
   Hash Cond: (i.owner = f.friend_id)
   ->  Seq Scan on images i  (cost=0.00..32.60 rows=2260 width=8)
   ->  Hash  (cost=61.73..61.73 rows=10 width=4)
         ->  Hash Join  (cost=25.95..61.73 rows=10 width=4)
               Hash Cond: (f.user_id = u.id)
               ->  Seq Scan on friends f  (cost=0.00..30.40 rows=2040 width=8)
               ->  Hash  (cost=25.88..25.88 rows=6 width=4)
                     ->  Seq Scan on users u  (cost=0.00..25.88 rows=6 width=4)
                           Filter: (name = 'user1'::text)
(10 rows)
*/


EXPLAIN SELECT *
FROM images
WHERE owner IN (
    SELECT friend_id
    FROM friends
    WHERE user_id = (
        SELECT id FROM users WHERE name = 'user1'
    ));

/*
                             QUERY PLAN                              
---------------------------------------------------------------------
 Hash Semi Join  (cost=61.50..101.29 rows=113 width=8)
   Hash Cond: (images.owner = friends.friend_id)
   InitPlan 1 (returns $0)
     ->  Seq Scan on users  (cost=0.00..25.88 rows=6 width=4)
           Filter: (name = 'user1'::text)
   ->  Seq Scan on images  (cost=0.00..32.60 rows=2260 width=8)
   ->  Hash  (cost=35.50..35.50 rows=10 width=4)
         ->  Seq Scan on friends  (cost=0.00..35.50 rows=10 width=4)
               Filter: (user_id = $0)
(9 rows)
*/

--------------------
--Find all friends of a particular user (Say, userA) who has tagged him in all of his pics.
-- for user with name = 'user1'

SELECT friend_id
FROM friends f
JOIN images i ON f.friend_id = i.owner
LEFT JOIN tags t ON i.id = t.image_id AND t.tagged = (SELECT id FROM users WHERE name = 'user1')
WHERE f.user_id = (SELECT id FROM users WHERE name = 'user1')
GROUP BY (friend_id)
HAVING COUNT(i.id)=COUNT(t.id);
-- here. i used left join to include images with no tags with user1 too 
--to count how many images are owned by the friend of user 1 and how many have tagged user 1.
--------------------
--Find friend of a particular user (Say, userA) who have tagged him most no. of times.
-- for user with name = 'user1'

SELECT friend_id
FROM friends f
JOIN images i ON f.friend_id = i.owner
JOIN tags t ON i.id = t.image_id AND t.tagged = user_id
WHERE f.user_id = (SELECT id FROM users WHERE name = 'user1')
GROUP BY friend_id
ORDER BY COUNT(tagged) DESC
LIMIT 1;
--------------------

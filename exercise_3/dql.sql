--select all articles whose author's name is user3 (Do this exercise using variable also).
SELECT * FROM articles
WHERE user_id IN (SELECT id
    FROM users
    WHERE name = 'user3' );

SELECT a.* FROM (articles a JOIN users u
    ON a.user_id = u.id)
WHERE u.name = 'user3';

-- using variable ( will work on psql cmd line)

-- \set username 'user3'
/*
SELECT *
FROM articles
WHERE user_id = ( SELECT id
    FROM users
    WHERE name = :'username'
);
*/
-------------------------------------------
/*For all the articles being selected above,
select all the articles and also the comments associated with those articles
in a single query (Do this using subquery also)
*/
--Using Join

SELECT a.*, string_agg(c.content, ' , ') AS all_comments
FROM (articles a
LEFT JOIN comments c ON c.article_id = a.id)
INNER JOIN users u ON a.user_id = u.id
WHERE u.name = 'user3'
GROUP BY a.id;

--Using SubQuery
SELECT a.*, (SELECT string_agg(c.content, ' , ')
    FROM comments c
    WHERE c.article_id = a.id
) as all_comments
FROM articles a
WHERE a.user_id = (
    SELECT id FROM users WHERE name = 'user3'
);
----------------------------------------------
/* Write a query to select all articles
which do not have any comments (Do using subquery also)
*/
--Using Join
SELECT a.* FROM (articles a LEFT JOIN comments c
    ON a.id = c.article_id)
WHERE c.id IS NULL;

--Using SubQuery
SELECT * FROM articles
WHERE id NOT IN (SELECT article_id
    FROM comments);
-----------------------------------------------
/*Write a query to select article
which has maximum comments
*/
SELECT a.*, COUNT(c.id) AS comment_count 
FROM articles a
JOIN comments c
ON a.id = c.article_id
GROUP BY a.id
ORDER BY comment_count DESC
LIMIT 1;

SELECT *
FROM (SELECT a.*,(SELECT COUNT(*) 
          FROM comments c 
          WHERE c.article_id = a.id
      ) AS comment_count
    FROM articles a
)
ORDER BY comment_count DESC
LIMIT 1;

---------------------------------------------------
/*Write a query to select article which 
does not have more than one comment by the same user
( do this using left join and group by )
*/

SELECT a.* FROM articles a LEFT JOIN comments c
    ON a.id = c.article_id
GROUP BY a.id
HAVING COUNT(c.id)<=1;
--------------------
--Find image that has been tagged most no of times.
SELECT image_id
FROM tags
GROUP BY image_id
HAVING COUNT(tagged) = (
    SELECT MAX(tag_count)
    FROM (
        SELECT COUNT(tagged) as tag_count
        FROM tags
        GROUP BY image_id
    ) x
)
ORDER BY image_id;

--------------------
--Find all images belonging to the friends of a particular user.
--for user with name = 'user1'

SELECT id
FROM images
WHERE owner IN (
    SELECT friend_id
    FROM friends
    WHERE user_id = (
        SELECT id FROM users WHERE name = 'user1'
    ));
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

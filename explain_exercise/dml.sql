INSERT INTO users (name)
SELECT 'User ' || g
FROM generate_series(1, 1000) AS g
RETURNING *;

INSERT INTO articles (title)
SELECT 'Article ' || g
FROM generate_series(1, 100) AS g
RETURNING *;

INSERT INTO photos (url)
SELECT 'http://example.com/photo/' || g
FROM generate_series(1, 100) AS g
RETURNING *;

INSERT INTO comments (commentable_type, commentable_id, user_id, body)
SELECT 
    CASE WHEN random() < 0.5 THEN 'Article' ELSE 'Photo' END AS commentable_type,
    (floor(random()*100) + 1)::int AS commentable_id,
    (floor(random()*1000) + 1)::int AS user_id,
    'This is a comment #' || g AS body
FROM generate_series(1, 10000) AS g
RETURNING *;
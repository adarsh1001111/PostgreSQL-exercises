INSERT INTO users(name, type) VALUES
  ('user1', 'Admin'),
  ('user2', 'Admin'),
  ('user3', 'Normal'),
  ('user4', 'Normal'),
  ('user5', 'Admin')
RETURNING *;

INSERT INTO categories(name) VALUES
  ('Science'),
  ('Maths'),
  ('CSE'),
  ('ECE')
RETURNING *;

INSERT INTO articles(content, user_id, category_id) VALUES
  ('article 1', 1, 3),
  ('article 2', 3, 4),
  ('article 3', 2, 3),
  ('article 4', 5, 1),
  ('article 5', 5, 2)
  RETURNING *;

INSERT INTO comments(content, user_id, article_id) VALUES
  ('hi i am user 3', 3, 2),
  ('hi from user 1', 1, 1),
  ('hello again from user 1', 1, 1)
RETURNING *;


--Update on all tables

UPDATE users
SET type = 'Normal'
WHERE id = 2
RETURNING *;

UPDATE categories
SET name = 'Mathematics'
WHERE id = 2
RETURNING *;

UPDATE articles
SET user_id = 2
WHERE id = 1
RETURNING *;

UPDATE comments
SET user_id = 2
WHERE id = 2
RETURNING *;

-- Delete on all tables

DELETE FROM users
WHERE id = 1
RETURNING *;

DELETE FROM categories
WHERE name = 'Science'
RETURNING *;

DELETE FROM articles
WHERE user_id = 2
RETURNING *;

DELETE FROM comments
WHERE user_id = 2
RETURNING *;




INSERT INTO users(type) VALUES
  ('Admin'),('Admin'),('Normal'),('Normal'),('Admin');

INSERT INTO categories(name) VALUES
  ('Science'),('Maths'),('CSE'),('ECE');

INSERT INTO articles(content, user_id, category_id) VALUES
  ('article 1', 1, 3),
  ('article 2', 3, 4),
  ('article 3', 2, 3),
  ('article 4', 5, 1);

INSERT INTO comments(content, user_id) VALUES
  ('hi i am user 3', 3),
  ('hi from user 1', 1),
  ('hello again from user 1', 1);

--Update on all tables

UPDATE articles
SET user_id = 2
WHERE id = 1;

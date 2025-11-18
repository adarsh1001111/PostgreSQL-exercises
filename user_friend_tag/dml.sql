INSERT INTO users (name) VALUES
  ('user1'),
  ('user2'),
  ('user3'),
  ('user4'),
  ('user5')
  RETURNING *;


INSERT INTO friends (user_id, friend_id) VALUES
  (1, 2),(2, 1),
  (1, 3),(3, 1),
  (2, 3),(3, 2),
  (3, 4),(4, 3),
  (4, 5),(5, 4)
  RETURNING *;

INSERT INTO images (owner) VALUES
  (1),
  (1),
  (2),
  (2),
  (3),
  (4)
  RETURNING *;

INSERT INTO tags (image_id, tagged) VALUES
  (1, 2),
  (1, 3),
  (2, 1), 
  (3, 2),
  (3, 5),
  (3, 1),
  (4, 1),
  (4, 3),
  (5, 4),
  (5, 1)
  RETURNING *;
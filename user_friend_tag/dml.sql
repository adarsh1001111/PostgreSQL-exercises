INSERT INTO users (name) VALUES
('user1'),
('user2'),
('user3'),
('user4'),
('user5');


INSERT INTO friends (user_id, friend_id) VALUES
(1, 2),(2, 1)
(1, 3),(3, 1)
(2, 3),(3, 2)
(3, 4),(4, 3)
(4, 5),(5, 4)

INSERT INTO images (user) VALUES
(1),
(1),
(2),
(3),
(4),

INSERT INTO tags (image_id, tagged) VALUES
(1, 2),
(1, 3),
(2, 1), 
(3, 2),
(3, 5),
(4, 3),
(5, 4),
(5, 1);
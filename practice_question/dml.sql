INSERT INTO locations (address) VALUES
    ('Rajiv Chowk'),
    ('Hauz Khas'),
    ('Dwarka'),
    ('Kashmere Gate'),
    ('Saket'),
    ('Mayur Vihar'),
    ('Lajpat Nagar'),
    ('Noida City Centre'),
    ('Vaishali'),
    ('Rohini'),
    ('Anand Vihar')
RETURNING *;

INSERT INTO complexes (name, location_id) VALUES
    ('Complex A', 1),
    ('Complex B', 2),
    ('Complex C', 3),
    ('Complex D', 4),
    ('Complex E', 5),
    ('Complex F', 6),
    ('Complex G', 6),
    ('Complex H', 8),
    ('Complex I', 3),
    ('Complex J', 10)
RETURNING *;

INSERT INTO members (name) VALUES
    ('m1'),
    ('m2'),
    ('m3'),
    ('m4'),
    ('m5'),
    ('m6'),
    ('m7'),
    ('m8'),
    ('m9'),
    ('m10')
RETURNING *;

INSERT INTO memberships (member_id, complex_id, type) VALUES
        (1, 1, 'active'),
        (2, 1, 'active'),
        (3, 2, 'inactive'),
        (4, 3, 'active'),
        (5, 3, 'active'),
        (5, 4, 'inactive'),
        (6, 4, 'active'),
        (7, 5, 'active'),
        (8, 6, 'active'),
        (9, 2, 'active'),
        (10,5, 'inactive'),
        (1, 2, 'active'),
        (2, 3, 'inactive'),
        (3, 4, 'active'),
        (4, 5, 'active')
RETURNING *; 

INSERT INTO sports (name) VALUES
    ('Tennis'),
    ('Badminton'),
    ('Football'),
    ('Swimming'),
    ('Cricket'),
    ('Basketball'),
    ('Table Tennis'),
    ('Squash')
RETURNING *;


INSERT INTO complex_sports (complex_id, sport_id) VALUES
    (1, 1),
    (1, 2),
    (1, 8),

    (2, 1),
    (2, 3),

    (3, 4),
    (3, 5),

    (4, 6),
    (4, 7),
    (4, 2),

    (5, 1),
    (5, 5),

    (6, 3),
    (6, 4),
    (6, 7),

    (7, 8),
    (7, 2),

    (8, 3),
    (8, 6),

    (9, 1),
    (9, 4),

    (10,5),
    (10,7)
RETURNING *;

INSERT INTO coachings (complex_id, sport_id) VALUES
    (1, 1),
    (1, 2),

    (2, 3),

    (3, 4),

    (4, 6),
    (4, 2),

    (5, 1),

    (6, 4),
    (6, 7),

    (7, 8),

    (8, 3),

    (9, 1),

    (10, 5),
    (10, 3)
RETURNING *;

INSERT INTO trainings(member_id, sport_id, complex_id) VALUES
    (1, 8, 7),
    (1, 6, 4),
    (2, 3, 2),
    (4, 2, 1),
    (10,3, 2),
    (9, 3, 2),
    (5, 3, 10),
    (4, 1, 9)
RETURNING *;

INSERT INTO employees(name) VALUES
    ('userA'),
    ('userB'),
    ('userC'),
    ('userD'),
    ('userE')
RETURNING *;

INSERT INTO projects(name) VALUES
    ('p1'),
    ('p2'),
    ('p3'),
    ('p4'),
    ('p5'),
    ('p6'),
    ('p7'),
    ('p8'),
    ('p9'),
    ('p10')
RETURNING *;

INSERT INTO technologies(name, project_id) VALUES
    ('HTML', 1), ('JavaScript', 1), ('Ruby', 1), ('Rails', 1),
    ('IOS', 2),
    ('Android', 3),
    ('IOS', 4), ('Android', 4),
    ('Ruby', 5), ('Rails', 5),
    ('Android', 6), ('HTML', 6), ('JavaScript', 6),
    ('Android', 7), ('IOS', 7),
    ('HTML', 8), ('JavaScript', 8), ('Ruby', 8), ('Rails', 8), ('Android', 8),
    ('IOS', 9)
RETURNING *;

INSERT INTO assigns(emp_id, project_id, type) VALUES
    (1, 1, 'finished'), (1, 2, 'finished'), (1, 3, 'finished'), (1, 6, 'current'),
    (2, 1, 'finished'), (2, 3, 'finished'), (2, 7, 'finished'), (2, 9, 'finished'),
    (3, 1, 'finished'), (3, 2, 'finished'), (3, 8, 'finished'), (3, 9, 'finished'),
    (4, 1, 'finished'), (4, 2, 'finished'), (4, 4, 'finished'), (4, 5, 'current'), (4, 6, 'current')
RETURNING *;
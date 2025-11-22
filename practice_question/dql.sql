/*
members who are taking tennis coaching in Dwarka
members of Dwarka Sports Complex
All the locations where tennis coaching happens
All the location where football can be played
Active members of Dwarka sports complex (membership still active)
*/


SELECT member_id
FROM trainings t JOIN sports s
    ON t.sport_id = s.id AND s.name = 'Tennis'
    JOIN complexes c
    ON t.complex_id = c.id
    JOIN locations l
    ON l.id = c.location_id AND l.address = 'Dwarka';

SELECT m.member_id, m.type
FROM memberships m JOIN complexes c
    ON m.complex_id = c.id
    JOIN locations l
    ON l.id = c.location_id
    AND l.address = 'Dwarka';

SELECT l.*
FROM coachings c JOIN sports s
    ON c.sport_id = s.id
    AND s.name = 'Tennis'
    JOIN complexes cm
    ON c.complex_id = cm.id
    JOIN locations l
    ON cm.location_id = l.id;

SELECT l.*
FROM complex_sports cs JOIN sports s
    ON cs.sport_id = s.id
    AND s.name = 'Football'
    JOIN complexes c
    ON c.id = cs.complex_id
    JOIN locations l
    ON c.location_id = l.id;

SELECT m.member_id, m.type
FROM memberships m JOIN complexes c
    ON m.complex_id = c.id
    AND m.type = 'active'
    JOIN locations l
    ON l.id = c.location_id
    AND l.address = 'Dwarka';
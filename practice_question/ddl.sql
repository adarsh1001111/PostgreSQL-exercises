DROP TABLE IF EXISTS locations, complexes, members, memberships, sports, complex_sports, coachings, trainings;

CREATE TABLE locations(
    id SERIAL PRIMARY KEY,
    address TEXT NOT NULL UNIQUE
);

-- here, one to many relation is there b/w complexes and locations so,
-- complexes has location_id as one of its feature/col.

CREATE TABLE complexes (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    location_id INT NOT NULL REFERENCES locations ON DELETE CASCADE
);

CREATE TABLE members (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- since a memebrr can be member of many complexes and a complex can have many members.
-- many to many relation is establised with memberships table there.

CREATE TABLE memberships(
    id SERIAL PRIMARY KEY,
    member_id INT REFERENCES members ON DELETE CASCADE,
    complex_id INT REFERENCES complexes ON DELETE CASCADE,
    type TEXT CHECK (type IN ('active', 'inactive')),
    UNIQUE(member_id, complex_id)
);

CREATE TABLE sports(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- complex_sports table contains which complex contains/allows which sports,
-- a complex can have many sports

CREATE TABLE complex_sports(
    id SERIAL PRIMARY KEY,
    complex_id INT REFERENCES complexes ON DELETE CASCADE,
    sport_id INT REFERENCES sports ON DELETE CASCADE,
    UNIQUE(complex_id, sport_id)
);

-- coachings table tells which complex has which sports coachings in them,
-- a complex can have many sports coachings and a sport can be coached in many complexes.

CREATE TABLE coachings(
    id SERIAL PRIMARY KEY,
    complex_id INT REFERENCES complexes ON DELETE CASCADE,
    sport_id INT REFERENCES sports ON DELETE CASCADE,
    UNIQUE(complex_id, sport_id)
);

-- trainings tells which member does which coaching in which which complex
CREATE TABLE trainings(
    id SERIAL PRIMARY KEY,
    member_id INT REFERENCES members ON DELETE CASCADE,
    sport_id INT,
    complex_id INT,
    FOREIGN KEY(sport_id, complex_id) REFERENCES coachings(sport_id, complex_id)ON DELETE CASCADE,
    FOREIGN KEY(member_id, complex_id) REFERENCES memberships(member_id, complex_id)ON DELETE CASCADE,
    UNIQUE(member_id, sport_id, complex_id)
);
-- foreign key on coaching cause if the complex isn't giving coaching on a particular sport, it can't exist in the trainings too.

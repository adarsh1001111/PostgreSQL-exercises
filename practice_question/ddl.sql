DROP TABLE IF EXISTS locations, complexes, coachings, members, memberships, sports, complex_sports;

CREATE TABLE locations(
    id SERIAL PRIMARY KEY,
    address TEXT NOT NULL UNIQUE
);

CREATE TABLE complexes (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    location_id INT NOT NULL REFERENCES locations ON DELETE CASCADE
);

CREATE TABLE members (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

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

CREATE TABLE complex_sports(
    id SERIAL PRIMARY KEY,
    complex_id INT REFERENCES complexes ON DELETE CASCADE,
    sport_id INT REFERENCES sports ON DELETE CASCADE,
    UNIQUE(complex_id, sport_id)
);

CREATE TABLE coachings(
    id SERIAL PRIMARY KEY,
    complex_id INT REFERENCES complexes ON DELETE CASCADE,
    sport_id INT REFERENCES sports ON DELETE CASCADE,
    member_id INT REFERENCES members ON DELETE CASCADE,
    UNIQUE(complex_id, sport_id, member_id)
);
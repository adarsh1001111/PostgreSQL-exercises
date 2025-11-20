DROP TABLE IF EXISTS users, articles, photos, comments;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL
);

CREATE TABLE photos (
    id SERIAL PRIMARY KEY,
    url TEXT NOT NULL
);

CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    commentable_type TEXT NOT NULL,
    commentable_id INT NOT NULL,
    user_id INT NOT NULL REFERENCES users,
    body TEXT
);

-- Basic index to show how indexing affects EXPLAIN

-- You will later create composite indexes for Q3.

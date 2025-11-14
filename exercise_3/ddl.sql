DROP TABLE IF EXISTS users, categories, articles, comments;

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    type TEXT CHECK (type IN ('Admin','Normal'))
);

CREATE TABLE categories(
    id SERIAL PRIMARY KEY,
    name text NOT NULL UNIQUE
);

CREATE TABLE articles(
    id SERIAL PRIMARY KEY,
    content text NOT NULL,
    user_id INT REFERENCES users,
    category_id INT REFERENCES categories
);

CREATE TABLE comments(
    id SERIAL PRIMARY KEY,
    content text NOT NULL,
    user_id INT REFERENCES users
);

select max(v) from (values ('infinity'::numeric),(1)) as t(v);
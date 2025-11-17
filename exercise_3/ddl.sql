DROP TABLE IF EXISTS users, categories, articles, comments;

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    type TEXT CHECK (type IN ('Admin','Normal'))
);

CREATE TABLE categories(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE articles(
    id SERIAL PRIMARY KEY,
    content TEXT NOT NULL,
    user_id INT REFERENCES users ON DELETE CASCADE,
    category_id INT REFERENCES categories ON DELETE CASCADE
);

CREATE TABLE comments(
    id SERIAL PRIMARY KEY,
    content TEXT NOT NULL,
    user_id INT NOT NULL REFERENCES users ON DELETE CASCADE,
    article_id INT NOT NULL REFERENCES articles ON DELETE CASCADE
);
DROP TABLE IF EXISTS users, friends, images, tags;

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE friends(
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users,
    friend_id INT NOT NULL REFERENCES users
);



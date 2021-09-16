CREATE DATABASE bluebird;

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    sport TEXT,
    difficulty TEXT,
    location TEXT,
    photo TEXT,
    user_id INTEGER
);

INSERT INTO posts (sport, difficulty, location, photo, user_id) VALUES ('climbing', '5.15a', 'moab', 'https://images.unsplash.com/photo-1586627161720-ee2849303aee?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',5);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    user_name TEXT,
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    profile_img TEXT,
    password_digest TEXT
);

ALTER TABLE posts 
ADD public_id TEXT,
ADD format TEXT;

ALTER TABLE users
ADD public_id TEXT, 
ADD format TEXT;
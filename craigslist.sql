-- from the terminal run:
-- psql < craigslist.sql

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE region
(
    id SERIAL PRIMARY KEY,
    region_name TEXT NOT NULL
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    email_address VARCHAR(30) NOT NULL,
    preferred_region INTEGER NOT NULL references region(id)
);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    category_name TEXT NOT NULL
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    post_title TEXT NOT NULL,
    post_text VARCHAR NOT NULL,
    post_owner INTEGER references users(id),
    post_location VARCHAR(20) NOT NULL,
    post_region INTEGER references region(id)
);

CREATE TABLE categories_posts
(
    id SERIAL PRIMARY KEY,
    post_id INTEGER references posts (id),
    category_id INTEGER references categories(id)
);

INSERT INTO region
    (region_name)
VALUES
    ('San Francisco'),
    ('Seattle'),
    ('Atlanta'),
    ('Los Angeles'),
    ('Honolulu');

INSERT INTO users
    (username, email_address, preferred_region)
VALUES
    ('icestormgoat', 'icestormgoat@email.com', 1),
    ('beforesunset', 'beforesunset@email.com', 3),
    ('ryewavepieleoi', 'ryewavepieleo@email.com', 4),
    ('thelionkingant', 'thelionkingant@email.com', 2);

INSERT INTO categories
    (category_name)
VALUES
    ('for sale'),
    ('personals'),
    ('looking for'),
    ('random');

INSERT INTO posts
    (post_title,post_text, post_owner, post_location, post_region)
VALUES
    ('new desk for sale', 'selling new desk. 32" tall by 60" wide.', 1, 'culver city', 4);

INSERT INTO categories_posts
    (post_id, category_id)
VALUES
    (1, 1);
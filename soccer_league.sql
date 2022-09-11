-- from the terminal run:
-- psql < soccer_league.sql

DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league;

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    team_name TEXT NOT NULL
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    player_first_name TEXT NOT NULL,
    player_last_name TEXT NOT NULL,
    team INTEGER references teams(id)
);

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE matches
(
    id SERIAL PRIMARY KEY,
    match_date DATE NOT NULL,
    team_1 INTEGER references teams(id),
    team_2 INTEGER references teams(id)
);

CREATE TABLE matches_referees
(
    id SERIAL PRIMARY KEY,
    match_id INTEGER references matches(id),
    referee_id INTEGER references referees(id)
);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    player_id INT references players(id),
    match_id INT references matches(id),
    goal_count INTEGER
);

CREATE TABLE seasons
(
    id SERIAL PRIMARY KEY,
    season TEXT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);
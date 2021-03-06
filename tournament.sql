-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

/* Deletes the db if it exists to avoid any errors */
DROP DATABASE IF EXISTS tournament;

/* Create the db tournament */
CREATE DATABASE tournament;

/* Connect to the db */
\c tournament;


/*
Creates the players table with the player's name and id
as attributes. The primary key, id, will be autogenerated 
by the db.

    id | name
    ------------------
    1  | Player1      |
    2  | Player2      |
    3  | Player3      |
    4  | Player4      |
*/


CREATE TABLE players (
        id serial PRIMARY KEY,
        name varchar (30) NOT NULL
);

/*
Creates results table to record the user_id of the winner
and user_id of the loser.  The primary key, id, is 
autogenerated by the db.

     id |  winner_user_id | loser_user_id
    --------------------------------------
      1 |              1  |           2  |
      2 |              3  |           4  |
*/


CREATE TABLE results (
        id serial PRIMARY KEY,
        winner_user_id integer REFERENCES players(id) NOT NULL,
        loser_user_id integer REFERENCES players(id) NOT NULL
);


/*
Creates a view for the standings. Standings are sorted by total_wins
and then by total_matches:
    id | name    | wins | matches_played
    -------------------------------------
    1  | Player1 |    1 |             1
    2  | Player2 |    0 |             1
    3  | Player3 |    0 |             1
    4  | Player4 |    0 |             1
*/


CREATE VIEW standings AS
SELECT players.id, players.name,
(SELECT count(results.winner_user_id)
    FROM results
    WHERE players.id = results.winner_user_id)
    AS wins,
(SELECT count(results.id)
    FROM results
    WHERE players.id = results.winner_user_id
    OR players.id = results.loser_user_id)
    AS matches_played
FROM players
ORDER BY wins DESC, matches_played DESC;

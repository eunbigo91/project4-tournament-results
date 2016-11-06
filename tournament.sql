DROP DATABASE IF EXISTS tournament;

CREATE DATABASE tournament;

-- Connect to the newly created DB
\c tournament;

-- Create table named players
-- which has player_id as a primary key and name
CREATE TABLE players (player_id serial PRIMARY KEY, name varchar);

-- Create table named matches
-- which has match_id as a primary key,
-- winner's player_id and loser' player_id
CREATE TABLE matches (match_id serial PRIMARY KEY,
    winner integer REFERENCES players(player_id),
    loser integer REFERENCES players(player_id));

-- Create view named rankings
-- which contains player_id, name, wins and matches order by wins
CREATE VIEW rankings AS SELECT player_id, name,
    count(CASE WHEN player_id = winner then 1 END) AS wins,
    count (matches) AS matches
    FROM players
    LEFT JOIN matches ON players.player_id = matches.winner
        OR players.player_id = matches.loser
    GROUP BY players.player_id
    ORDER BY wins DESC;

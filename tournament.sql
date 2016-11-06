DROP DATABASE IF EXISTS tournament;

CREATE DATABASE tournament;

\c tournament;

create table players (player_id serial primary key, name varchar);

create table matches (match_id serial primary key, winner integer references
  players(player_id), loser integer references players(player_id));

create view rankings as select player_id, name,
    count(CASE WHEN player_id = winner then 1 END) as wins,
    count (matches) as matches
    from players
    left join matches on players.player_id = matches.winner
        or players.player_id = matches.loser
    group by players.player_id
    order by wins desc;

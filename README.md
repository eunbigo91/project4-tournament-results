# Project4: Tournament Results

This is a Python module that uses the PostgreSQL database to keep track of players and matches in a game tournament. The game tournament will use the Swiss system for pairing up players in each round: players are not eliminated, and each player should be paired with another player with the same number of wins, or as close as possible.


## Files
- tournament.sql : contains the database schema, in the form of SQL create table commands.
- torunament.py : the code of this module. This file has several functions such as countPlayers and playerStandings. Each function has a docstring that says what it does.
- tournament_test.py : contains unit tests that will test the functions I’ve written in tournament.py. You can run the test from the command line, using the command python tournament_test.py.


## Installation
1. Python
2. VirtualBox
3. Vagrant
4. Git


##Steps:
1. Install Vagrant and VirtualBox
2. Clone the fullstack-nanodegree-vm repository :
  - Run: `git clone http://github.com/udacity/fullstack-nanodegree-vm fullstack`
4. Move to the *vagrant* folder : `cd fullstack/vagrant/`
5. Using Git, clone this project:
  - Run: `git clone https://github.com/eunbigo91/project4-tournament-results.git tournament`
  - This will create a directory inside the *vagrant* directory titled *tournament*.
6. Powers on the virtual machine : `vagrant up`
7. Logs into the virtual machine : `vagrant ssh`
8. Change directory to the synced folders : `cd /vagrant/tournament`
9. Create the tournament database : psql -f tournament.sql
10. If you want to run tournament_test.py : python tournament_test.py


## Functions in tournament.py
- registerPlayer(name): Adds a player to the tournament by putting an entry in the database. The database should assign an ID number to the player. Different players may have the same names but will receive different ID numbers.

- countPlayers() : Returns the number of currently registered players. This function should not use the Python len() function; it should have the database count the players.

- deletePlayers() : Clear out all the player records from the database.

- reportMatch(winner, loser) : Stores the outcome of a single match between two players in the database.

- deleteMatches() : Clear out all the match records from the database.

- playerStandings() : Returns a list of (id, name, wins, matches) for each player, sorted by the number of wins each player has.

- swissPairings() : Given the existing set of registered players and the matches they have played, generates and returns a list of pairings according to the Swiss system. Each pairing is a tuple (id1, name1, id2, name2), giving the ID and name of the paired players. For instance, if there are eight registered players, this function should return four pairings. This function should use playerStandings to find the ranking of players.


## Copyright and License
- Project starter code contributed by Udacity Full Stack Web Developer Nanodegree Program.
- Additional code contributed by Eunbi Go.


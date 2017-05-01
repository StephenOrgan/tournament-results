# Tournament Results

Tournament Results is a project submission for the Udacity Full Stack Engineering program.  It's composed of a database schema to match pairs of players under the swiss tournament style, in addition to storing match results and standings. 

## Requirements

vagrant (latest build)


## Setup

1. Start Vagrant
2. Open Terminal and navigate to the vagrant folder
3. In the terminal type `vagrant up`
5. In the terminal type `vagrant ssh`
6. Navigate to the tournament folder (`cd /vagrant/tournament`)
7. In the terminal type `psql`
8. In the terminal type `\i tournament.sql` to import the sql contents
9. In the terminal type `\q` or Ctrl+D to quit out of PSQL
10. In the terminal type `python tournament_test.py` to run the tests file

## Expected test results:
```
1. countPlayers() returns 0 after initial deletePlayers() execution.
2. countPlayers() returns 1 after one player is registered.
3. countPlayers() returns 2 after two players are registered.
4. countPlayers() returns zero after registered players are deleted.
5. Player records successfully deleted.
6. Newly registered players appear in the standings with no matches.
7. After a match, players have updated standings.
8. After match deletion, player standings are properly reset.
9. Matches are properly deleted.
10. After one match, players with one win are properly paired.
Success!  All tests pass!
```

## GitHub
Source Code: It is available on github. Clone the project using `git clone` command or fork the project to provide contributions.
 
 ``` 
   # Clone the repository directly 
   $ git clone https://github.com/StephenOrgan/tournament-results 
   # Clone a forked repository
   $ git clone https://github.com/your-github-username/tournament-results

   ```

Twitter Bootstrap

Font-Awesome
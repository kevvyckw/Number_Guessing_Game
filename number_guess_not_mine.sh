#!/bin/bash 
# Number Guessing Game

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# generate a random variable with a 1 to 1000 range
NUMBER=$(( RANDOM%1000 +1)) 
#echo $NUMBER

MAIN() {
  echo "Enter your username:"
  read NAME
  # check if USER is in the database
  USERNAME=$($PSQL "SELECT username FROM username WHERE username='$NAME'")
  # greeting the player
  if [[ ! $USERNAME ]]
  then 
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    INSERT_USER=$($PSQL "INSERT INTO username(username) VALUES('$NAME')")
    CUSTOMER_ID=$($PSQL "SELECT username_id FROM username WHERE username='$NAME'")
    GAMES_PLAYED=0
  else 
    EXISTING_USERNAME=$($PSQL "SELECT username FROM username WHERE username='$USERNAME'")
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM username WHERE username='$USERNAME'")
    BEST_GAME=$($PSQL "SELECT best_game FROM username WHERE username='$USERNAME'")
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi
  GUESS_GAME
}

# guessing the number
GUESS_GAME() {
  COUNT=0 # number of games in this round
  echo "Guess the secret number between 1 and 1000:"
  while [[ $NUMBER -ne $USER_GUESS ]]
  do 
    read USER_GUESS
    if [[ $USER_GUESS =~ ([^0-9]+)$ ]]
    then
      echo "That is not an integer, guess again:"
      #((COUNT++))
      #((GAMES_PLAYED++))
    else
      if [[ $NUMBER -lt $USER_GUESS ]]
      then
        echo "It's lower than that, guess again:"
        ((COUNT++))
        #((GAMES_PLAYED++))
      elif [[ $NUMBER -gt $USER_GUESS ]]
      then
        echo "It's higher than that, guess again:"
        ((COUNT++))
        #((GAMES_PLAYED++))
      elif [[ $NUMBER -eq $USER_GUESS ]] 
      then
        ((COUNT++))
        ((GAMES_PLAYED++))
        echo "You guessed it in $COUNT tries. The secret number was $NUMBER. Nice job!"
        # check if best_game exists
        if [[ ! $BEST_GAME ]]
        then
          INSERT_BEST_GAME=$($PSQL "UPDATE username SET best_game=$COUNT WHERE username='$USERNAME'")
          INSERT_GAMES_PLAYED=$($PSQL "UPDATE username SET games_played=$GAMES_PLAYED WHERE username='$USERNAME'")
        elif [[ $COUNT -lt $BEST_GAME ]]
        then
          INSERT_BEST_GAME=$($PSQL "UPDATE username SET best_game=$COUNT WHERE username='$USERNAME'")
          INSERT_GAMES_PLAYED=$($PSQL "UPDATE username SET games_played=$GAMES_PLAYED WHERE username='$USERNAME'")
        else
          #INSERT_BEST_GAME=$($PSQL "UPDATE customers SET best_game=$COUNT WHERE customer_id=$CUSTOMER_ID")
          INSERT_GAMES_PLAYED=$($PSQL "UPDATE username SET games_played=$GAMES_PLAYED WHERE username='$USERNAME'") 
        fi
      fi
    fi
  done
}

MAIN

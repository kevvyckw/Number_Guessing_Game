#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess --tuples-only -c"

MAIN_MENU(){ 
#Prompt the user for a username 
echo "Enter your username:"
read USERNAME

#Random Number Generator
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
SECRET_NUMBER_FORMATTED=$(echo $SECRET_NUMBER | sed 's/^ *//')
echo $SECRET_NUMBER

#check if username has been used before
USERNAME_EXIST=$($PSQL "SELECT username FROM username WHERE username='$USERNAME'")
USERNAME_EXIST_FORMATTED=$(echo $USERNAME_EXIST | sed 's/^ *//')
if [ -z "$USERNAME_EXIST" ]
then
  #if username has not been used before
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  echo "Guess the secret number between 1 and 1000:"
  read NEW_USER_GUESS
  
  
  until [[ $NEW_USER_GUESS == $SECRET_NUMBER ]]
  do 
    #if guess is not an integer
    if ! [[ "$NEW_USER_GUESS" =~ ^[0-9]+$ ]]; 
    then
      echo "That is not an integer, guess again:"
      read NEW_USER_GUESS
    else
      NUMBER_OF_GUESSES=1
      #if guess is an integer
      if (( $NEW_USER_GUESS != $SECRET_NUMBER ))
      then
        let "NUMBER_OF_GUESSES+=1"
        #if guess lower than secret number
        if (( $NEW_USER_GUESS > $SECRET_NUMBER ))
        then
          echo "It's lower than that, guess again:"
          read NEW_USER_GUESS
        #if guess high than secret number
        else
          echo "It's higher than that, guess again:"
          read NEW_USER_GUESS
        fi
      fi
    fi
  done
  #if guess is secret number
  NUMBER_OF_GUESSES_FORMATTED=$(echo $NUMBER_OF_GUESSES | sed 's/^ *//')
  LATEST_USERNAME_ID=$($PSQL "SELECT MAX(username_id) FROM username")
  INSERT_NEW_USER_SCORE=$($PSQL "INSERT INTO username(username_id, username, games_played, best_game) VALUES($LATEST_USERNAME_ID + 1, '$USERNAME', 1, $NUMBER_OF_GUESSES)")
  echo "You guessed it in $NUMBER_OF_GUESSES_FORMATTED tries. The secret number was $SECRET_NUMBER_FORMATTED. Nice job!"
 
else
  #if username has been used before
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM username WHERE username='$USERNAME'")
  GAMES_PLAYED_FORMATTED=$(echo $GAMES_PLAYED | sed 's/^ *//')
  BEST_GAME=$($PSQL "SELECT best_game FROM username WHERE username='$USERNAME'")
  BEST_GAME_FORMATTED=$(echo $BEST_GAME | sed 's/^ *//')
  echo "Welcome back, $USERNAME_EXIST_FORMATTED! You have played $GAMES_PLAYED_FORMATTED games, and your best game took $BEST_GAME_FORMATTED guesses."
  echo "Guess the secret number between 1 and 1000:"
  read EXISTING_USER_GUESS

  until [[ $EXISTING_USER_GUESS == $SECRET_NUMBER ]]
  do
    #if guess is not an integer
    if ! [[ "$EXISTING_USER_GUESS" =~ ^[0-9]+$ ]]; 
    then
      echo "That is not an integer, guess again:"
      read EXISTING_USER_GUESS
    else
      NUMBER_OF_GUESSES=1    
      #if guess is an integer
      if (( $EXISTING_USER_GUESS != $SECRET_NUMBER ))
      then
        let "NUMBER_OF_GUESSES+=1"
        #if guess lower than secret number
        if (( $EXISTING_USER_GUESS > $SECRET_NUMBER ))
        then
          echo "It's lower than that, guess again:"
          read EXISTING_USER_GUESS
        #if guess high than secret number
        else
          echo "It's higher than that, guess again:"
          read EXISTING_USER_GUESS
        fi
      fi
    fi
  done
  #if guess is secret number
  NUMBER_OF_GUESSES_FORMATTED=$(echo $NUMBER_OF_GUESSES | sed 's/^ *//')
  UPDATE_GAMES_PLAYED=$($PSQL "UPDATE username SET games_played = $GAMES_PLAYED + 1 WHERE username = '$USERNAME'")
  UPDATE_BEST_GAME=$($PSQL "UPDATE username SET best_game = $NUMBER_OF_GUESSES WHERE username = '$USERNAME' AND best_game > $NUMBER_OF_GUESSES")
  echo "You guessed it in $NUMBER_OF_GUESSES_FORMATTED tries. The secret number was $SECRET_NUMBER_FORMATTED. Nice job!"
fi
}

EXIT(){
echo -e "\nThank you for stopping in.\n"

}

MAIN_MENU

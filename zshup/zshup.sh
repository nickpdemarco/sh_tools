#!/bin/zsh
# see ANONYMOUS FUNCTIONS in zsh - note the argument being passed ($1) at the close of th function
() {
  if [ "$#" -ne 1 ]; then
  	echo "Usage:. zshup <some parent directory of current path>"
  	exit 1
  fi

  local MY_PWD="`( cd \"$MY_PWD\" && pwd )`"  
  if [ -z "$MY_PWD" ] ; then
    echo "Unknown error occured. Failed to acquire current working directory (pwd). There may be a permissions error"
    exit 1  # fail
  fi
  
  local PWD_ARR
  PWD_ARR=("${(@s|/|)MY_PWD}") # See http://stackoverflow.com/questions/105721/how-do-i-move-to-end-of-line-in-vim
  local DEST_PATH=""
  for i in "${PWD_ARR[@]}"; do
      if [[ $i = *[!\ ]* ]]; then # if the line has any non-whitespace
  		  DEST_PATH="$DEST_PATH/$i" # add to the destination path
  		  if [ "$i" = "$1" ]; then # if we find the given pathname
  			cd $DEST_PATH 
  		  fi
  		fi
  done
} $1


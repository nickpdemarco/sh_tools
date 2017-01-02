#!/bin/zsh

if [ "$#" -ne 1 ]; then
	echo "Usage:. zshup <some parent directory of current path>"
	exit 1
fi

MY_PWD="`( cd \"$MY_PWD\" && pwd )`"  
if [ -z "$MY_PWD" ] ; then
  exit 1  # fail
fi

PWD_ARR=("${(@s|/|)MY_PWD}")
DEST_PATH=""
for i in "${PWD_ARR[@]}"; do
    if [[ $i = *[!\ ]* ]]; then # if the line has any non-whitespace
		  DEST_PATH="$DEST_PATH/$i" # add to the destination path
		  if [ "$i" = "$1" ]; then # if we find the given pathname
		  	cd $DEST_PATH 
		  fi
		fi
done

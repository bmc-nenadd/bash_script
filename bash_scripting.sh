#!/bin/bash
#
# Author: Nenad Dimitrijevic
# Date: 21.12.2021
# 
#
# Description: The following script rename all files in a given directory 
# 			   whit user-defined directory, prefix and suffix
#
# Run Information: ./bash_scripting.sh $1 $2 $3 $4
#					Example: 
#							./bash_scripting.sh /home/nenad/Desktop/test/ audiofile wav wav 
#
#
# Version: 1
#
#

directory=$1
name=$2
suffix1=$3
suffix2=$4

current_date=$(date "+%Y-%m-%d")
new_name=$2_$current_date


cd "$directory" || exit 1

##########
# this line is for testing 
###########
#touch $directory/test{0001..00010}.wav


FILES=$directory*$suffix1
i=1
for f in $FILES
do
  if [ -f "$f" ]
  then
    echo "Processing $f file..."
    j=$( printf $"%03d" "$i" )
    mv "$f" "$new_name""_""$j.$suffix2"
    (( i++ ))    
  else
    echo "Warning: Some problem with \"$f\""
  fi
done
#!/bin/bash



# Aaron Cumming
# 10/27/2025
# CS 310
# Simple Program for rewriting echo


# Main program                                            

noNewLine=False
escapes=False


# Get the options
while getopts ":ne" option; do
   case $option in
      n) # no new line
         noNewLine=True;;
      e) # interpret escape sequences
         escapes=True;;
   esac
done


# Shift away parsed options so $1 points to the input string
shift $((OPTIND - 1))

# get the input string
input_str="$*"

if [ "$noNewLine" == True ] && [ "$escapes" == True ]; then
    printf "%b" "$input_str"

elif [ "$noNewLine" == False ] && [ "$escapes" == True ]; then
    printf "%b\n" "$input_str"

elif [ "$noNewLine" == True ] && [ "$escapes" == False ]; then
    printf "%s" "$input_str"

else
    printf "%s\n" "$input_str"
fi
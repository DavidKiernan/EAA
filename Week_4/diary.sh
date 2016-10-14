#!/bin/bash

# gets user input
read line

# reads the line into diary.txt
echo $(  date ) $line >> $HOME/EAA/Week_4/diary.txt

# Alternative syntax
# or echo `date` $line >> diary.txt
# >> redirect append symbol
# $( cmd ) execute the command
# diaryFile = diary.txt
# $line >> diaryFile

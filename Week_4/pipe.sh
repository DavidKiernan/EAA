#!/bin/bash

# ls | more  is chaining the ls cmd with more will show list files page by page # can pipe one cmd with another and another untill pleased
# creates a new command

# ps -ef displays information on the running process
# grep mysql searches for the word mysql
# This new cmd lists all the running process and searches for the process that
# contains mysql string
ps -ef | grep mysql

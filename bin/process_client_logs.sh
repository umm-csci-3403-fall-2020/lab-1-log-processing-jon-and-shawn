#!/usr/bin/env bash

# This script takes a directory as a argument. This directory is assumed
# to contain the un-tarred and un-gzipped log files for a single client.
# Then the script will process the log files and generate an intermediate file
# called failed_login_data.txt

  directory=$1
  
  cd "$directory"

# Gather contents of all the log files in current directory using cat
  for FILE in /var/log/*
  do
    cat "$FILE" >> failed_login_data.txt
  done 

# Extract the appropriate columns from the relevant lines, piping them
# to a command that removes the minutes and seconds from all the times


# Redirect the output to the file failed_login_data.txt

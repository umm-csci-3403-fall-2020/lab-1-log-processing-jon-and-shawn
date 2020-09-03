#!/usr/bin/env bash

# This script takes a directory as a argument. This directory is assumed
# to contain the un-tarred and un-gzipped log files for a single client.
# Then the script will process the log files and generate an intermediate file
# called failed_login_data.txt

  directory=$1

# Gather contents of all the log files in current directory using cat

# Extract the appropriate columns from the relevant lines, piping them
# to a command that removes the minutes and seconds from all the times


# Redirect the output to the file failed_login_data.txt
cat "$directory"/var/log/* | awk '/Failed password/ {print $1,$2,$3,$9,$11,$13}' | sed -E 's/:\w+:\w+//' | sed -E 's/ invalid| [0-9]{4,5}//' > failed_login_data.txt

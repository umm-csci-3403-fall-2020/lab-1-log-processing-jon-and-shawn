#!/usr/bin/env bash

  directory=$1

  here=$(pwd)

  cd "$directory" || exit

# Sort and then use awk to extract the third column of the file
  sort -k 3 -- */failed_login_data.txt | awk '{print $3}' | 

# Use uniq to count occurences of a specific hours and then use awk to print the hour and number of occurences accordingly
  uniq -c | awk '{print "data.addRow([\x27" $2 "\x27, " $1 "]);"}' | sort |

# Call wrap_contents.sh to wrap file passed in through the pipe and hour_dist footer and header
# Finally to create file called hours_dist.html
  "$here"/bin/wrap_contents.sh - "$here"/html_components/hours_dist hours_dist.html

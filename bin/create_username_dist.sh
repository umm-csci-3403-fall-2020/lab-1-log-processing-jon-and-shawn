#!/usr/bin/env bash

  directory=$1

  here=$(pwd)

  cd "$directory" || exit

# Gather the contents of the failed_login_data.txt file and extract the username columns.                               # Then count how many times each user name appears 
  sort -k 4 -- */failed_login_data.txt |
  awk '{print $4}' | 
  uniq -c |
  awk '{print "data.addRow([\x27" $2 "\x27, " $1 "]);"}' | sort |
# Wrap contents and create username_dist.html file
  "$here"/bin/wrap_contents.sh - "$here"/html_components/username_dist username_dist.html

#!/usr/bin/env bash

  directory=$1

  cd "$directory" || exit

# Gather the contents of the failed_login_data.txt file and extract the username columns.                               # Then count how many times each user name appears 

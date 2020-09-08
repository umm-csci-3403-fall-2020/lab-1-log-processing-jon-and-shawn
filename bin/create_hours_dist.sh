#!/usr/bin/env bash

    directory=$1

    here=$(pwd)

    cd "$directory" || exit



# Gather the contents of the failed_login_data.txt file and extract the hour columns.                               # Then count how many times each hour appears
sort -k 3 -- */failed_login_data.txt | awk '{print $3}' | uniq -c | awk '{print "data.addRow([\x27" $2 "\x27, " $1 "]);"}' | sort > tempHours.txt

"$here"/bin/wrap_contents.sh tempHours.txt "$here"/html_components/hours_dist hours_dist.html

#!/usr/bin/env bash

# Gather the contents of the failed_login_data.txt file and extract the hour columns.                               # Then count how many times each hour appears
sort -k 4 */failed_login_data.txt | awk '{print $4}' | uniq -c | awk '{print "data.addRow([\x27" $2 "\x27, " $1 "]);"}' | sort > tempHours.txt

"$here"/bin/wrap_contents.sh tempHours.txt "$here"/html_components/hou_dist username_dist.html

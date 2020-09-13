#!/usr/bin/env bash

 directory=$1

 here=$(pwd)

 cd "$directory" || exit

 #Collects the content of country, hours, username dist and wraps them in an html header and footer.  Places them into failed_login_summary.html

 cat country_dist.html hours_dist.html username_dist.html > failed_login_summary.txt

 "$here"/bin/wrap_contents.sh failed_login_summary.txt "$here"/html_components/summary_plots failed_login_summary.html

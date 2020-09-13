#!/usr/bin/env bash

  here=$(pwd)

  directory=$1

  cd "$directory" || exit

# Sort country_IP_map.txt file to use later
  sort "$here"/etc/country_IP_map.txt

# Extract IP addresses and sort them  
  sort -k 5 -- */failed_login_data.txt | awk '{print $5}' | sort |

# Join two files together using goin then print the second column which is the country 
  join -1 1 -2 1 - "$here"/etc/country_IP_map.txt | awk '{print $2}' | sort |

# Use uniq to count occurances of country names then using awk print the country followed by occurences of that country
  uniq -c | awk '{print "data.addRow([\x27" $2 "\x27, "$1"]);"}' |

# Call execuatable wrap_contents.sh to wrap take in a file through the pipe and country_dist header and footer
# Finally name the finished wrap file country_dist.html
  "$here"/bin/wrap_contents.sh - "$here"/html_components/country_dist country_dist.html

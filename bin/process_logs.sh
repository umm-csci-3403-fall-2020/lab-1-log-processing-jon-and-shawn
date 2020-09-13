#!/usr/bin/env bash

# Takes a list of gzipped tar files from the command line

  here=$(pwd)

  tempDir=$(mktemp -d)

  for FILE in "$@"
  do
	basename=$(basename -s .tgz "$FILE")
	dirName=$(echo "$basename" | awk -F '_' '{print $1}')
	mkdir "$tempDir"/"$dirName"

	tar -xvf "$FILE" -C "$tempDir"/"$dirName"
	bin/process_client_logs.sh "$tempDir"/"$dirName"
  done
	cd "$here" || exit

	bin/create_username_dist.sh "$tempDir" 
	bin/create_hours_dist.sh "$tempDir" 
	bin/create_country_dist.sh "$tempDir" 
	bin/assemble_report.sh "$tempDir" 

	mv "$tempDir"/failed_login_summary.html "$here"

#!/usr/bin/env bash

  here=$(pwd)
  
# Creates a temporary directory
  tempDir=$(mktemp -d)

# Takes a list of gzipped tar files from the command line and loops through them 
  for FILE in "$@"
  do
#	Strips extraneous pieces off of the file name to create a subdirectory to separate computer specific logs
	basename=$(basename -s .tgz "$FILE")
	dirName=$(echo "$basename" | awk -F '_' '{print $1}')
	mkdir "$tempDir"/"$dirName"

#	Untars and zips the files into the created directory
	tar -xvf "$FILE" -C "$tempDir"/"$dirName"

#	Calls process_client_logs.sh
	bin/process_client_logs.sh "$tempDir"/"$dirName"
  done
#	Returns us back from the temp directory which we entered while processing client logs
	cd "$here" || exit

#	Runs the necessary scripts to create failed_login_summary.html
	bin/create_username_dist.sh "$tempDir" 
	bin/create_hours_dist.sh "$tempDir" 
	bin/create_country_dist.sh "$tempDir" 
	bin/assemble_report.sh "$tempDir" 

#	Moves failed_login_summary.html from out of the temp directory and back to where the rest of the files are
	mv "$tempDir"/failed_login_summary.html "$here"

#!/usr/bin/env bash

# Takes a list of gzipped tar files from the command line

tempDir=$(mktemp -d)

for FILE in $1 $2 $3 $4 $5 $6
do
	tar -xvf $FILE
done

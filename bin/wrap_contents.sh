#!/usr/bin/env bash

# Script that takes three arguments and combines the three files together.
# The last argument is the new name for the combination of the three files.

# Assigning descriptive names to the first three arguments that will be taken in
   unwrappedFile=$1
   contents=$2
   wrappedFile=$3


# Assigning descriptive names to files
   header="$contents"_header.html
   footer="$contents"_footer.html

# Combining three files to create a file called my_chart.ht
  cat "$header" "$unwrappedFile" "$footer" > "$wrappedFile"

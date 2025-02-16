#!/bin/bash

#############################
# Author - Siren
# Username - SirenSun732
# Date - 15-02-2025
#############################

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
	echo "Usage: $0 <filesdir><searchstr>"
	exit 1
fi

filesdir="$1"
searchstr="$2"

# Check if filesdir is a directory
if [ ! -d "$filesdir" ]; then
	echo "Error: $filesdir is not a directory"
	exit 1
fi

# Init counters
file_count=0
matching_lines=0

# Function to recursively search files
    find_files() {
      find "$1" -type f -print0 | while IFS= read -r -d $'\0' file; do
        ((file_count++))
        local line_count=0
        while IFS= read -r line; do
          if [[ "$line" == *"$searchstr"* ]]; then
            ((line_count++))
          fi
        done < "$file"
        ((matching_lines+=line_count))
      done
    }

    # Call the function to search files
    find_files "$filesdir"

    # Print the results
    echo "The number of files are $file_count and the number of matching lines are $matching_lines"



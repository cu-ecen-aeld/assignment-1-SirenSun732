#!/bin/bash

    # Check if the correct number of arguments is provided
    if [ $# -ne 2 ]; then
      echo "Usage: $0 <writefile> <writestr>"
      exit 1
    fi

    # Assign arguments to variables
    writefile="$1"
    writestr="$2"

    # Create the directory if it doesn't exist
    mkdir -p "$(dirname "$writefile")"

    # Write the string to the file, overwriting if it exists
    echo -n "$writestr" > "$writefile"

    # Check if the file was created successfully
    if [ ! -f "$writefile" ]; then
      echo "Error: Could not create file '$writefile'"
      exit 1
    fi

#!/bin/bash

# Function to show usage

show_help() 

{
    echo "Usage:mygrep.sh [option] [file name]"
    echo "try mygrep.sh --help for more information "
    exit 0
}

option()

{
	echo "option"
	echo "-n : show line numbers"
	echo "-v : Invert match (show lines that don't match)"
	exit 0
}


# Check if --help is provided

if [[ "$1" == "--help" ]]; then
	option
    
fi

# Initialize options

show_line_number=false
invert_match=false

# read options

while getopts ":nv" opt; do
  case $opt in
    n)
      show_line_number=true
      ;;
    v)
      invert_match=true
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      option
      ;;
  esac
done

# Remove parsed options from arguments

shift $((OPTIND -1))

# Check for sufficient arguments

if [ $# -lt 2 ]; then
    echo "Error: Missing search string or filename."
    show_help
fi

search_word="$1"
file_name="$2"

# Check if file exists

if [ ! -f "$file_name" ]; then
    echo "Error: File '$file_name' not found."
    exit 1
fi

# Read file line by line

line_number=0
while IFS= read -r line
do
    line_number=$((line_number + 1))
    
    # Perform case-insensitive match
    if echo "$line" | grep -i -q -- "$search_word"; then
        match=true
    else
        match=false
    fi

    # Handle inverted match
    
    if $invert_match; then
        match=$(! $match && echo true || echo false)
    fi

    
# Print line if match condition is satisfied
    
	if [ "$match" = true ]; then
        if $show_line_number; then
            echo "${line_number}:${line}"
        else
            echo "$line"
        fi
    fi

done < "$file_name"

exit 0

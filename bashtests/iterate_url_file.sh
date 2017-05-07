#!/bin/bash

# Print Usage and exit
usage() {
    echo "Usage: $0 [-c <command>] <url.list>" 1>&2
    echo "" 1>&2
    echo "example:" 1>&2
    echo "  $0 -c wget my_url.list" 1>&2
    exit 1
}

# URL variables
MY_URL_1="http://www."
MY_URL_2=".com/"

# Default command
command=echo

# Get the options
while getopts ":s:c:" o; do
    case "${o}" in
        c)
            command=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))


# Check that a file was specified
if [ -z "$1" ]; then
    usage
fi

# Check that the file exists
if [ ! -f "$1" ]; then
    echo "$0: $1: file not found" 1>&2
    exit 1
fi

# Iterate over every line in the file
for i in $( cat $1 ); do
    $command "$MY_URL_1""$i""$MY_URL_2"
done

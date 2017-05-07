#!/bin/bash

# Print Usage and exit
usage() {
    echo "Usage: $0" '[-c <command>] [-x "<x_min> <x_increment> <x_max>"] [-y "<y_min> <y_increment> <y_max>"]' 1>&2
    echo "" 1>&2
    echo "attention:" 1>&2
    echo "  This script must be tunned by editing the URL variables" 1>&2
    exit 1
}

# URL variables
# FINAL_URL = MY_URL_1 + X + MY_URL_2 + Y + MY_URL_3
MY_URL_1="http://www.mywebsite.com/q?folder_number="
MY_URL_2="&other_parameters=1234&file_number="
MY_URL_3="&even_more_parameters=0/"

# Default parameters
command=echo
x="1 1"
y="1 1"

# Get the options
while getopts ":s:c:x:y:" o; do
    case "${o}" in
        c)
            command=${OPTARG}
            ;;
        x)
            x=${OPTARG}
            ;;
        y)
            y=${OPTARG}
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
for X in `seq $x`; do
    for Y in `seq $y`; do
        $command "$MY_URL_1$X$MY_URL_2$Y$MY_URL_3"
    done
done

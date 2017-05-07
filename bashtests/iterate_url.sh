#!/bin/bash

usage() {
    echo "Usage: $0 [-c <command>] <url.list>" 1>&2
    echo "" 1>&2
    echo "example:" 1>&2
    echo "  $0 -c wget my_url.list" 1>&2
    exit 1
}

MY_URL_1="http://www."
MY_URL_2=".com/"

command=echo

while getopts ":s:c:" o; do
    case "${o}" in
        s)
            s=${OPTARG}
            ((s == 45 || s == 90)) || usage
            ;;
        c)
            command=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))



if [ -z "$1" ]; then
    usage
fi

if [ ! -f "$1" ]; then
    echo "$0: $1: file not found" 1>&2
    exit 1
fi

for i in $( cat $1 ); do
    $command "$MY_URL_1""$i""$MY_URL_2"
done

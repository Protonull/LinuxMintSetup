#!/bin/sh

# This lets you update the timestamp of the previous commit to a specific date.

# Usage: sh amend-at-time.sh <timestamp>
# Use https://www.epochconverter.com/ to calculate the timestamp (in seconds, not milliseconds!)

# DO NOT CHANGE ANYTHING BELOW!

if ! (echo "$1" | grep -qE '^-?[0-9]+$'); then
    echo "That is not a valid timestamp! ($1)"
    exit 1
fi

(GIT_AUTHOR_DATE="$1" GIT_COMMITTER_DATE="$1" git commit --date "$1" --amend)

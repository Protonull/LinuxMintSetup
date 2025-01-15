#!/bin/sh

# This lets you make a commit with a specific date. You will then be asked to
# input a commit message in your configured git editor.

# Usage: sh commit-at-time.sh <timestamp>
# Use https://www.epochconverter.com/ to calculate the timestamp (in seconds, not milliseconds!)

# DO NOT CHANGE ANYTHING BELOW!

if ! (echo "$1" | grep -qE '^-?[0-9]+$'); then
    echo "That is not a valid timestamp! ($1)"
    exit 1
fi

(GIT_AUTHOR_DATE="$1" GIT_COMMITTER_DATE="$1" git commit --date "$1")

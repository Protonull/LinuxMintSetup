#!/bin/sh

# This lets you cherrypick a commit, but ensures the author and commit dates
# are both at the time of the cherrypick.

# Usage: sh cherrypick-as-now.sh <commit hash>

# DO NOT CHANGE ANYTHING BELOW!

git cherry-pick "$1"

DATE_NOW="$(date +'%Y-%m-%dT%H:%M:%S')"

export GIT_AUTHOR_DATE="$DATE_NOW"
export GIT_COMMITTER_DATE="$DATE_NOW"
git commit --amend --no-edit --date "$GIT_AUTHOR_DATE"

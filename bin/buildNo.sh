#!/usr/bin/env bash

#get count of commits in current branch
COUNT=`git rev-list --count HEAD`

# get branch name
BRANCH=`git rev-parse --abbrev-ref HEAD`

if [ "$BRANCH" = "master" ]
then
  echo $COUNT
else
  # get first letter of branch
  BRANCH=`git rev-parse --abbrev-ref HEAD |  head -c1`
  echo $BRANCH$COUNT
fi
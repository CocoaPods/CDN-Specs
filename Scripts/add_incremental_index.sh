#!/bin/sh

# Get the changed files from the last 5 commits |
# Cut those down back to `Specs/5/2/f/BugBattle` |
# cd to that folder, and pipe `ls` into an index.txt

git diff --name-only HEAD HEAD~5 Specs | cut -d / -f 1,2,3,4,5 | xargs -I {} bash -c 'cd "{}"; ls -1 | grep -v "index.txt" > index.txt' 

# Loops through all known Podspec folders and pipes their name into a single all_pods.txt 
# in the root.
find . -mindepth 5 -maxdepth 5 -type d -not -wholename '**/.git/**/*' | cut -c15- | sort > all_pods.txt

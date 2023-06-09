#! /bin/bash

# git branch -r | grep -v '\->' | sed "s,\x1B\[[0-9;]*[a-zA-Z],,g" | while read remote; do git branch --track "${remote#origin/}" "$remote"; done



git branch -r | grep -v '\->' | sed "s,\x1B\[[0-9;]*[a-zA-Z],,g" | awk -F/ '{
    operation = "git branch --track " $2 $0
    print "执行: " operation
    system(operation)
}'

#!/usr/bin/env bash

currentDir=$(dirname $0)
cd $currentDir

source ./utils/help-fn.sh

if file_contains ~/.ssh/config "coxx"; then
    echo count:$count
fi

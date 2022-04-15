#!/bin/bash

openf () {
	# fdfind . ./ | fzf -m | sed 's!\/!\\!g' | xargs -d "\n" cmd.exe /C start "";
    files=$(fdfind . ./ | fzf -m | sed 's!\/!\\!g') 
    while read -r fname; do
        echo "Opening file : $fname"
        echo $fname  | xargs -d "\n" cmd.exe /C start "";
    done <<< "$files"
}

if [ $# -lt 1 ]
then
    openf;
else
    cmd.exe /C start "" "$1";
fi


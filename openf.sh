#!/bin/bash
openf () {
	# fdfind . ./ | fzf -m | sed 's!\/!\\!g' | xargs -d "\n" cmd.exe /C start "";
    files=$(fdfind . ./ | fzf -m | sed 's!\/!\\!g') 
    while read -r fname; do
        echo "Opening file : $fname"
        echo $fname  | xargs -d "\n" cmd.exe /C start "";
    done <<< "$files"
}
openf

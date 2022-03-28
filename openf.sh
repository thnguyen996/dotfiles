#!/bin/bash
openf () {
	fdfind . ./ | fzf | sed 's!\/!\\!g' | xargs -d "\n" cmd.exe /C start "";
}
openf

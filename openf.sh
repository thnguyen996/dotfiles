#!/bin/bash
openf () {
	fd . ./ | fzf | sed 's!\/!\\!g' | xargs -d "\n" cmd.exe /C start "";
}
openf

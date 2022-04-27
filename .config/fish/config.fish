if status --is-interactive
    # set -U fish_user_paths "$HOME/anaconda3/bin" $fish_user_paths
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
    eval $HOME/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

# Aliases:
    alias vi="nvim"
    alias openf="~/openf.sh"
    alias ide="~/tmux_ide.sh"
    alias config="git --git-dir=$HOME/dotfiles --work-tree=$HOME"
    alias gradient="ssh -Y -i ~/.ssh/labpc th.nguyen@gradientday.yonsei.ac.kr"
    alias gradientf="bash ~/port-forward.sh"
    alias gradient_mount="sshfs -o IdentityFile=~/.ssh/home_key -o ssh_command='ssh -J thnguyen@goodday.yonsei.ac.kr:80' th.nguyen@gradientday.yonsei.ac.kr:/home/th.nguyen/ ~/gradient"
    alias gr="git remote add origin"
    alias ga="git add"
    alias gm="git commit -m"
    alias gp="git push origin master"
    alias cit="papers list --no-key --field title author | fzf | xargs -d '\n' papers list --fuzzy -t | clip.exe && powershell.exe Get-Clipboard "
    alias cia="papers list --no-key --field author | fzf | xargs -d '\n' papers list --fuzzy -a | clip.exe && powershell.exe Get-Clipboard" 
    alias pr="pr -t -m"
    alias trash="trash-put"
    if test -d /mnt/g/My\ Drive/
        alias drive="cd /mnt/g/My\ Drive/"
        alias paper="cd /mnt/g/My\ Drive/papers"
    else
        alias drive="cd /mnt/e/My\ Drive/"
        alias paper="cd /mnt/e/My\ Drive/papers"
    end

    fish_vi_key_bindings

    set PATH "$HOME/.npm-global/bin:$PATH"
    set PATH $HOME/.local/bin $PATH
    set -x SHELL /bin/bash
    bind -M insert \cf accept-autosuggestion

    if test -d $HOME/.linuxbrew
        set AUTOJUMP_PATH $HOME/.linuxbrew/share/autojump/autojump.fish \
        && source "$HOME/.linuxbrew/opt/fzf/shell/key-bindings.fish"
    else
        set AUTOJUMP_PATH /usr/share/autojump/autojump.fish
    end

    if test -e $AUTOJUMP_PATH
        source $AUTOJUMP_PATH
    end

    if test -d /mnt/c/Windows/
        set -x DISPLAY (awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
        set LIBGL_ALWAYS_INDIRECT 1
    end
end

function fish_user_key_bindings
	fzf_key_bindings
end

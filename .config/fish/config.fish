if status --is-interactive
    # set -U fish_user_paths "$HOME/anaconda3/bin" $fish_user_paths
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
    eval /home/th.nguyen/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

# Aliases:
    alias vi="nvim"
    alias openf="xdg-open"
    alias ide="~/tmux_ide.sh"
    alias config="git --git-dir=$HOME/dotfiles --work-tree=$HOME"
    alias gr="git remote add origin"
    alias ga="git add"
    alias gm="git commit -m"
    alias gp="git push origin master"
    fish_vi_key_bindings

    set PATH "$HOME/.npm-global/bin:$PATH"
    set -x SHELL /bin/bash
    bind -M insert \cf accept-autosuggestion

    set --local AUTOJUMP_PATH /home/th.nguyen/.linuxbrew/share/autojump/autojump.fish
    if test -e $AUTOJUMP_PATH
        source $AUTOJUMP_PATH
    end

# Key bindings
# ------------
    source "/home/th.nguyen/.linuxbrew/opt/fzf/shell/key-bindings.fish"

# Commands to run in interactive sessions can go here
end

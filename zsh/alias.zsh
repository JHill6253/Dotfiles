#!/usr/bin/env zsh
alias reload='source ~/.zshrc'
alias cat="bat"
alias pipenv-list='for venv in ~/.local/share/virtualenvs/* ; do basename $venv; cat $venv/.project | sed "s/\(.*\)/\t\1\n/" ; done'
alias f='cd $(fd --type directory | fzf)'
alias ls='eza'
alias ll='eza -alh'
alias tree='eza --tree'
alias tgig='touch .gitignore;'
alias pn='pnpm'
alias pni='pnpm install'
alias pnu='pnpm update'
alias pnlp='pnpm m ls --depth -1 --json'
if command -v bat > /dev/null; then
    alias cat='bat'
fi

alias kys="tmux kill-server"
alias tmuxa="tmux attach-session -t"
alias tmuxl="tmux list-sessions"

alias vi="nvim"
#-------Locations--------
alias repos="cd $HOME/Repos/"
alias dotf="cd $HOME/dotfiles/"
alias conf="cd $HOME/.config"
alias bin="cd $HOME/bin/"
alias am="zsh $HOME/bin/scripts/am.sh"
alias icloud="cd $HOME/Library/Mobile\ Documents/com~apple~CloudDocs"
#-------Web dev----------
alias rmnm="rm -r node_modules"
#alias .f=cd ~/dotfiles
#alias lazyvim="NVIM_APPNAME=lazyvim nvim"
#alias lvi="NVIM_APPNAME=lazyvim nvim"

alias gcs='gh copilot suggest'
alias gce='gh copilot explain'

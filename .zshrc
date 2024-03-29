OS="`uname`"
DOTFILES=$HOME/dotfiles
ZSH_DIR=$DOTFILES/zsh
export PATH=/opt/homebrew/bin:$PATH
ZSH_THEME="powerlevel10k/powerlevel10k"

source_if_exists () {
    if test -r "$1"; then
        source "$1"
    fi
}

#source_if_exists $DOTFILES/zsh/alias.zsh
#source_if_exists $DOTFILES/zsh/p10k.zsh


if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

alias vi="nvim"

# Set vars

# plugins=(git nvm python macos)


# User configuration
bindkey -v
export EDITOR='nvim'
if [ $OS = "Linux" ]; then
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
fi

eval "$(zoxide init zsh)"



# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/p10k.zsh ]] || source ~/p10k.zsh



# Paths
PATH="$PATH:$(python3 -m site --user-base)/bin"
export SCRIPTS="$HOME/.local/bin/scripts"
export PATH="$PATH:$SCRIPTS"
export GEM_HOME="$HOME/.gem"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Source zsh crap
# write for loop to source zsh files in directory

for file in $ZSH_DIR/zsh-plugs/*.zsh; do
  source $file
done
source ~/powerlevel10k/powerlevel10k.zsh-theme
source $DOTFILES/zsh/zsh-plugs/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $DOTFILES/zsh/zsh-plugs/fzf-dir-navigator/fzf-dir-navigator.zsh

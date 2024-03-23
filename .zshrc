OS="`uname`"
DOTFILES=$HOME/dotfiles
export PATH=/opt/homebrew/bin:$PATH
ZSH_THEME="powerlevel10k/powerlevel10k"

source_if_exists () {
    if test -r "$1"; then
        source "$1"
    fi
}

source_if_exists $DOTFILES/zsh/alias.zsh
source_if_exists $DOTFILES/zsh/p10k.zsh
source_if_exists $DOTFILES/bin/scripts/np.sh


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
export NVM_DIR="$HOME/.nvm"
export SCRIPTS="$HOME/.local/bin/scripts"
export PATH="$PATH:$SCRIPTS"


[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
source ~/powerlevel10k/powerlevel10k.zsh-theme
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

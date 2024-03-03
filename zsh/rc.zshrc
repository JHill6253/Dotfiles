if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# Set vars 
OS="`uname`"
export PATH=/opt/homebrew/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git nvm python macos)

source $ZSH/oh-my-zsh.sh

# User configuration
bindkey -v
export EDITOR='nvim'
source ~/.zsh_profile
if [ $OS = "Linux" ]; then 
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
fi

eval "$(zoxide init zsh)"



# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Load alias 
dir="$HOME/alias"

# Check if the directory exists in the path
if [[ -d "$dir" ]]; then
    # If it does, source every file that starts with .alias and ends with .zsh
    for file in "$dir"/.alias*.zsh; do
        if [[ -f "$file" ]]; then
            source "$file"
        fi
    done
else
    echo "Directory $dir does not exist."
fi


# Paths
export PATH="$PATH:/home/john/.dotnet/"
PATH="$PATH:$(python3 -m site --user-base)/bin"
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

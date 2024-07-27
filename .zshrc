export ZSH="$HOME/.oh-my-zsh"
export PATH=/opt/homebrew/bin:$PATH
export THEME_COLOR="cat-mac"

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob=!{.git,.svn,node_modules,.azure,Trash,Library,.local,Movies,Music,cache,.docker}'

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
source_if_exists () {
    if test -r "$1"; then
        source "$1"
    fi
}
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


plugins=(git nvm python macos web-search )

source_if_exists $ZSH/oh-my-zsh.sh
source_if_exists $HOME/zsh/alias.zsh

[[ -f ~/.config/p10k/p10k.zsh ]] && source ~/.config/p10k/p10k.zsh
# User configuration
bindkey -v
export EDITOR='nvim'

eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"

# Paths
export SCRIPTS="$HOME/bin/"
export PATH="$PATH:$SCRIPTS"
export PATH="$PATH:$HOME/.local/bin"
export GEM_HOME="$HOME/.gem"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

autoload -U add-zsh-hook

load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc
# add bin to path
for file in $HOME/bin/*; do
    export PATH=$PATH:$file
done

global-colors "cat-moc"


source ~/powerlevel10k/powerlevel10k.zsh-theme
source $HOME/zsh/zsh-plugs/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Created by `pipx` on 2024-07-02 02:49:35
export PATH="$PATH:/Users/johnhill/.local/bin"

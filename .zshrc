# Load PATH and other sensitive stuff
(. $HOME/.zshenv)

# --> ZSH guts configuration

# append completions to fpath
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
fpath=($HOME/.config/zsh/completions $fpath)

# set autocomplete and colors plugins
autoload -Uz compinit && compinit
autoload -U colors && colors

# Set autocd option
setopt autocd

# Set VI mode for ZSH
bindkey -v

# Ctrl-R and Ctrl-S are used to navigate throughout the history
bindkey ^R history-incremental-search-backward 
bindkey ^S history-incremental-search-forward

# --> Set of exports (all but paths, which are stored in .zshenv)
## -- Prompts
# Disabled, because I use starship instead
# export PROMPT="└─> "
# export RPROMPT="%B[%F{red}%?%F{reset}]%b"

## -- Editors
export EDITOR=hx
export VISUAL=hx

# --> Set of aliases
alias reload-zsh="source $HOME/.zshrc"
alias cat="bat --theme TwoDark"
alias world="cd $HOME/World"
alias ll="ls -lG"
alias la="ls -alG"
alias gbr="git branch --show-current"
alias gfe="git fetch -a"
alias gpl="git pull"
alias gph="git push"
alias gco="git checkout"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias edit-alacritty-config="hx $HOME/.config/alacritty/alacritty.toml"
alias brew-all-new="brew update && brew upgrade && brew autoremove"
alias edit="hx"

# Set starship on the last line
eval "$(starship init zsh)"

# Set fuzzyfinder(fzf)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

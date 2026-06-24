#
# --------------------------------------------------------
# My Aliases
# --------------------------------------------------------
#
# Aliases General
 alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
 alias cat=$(command -v 'batcat' || command -v 'bat')
 alias copy='rsync -a --stats --progress'
 alias vim=nvim
 alias please='sudo'
 alias pa='php artisan'
 alias nf="neofetch_info"
 alias tn="tmux new-session -A -s Main"
 alias reload-zsh="source ~/.zshrc"
 alias gotozshrc="nvim ~/.zshrc"
 alias gotoalias="nvim ~/.aliases.zsh"
 alias gotoalacritty="nvim ~/.config/alacritty/alacritty.toml"
 alias cls="clear"
 alias weather="curl http://wttr.in/"

# ---- Eza (better ls) -----
alias ls="eza -l --icons=always"
#  Detailed listing
alias ll='eza -lh --icons --git'
#  Detailed listing including hidden files
alias la='eza -lah --icons --git'
#  Tree view
alias tree='eza --tree --icons'

# Reuse ls completions for eza(avoids defining a separate competion function
compdef eza=ls

# Show/hide hidden files in Finder
 alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
 alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Print each PATH entry on a separate line
 alias path='echo -e ${PATH//:/\\n}'

# git specific
 alias gs="git status"
 alias glog="git log"
 alias gaa="git add ."
 alias gcm="git commit"
 alias gch="git checkout $1"
 alias gp="git pull"
 alias gd="git diff"
 alias gpush="git push $1 $2"

# ---- Core Utilities -----
alias grep='rg --color=auto'
alias diff='diff --color=auto'
alias df='df -h'

# Docker specific
 alias dclean_containers="cleanup_docker_containers"
 alias dclean_images="cleanup_docker_images"
 alias dcb="docker compose build"
 alias dcu="docker compose up $1"
 alias dcd="docker compose down"
 alias dcps="docker compose ps"
 alias dclog="docker compose logs -f"
 alias dps="docker ps"
 alias dls="docker container ls $1"
 alias dils="docker image ls $1"
 alias dvls="docker volume ls"
 alias dnls="docker network ls"

# python specific
 alias python="python3"
#alias python=/usr/local/bin/python3.7
#alias python=/usr/local/bin/python3.10

# ---- Functions -----
#
## Creating and entering directories
 function take {
   mkdir -p $1
   cd $1
 }

## Show a directory listing when using 'cd'
function cd() {
	# if no arguments are passed, it goes to HOME
	builtin cd "${1:-$HOME}" || return
	# Checks if we are on MacOS or Linux to use the right flags
	if [[ "$OSTYPE" == "darwin"* ]]; then
		# macOS/BSD
		ls -G -lhF
	else
		# Linux/GNU
		ls -lhF --color=auto --time-style=long-iso --ignore=lost+found
	fi
}

## extract
function extract () {
  if [ -f "$1" ] ; then
    case "$1" in
      *.tar.bz2)   tar xvjf "$1"    ;;
      *.tar.gz)    tar xvzf "$1"    ;;
      *.tar.xz)    tar xvf "$1"     ;;
      *.bz2)       bzip2 -d "$1"    ;;
      *.rar)       unrar x "$1"     ;;
      *.gz)        gunzip "$1"      ;;
      *.tar)       tar xf "$1"      ;;
      *.tbz2)      tar xjf "$1"     ;;
      *.tgz)       tar xzf "$1"     ;;
      *.zip)       unzip "$1"       ;;
      *.Z)         uncompress "$1"  ;;
      *.7z)        7z x "$1"        ;;
      *.ace)       unace x "$1"     ;;
      *)           echo "'$1' não pode ser extraído via extract()" ;;
    esac
  else
    echo "'$1' não é um arquivo válido"
  fi
}

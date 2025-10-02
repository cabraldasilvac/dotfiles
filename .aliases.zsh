#
# --------------------------------------------------------
# My Aliases
# --------------------------------------------------------
#
# Aliases
 alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
 alias cat=$(command -v 'batcat' || command -v 'bat')
 alias copy='rsync -a --stats --progress'
 alias vim=nvim
 alias please='sudo'
 alias pa='php artisan'
 alias nf="neofetch_info"
 alias tn="tmux new-session -A -s Main"

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
#
#

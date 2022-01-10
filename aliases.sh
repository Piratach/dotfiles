### General aliases ###
alias smlnj="sml"

# repeat last command with sudo
# have to fix error message upon startup
# alias fu="sudo $(fc -ln | tail -n2 | head -n1)"

alias tmux="tmux -2"

## i3 aliases ###
alias config="vim ~/.i3/config"
alias pconfig="vim ~/.config/polybar/config"
# alias rconfig="vim ~/.config/rofi/config.ras"
alias rconfig="vim $HOME/.config/rofi/launchers/colorful/launcher.sh"
alias xupdate="xrdb -merge ~/.Xresources"

### Git aliases ###
alias gi="git init"
alias gs="git status -sbu"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gp="git push"
alias gf="git fetch"
alias gm="git merge"
alias ga="git add ."
alias gpl="git pull"
alias gst="git stash"
alias gstl="git stash list"
alias glg='git log --graph --oneline --decorate --all'
alias gitpom="git push -u origin main"

### tmux aliases ###
alias tmux-ks="tmux kill-server"

### C/C++ Compiler Aliases ###
# this uses g++ and gcc instead of macOS's clang
alias g++="g++-9"
alias gcc="gcc-9"
alias remake="make clean; make"

### Python Aliases ###

### Personal Folder Aliases -- update to fit needs ###
alias repos="cdf ~/repos"

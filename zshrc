# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/Piratach/.oh-my-zsh"

# Pure
fpath+=("$HOME/.zsh/pure")
autoload -U promptinit; promptinit

# change the path color
zstyle :prompt:pure:path color white

prompt pure

# fasd, for theme
eval "$(fasd --init auto)"

# For history command output
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd" # the most logical format :-)

# other optional plugins: osx, brew
# too many plugins can slow down startup time
plugins=(git z zsh-autosuggestions extract)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=59'

source $ZSH/oh-my-zsh.sh

# User configuration

# Alias and Functions
# Recommended directory $ZSH_CUSTOM/
source $HOME/.zsh_scripts
source $HOME/.aliases

alias c='fasd_cd -d'

# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Some paths added due to local problems -- ignore
export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python3.7/dist-packages/
export PATH=/usr/local/smlnj/bin:$PATH
export TERM=xterm-256color
export PATH=$PATH:/usr/local/go/bin


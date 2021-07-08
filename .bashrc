################################################################################
# Important
################################################################################

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Needed for gpg-agent
export GPG_TTY=$(tty)

################################################################################
# Aliases
################################################################################

# 3 characters = too much typing
alias v='vim'

# 6 characters is also too much typing
alias r='ranger'

# Update all pip packages
alias pip-update='pip list -o --format=freeze | ./.scripts/pip-update.awk'

# Colorful less
alias less='less -R'

# Colorful ls
alias ls='ls --color=always'

# Colorful long ls w/ hidden files
alias ll='ls --color=always -lAh'

# Colorful long ls w/o hidden files
alias lsl='ls --color=always -lh'

# Always run df with -h
alias df='df -h'

# Always run du with -h
alias du='du -h'

# Load .Xresources
alias xup='xrdb ~/.Xresources'

# Dotfiles bare repo
alias dot='/usr/bin/git --git-dir=$HOME/.files --work-tree=$HOME'

################################################################################
# Shell Prompt (starship)
################################################################################

# Set prompt (disabled for now)
# if [ `command -v starship` ]
# then
#   eval "$(starship init bash)"
# else
#  PS1='\[\e[1m\]\u@\h \W$ \[\e[0m\]'
# fi

################################################################################
# Other Stuff
################################################################################

# For fzf completions
source /usr/share/bash-completion/completions/fzf
source /usr/share/fzf/key-bindings.bash

# Configure fuck
eval "$(thefuck --alias)"

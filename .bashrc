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

# Show maximum gpg key info
alias keys='gpg --list-keys --fingerprint --fingerprint --keyid-format=long'

# Dotfiles bare repo
alias dot='git --git-dir="$HOME/.files" --work-tree="$HOME"'

################################################################################
# Other Stuff
################################################################################

# For fzf completions
if [[ -e "/usr/share/bash-completion/completions/fzf" &&
        -e "/usr/share/fzf/key-bindings.bash" ]]
then
    source /usr/share/bash-completion/completions/fzf
    source /usr/share/fzf/key-bindings.bash
fi

# Configure fuck
if [[ $(command -v thefuck) ]]
then
    eval "$(thefuck --alias)"
fi

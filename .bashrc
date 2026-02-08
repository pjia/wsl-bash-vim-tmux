# ~/.bashrc: simplified for Go and AI-assisted coding

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# History settings
HISTCONTROL=ignoredups:erasedups
HISTSIZE=2000
HISTFILESIZE=4000
shopt -s checkwinsize

# Color support for ls and grep
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto --binary-files=without-match --exclude-dir .git --exclude tags --exclude *.swp'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Basic aliases
alias ll='ls -alh'
alias la='ls -A'
alias l='ls -CF'
alias tmux="TERM=screen-256color-bce tmux"

# Git branch prompt
current_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

YELLOW='\[\033[0;33m\]'
CYAN='\[\033[0;36m\]'
RESET='\[\033[0m\]'

export PS1="$YELLOW\u@\\H:\\w$CYAN\$(current_git_branch)$YELLOW->$RESET "

# Go environment
export GOPATH=$HOME/go
export PATH="$PATH:/local/tools:/usr/local/go/bin:$GOPATH/bin"

# Enable programmable completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

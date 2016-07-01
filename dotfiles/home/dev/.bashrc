# .bashrc

[ -z "$PS1" ] && return

## Set Locale
LANG="en_US.UTF-8"
LANGUAGE="en_US:en"
LC_MONETARY="en_US.UTF-8"
LC_PAPER="en_US.UTF-8"
LC_NAME="en_US.UTF-8"
LC_ADDRESS="en_US.UTF-8"
LC_TELEPHONE="en_US.UTF-8"
LC_MEASUREMENT="en_US.UTF-8"
LC_IDENTIFICATION="en_US.UTF-8"

## CMD Alias
alias ..="cd .."
alias ...="cd ../.."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
alias ..6="cd ../../../../../.."
alias ..7="cd ../../../../../../.."
alias vcb="vim +BundleClean! +BundleInstall! +qall!"
alias v="vim"
alias vi="vim"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alF'
alias la='ls -lhSrta'
alias l='ls -CF'
alias lt='ls -lrt'
alias cnt='ls -l ./|grep -v ^l|wc -l'

# Source global definitions
if [ -f /etc/bashrc ]; then
            . /etc/bashrc
fi

# enable bash completion in interactive shells
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

export GOPATH='/go'

export PATH="$PATH:$GOPATH/bin"

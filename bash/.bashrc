# -*- mode: sh -*-

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

if [ $(uname) == 'Linux' ]; then
    source ~/.linux.sh
else
    source ~/.mac.sh
fi

# setup cdpath
export CDPATH=.:$HOME/code

green="\[\033[0;32m\]"
blue="\[\033[0;34m\]"
purple="\[\033[0;35m\]"
reset="\[\033[0m\]"

# Change command prompt
export GIT_PS1_SHOWDIRTYSTATE=1
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
export PS1="$purple\u$blue \w$green\$(__git_ps1) \n$ $reset"

# Aliases
alias be='bundle exec'
alias ec='emacsclient -tty'

# gpg

if [ -f ~/.gnupg/.gpg-agent-info ] && [ -n "$(pgrep gpg-agent)" ]; then
    source ~/.gnupg/.gpg-agent-info
    export GPG_AGENT_INFO
else
    eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
fi

blowport() {
    lsof -ti tcp:$1 | xargs kill
}

alias ls='ls --color=auto'

export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin

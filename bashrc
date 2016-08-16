[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# Postgres
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# Path for homebrew (/usr/local/[s]bin)
PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Set up rbenv for Homebrew. Make sure path is BEFORE Homebrew's /usr/local/[s]bin
#To enable shims and autocompletion add to your profile:
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Cask
export PATH=/Users/benjamin/.cask/bin:$PATH

test -f ~/.git-completion.sh && . $_

green="\[\033[0;32m\]"
blue="\[\033[0;34m\]"
purple="\[\033[0;35m\]"
reset="\[\033[0m\]"

# Change command prompt
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
export PS1="$purple\u$blue \w$green\$(__git_ps1) \n$ $reset"

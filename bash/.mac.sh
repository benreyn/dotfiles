# stop macOS from telling me to switch zsh
export BASH_SILENCE_DEPRECATION_WARNING=1

# Postgres
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# Path for homebrew (/usr/local/[s]bin)
PATH=/usr/local/bin:/usr/local/sbin:$PATH

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# asdf version manager
# . $(brew --prefix asdf)/asdf.sh
# . $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash


## zshrc - Steve Urban ##

## SHELL OPTIONS ##

setopt autocd
# Changes directory when path entered without cd

setopt correct
# Spell checker, `correct 'x' to 'y' [nyae]`
# n=no; y=yes; a=abort; e=edit


## SOURCE ##

source $HOME/.zsh/aliases
# Executes file


## SHELL VARIABLES/PARAMETERS ##

# Save command history
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=2000
SAVEHIST=5000
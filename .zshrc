## zshrc - Steve Urban ##

## SHELL OPTIONS ##

# Changes directory when path entered without cd
setopt autocd

# Spell checker
# Usage: `correct 'x' to 'y' [nyae]`
# n=no; y=yes; a=abort; e=edit
setopt correct


## SOURCE ##

source $HOME/.zsh/aliases # Executes file


## SHELL VARIABLES/PARAMETERS ##

# Save command history
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
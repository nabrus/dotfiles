## zshrc - Steve Urban ##

## SHELL OPTIONS ##

setopt AUTO_CD # Change dir when path entered without cd command

setopt CORRECT # Spell checker
# Usage: `correct 'x' to 'y' [nyae]?`
# n=no, execute as is; y=yes, correct and execute;
# a=abort; e=edit, returns to the prompt

setopt NO_CASE_GLOB # Set globbing and tab-completion to be case-insensitive
# Note: Globbing refers to the expansion of wildcard
# characters.

# History #
setopt EXTENDED_HISTORY # Add timestamps to history `: <beginning time>:<elapsed seconds>;<command>`
setopt SHARE_HISTORY # Share history across multiple zsh sessions
setopt HIST_IGNORE_ALL_DUPS # Removes older command in history list when command being added is a duplicate
setopt HIST_REDUCE_BLANKS # Removes blank lines from history
setopt HIST_FIND_NO_DUPS # Ignore dups when searching
setopt HIST_VERIFY # `!!` Shows history expanded command before executing


## SOURCE ##

for file in $HOME/.zsh/*; source $file # Executes all files in .zsh dir using a short form `for` loop


## SHELL VARIABLES/PARAMETERS ##

# Save command history
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=10000 # Lines remembered per session
SAVEHIST=10000 # Lines stored in history file


# >>>>>>>>>>>>>>>>>>>>>>>> zshrc - Steve Urban <<<<<<<<<<<<<<<<<<<<<<<<< #


## SHELL OPTIONS ##

setopt AUTO_CD # Change dir when path entered without cd command

setopt CORRECT # Spell checker
# Usage: `correct 'x' to 'y' [nyae]?`
# n=no, execute as is; y=yes, correct and execute;
# a=abort; e=edit, returns to the prompt

setopt CORRECT_ALL # Correct spelling on all arguments.

# Globbing #
# Note: Globbing refers to the expansion of wildcard characters.
setopt EXTENDED_GLOB 
# Expands basic globbing by adding use of qualifiers enclosed in parentheses at the end of filename generation.
setopt NO_CASE_GLOB 
# Set globbing and tab-completion to be case-insensitive

# History #
setopt EXTENDED_HISTORY     # Add timestamps to history `: <beginning time>:<elapsed seconds>;<command>`
setopt SHARE_HISTORY        # Share history across multiple zsh sessions
setopt HIST_IGNORE_ALL_DUPS # Removes older command in history list when command being added is a duplicate
setopt HIST_REDUCE_BLANKS   # Removes blank lines from history
setopt HIST_FIND_NO_DUPS    # Ignore dups when searching
setopt HIST_VERIFY          # `!!` Shows history expansion before executing
setopt HIST_SAVE_NO_DUPS    # Omits old commands that duplicate new from hist file  


## SHELL VARIABLES/PARAMETERS ##

# Save command history
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=10000 # Lines remembered per session
SAVEHIST=20000 # Lines stored in history file


## SOURCE ##

# Load all files in .zsh dir to current shell using a short form `for` loop
for file in $HOME/.zsh/*; source $file 


## KEY BINDINGS ##

bindkey $'^[[A' up-line-or-search    # Up arrow
bindkey $'^[[B' down-line-or-search  # Down arrow


## COMPLETION ##

#------------------------------------------------------# 
# The following lines were added by compinstall        #
#------------------------------------------------------#

# Partial completion suggestions
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' list-suffixes true

# List with color
zstyle ':completion:*' list-colors ''

# Case insensiive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]}'

# Enable completion selection with arrow keys (added post compinstall)
zstyle ':completion:*' menu select

zstyle :compinstall filename '/Users/sju/.zshrc'

# Load completion
autoload -Uz compinit && compinit

#------------------------------------------------------#
# End of lines added by compinstall                    #
#------------------------------------------------------#


## EXTENSIONS/PLUG-INS ##

# zsh-autosuggestions #

# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
if [[ -r ~/code/shell_projects/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then 
   source ~/code/shell_projects/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# zsh-syntax-highlighting #

# **NOTE** load this AT THE END, according to the docs.
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
if [[ -r ~/code/shell_projects/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
     source ~/code/shell_projects/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
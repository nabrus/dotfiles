# >>>>>>>>>>>>>>>>>>>>>>>> zshrc - Steve Urban <<<<<<<<<<<<<<<<<<<<<<<<< #

## ENVIRONMENT VARIABLES ##

# Use ANSI color sequences to distinguish file types
export CLICOLOR=1
# Sets which colors to use
export LSCOLORS=GxFxCxDxBxegedabagaced


## SHELL OPTIONS ##

setopt AUTO_CD # Change dir when path entered without cd command

setopt CORRECT # Spell checker
# Usage: `correct 'x' to 'y' [nyae]?`
# n=no, execute as is; y=yes, correct and execute;
# a=abort; e=edit, returns to the prompt

# Disabled `CORRECT_ALL` below to avoid unwanted correction of arguments, paths, and filenames
# setopt CORRECT_ALL # Correct spelling on all arguments.

# Globbing #
# Note: Globbing refers to the expansion of wildcard characters.
setopt EXTENDED_GLOB 
# Expands basic globbing by adding use of qualifiers enclosed in parentheses at the end of filename generation.
setopt NO_CASE_GLOB 
# Make filename globbing case-insensitive

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
HISTSIZE=60000 # Maximum events kept in the internal history list
SAVEHIST=50000 # Maximum events saved to the history file


## SOURCE ##

# Load all files in .zsh dir to current shell using a `for` loop
for file in "$HOME"/.zsh/*.zsh(N); do
    source "$file"
done


## KEY BINDINGS ##

bindkey $'^[[A' up-line-or-search    # Up arrow
bindkey $'^[[B' down-line-or-search  # Down arrow


## COMPLETION ##
# Initially generated with compinstall; maintained manually

# Partial completion suggestions
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' list-suffixes true

# Display completion lists with color
zstyle ':completion:*' list-colors ''

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]}'

# Enable completion selection with arrow keys (manual change)
zstyle ':completion:*' menu select

# Load completion
autoload -Uz compinit && compinit


## EXTENSIONS/PLUG-INS ##

# **NOTE** Create a `.zsh_plugins` directory for new system setup.

# zsh-autosuggestions #
# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
if [[ -r ~/.zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then 
   source ~/.zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# zsh-syntax-highlighting #
# **NOTE** Load this AT THE END, according to the docs.
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
if [[ -r ~/.zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
   source ~/.zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

## ALIASES ##

# 'dotfiles' git repo shortcut.
alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfgFiles/ --work-tree=$HOME'
# Replaces the regular `git` command to use `dotfiles` instead to
# interact with the config files repository from any location. 
# It also configures the `--bare` repo, setting `$HOME` as the work tree
# and stores Git state at `.cfgFIles`.

# Shortcuts
alias ll='ls -lhF'    # (F) puts `/` for directory, `@` for symbolic link, etc.
alias lla='ls -lhaF'  # (l) long, (h) human readable, (a) all
alias ds='du -sh'     # Get a directory's size: du -sh [ directory-name ]
alias cl='clear'
alias del='rm -ri'    # Remove recursively with confirmation
alias g='git'
alias x='exit'

# Homebrew
alias tapkeg='brew update && brew upgrade'
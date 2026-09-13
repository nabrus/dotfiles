## ALIASES ##

# 'dotfiles' shortcut for the bare Git repository.
alias dotfiles='git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'
# Use `dotfiles` in place of `git` when managing tracked dotfiles.
# Git repository metadata is stored in ~/.dotfiles.git with $HOME as the work tree.

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

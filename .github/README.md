# dotfiles #

This repo contains my (`.`) files—configurations, shortcuts, etc.

#### A `--bare` Git repo used for initial setup ####

```zsh
git init --bare $HOME/<.dir_name>
```
*  Initializes a bare git repo, creating a directory.

```zsh
alias <alias_name>='/usr/bin/git --git-dir=$HOME/<.dir_name>/ --work-tree=$HOME'
```
*  Creates an alias to use instead of the regular `git` command when interacting with dotfiles repo. Also sets `$HOME` as the work tree and stores git state at created directory.

```zsh
<alias_name> config --local status.showUntrackedFiles no
```
*  Hide files not explicitly tracked.

Add the alias to `.zshrc` or `.bashrc`.
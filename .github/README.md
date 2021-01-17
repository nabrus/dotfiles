# dotfiles #

This repo contains my (`.`) files—configurations, shortcuts, etc.

#### A `--bare` Git repo used for initial setup following these steps: ####

*  Initialize a bare git repo:
```zsh
git init --bare $HOME/<.dir_name>
```

*  Create an alias to use instead of the regular `git` command when interacting with the dotfiles repo. Also sets `$HOME` as the work tree and stores git state at created directory:
```zsh
alias <alias_name>='/usr/bin/git --git-dir=$HOME/<.dir_name>/ --work-tree=$HOME'
```

*  Hide files not explicitly tracked:
```zsh
<alias_name> config --local status.showUntrackedFiles no
```

*  Add the alias to `.zshrc` or `.bashrc`.
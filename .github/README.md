# dotfiles #

This repo contains my (`.`) files—configurations, shortcuts, etc.

My setup for storing and managing these *dotfiles* is following Nicola Paolucci's tutorial on Atlassian [The best way to store your dotfiles: A bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles). See [Starting From Scratch](#starting-from-scratch) below for initial setup of this technique if not already tracking your configuration files. 


##  How to install on a new system ## 

*  Prior to installation, to avoid weird recursion issues, make sure the source repository ignores the folder where you'll clone it. Add it to the current global `.gitignore` file:
```zsh
echo ".cfgFiles" >> .gitignore
```

*  Clone dotfiles into a **bare** repository in a "dot" folder on your `$HOME`:
```zsh
git clone --bare https://github.com/nabrus/dotfiles.git $HOME/.cfgFiles
```


## Starting From Scratch ##

#### A `--bare` Git repo used for initial setup following these steps: ####

Requires [Git](https://git-scm.com)

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
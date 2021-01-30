# dotfiles #

This repo contains my (`.`) files—configurations, shortcuts, etc.

My setup for storing and managing these *dotfiles* is following Nicola Paolucci's tutorial on Atlassian [The best way to store your dotfiles: A bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles). See [Starting From Scratch](#starting-from-scratch) below for initial setup of this technique if not already tracking your configuration files. 


##  How to install on a new system ## 

*  Prior to installation, to avoid weird recursion issues, make sure the source repository ignores the folder where you'll clone it. Add it to the current global `.gitignore` file on the new machine:
```zsh
echo ".cfgFiles" >> .gitignore
```

*  Now clone this *dotfiles* repo using the `--bare` flag into a "dot" folder in `$HOME`:
```zsh
git clone --bare https://github.com/nabrus/dotfiles.git $HOME/.cfgFiles
```

*  Next, define the alias in the current shell scope:
```zsh
alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfgFiles/ --work-tree=$HOME'
```

*  Then, set the flag `showUntrackedFiles` to 'no'. Local configuration to ignore all untracked files.
```zsh
dotfiles config --local status.showUntrackedFiles no
```

*  Lastly, run the `checkout` command to restore working tree files::
```zsh
dotfiles checkout
```

You may receive the following error message with this final step:
```zsh
error: The following untracked working tree files would be overwritten by checkout:
    .zshrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting
```

Back up the files if important then remove them. Finally re-run `dotfiles checkout`.

All finished, use the alias to manage dotfiles with git commands like so:
```zsh
dotfiles status
dotfiles add .eslintrc
dotfiles commit -m "Add eslintrc"
dotfiles push
dotfiles pull
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
# dotfiles #

This repo contains my (`.`) files—configurations, shortcuts, etc.

My setup for storing and managing these *dotfiles* is following Nicola Paolucci's tutorial on Atlassian, [The best way to store your dotfiles: A bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles).

*Note*: For first-time setup instructions of this technique, if not already tracking your configuration files, see [Starting From Scratch](#starting-from-scratch) below.

##  How to install on a new system ## 

*  Prior to installation, to avoid any strange recursion issues, make sure the source repository ignores the folder where you'll clone it. Add it to the current global `.gitignore` file on the new machine:
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

*  Lastly, run the `checkout` command to restore working tree files:
```zsh
dotfiles checkout
```

You may receive an error message with this final step, for example:
```zsh
error: The following untracked working tree files would be overwritten by checkout:
    .zshrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting
```

Back up the files if important then remove them. Finally re-run `dotfiles checkout`.

**All finished!** 

Use the alias to manage dotfiles with git commands like so:
```zsh
dotfiles status
dotfiles add .eslintrc
dotfiles commit -m "Add eslintrc"
dotfiles push
dotfiles pull
```
## VS Code Setup ##

After cloning this repo, the user settings file will now be in the `.vscode` directory. Be sure to do the following.

*  Remove existing default json file:
```zsh
rm ~/Library/Application\ Support/Code/User/settings.json
```

*  Symlink default path to the files new location:
```zsh
ln -s ~/.vscode/settings.json ~/Library/Application\ Support/Code/User
```

See the VS Code [README](https://github.com/nabrus/dotfiles/tree/main/.vscode) for more editor info.

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
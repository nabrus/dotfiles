# dotfiles #

This repo contains my (`.`) files—configurations, shortcuts, etc.

My setup for storing and managing these *dotfiles* is following Nicola Paolucci's tutorial on Atlassian, [The best way to store your dotfiles: A bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles).

*Note*: For first-time setup instructions of this technique, if not already tracking your configuration files, see [Starting From Scratch](#starting-from-scratch) below.

## Prerequisites ##

This configuration is designed for an Apple Silicon Mac.

Before installing the dotfiles, make sure the following are installed:

* Apple Command Line Tools (provides Git for the initial setup)

```zsh
xcode-select --install
```

* [Homebrew](https://brew.sh) installed at `/opt/homebrew`

##  How to install on a new system ##

Before installing, check for any existing dotfiles that may conflict with files tracked by this repository. The checkout step will not overwrite conflicting untracked files; back up or merge any existing configuration you want to keep.

Now clone this *dotfiles* repo using the `--bare` flag into a "dot" folder in `$HOME`:

```zsh
git clone --bare https://github.com/nabrus/dotfiles.git $HOME/.dotfiles.git
```

Next, define the `dotfiles` alias in the current shell scope:

```zsh
alias dotfiles='git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'
```

Then, set `showUntrackedFiles` to `no`. This local repository configuration hides untracked files from `dotfiles status`:

```zsh
dotfiles config --local status.showUntrackedFiles no
```

Next, run `checkout` to restore the tracked dotfiles into `$HOME`:

```zsh
dotfiles checkout
```

You may receive an error if existing files in `$HOME` would be overwritten by the checkout, for example:

```zsh
error: The following untracked working tree files would be overwritten by checkout:
    .zshrc
    .gitconfig
Please move or remove them before you can switch branches.
Aborting
```

Back up or rename any conflicting files you want to keep, then re-run:

```zsh
dotfiles checkout
```

### Local Git Configuration ###

The tracked `.gitconfig` includes `~/.gitconfig.local` for machine-specific Git configuration. This file is intentionally not tracked by the dotfiles repository.

Create `~/.gitconfig.local` and add the appropriate Git identity:

```ini
[user]
    name = nabrus
    email = 34988577+nabrus@users.noreply.github.com
```

### Zsh Plugins ###

The `~/.zsh_plugins` directory is intentionally not tracked by the dotfiles repository. Create the directory and install the plugins used by `.zshrc`:

```zsh
mkdir -p ~/.zsh_plugins
```

Install `zsh-autosuggestions`:

```zsh
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh_plugins/zsh-autosuggestions
```

Install `zsh-syntax-highlighting`:

```zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh_plugins/zsh-syntax-highlighting
```

### Verify Shell Environment ###

After restoring the dotfiles and installing the Zsh plugins, open a new Terminal session to load the restored shell configuration.

Verify that Homebrew and the Homebrew-installed Git are being used:

```zsh
which brew
which git
git --version
```

Expected paths:

```text
/opt/homebrew/bin/brew
/opt/homebrew/bin/git
```

**All finished!** 

Use the `dotfiles` alias in place of `git` when managing files tracked by the dotfiles repository:

```zsh
dotfiles status
dotfiles add .zshrc
dotfiles commit -m "Update zsh configuration"
dotfiles push
dotfiles pull
```

## VS Code Setup ##

The VS Code user settings file is tracked at `~/.vscode/settings.json`. VS Code normally stores this file under `~/Library/Application Support/Code/User/`, so a symbolic link is used to connect the native VS Code location to the tracked dotfiles version.

Before creating the symbolic link, check whether a settings file already exists:

```zsh
ls -la ~/Library/Application\ Support/Code/User/settings.json
```

If an existing `settings.json` is present, back it up or merge any settings you want to keep before continuing.

Create the symbolic link:

```zsh
ln -s ~/.vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
```

See the VS Code [README](https://github.com/nabrus/dotfiles/tree/main/.vscode) for more editor information.

## Starting From Scratch ##

#### A `--bare` Git repo used for initial setup following these steps: ####

Requires [Git](https://git-scm.com)

NOTE: Replace `<.dir_name>` and `<alias_name>` with the desired repository directory and command alias.

* Initialize a bare Git repository:

```zsh
git init --bare $HOME/<.dir_name>
```

* Create an alias to use instead of the regular `git` command when interacting with the dotfiles repository.This sets `$HOME` as the work tree and stores the Git repository metadata in the chosen directory:

```zsh
alias <alias_name>='git --git-dir=$HOME/<.dir_name> --work-tree=$HOME'
```

* Hide untracked files from the repository's `status` output:

```zsh
<alias_name> config --local status.showUntrackedFiles no
```

* Add the alias to your shell configuration.

## Maintenance ##

### Zsh Plugins ###

The plugins in `~/.zsh_plugins` are separate Git repositories and are not updated by the dotfiles repository.

Update `zsh-autosuggestions`:

```zsh
cd ~/.zsh_plugins/zsh-autosuggestions
git pull
```

Update `zsh-syntax-highlighting`:

```zsh
cd ~/.zsh_plugins/zsh-syntax-highlighting
git pull
```

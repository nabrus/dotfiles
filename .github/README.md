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

### Configure Remote Branch Tracking ###

A bare clone does not automatically create the normal remote-tracking branch
configuration used by a standard Git clone. Configure the `origin` remote so
fetched branches are stored under `refs/remotes/origin/`:

```zsh
dotfiles config remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*'
```

This setting tells Git how branches fetched from `origin` should be represented locally. The value is a `refspec` (reference specification): a mapping between remote references and local references. In this case, branches under `refs/heads/` on the remote are mapped to remote-tracking references under `refs/remotes/origin/` locally. For example:

```text
refs/heads/main → refs/remotes/origin/main
```

This creates the normal `origin/main` remote-tracking reference Git uses to keep track of the last fetched state of the remote `main` branch.

Now fetch from `origin` to apply this mapping and create the remote-tracking references:

```zsh
dotfiles fetch origin
```

Set `origin/main` as the upstream branch for the local `main` branch:

```zsh
dotfiles branch --set-upstream-to=origin/main main
```

This allows Git to compare the local `main` branch with `origin/main` and report
whether the local branch is ahead, behind, or up to date.

Verify the tracking configuration:

```zsh
dotfiles branch -vv
```

A correctly configured branch should show `origin/main` as its upstream:

```text
* main <commit> [origin/main] <commit message>
```

If the local branch contains commits that have not been pushed, the relationship
will also be shown:

```text
* main <commit> [origin/main: ahead 1] <commit message>
```

The same relationship can be checked with:

```zsh
dotfiles status
```

For example:

```text
On branch main
Your branch is ahead of 'origin/main' by 1 commit.
```

### Restore Tracked Dotfiles ###

Run `checkout` to restore the tracked dotfiles into `$HOME`:

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

Third-party Zsh plugins are installed manually in `~/.zsh_plugins` and are not
tracked by this dotfiles repository.

Plugins are maintained by the [zsh-users](https://github.com/zsh-users) organization:

- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

Create the plugin directory:

```zsh
mkdir -p ~/.zsh_plugins
```

Clone `zsh-autosuggestions`:

```zsh
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh_plugins/zsh-autosuggestions
```

Clone `zsh-syntax-highlighting`:

```zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh_plugins/zsh-syntax-highlighting
```

The plugins are sourced by `.zshrc` when their respective plugin files are present.

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

The VS Code user settings file is tracked at `~/.vscode/settings.json`. On macOS, VS Code normally stores this file under `~/Library/Application Support/Code/User/`, so a symbolic link connects the native VS Code location to the tracked dotfiles version.

Before creating the symbolic link, check whether a settings file already exists:

```zsh
ls -la ~/Library/Application\ Support/Code/User/settings.json
```

If an existing `settings.json` is present, review it and save or merge any settings that should be kept before continuing.

Once any existing settings have been preserved, remove the existing file:

```zsh
rm ~/Library/Application\ Support/Code/User/settings.json
```

Create a symbolic link from VS Code's user settings location to the tracked dotfiles configuration:

```zsh
ln -s ~/.vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
```

Verify the symbolic link:

```zsh
ls -l ~/Library/Application\ Support/Code/User/settings.json
```

The output should show that VS Code's `settings.json` points to the tracked file:

```text
settings.json -> /Users/<username>/.vscode/settings.json
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

* Create an alias to use instead of the regular `git` command when interacting with the dotfiles repository. This sets `$HOME` as the work tree and stores the Git repository metadata in the chosen directory:

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

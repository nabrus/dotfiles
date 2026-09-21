# Visual Studio Code Settings #

## Command Line Setup for macOS ##

Running VS Code from the terminal by typing the `code` command.

#### This functionality needs to be added to your PATH ####

*  Open the **Command Palette** (Shift-Cmd-P), type `shell command`, and run the `Shell Command: Install 'code' command in PATH` command.

*  The new `$PATH` value will take effect with a new terminal session.

**Or** add to your PATH manually in `.zprofile`:

```zsh
# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
```

Check out [Visual Studio Code on macOS](https://code.visualstudio.com/docs/setup/mac) for more info.

## Installed Extensions ##

*  [Night Owl](https://marketplace.visualstudio.com/items?itemName=sdras.night-owl): theme by Sarah Drasner
*  [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker): Spelling checker for source code by Street Side Software
*  [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python): Python language support by Microsoft

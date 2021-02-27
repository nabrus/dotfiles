# Visual Studio Code Settings #

## Command Line Setup for macOS ##

Running VS Code from the terminal by typing the `code` command.

#### Adding to your PATH ####

*  In the **Command Palette** (shift+cmd+P), type `shell command` to find the `**Shell Command**: Install 'code' command in PATH`

*  The new `$PATH` value will take effect with a new terminal session.

Or add to your PATH manually in zsh config:

```zsh
# Add Visual Studio Code (code)
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
```

Check out [Visual Studio Code on macOS](https://code.visualstudio.com/docs/setup/mac) for more info.




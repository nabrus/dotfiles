# Visual Studio Code Settings #

## Command Line Setup for macOS ##

Running VS Code from the terminal by typing the `code` command.

#### Adding to your PATH ####

*  In the **Command Palette** (shift+cmd+P), type `shell command` to find the `Shell Command: Install 'code' command in PATH`

*  The new `$PATH` value will take effect with a new terminal session.

Or add to your PATH manually in zsh config:

```zsh
# Add Visual Studio Code (code)
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
```

Check out [Visual Studio Code on macOS](https://code.visualstudio.com/docs/setup/mac) for more info.

## Extensions ##

*  [Night Owl](https://marketplace.visualstudio.com/items?itemName=sdras.night-owl): theme by Sarah Drasner
*  [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint): JavaScript linter by Dirk Baeumer
*  [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker): Spelling checker for source code by Street Side Software
*  [Bracket Pair Colorizer](https://marketplace.visualstudio.com/items?itemName=CoenraadS.bracket-pair-colorizer): Colorizing matching brackets by CoenraadS
*  [Auto Rename Tag](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-rename-tag): Auto rename paired HTML/XML tag by Jun Han
*  [Color Highlight](https://marketplace.visualstudio.com/items?itemName=naumovs.color-highlight): Styles CSS/Web colors found in doc by Sergil Naumov




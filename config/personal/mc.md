# Midnight Commander (mc)- terminal-based visual file manager

[Homepage] (https://www.midnight-commander.org/)
[Wiki] (https://midnight-commander.org/wiki/doc)
[Cheatsheet] (https://gist.github.com/samiraguiar/9cd4264445545cfd459d)

`Ctrl+t` to tag (select) files/folders to copy/move/etc.
`Ctrl+r` to refresh/rescan the current panel

## Midnight Commander/mc keybindings

mc interface (menus) abbreviates:

- `Meta` as `M`, e.g. `M-e` (`Meta+e`)
- `Ctrl` as `C`, e.g. `C-t` (`Ctrl+t`)


- Meta key
  - `Alt` : Linux/Windows
  - `Esc` : Mac (default out-of-box setting)
  - Change Mac to use `Option` as Meta in Terminal settings:

```bash
defaults write com.apple.Terminal set useOptionAsMetaKey 1
```

You will need to look for your default Window Setting with the key
'Default Window Settings'. look at the corresponding nested dictionary
inside the dictionary 'Window Settings' and set the key
`useOptionAsMetaKey` to `1` via GUI

> Terminal > Preferences... (or type `⌘+,` / `Command+,`)
> Profiles > Keyboard and check the box for `Use Option as Meta key`

## Keyboard Shortcuts

### Main View

#### File/directory operations

    F3                     View file
    Shift+F3               View raw file (disregard extension)
    F5                     Copy selected files
    F6                     Move selected files
    Shift+F4               Create a new file
    Ctrl+x d               Compare directories
    Ctrl+x c               Chmod dialog
    Ctrl+x o               Chown dialog
    Ctrl+x Ctrl+s          Edit symlink
    Ctrl+x s               Create symlink dialog
    Ctrl+x l               Create hard link dialog
    Ctrl+x v               Run relative symbolic link tool on selected
                           or tagged items
    Ctrl+x a               List active VFS directories

#### Selection

    Insert / Ctrl+t        Select/deselect file
    *                      Invert selection on files
    +                      Specify file selection options
                           (including custom pattern)
    -                      Same as above, but for deselecting

#### Navigation

    TAB / Ctrl+i           Jump from one panel to the other
    F9                     Select the top menu bar
    Meta+c                 Quick cd dialog
    Meta+?                 Search dialog
    Ctrl+s                 Search for item
    Meta+s                 Incremental search
                           (Meta+s again to jump to next occurence)
    Meta+y                 Move to the previous directory in the 
                           Directory history
    Meta+u                 Move to the next directory in the directory history
    Meta+Shift+h           Show path history
    Ctrl+\                 Directory Hotlist
    Ctrl+p / Up Arrow      Move selection bar to the prev entry
    Ctrl+n / Down Arrow    Move selection bar to the next entry
    Meta+g                 Move selection bar to the first visible item
    Meta+r                 Move selection bar to the middle item
    Meta+j                 Move selection bar to the last visible item
    Meta+v / Page Up       Move selection bar one page up
    Meta+p / Page Down     Move selection bar one page down
    Meta+< / Home          Move selection bar to the top (first entry)
    Meta+> / End           Move selection bar to the bottom (last entry)

#### Display

    Ctrl+r                 Refresh/rescan current panel
    Ctrl+u                 Swap panels
    Meta+,                 Toggle panel layout (horizontal/vertical)
    Ctrl+x i               Toggle other panel to information mode
    Ctrl+x q               Toggle other panel to quick view mode
    Meta+i                 Make the other panel show the same directory
    Meta+o                 Display contents of highlighted dir in other panel
    Meta+t                 Change panel view (full, brief, long)
    Meta+.                 Toggle "Show Hidden Files" feature

#### Command prompt

    Ctrl+o                  Drop to the console
    Meta+Enter              Put the name of highlighted file on command line
    Ctrl+x t                Put the name of selected items on command line
    Ctrl+Shift+Enter        Put the full path of the highlighted file
                            on command line
    Meta+a / Ctrl+x p       Put the full path of the pane directory
                            on the command line
    Meta+h                  Show command history
    Meta+n / Meta+p         Navigate up/down through the command history
    Ctrl+x !                External Panelize
                            (Fill current panel with the output of a command)
    Ctrl+x j                Show background jobs
    F2-@ commmand [args]    Run a command on currently highlighted item:
        F2-@ unzip              Unzip selected file
        F2-@ zip -R foo.zip     Zip current directory as foo.zip
        F2-@ 7za x              Extract selected file with 7zip
        F2-@ 7za a foo.7z       7zip current directory as foo.7z

#### Others

    Shift+F10               Quiet exit, without confirmation


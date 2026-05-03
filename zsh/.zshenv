# .zshenv (Optional)
# This is read first and read every time. This is where you set
# environment variables. I say this is optional because is geared more
# toward advanced users where having your $PATH, $PAGER, or $EDITOR
# variables may be important for things like scripts that get called by
# launchd. Those run under a non-interactive shell 3 so anything in
# .zprofile or .zshrc won't get loaded. Personally, I don't use this one
# because I set the PATH variable in my script itself to ensure
# portability.

# uv
# export PATH="$HOME/.local/bin:$PATH"
# moved to .zshrc as zshenv loads too early __> makes ".local/bin" last on  path

# Ctrl (control) key navigation
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

[ -f ~/dotfiles/exports.sh ] && source ~/dotfiles/exports.sh

# If you receive "highlighters directory not found" error message add to .zshenv:
#   export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters


# export PATH=/Applications/$(/opt/homebrew/bin/fd -e app mkvtoolnix  /Applications | sort | tail -n1)/Contents/MacOS/:$PATH   
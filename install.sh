#!/usr/bin/env bash

# check if ln is the older macOS standard version
if  ln --version >/dev/null 2>&1; then
	args='-s -f'
else
	args='-s -F'
fi

[[ -d ~/.dotfiles ]] || git clone https://github.com/mikemcduffie/dotfiles.git > ~/.dotfiles

# link dotfiles
ln $args ~/.dotfiles/.bashrc                  ~/.bashrc
ln $args ~/.dotfiles/.bash_env                ~/.bash_env
ln $args ~/.dotfiles/.inputrc                 ~/.inputrc
ln $args ~/.dotfiles/.rarregkey               ~/.rarregkey
ln $args ~/.dotfiles/gitconfig/.gitconfig     ~/.gitconfig
ln $args ~/.dotfiles/gitconfig/.gitignore     ~/.gitignore
ln $args ~/.dotfiles/.tidyrc                  ~/.tidyrc
ln $args ~/.dotfiles/.zprofile                ~/.zprofile
ln $args ~/.dotfiles/.zshrc                   ~/.zshrc
ln $args ~/.dotfiles/dot_zshenv               ~/.zshenv

[ -d ~/.ssh ] || mkdir ~/.ssh
ln $args ~/.dotfiles/ssh_config               ~/.ssh/config

ln $args ~/.dotfiles/Text\ Substitutions.plist ~/Text\ Substitutions.plist


# Xcode CLI Tools
[[ -z "/Library/Developer/CommandLineTools" ]] && xcode-select --install


# homebrew
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if ! brew tap | grep -qFz "homebrew/cask"; then
    brew tap "brew/cask"
fi


#cmas


# Oh My Posh
if ! command -v oh-my-posh &> /dev/null; then
    brew install jandedobbeleer/oh-my-posh/oh-my-posh
    brew update && brew upgrade oh-my-posh
fi

# uv installs (~/.local/bin/)
#
# uv tool install acefile
#   executable: acefile-unace
# uv tool install srt
#   executables: srt, srt-deduplicate, srt-fixed-timeshift, srt-linear-timeshift, srt-lines-matching, srt-mux, srt-normalise, srt-play, srt-process
# uv tool install webvtt-py
#   executable: webvtt

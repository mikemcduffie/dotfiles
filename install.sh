#!/usr/bin/env bash

# check if ln is the older macOS standard version
if  ln --version >/dev/null 2>&1; then
	args='-s -f'
else
	args='-s -F'
fi

# link dotfiles
ln $args ~/.dotfiles/.bashrc                  ~/.bashrc
ln $args ~/.dotfiles/.bash_env                ~/.bash_env
ln $args ~/.dotfiles/.inputrc                 ~/.inputrc
ln $args ~/.dotfiles/.rarregkey               ~/.rarregkey
ln $args ~/.dotfiles/gitconfig/.gitconfig     ~/.gitconfig
ln $args ~/.dotfiles/gitconfig/.gitignore     ~/.gitignore
ln $args ~/.dotfiles/.tidyrc                  ~/.tidyrc

[ -d ~/.ssh ] || mkdir ~/.ssh
ln $args ~/.dotfiles/ssh_config               ~/.ssh/config

ln $args ~/.dotfiles/Text\ Substitutions.plist ~/Text\ Substitutions.plist

#if [[ "$ZSH_VERSION" ]]; then
    ln $args ~/.dotfiles/.zprofile                ~/.zprofile
    ln $args ~/.dotfiles/.zshrc                   ~/.zshrc
    ln $args ~/.dotfiles/dot_zshenv               ~/.zshenv
#fi

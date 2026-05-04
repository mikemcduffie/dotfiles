#!/usr/bin/env bash

# link dotfiles
ln --source --force ~/.dotfiles/.bashrc                  ~/.bashrc
ln --source --force ~/.dotfiles/.bash_env                ~/.bash_env
ln --source --force ~/.dotfiles/.inputrc                 ~/.inputrc
ln --source --force ~/.dotfiles/.rarregkey               ~/.rarregkey
ln --source --force ~/.dotfiles/gitconfig/.gitconfig     ~/.gitconfig
ln --source --force ~/.dotfiles/gitconfig/.gitignore     ~/.gitignore
ln --source --force ~/.dotfiles/.tidyrc                  ~/.tidyrc

[ -d ~/.ssh ] || mkdir ~/.ssh
ln --source --force ~/.dotfiles/ssh_config               ~/.ssh/config

ln --source --force ~/.dotfiles/Text Substitutions.plist ~/Text Substitutions.plist

if [[ $ZSH_VERSION ]]; then
    ln --source --force ~/.dotfiles/.zprofile                ~/.zprofile
    ln --source --force ~/.dotfiles/.zshrc                   ~/.zshrc
    ln --source --force ~/.dotfiles/dot_zshenv               ~/.zshenv
fi

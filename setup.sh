#!/bin/bash

# Tmux
ln -s $HOME/dotFiles/.tmux.conf $HOME/.tmux.conf

# Neovim
mkdir -p ~/.config/nvim
ln -s $HOME/dotFiles/.nvimrc $HOME/.config/nvim/init.vim
ln -s $HOME/dotFiles/slate_arctic.vim $HOME/.config/nvim/colors//slate_arctic
nvim -c "PlugInstall" -c "q" -c "q"

# IdeaVim
ln -s $HOME/dotFiles/.ideavimrc $HOME/.ideavimrc

# Fish Shell
mkdir -p ~/.config/fish
ln -s $HOME/dotFiles/config.fish $HOME/.config/fish/config.fish
ln -s $HOME/dotFiles/functions/ $HOME/.config/fish/functions

#!/bin/bash

set -euo pipefail

echo "Installing ripgrep..."
# https://github.com/BurntSushi/ripgrep
brew install ripgrep


echo "Installing neovim configs..."
VIMRC_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sf $VIMRC_DIR/init.vim $HOME/.config/nvim/init.vim

echo "Setting envs..."
if [ -f $HOME/.zshrc ]; then
    cat $VIMRC_DIR/zshrc >> $HOME/.zshrc
else
    echo "No zshrc config found. Install oh-my-zsh first."
fi

echo "Done."
echo "Please start nvim and run `PlugInstall`."

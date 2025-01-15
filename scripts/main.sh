#!/bin/bash

# zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/plugins/zsh-syntax-highlighting

# tmux
if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [ "$NAME" == "Amazon Linux" ]; then
        bash /scripts/tmux/amazon-linux.sh
    fi
fi

# pyenv
curl -fsSL https://pyenv.run | bash

# dotfiles
if [ -f ~/.zshrc ]; then
    cat ../root_dotfiles/.zshrc >> ~/.zshrc
else
    cp ../root_dotfiles/.zshrc ~/.zshrc
fi
cp ../root_dotfiles/.vimrc ~/.vimrc


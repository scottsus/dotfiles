#!/bin/bash

# dotfiles
echo "copying dotfiles..."
if [ -f ~/.zshrc ]; then
    cat ../root_dotfiles/.zshrc >> ~/.zshrc
else
    cp ../root_dotfiles/.zshrc ~/.zshrc
fi
cp ../root_dotfiles/.vimrc ~/.vimrc
cp ../root_dotfiles/.tmux.conf ~/.tmux.conf

# zsh
echo "installing zsh plugins..."
mkdir -p ~/.zsh/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/plugins/zsh-syntax-highlighting

# linuxbrew
echo "installing linuxbrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# tmux
echo "upgrading tmux..."
if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [ "$NAME" == "Amazon Linux" ]; then
        chmod +x ./tmux/amazon-linux.sh
        bash ./tmux/amazon-linux.sh
    fi
fi
echo "installing tpm..."
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# pyenv
echo "installing pyenv..."
curl -fsSL https://pyenv.run | bash
echo "installing python dependencies..."
if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [ "$NAME" == "Amazon Linux" ]; then
        bash yum install gcc make patch zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl11-devel tk-devel libffi-devel xz-devel
    fi
fi

# source
source ~/.zshrc

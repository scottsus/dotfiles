# zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/plugins/zsh-syntax-highlighting

# tmux
if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [ "$NAME" == "Amazon Linux" ]; then
        bash ./tmux/amazon-linux.sh
    fi
fi

# pyenv
curl -fsSL https://pyenv.run | bash

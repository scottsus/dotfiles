# git information & styling zsh prompt

autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats '%b'
precmd_vcs_info() {
  vcs_info
  if [[ -n ${vcs_info_msg_0_} ]]; then
    PS1="%B%F{red}%n:%f %F{white}%1~%f%b %F{blue}(${vcs_info_msg_0_})%f $ "
  else
    PS1="%B%F{red}%n:%f %F{white}%1~%f%b $ "
  fi
}
precmd_functions+=(precmd_vcs_info)

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Pyenv

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


# Homebrew

export PATH=$HOME/.toolbox/bin:$PATH
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
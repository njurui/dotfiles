#!/usr/bin/env zsh

set -eu

ZSH_DATA_HOME=${ZSH_DATA_HOME:-"$HOME/.local/share/zsh"}

plugins=(
    powerlevel10k
    zsh-completions
    zsh-syntax-highlighting
    zsh-autosuggestions
    zsh-history-substring-search
    fzf-tab
)

for plugin in $plugins; do
    git -C "$ZSH_DATA_HOME/$plugin" pull
done

curl -sSfL "https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh" | sh

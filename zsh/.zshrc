#!/bin/zsh
#
# .zshrc - Zsh file loaded on interactive shell sessions.
#

# Enable Powerlevel10k instant prompt. Should stay close to the top of .zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Clone antidote if necessary.
if [[ ! -d "${XDG_DATA_HOME:-$HOME/.local/share}/.antidote" ]]; then
    git clone https://github.com/mattmc3/antidote "${XDG_DATA_HOME:-$HOME/.local/share}/.antidote"
fi

# Ensure path arrays do not contain duplicates.
typeset -gU path fpath

# Editor
export EDITOR=nvim
export VISUAL=nvim

# Force emacs keybinding due to vi in editor
bindkey -e

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000000
SAVEHIST=100000000

# Auto activate / deactivate venv
PYTHON_AUTO_VRUN=true

# History substring search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
bindkey -M emacs '^P' up-line-or-beginning-search
bindkey -M emacs '^N' down-line-or-beginning-search

# Homebrew
(($+commands[brew])) && eval "$(brew shellenv zsh)"

# Rustup
[[ ! -f $HOME/.cargo/env ]] || . "$HOME/.cargo/env"

# Create an amazing Zsh config using antidote plugins.
source ${XDG_DATA_HOME:-$HOME/.local/share}/.antidote/antidote.zsh
antidote load

# Reset ls color
unset LSCOLORS
unset LS_COLORS

# Zoxide
(($+commands[zoxide])) && eval "$(zoxide init zsh)"

# fzf
(($+commands[fzf])) && source <(fzf --zsh)

# kitty shell integration
if [[ -n "$KITTY_INSTALLATION_DIR" ]]; then
    export KITTY_SHELL_INTEGRATION="enabled"
    autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
    kitty-integration
    unfunction kitty-integration
    alias s="kitten ssh"
    alias icat="kitten icat"
fi

# kitten config
export KITTY_REMOTE_DIR="$HOME/.local/share/kitty-ssh-kitten"
if [[ -d "$KITTY_REMOTE_DIR" ]]; then
    path=($KITTY_REMOTE_DIR/kitty/bin $path)
    export KITTY_SHELL_INTEGRATION="enabled"
    autoload -Uz -- "$KITTY_REMOTE_DIR"/shell-integration/zsh/kitty-integration
    kitty-integration
    unfunction kitty-integration
    alias icat="kitten icat"
fi

# To customize prompt, run `p10k configure` or edit .p10k.zsh.
[[ ! -f ${ZDOTDIR:-$HOME}/.p10k.zsh ]] || source ${ZDOTDIR:-$HOME}/.p10k.zsh

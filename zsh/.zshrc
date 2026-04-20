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

# Lazy-load (autoload) Zsh function files from a directory.
ZFUNCDIR=${ZDOTDIR:-$HOME}/.zfunc
fpath=($ZFUNCDIR $fpath)

# Set any zstyles you might use for configuration.
[[ ! -f ${ZDOTDIR:-$HOME}/.zstyles ]] || source ${ZDOTDIR:-$HOME}/.zstyles

# Clone antidote if necessary.
if [[ ! -d $XDG_DATA_HOME/.antidote ]]; then
    git clone https://github.com/mattmc3/antidote $XDG_DATA_HOME/.antidote
fi

# Create an amazing Zsh config using antidote plugins.
source $XDG_DATA_HOME/.antidote/antidote.zsh
antidote load

# Source anything.
## History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000000
SAVEHIST=100000000

## History substring search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='underline'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='underline,fg=1,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_TIMEOUT=65535

## Colors
LSCOLORS='ExgxFxdacxDaDaabagacad'

## Homebrew
(($+commands[brew])) && eval "$(brew shellenv zsh)"

## Rustup
[[ ! -f $HOME/.cargo/env ]] || . "$HOME/.cargo/env"

## Zoxide
(($+commands[zoxide])) && eval "$(zoxide init zsh)"

## fzf
(($+commands[fzf])) && source <(fzf --zsh)

## kitty shell integration
if [[ -n "$KITTY_INSTALLATION_DIR" ]]; then
    export KITTY_SHELL_INTEGRATION="enabled"
    autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
    kitty-integration
    unfunction kitty-integration
    alias s="kitten ssh"
    alias icat="kitten icat"
fi

## kitten config
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

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_DATA_HOME="${HOME}/.local/share/zsh"
if [[ ! -d "$ZSH_DATA_HOME" ]]; then
    mkdir -p "$ZSH_DATA_HOME"
fi

# configs
source $HOME/.config/zsh/directories.zsh
source $HOME/.config/zsh/completion.zsh
source $HOME/.config/zsh/history.zsh
source $HOME/.config/zsh/misc.zsh
source $HOME/.config/zsh/kitty.zsh
source $HOME/.config/zsh/toolchain.zsh

# clear
ctrl_l() {
    builtin print -rn -- $'\r\e[0J\e[H\e[3J' >"$TTY"
    builtin zle .reset-prompt
    builtin zle -R
}
zle -N ctrl_l
bindkey '^l' ctrl_l

# powerlevel10k
if [[ ! -d "$ZSH_DATA_HOME/powerlevel10k" ]]; then
    git clone --depth=1 "https://github.com/romkatv/powerlevel10k.git" "$ZSH_DATA_HOME/powerlevel10k"
fi
source $ZSH_DATA_HOME/powerlevel10k/powerlevel10k.zsh-theme

# zsh-completions
if [[ ! -d "$ZSH_DATA_HOME/zsh-completions" ]]; then
    git clone --depth=1 "https://github.com/zsh-users/zsh-completions.git" "$ZSH_DATA_HOME/zsh-completions"
fi
fpath=($ZSH_DATA_HOME/zsh-completions/src $fpath)

# compinit
autoload -Uz compinit && compinit

# zsh-syntax-highlighting
if [[ ! -d "$ZSH_DATA_HOME/zsh-syntax-highlighting" ]]; then
    git clone --depth=1 "https://github.com/zsh-users/zsh-syntax-highlighting" "$ZSH_DATA_HOME/zsh-syntax-highlighting"
fi
source $ZSH_DATA_HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-autosuggestions
if [[ ! -d "$ZSH_DATA_HOME/zsh-autosuggestions" ]]; then
    git clone --depth=1 "https://github.com/marlonrichert/zsh-autosuggestions.git" "$ZSH_DATA_HOME/zsh-autosuggestions"
fi
source $ZSH_DATA_HOME/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

# zsh-history-substring-search
if [[ ! -d "$ZSH_DATA_HOME/zsh-history-substring-search" ]]; then
    git clone --depth=1 "https://github.com/zsh-users/zsh-history-substring-search.git" "$ZSH_DATA_HOME/zsh-history-substring-search"
fi
source $ZSH_DATA_HOME/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='underline'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='fg=1,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_TIMEOUT=999999999

# zoxide
if ! command -v zoxide &>/dev/null; then
    curl -sSfL "https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh" | sh
fi
if [[ -d $HOME/.local/bin/ ]]; then
    typeset -aU path
    path=($HOME/.local/bin/ $path)
fi
eval "$(zoxide init zsh)"

# fzf
if command -v fzf &>/dev/null; then
    source <(fzf --zsh)

    # fzf-tab
    if [[ ! -d "$ZSH_DATA_HOME/fzf-tab" ]]; then
        git clone --depth=1 "https://github.com/Aloxaf/fzf-tab" "$ZSH_DATA_HOME/fzf-tab"
    fi
    source $ZSH_DATA_HOME/fzf-tab/fzf-tab.plugin.zsh
    zstyle ':fzf-tab:*' fzf-flags --ignore-case
fi

if command -v entr &>/dev/null; then
    entr() {
        echo "$1" | command entr -s "kitten icat $1"
    }
    compdef _files entr
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

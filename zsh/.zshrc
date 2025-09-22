# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_DATA_HOME="${HOME}/.local/share/zsh"
if ! [[ -d "$ZSH_DATA_HOME" ]]; then
  mkdir -p "$ZSH_DATA_HOME"
fi

# configs
source $HOME/.config/zsh/directories.zsh
source $HOME/.config/zsh/completion.zsh
source $HOME/.config/zsh/history.zsh
source $HOME/.config/zsh/misc.zsh
source $HOME/.config/zsh/kitty.zsh
source $HOME/.config/zsh/llvm.zsh

# powerlevel10k
if ! [[ -d "$ZSH_DATA_HOME/powerlevel10k" ]]; then
  git clone --depth=1 "https://github.com/romkatv/powerlevel10k.git" "$ZSH_DATA_HOME/powerlevel10k"
fi
source $ZSH_DATA_HOME/powerlevel10k/powerlevel10k.zsh-theme

# zsh-completions
if ! [[ -d "$ZSH_DATA_HOME/zsh-completions" ]]; then
  git clone --depth=1 "https://github.com/zsh-users/zsh-completions.git" "$ZSH_DATA_HOME/zsh-completions"
fi
fpath=($ZSH_DATA_HOME/zsh-completions/src $fpath)

# compinit
autoload -Uz compinit && compinit

# zsh-syntax-highlighting
if ! [[ -d "$ZSH_DATA_HOME/zsh-syntax-highlighting" ]]; then
  git clone --depth=1 "https://github.com/zsh-users/zsh-syntax-highlighting" "$ZSH_DATA_HOME/zsh-syntax-highlighting"
fi
source $ZSH_DATA_HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-autosuggestions
if ! [[ -d "$ZSH_DATA_HOME/zsh-autosuggestions" ]]; then
  git clone --depth=1 "https://github.com/marlonrichert/zsh-autosuggestions.git" "$ZSH_DATA_HOME/zsh-autosuggestions"
fi
source $ZSH_DATA_HOME/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

# zsh-history-substring-search
if ! [[ -d "$ZSH_DATA_HOME/zsh-history-substring-search" ]]; then
  git clone --depth=1 "https://github.com/zsh-users/zsh-history-substring-search.git" "$ZSH_DATA_HOME/zsh-history-substring-search"
fi
source $ZSH_DATA_HOME/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# fzf
if (( $+commands[fzf] )); then
  source <(fzf --zsh)

  # fzf-tab
  if ! [[ -d "$ZSH_DATA_HOME/fzf-tab" ]]; then
      git clone --depth=1 "https://github.com/Aloxaf/fzf-tab" "$ZSH_DATA_HOME/fzf-tab"
  fi
  source $ZSH_DATA_HOME/fzf-tab/fzf-tab.plugin.zsh
fi

# zoxide
if ! (( $+commands[zoxide] )); then
    curl -sSfL "https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh" | sh
fi
eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

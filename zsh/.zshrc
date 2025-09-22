# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# snippets
zinit snippet $HOME/.config/zsh/directories.zsh
zinit snippet $HOME/.config/zsh/completion.zsh
zinit snippet $HOME/.config/zsh/history.zsh
zinit snippet $HOME/.config/zsh/misc.zsh
zinit snippet $HOME/.config/zsh/kitty.zsh
zinit snippet $HOME/.config/zsh/llvm.zsh

# plugins loaded before compinit
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit ice depth=1; zinit light zsh-users/zsh-completions
zinit ice depth=1; zinit light zsh-users/zsh-autosuggestions
zinit ice depth=1; zinit light zdharma/fast-syntax-highlighting
zinit ice depth=1; zinit light agkozak/zsh-z

# Zsh completion
autoload -Uz compinit && compinit

# plugins loaded after compinit
zinit ice depth=1; zinit light Aloxaf/fzf-tab

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# History size of zsh
HISTSIZE=100000000
SAVEHIST=100000000

# zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit ice depth=1; zinit light romkatv/powerlevel10k

zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

# z
zinit light agkozak/zsh-z

# zsh-vi-mode
# Do the initialization when the script is sourced (i.e. Initialize instantly) to avoid conflict with fzf
export ZVM_INIT_MODE=sourcing
zinit light jeffreytse/zsh-vi-mode

# fzf-tab
zinit light Aloxaf/fzf-tab
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# fzf
source <(fzf --zsh)

# export TERM=xterm
# export TERM=xterm-256color

# export LSCOLORS for FreeBSD / MacOS ls
export LSCOLORS="Gxfxcxdxbxegedabagacad"
# export LS_COLORS for GNU ls
export LS_COLORS='no=00:fi=00:di=01;34:ln=00;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=00;32:*.cmd=00;32:*.exe=01;32:*.com=01;32:*.bat=01;32:*.btm=01;32:*.dll=01;32:*.tar=00;31:*.tbz=00;31:*.tgz=00;31:*.rpm=00;31:*.deb=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.zoo=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.tb2=00;31:*.tz2=00;31:*.tbz2=00;31:*.avi=01;35:*.bmp=01;35:*.fli=01;35:*.gif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mng=01;35:*.mov=01;35:*.mpg=01;35:*.pcx=01;35:*.pbm=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.tga=01;35:*.tif=01;35:*.xbm=01;35:*.xpm=01;35:*.dl=01;35:*.gl=01;35:*.wmv=01;35:*.aiff=00;32:*.au=00;32:*.mid=00;32:*.mp3=00;32:*.ogg=00;32:*.voc=00;32:*.wav=00;32:'

# export llvm-toolchain
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export CPATH="/opt/homebrew/include"
# export C_INCLUDE_PATH=""
# export OBJC_INCLUDE_PATH=""
# export CPLUS_INCLUDE_PATH=""

# export flags of llvm for build system
export CC="/opt/homebrew/opt/llvm/bin/clang"
export CXX="/opt/homebrew/opt/llvm/bin/clang++"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include/c++/v1 -I/opt/homebrew/include"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib/c++ -Wl,-rpath,/opt/homebrew/opt/llvm/lib/c++"
export RUSTFLAGS="-L/opt/homebrew/opt/llvm/lib/c++ -L/opt/homebrew/lib"

# export postgresql
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# Editor
# export EDITOR='nvim'           # $EDITOR is the default for most shells
# export VISUAL=$EDITOR          # $VISUAL in case

# alias for cd
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias -- -='cd -'
alias 1='cd -1'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

# alias for ls
alias lsa='gls --color=auto -lah'
alias l='gls --color=auto -lah'
alias ls='gls --color=auto'
alias ll='gls --color=auto -lh'
alias la='gls --color=auto -lAh'

# alias for grep
alias egrep='grep -E --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
alias fgrep='grep -F --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

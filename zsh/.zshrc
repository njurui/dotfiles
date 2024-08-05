# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# History size of zsh
HISTSIZE=100000000
SAVEHIST=100000000

# export TERM=xterm
# export TERM=xterm-256color

# export LSCOLORS for FreeBSD / MacOS ls
export LSCOLORS="Gxfxcxdxbxegedabagacad"
# export LS_COLORS for GNU ls
export LS_COLORS='no=00:fi=00:di=01;34:ln=00;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=00;32:*.cmd=00;32:*.exe=01;32:*.com=01;32:*.bat=01;32:*.btm=01;32:*.dll=01;32:*.tar=00;31:*.tbz=00;31:*.tgz=00;31:*.rpm=00;31:*.deb=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.zoo=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.tb2=00;31:*.tz2=00;31:*.tbz2=00;31:*.avi=01;35:*.bmp=01;35:*.fli=01;35:*.gif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mng=01;35:*.mov=01;35:*.mpg=01;35:*.pcx=01;35:*.pbm=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.tga=01;35:*.tif=01;35:*.xbm=01;35:*.xpm=01;35:*.dl=01;35:*.gl=01;35:*.wmv=01;35:*.aiff=00;32:*.au=00;32:*.mid=00;32:*.mp3=00;32:*.ogg=00;32:*.voc=00;32:*.wav=00;32:'

# export llvm-toolchain
# export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
# export CPATH="/opt/homebrew/include"
# export C_INCLUDE_PATH=""
# export OBJC_INCLUDE_PATH=""
# export CPLUS_INCLUDE_PATH=""

# export flags of llvm for build system
# export CC="/opt/homebrew/opt/llvm/bin/clang"
# export CXX="/opt/homebrew/opt/llvm/bin/clang++"
# export CPPFLAGS="-I/opt/homebrew/opt/llvm/include/c++/v1 -I/opt/homebrew/include"
# export LDFLAGS="-L/opt/homebrew/opt/llvm/lib/c++ -Wl,-rpath,/opt/homebrew/opt/llvm/lib/c++"
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

# powerlevel10k
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# zsh-fast-syntax-highlighting
source /opt/homebrew/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-completions
zmodload -i zsh/complist

WORDCHARS='*?_-[]~=&;!#$%^(){}<>'

unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end

zstyle ':completion:*' list-prompt ''
zstyle ':completion:*' select-prompt '%SSelect:  lines: %L  matches: %M  [%p]'

bindkey -M menuselect '/' history-incremental-search-forward
# bindkey -M menuselect '?' history-incremental-search-forward

zstyle ':completion:*:*:*:*:*' menu select

# case insensitive (all), partial-word and substring completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]-_}={[:upper:][:lower:]_-}' 'r:|=*' 'l:|=* r:|=*'

# Complete . and .. special directories
zstyle ':completion:*' special-dirs true

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

zstyle ':completion:*:*:*:*:processes' command "ps -u $USERNAME -o pid,user,comm -w -w"

# disable named-directories autocompletion
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

# Use caching so that commands like apt and dpkg complete are useable
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path $ZSH_CACHE_DIR

# Don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
        clamav daemon dbus distcache dnsmasq dovecot fax ftp games gdm \
        gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm \
        ldap lp mail mailman mailnull man messagebus mldonkey mysql nagios \
        named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn \
        operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd \
        rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp \
        usbmux uucp vcsa wwwrun xfs '_*'

# ... unless we really want to.
zstyle '*' single-ignored show

FPATH="/opt/homebrew/share/zsh/site-functions:$FPATH"
autoload -Uz compinit
compinit

# z
. /opt/homebrew/etc/profile.d/z.sh

# zsh-vi-mode
# Do the initialization when the script is sourced (i.e. Initialize instantly) to avoid conflict with fzf
export ZVM_INIT_MODE=sourcing
source /opt/homebrew/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# fzf
source <(fzf --zsh)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000000
SAVEHIST=100000000

## History command configuration
setopt append_history         # append to history file
setopt inc_append_history     # write to the history file immediately, not when the shell exits
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # don't record an event that was just recorded again
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_reduce_blanks     # remove superfluous blanks from each command line being added to the history list
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

# Expansion and Globbing
# http://zsh.sourceforge.net/Doc/Release/Options.html#Expansion-and-Globbing
setopt extended_glob           # use more awesome globbing features
setopt glob_dots               # include dotfiles when globbing

# Input/Output
# http://zsh.sourceforge.net/Doc/Release/Options.html#Input_002fOutput
# unsetopt clobber               # must use >| to truncate existing files
unsetopt correct               # don't try to correct the spelling of commands
unsetopt correct_all           # don't try to correct the spelling of all arguments in a line
setopt interactive_comments    # enable comments in interactive shell
unsetopt mail_warning          # don't print a warning message if a mail file has been accessed
setopt path_dirs               # perform path search even on command names with slashes
setopt rc_quotes               # allow 'Henry''s Garage' instead of 'Henry'\''s Garage'
unsetopt rm_star_silent        # ask for confirmation for `rm *' or `rm path/*'

# Job Control
# http://zsh.sourceforge.net/Doc/Release/Options.html#Job-Control
setopt auto_resume            # attempt to resume existing job before creating a new process
unsetopt bg_nice              # don't run all background jobs at a lower priority
unsetopt check_jobs           # don't report on jobs when shell exit
unsetopt hup                  # don't kill jobs on shell exit
setopt long_list_jobs         # list jobs in the long format by default
setopt notify                 # report status of background jobs immediately


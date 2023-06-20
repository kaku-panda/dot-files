## colors
export CLICOLOR=1
autoload -Uz colors
colors

# Set up aliases
alias mv='nocorrect mv -i'       # no spelling correction on mv
alias cp='nocorrect cp -i'       # no spelling correction on cp
alias rm='nocorrect rm -i'       # no spelling correction on rm
alias mkdir='nocorrect mkdir' # no spelling correction on mkdir
alias j=jobs
alias pu=pushd
alias po=popd
alias d='dirs -v'
alias h=history
alias ls='ls -F --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias x=exit

# List only directories and symbolic
# links that point to directories
alias lsd='ls -ld *(-/DN)'

# List only file beginning with "."
alias lsa='ls -ld .*'

# Shell functions
setenv() { typeset -x "${1}${1:+=}${(@)argv[2,$#]}" }  # csh compatibility
freload() { while (( $# )); do; unfunction $1; autoload -U $1; shift; done }

# Where to look for autoloaded function definitions
fpath=($fpath ~/.zfunc)

# Autoload all shell functions from all directories in $fpath (following
# symlinks) that have the executable bit on (the executable bit is not
# necessary, but gives you an easy way to stop the autoloading of a
# particular shell function). $fpath should not be empty for this to work.
for func in $^fpath/*(N-.x:t); autoload $func

# automatically remove duplicates from these arrays
typeset -U path cdpath fpath manpath

# Global aliases -- These do not have to be
# at the beginning of the command line.
alias -g M='|more'
alias -g H='|head'
alias -g T='|tail'

manpath=(/opt/share/man /usr/share/man)
export MANPATH

# Hosts to use for completion (see later zstyle)
hosts=(`hostname` ftp.math.gatech.edu prep.ai.mit.edu wuarchive.wustl.edu)

# Set prompts
if [ $TERM = screen ]; then 
  promptname=${fg[green]}$(print "\ek%m\e\\")$USERNAME${reset_color}
else
  promptname=${fg[green]}$USERNAME${reset_color}
fi
PROMPT="%U%B$promptname%b [ %m : %~ ]%u 
"

# Some environment variables
export HELPDIR=/usr/local/lib/zsh/help  # directory for run-help function to find docs
MAILCHECK=0
HISTSIZE=200
DIRSTACKSIZE=20

# Setup new style completion system. To see examples of the old style (compctl
# based) programmable completion, check Misc/compctl-examples in the zsh
# distribution.
autoload -U compinit
compinit

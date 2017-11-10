# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

alias devel="cd ~/dev"
alias v="vim"
alias vi="vim"
alias vim="stty stop '' -ixoff ; vim"
alias zrc="vim ~/.zshrc"
alias szrc="source ~/.zshrc"
alias rsp="rake spec"
#alias migrate="be rake db:migrate db:test:prepare"
alias be="bundle exec"
alias sl="ls"
alias vimrc="vim ~/.vimrc"
alias tconf="vim ~/.tmux.conf"
alias ta="tmux attach -t"
alias tk="tmux kill-session -t"
alias tn="tmux new -s"
alias tls="tmux ls"
alias bsl="brew services list"
alias bss="brew services start"
alias bst="brew services stop"

alias glum="git pull upstream master"
alias gpum="git push upstream master"

alias -s rb=vim
alias -s txt=vim
alias -s js=vim
alias -s erb=vim
alias -s haml=vim
alias -s yml=vim

ttyctl -f

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# DISABLE_UPDATE_PROMPT=true

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/Users/lukeaiken-vertiba/dotfiles/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"

# export MANPATH="/usr/local/man:$MANPATH"

# unsetopt nomatch

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

#Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
TERM=xterm-256color

export ARCHFLAGS='-arch x86_64'
export PATH=/Library/PostgreSQL/9.1/bin:${PATH}
export PATH=/Applications/Postgres.app/Contents/Versions/9.3/bin:${PATH}

function killjob()
{
    emulate -L zsh
    for jobnum in $@ ; do
        kill ${${jobstates[$jobnum]##*:*:}%=*}
    done
}

autoload -U zmv
# alias zcp='zmv -C'
# alias zln='zmv -L

# Goal here is to get a list of files by name without junk from subversion or
# similar directory trees. Prune them (to avoid descent) and then remove the
# directory from the resulting file list via grep -v. Note the trailing sed
# line which handles filenames with blanks.
function findem () {
  find . -name .svn -prune -o -name .git -prune -o -name node_modules\
    -prune -o -iname "*$1*" 2<&1 | grep -v '\.svn' | grep -v '\.git' |\
    grep -v 'node_modules' | grep -v 'thirdParty' |\
    grep -v 'Permission denied' | grep -v '\.sw[op]' |\
    grep -v '\.class' | grep -v '\.scssc' | grep -v '\.tap' | sed 's/\ /\\ /g'
}
alias findme=findem

export BCONNECTED_API_ROOT_PATH=/Users/laiken11/dev/bc4/bconnected-api/
export BCONNECTED_API_WSREQUEST_TIMEOUT=30000
export BCONNECTED_API_MEMCACHED_HOST=127.0.0.1:11211
export BCONNECTED_API_STANDALONE_RUN=true

# http://github.com/tgsamef  ___
#                          /'___\
# same-f [.dotfiles]      /\ \__/
#  ___  __ _ _ __ ___   __\ \ ,__\
# / __|/ _` | '_ ` _ \ / _ \ \ \_/
# \__ \ (_| | | | | | |  __/\ \ \
# |___/\__,_|_| |_| |_|\___| \/_/
#______________________________________
# .zshrc config 

manpath="/usr/man:/usr/share/man:/usr/local/man:/usr/X11R6/man:/opt/qt/doc"
export MANPATH
export LESS="-R"
export TERM="xterm-256color"
export PATH="$HOME/bin:/usr/.local/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"
export LANG="ru_RU.UTF-8"
export LC_NUMERIC="POSIX"
export EDITOR="vim"
export VISUAL="vim"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export ARCHFLAGS="-arch x86_64"
export RANGER_LOAD_DEFAULT_RC=false

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi
if [ -z "$XDG_CONFIG_HOME" ]; then
	export XDG_CONFIG_HOME="$HOME/.config"
fi
if [ -z "$XDG_DATA_HOME" ]; then
	export XDG_DATA_HOME="$HOME/.local/share"
fi
if [ -z "$XDG_CACHE_HOME" ]; then
	export XDG_CACHE_HOME="$HOME/.cache"
fi

zstyle ':omz:update' frequency 3
zstyle ':omz:update' mode reminder
bindkey -v

HISTFILE=~/.zhistory
SAVEHIST=20000
HISTSIZE=20000
HIST_STAMPS="dd.mm.yyyy"
setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -ap zsh/mapfile mapfile

autoload -U compinit
compinit

DISABLE_UNTRACKED_FILES_DIRTY=true
ZSH_THEME="norm"
CASE_SENSITIVE=true
ENABLE_CORRECTIONS=true
COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
CFLAGS="-03 -march=pentium4 -fomit-frame-pointer -funroll-loops -pipe -mfpmath=sse -mmmx -msse2 -fPIC"
CXXFLAGS="$CFLAGS"
BOOTSTRAPCFLAGS="$CFLAGS"
export CFLAGS CXXFLAGS BOOTSTRAPCFLAGS

plugins=(git colored-man-pages docker
	emotty emoji screen perl)

alias less='less -M'
alias ispell='ispell -d russian'
alias ls='ls -F --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -la'
alias sysup="sudo reflector --verbose -l 5 -p https --sort rate --save '/etc/pacman.d/mirrorlist' && sudo pacman -Syyuv"
source $ZSH/oh-my-zsh.sh

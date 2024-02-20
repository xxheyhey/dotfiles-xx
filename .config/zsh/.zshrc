# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh


# User configuration

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# opam
eval $(opam env)
. "$HOME/.cargo/env"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/vic/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/vic/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/vic/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/vic/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Keybindings
bindkey -s ^f "tmux-sessionizer\n"
bindkey -s ^n "alacritty -e less ~/personal/Documents/NeovimCheatsheet\n"
bindkey -s ^t "tmux attach\n"
bindkey -s ^g "open-current-dir\n"

# Completion
autoload -Uz compinit
compinit
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# zstyle ':completion:*' completer _expand _complete _ignored _approximate
# zstyle ':completion:*' menu select=2
# zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
# zstyle ':completion::complete:*' use-cache 1
# zstyle ':completion:*:descriptions' format '%U%F{cyan}%d%f%u'

# Fix slow git autocompletion
__git_files () {
    _wanted files expl 'local files' _files }

# Zsh options
# Keep history of `cd` as in with `pushd` and make `cd -<TAB>` work.
DIRSTACKSIZE=16
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_minus
# Ignore duplicate in history.
setopt hist_ignore_dups
# Nobody need flow control anymore. Troublesome feature.
setopt noflowcontrol

# I have to do this to correctly display the directory name when running
# tmux-sessionizer (I have no idea why)
cd .

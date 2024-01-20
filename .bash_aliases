# Nice ones
alias python="python3"
alias goto="source"
alias ..="cd .."
alias monitor="mons"
alias s="sudo"
# Finding files
alias fa="fd --type f --hidden --exclude .local/share --exclude .cache --exclude .local/pipx --exclude .git --exclude .npm --exclude .nvm --base-directory $HOME --search-path $HOME | fzf --print0 | xargs -0 -o nvim"
alias f="fd --type f --hidden --exclude .local/share --exclude .cache --exclude .local/pipx --exclude .git --exclude .npm --exclude .nvm | fzf --print0 | xargs -0 -o nvim"
# GPU
alias prime-run="__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia"
alias nvidiaoff="sudo envycontrol -s integrated"
alias nvidiahybrid="sudo envycontrol -s hybrid"
# Shutdown/reboot (+ syncing with Onedrive)
alias shutdown="sudo shutdown"
alias poweroff="sudo shutdown now"
alias off="sudo shutdown now"
alias reboot="sudo reboot"
alias sync="onedrive --synchronize"
alias syncoff="onedrive --synchronize && poweroff"
alias syncreboot="onedrive --synchronize && reboot"
# Gammastep (blue light filter)
alias night="gammastep -m randr -P -O"
alias nighty="gammastep -m randr -P -O 2800"
alias nightoff="gammastep -m randr -P -O 6500"
# Dotnet
alias bld="dotnet msbuild"
alias rn="bin/Debug/net8.0/$(basename "$PWD")"
# Neovim
alias vim='nvim'
alias vi='nvim'
alias v='nvim'
alias sv='sudo nvim'
alias svi='sudo nvim'
alias svim='sudo nvim'
# Git
alias g="git"
alias gs="git status"
alias gp="git push"
alias ga="git add"
alias gc="git commit"
# Git for my dotfiles
alias dotgit="/usr/bin/git --git-dir=$HOME/Github/dotfiles-xx/ --work-tree=$HOME"
alias d="dotgit"
alias dg="dotgit"
alias ds="dotgit status"
alias dgs="dotgit status"
alias da="dotgit add"
alias dga="dotgit add"
alias dc="dotgit commit"
alias dgc="dotgit commit"
alias dp="dotgit push"
alias dgp="dotgit push"
# Tmux
alias t="tmux"
alias ta="tmux attach"
alias tl="tmux ls"
alias tk="tmux kill-server"

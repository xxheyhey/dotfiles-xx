# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/personal/bin" ] ; then
    PATH="$HOME/personal/bin:$PATH"
fi

# set PATH so it includes alacritty if it exists
if [ -d "$HOME/Github/alacritty/target/release" ] ; then
    PATH="$HOME/Github/alacritty/target/release:$PATH"
fi

if [ -z $DISPLAY ] && [ $(tty) = /dev/tty1 ]; then
    exec startx
fi

# opam configuration
test -r /home/vic/.opam/opam-init/init.sh && . /home/vic/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# Rust configuration
. "$HOME/.cargo/env"

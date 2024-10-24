#[ environments
# opam
test -r /home/vic/.opam/opam-init/init.sh && . /home/vic/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# Haskell
[ -f "/home/vic/.ghcup/env" ] && . "/home/vic/.ghcup/env" # ghcup-env

# Rust
. "$HOME/.cargo/env"
#]

#[ PATH
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/personal/bin" ] ; then
    PATH="$HOME/personal/bin:$PATH"
fi

# set PATH so it includes alacritty if it exists
if [ -d "$HOME/Git/alacritty/target/release" ] ; then
    PATH="$HOME/Git/alacritty/target/release:$PATH"
fi

# set PATH so it includes ncbi-blast if it exists
if [ -d "$HOME/.local/ncbi-blast-2.15.0+/bin" ] ; then
    PATH="$HOME/.local/ncbi-blast-2.15.0+/bin:$PATH"
fi

# set PATH so it includes go if it exists
if [ -d"$HOME/.local/go/bin" ] ; then
    PATH="$HOME/.local/go/bin:$PATH"
fi

# set PATH so it includes jetbrains rider if it exists
if [ -d"$HOME/.local/JetBrains Rider-2024.2.4/bin" ] ; then
    PATH="$HOME/.local/JetBrains Rider-2024.2.4/bin:$PATH"
fi
#]

# startx
if [ -z $DISPLAY ] && [ $(tty) = /dev/tty1 ]; then
    exec startx
fi

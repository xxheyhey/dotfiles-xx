# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

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
if [ -d "$HOME/Git/alacritty/target/release" ] ; then
    PATH="$HOME/Git/alacritty/target/release:$PATH"
fi

if [ -z $DISPLAY ] && [ $(tty) = /dev/tty1 ]; then
	exec startx
fi

# opam configuration
test -r /home/vic/.opam/opam-init/init.sh && . /home/vic/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# Rust configuration
. "$HOME/.cargo/env"

[ -f "/home/vic/.ghcup/env" ] && . "/home/vic/.ghcup/env" # ghcup-env
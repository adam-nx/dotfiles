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

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin:/usr/local/go/bin:/home/adam/go/bin:/usr/local/go/bin:/home/adam/go/bin

export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export PATH=/home/adam/.nvm/versions/node/v18.20.2/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin:/usr/local/go/bin:/home/adam/go/bin:/usr/local/go/bin:/home/adam/go/bin:/usr/local/go/bin:/home/adam/go/bin


export GOPATH=${HOME}/go
export PATH=${PATH}:${GOPATH}/bin

# Added by pillar client setup mobile
export PATH="$PATH:$HOME/fvm/default/bin:$HOME/.pub-cache/bin"
# . "$HOME/.cargo/env"

# Android SDK configuration
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME

# Android and Flutter PATH configuration
export PATH=$PATH:$HOME/fvm/default/bin:$HOME/.pub-cache/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/emulator

# Flutter/Dart command aliases
alias flutter="fvm flutter"
alias dart="fvm dart"
# Go paths
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin

# nvm path
export NVM_DIR=$HOME/.nvm


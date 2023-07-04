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

# Run ssh agen on startup
# eval `ssh-agent -s` 
# ssh-add ~/.ssh/id_rsa
#
# # Launch ssh-agent
# env=~/.ssh/agent.env
#
# agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }
#
# agent_start () {
#     (umask 077; ssh-agent >| "$env")
#     . "$env" >| /dev/null ; }
#
# agent_load_env
#
# # agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2=agent not running
# agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)
#
# if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
#     agent_start
#     ssh-add
# elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
#     ssh-add
# fi
#
# unset env
#

# Environment variables
# set the default editor to be neovim
export VISUAL=nvim
export EDITOR=$VISUAL

# Configuration Files \(dotfiles\)

This repo stores some of my useful configuration files \(commonly referred to as
dotfiles\) for a Linux machine.

# Migrating to a new system

One of the most useful parts of having version control for these config files is
that it is easy to migrate to a new system while maintaining configurations for
many popular applications. In order to do this, follow this modified version of
[this](https://www.atlassian.com/git/tutorials/dotfiles) guide. Note that it is
assumed that the new system uses a Linux-based OS.

1. Install git and clone the repo. E.g if the `apt` package manager is available
   then use the following.

```
sudo apt install -y git && git clone --bare git@github.com:TSoli/dotfiles.git
```

\(Note: might change this to use SSH in the future\)

2. Run the following command \(note this is in the `.bashrc` from later so will
   automatically be applied then\). This will be used similarly to the `git`
   command for the bare repo holding the config info.

```
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

\(Note: For the alias to take effect either restart bash with `bash` paste the
above command into the terminal as well\)

3. Checkout the repo

```
config checkout
```

If only a specific file is needed then use

```
config fetch --all && config checkout origin/master -- path/to/file
// git checkout <local repo name (default is origin)>/<branch name> -- path/to/file
```

to checkout the particular file \(from origin/master\).

If the following error occurs it is because there are existing configuration
files. Either delete them or back them up \(see the
[above guide](https://www.atlassian.com/git/tutorials/dotfiles)\)

```
error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting
```

4. Now run `source ~/.bashrc` and then run the setup script with
   `~/.setup_scripts/debian_based/bash_setup.sh` \(note that this is for
   Debian-based distros such as Ubuntu\). This will install neovim and some
   package managers \(nvm, npm, yarn\) that are generally useful and needed for
   some of the plugins I use. It also installs some of the Hack
   [Nerd-Fonts](https://github.com/ryanoasis/nerd-fonts) which needs to be
   manually enabled for the terminal in order for some symbols to show.

5. If running Linux, you may like to install
   [Alacritty](https://github.com/alacritty/alacritty) as a terminal emulator
   \(note there is config for it in this repo\).

# Troubleshooting

If it seems that `.zprofile` or `.zshrc` is not running properly on startup this
is likely due to the terminal not running as a login shell. Therefore, you may
need to change this setting in the terminal application itself.

It is also likely that the first time opening tmux the plugins will need to be
manually installed by pressing the prefix \(C-Space\) and then 'I' \(S-i\).

# Updating the config files

Simply use the `config` alias from anywhere in the system as if it were `git`.
E.g

```
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push
```

Often you might want to add all the modified tracked files. To do this simply
use:

```
config add -u
```

It may be useful to check the untracked files in a particular directory. This is
possible with

```
config ls-files --others <path/to/dir>
```

\(Note that if `path/to/dir` is excluded then it defaults to the current
directory.\)

## References

For Neovim setup I mostly followed
[this guide](https://www.youtube.com/playlist?list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ).

# TODO

- Look into neorg
- Customise polybar/look into other bars
- see what else is useful to rice i3?

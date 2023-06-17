# Configuration Files \(dotfiles\)

This repo stores some useful configuration files \(commonly referred to as dotfiles\).

# Migrating to a new system

One of the most useful parts of having version control for these config files is that it is easy to migrate to a new system while maintaining configurations for many popular applications. In order to do this, follow this modified version of [this](https://www.atlassian.com/git/tutorials/dotfiles) guide. Note that it is assumed that the new system uses a Linux-based OS.

1. Install git and clone the repo. E.g if the `apt` package manager is available then use the following.
```
sudo apt install -y git && git clone --bare https://github.com/TSoli/dotfiles.git $HOME/.dotfiles
```
\(Note: might change this to use SSH in the future\)

2. Add the following alias to the `.bashrc`. This will be used similarly to the `git` command for the bare repo holding the config info.
```
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```
\(Note: For the alias to take effect either restart bash with `bash` paste the above command into the terminal as well\)

3. Checkout the repo
```
config checkout
```
If only a specific file is needed then use
```
config fetch --all && config checkout origin/master -- path/to/file
// git checkout <local repo name (default is origin)>/<branch name> -- path/to/file
```
will checkout the particular file from the downloaded changes (origin/master).

If the following error occurs it is because there are existing configuration files. Either delete them or back them up \(see the [above guide](https://www.atlassian.com/git/tutorials/dotfiles)\)
```
error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting
```

4. Hide all the untracked files in the repo (otherwise it will show basically everything from the homne directory)
```
config config --local status.showUntrackedFiles no
```

5. Check things are working as expected

# Updating the config files

Simply use the `config` alias from anywhere in the system as if it were `git`. E.g

```
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push
```

Often you might want to add all the modified tracked files. To do this simply use:
```
config add -u
```

It may be useful to check the untracked files in a particular directory. This is possible with
```
config ls-files --others <path/to/dir>
```
\(Note that if `path/to/dir` is excluded then it defaults to the current directory.\)

6. Install a [Nerd-Font](https://github.com/ryanoasis/nerd-fonts) so that icons display correctly.

## References

For Neovim setup I mostly followed [this guide](https://www.youtube.com/playlist?list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ).

# TODO

- Write a bash script to automate this setup

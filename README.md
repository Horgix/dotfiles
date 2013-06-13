    ===========================================================================
                        _   _  ______  _____  _   _ _____
                       | | | |/ ___\ \/ / _ \| \ | |  ___|
                       | |_| | |  _ \  / | | |  \| | |_
                       |  _  | |_| |/  \ |_| | |\  |  _|
                       |_| |_|\____/_/\_\___/|_| \_|_|
    
    ===========================================================================

# What is HGXonf ?

HGXonf is a regroupment of many configurations, aiming at limiting to 3 steps
any new installation:

1. clone
2. install
3. profit

This way, whenever your have to make a fresh install because your old HDD
crashed or whatever, you will not be afraid to have to setup everything
manually in the worst scenario, or clone and check for conflicts between 42
differents git repositories.


# What configurations does it support ?

Actually, HGXonf includes configurations for:

* ZSH
* Bash
* Vim
* i3
* Git
* slrn
* urxvt

For more informations about each configuration, you will find a README in the
corresponding parts.

HGXonf also provides a bunch of little scripts which are used for some parts
of the configurations but can also be useful in other situations.

# How to install it ?

Sinply clone this repository and run the **./install.sh** from where you cloned
it. For example:

    git clone [repo adress] ~/.hgxonf
    cd ~/.hgxonf
    ./install.sh

## Installation process

It will prompt you for each file/directory located at the root of the cloned
repo. Not answering anything will make the script use the default answer (the
one capitalized among the possibilities).

If the file/dir doesn't exist, it will ask you if you want to create it. This
can be useful for example on a server where you totally don't care about the i3
(window manager) and urxvt (terminal) parts.

If the file/dir already exists, it will ask you if you want to replace it. Be
careful, if you answer Yes it will directly replace without any backup of the
existing file.

## How it works

Every file created/replaced is just a **symbolic link** to the file in the
cloned repo.

For example, if you cloned the repo to ~/.hgxonf, and you tell the install
script to create the .zshrc, il will created a symlink from ~/.zshrc to
~/.hgxonf/.zshrc.

This way, if you want to keep the installed configurations up-to-date, you
just have to pull for new revisions.

Anyway **be careful**: since the install script makes symlink, if you move the
directory where you cloned the repository it will broke the symlinks, thus
making your configuration invalid and not working at all.

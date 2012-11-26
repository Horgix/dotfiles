# HGXonf
# by Alexis 'Horgix' Chotard
# https://bitbucket.org/Horgix/

# install.sh for INSTALL
# Installs the configuration by creating symlinks

#! /bin/sh

Color_reset='\e[0;0m'

Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

BBlack='\e[1;30m'       # Bold Black
BRed='\e[1;31m'         # Bold Red
BGreen='\e[1;32m'       # Bold Green
BYellow='\e[1;33m'      # Bold Yellow
BBlue='\e[1;34m'        # Bold Blue
BPurple='\e[1;35m'      # Bold Purple
BCyan='\e[1;36m'        # Bold Cyan
BWhite='\e[1;37m'       # Bold White

files_to_install=`ls -A . | grep -Ev 'TODO|README|install.sh|.git'`

for file in $files_to_install; do
    echo -e "${Yellow}\nInstalling $file...${Color_reset}"
    target=~/$file
    src=`pwd`/$file
    if [ -e $target ]; then
        echo -n "$target already exists. Replace it ? (Y/n) : "
        read replace
        if [ -z $replace ]; then
            replace="Y"
        fi
        if [ $replace = "Y" ] || [ $replace = "y" ]; then
            echo "Removing $target..."
            rm -R ~/$file
            echo -e "${BRed}$target removed.${Color_reset}"
            echo "Creating Symlink $target on $src..."
            ln -is `pwd`/$file ~/
            echo -e "${BGreen}Symlink created."
        else
            echo -e "${BRed}$file skipped."
        fi
    else
        echo -n "$target doesn't exist. Create it ? (Y/n) : "
        read create
        if [ -z $create ]; then
            create="Y"
        fi
        if [ $create = "Y" ] || [ $create = "y" ]; then
            echo "Creating Symlink $target on $src..."
            ln -is `pwd`/$file ~/
            echo -e "${BGreen}Symlink created."
        else
            echo -e "${BRed}$file skipped."
        fi
    fi
    echo -en ${Color_reset}
done

# EOF

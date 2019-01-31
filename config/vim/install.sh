#!/bin/bash

#################################################################
#	I3 configuredinstall										#
#	Author: Pengzhan Hao										#
#																#
#	This bash script is used for install i3 and configure it.	#
#################################################################

## Colored Output Define

RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
BLUE="$(tput setaf 4)"
BOLD="$(tput bold)"
NORMAL="$(tput sgr0)"

execute () {
	echo "$1"
	eval "$1"
}

install_dep () {
	install_cmd="sudo apt install $1"
	printf "${YELLOW}We are going to install $1 on your computer ...${NORMAL}\n"
	execute "$install_cmd"
}

check_installed () {
	loc=$(whereis "$1")
	if [ "${#loc}" -gt $((${#1}+1)) ]; then
		printf "${GREEN}$1 is installed!${NORMAL}\n"
	else
		printf "${RED}$1 hasn't been installed!${NORMAL}\n"
		install_dep $1
	fi
}


DEPS=(vim git exuberant-ctags silversearcher-ag)
for dep in ${DEPS[@]}
do
	check_installed $dep
done

# copy config file to default config directory
cmd="cp -f ./vimrc ~/.vimrc"
execute "$cmd"

# install vundle
cmd="git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim"
execute "$cmd"

printf "\n\n${GREEN}Finished vim configuration, please follow these steps${NORMAL}\n"
printf "1, Use :PluginInstall in vim\n"
printf "2, Compile Youcompleteme\n"
printf "${RED}We will do these two steps for you, if you do not want to autocomplete this part,\nusing ctrl+c to quit within 5 sec${NORMAL}\n"
# sleep 5

cmd="vim +PluginInstall +qall"
execute "$cmd"



DEPS=(build-essential cmake python-dev python3-dev)
for dep in ${DEPS[@]}
do
	check_installed $dep
done
(cd ~/.vim/bundle/youcompleteme && ./install.py --clang-completer)
cmd="cp ./ycm_extra_conf.py ~/.vim/bundle/.ycm_extra_conf.py"
execute "$cmd"

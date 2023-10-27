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


DEPS=(zsh autojump git curl)
for dep in ${DEPS[@]}
do
	check_installed $dep
done

cmd='sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'
execute "$cmd"
cmd="chsh -s /bin/zsh"
execute "$cmd"


# copy config file to default config directory
cmd="cp -f ./zshrc ~/.zshrc"
execute "$cmd"

# install to external plugins
# syntax-highlighting
cmd="git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
execute "$cmd"
# autocomplete-recommand
cmd="git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
execute "$cmd"

printf "\n\n${GREEN}Finished zsh configuration, please use following command to reload${NORMAL}\n"
printf "source ~/.zshrc\n"

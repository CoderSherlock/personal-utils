#!/bin/bash


usage () {
	echo "Take one arguement, to identify the directory need to be clean up"
	echo "Like: ./cleanbc.sh ~/Github/"	
}


cleanpyc () {
	(cd ${1} && find . | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs rm -rf)
}




if [ $# -ne 1 ] ; then
	usage
	exit
fi


cleanpyc $1

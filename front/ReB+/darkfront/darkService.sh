#!/bin/bash
############################################################
# Author : DarkChyper
# Description : This script executes some domotic orders
#                   based on the command passed as argument.
#               The network wrapper is Xinetd on
#                   port 6868/tcp (domoservices)
############################################################

. envi.sh
. fnct.sh

# define split separator
IFS=" "

# read the incoming command
read IN

# split IN into arr[]
arr=($IN)

case ${arr[0]} in
	takeShot)
	if [[ $(#arr) -ne 3 ]]
		then 
			echo "[ERROR] takeShot needs 3 arguments : .width .height .pathToSave"
			DHSLog ERROR "takeShot command received with arguments error" "$IN"
	else

		takeShot ${arr[1]} ${arr[2]} ${arr[3]}
		[[ $? -eq 0 ]] || DHSLog ERROR "takeShot ends with error" $?
	fi
	;;

	takeVideo)
	if [[ $(#arr) -ne 4 ]]
		then 
			echo "[ERROR] takeVideo needs 4 arguments : .width .height .duration .pathToSave"
			DHSLog ERROR "takeVideo command received with arguments error" "$IN"
	else

		takeVideo ${arr[1]} ${arr[2]} ${arr[3]} ${arr[4]} 
		[[ $? -eq 0 ]] || DHSLog ERROR "takeVideo ends with error" $?
	fi
	;;
	

	*)echo "[ERROR] UNKNOWN COMMAND"
	;;
esac

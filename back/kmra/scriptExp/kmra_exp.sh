#!/bin/bash
####################################
# kmra_exp.sh Author : Simon Lhoir #
# -------------------------------- #
#                                  #
# V 1.0 20160206                   #
####################################

# on récupère les variables globales
# et les fonctions de base
. envi.sh
. fnct.sh

DHSLog BeginTask $0

if [ $# -ne 2 ]
	then
	DHSLog Error "kmra_exp.sh needs 2 arguments, delay between 2 shot and time to end HHMMSS"
	DHSLog EndTask $0
	exit
fi

# le script ne doit fonctionner que la semaine (v1.0)
jourDeLaSemaine=$(date '+%u')

if [[ $jourDeLaSemaine -eq 6 OR $jourDeLaSemaine -eq 7 ]]
	then
	DHSLog Warning "kmra_exp.sh doesn't work at week-end" "CR=4"
	DHSLog EndTask $0
	exit
fi

# creation du dossier de sauvegarde des images
CR=`$DIR_SCRIPT/kmraDir.sh` 

if [ CR -ne 0 ]
	then
	DHSLog Error "kmraDir failed, kmra_exp stopped"
	DHSLog EndTask $0
	exit
fi
 


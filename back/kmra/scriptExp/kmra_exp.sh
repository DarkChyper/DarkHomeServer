#!/bin/bash
#exec 2>"/tmp/${0##*/}.log"
#set -x
####################################
# kmra_exp.sh Author : Simon Lhoir #
# -------------------------------- #
#                                  #
# V 1.0 20160206                   #
####################################

# on récupère les variables globales
# et les fonctions de base
. envi.sh
. fctn.sh

DHSLog BeginTask $0

if [ $# -ne 2 ]
	then
	DHSLog Error "kmra_exp.sh needs 2 arguments, delay between 2 shot and time to end HHMMSS"
	DHSLog EndTask $0
	exit
fi

# le script ne doit fonctionner que la semaine (v1.0)
jourDeLaSemaine=$(date '+%u')

if [ $jourDeLaSemaine -eq 6 ] || [ $jourDeLaSemaine -eq 7 ]
	then
	DHSLog Warning "kmra_exp.sh doesn't work at week-end" "CR=4"
	DHSLog EndTask $0
	exit
fi


# creation du dossier de sauvegarde des images
CreateDir "$KMRA_DIR_ARCHIVES"

if [ ! -e "$KMRA_DIR_ARCHIVES/$(date '+%Y')/$(date '+%m')/$(date '+%d')" ]
	then
	DHSLog Error "kmraDir failed, $0 stopped"
	DHSLog EndTask $0
	exit
fi
 
DHSLog Info "Fin des vérifications, lancement de la prise de vue"
# variables
refresh=$1
end=$2
camera=reb

# debut de la prise de vue sur les cameras
"${KMRA_DIR_SCRIPT}/kmra.sh" $refresh $end $camera

# on duplique les fichiers de la journée
# dans le dossier temporaire

# TODO
DHSLog EndTask $0

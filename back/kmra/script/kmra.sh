#!/bin/sh
#exec 2>"/tmp/${0##*/}.log"
#set -x
####################################
# kmra.sh Author : Simon Lhoir     #
# -------------------------------- #
#                                  #
# V 1.0 20160206                   #
####################################

# on récupère les variables globales
# et les fonctions de base
#. envi.sh
#. fctn.sh

DHSLog BeginTask $0

path=$KMRA_DIR_ARCHIVES/$(date '+%Y')/$(date '+%m')/$(date '+%d')
refresh=$1
end=$2
camera=$3

temps=$(date '+%H%M%S')

DHSLog Info "Début du script de prise de vue automatique de la camera $camera"

while [ $temps -le $end ]
	do
		echo $REB_SERVICE
		retour=`ssh $LOGIN@$camera "$REB_SERVICE takeShot 1280 976 $path"`

		sleep $refresh
		temps=$(date '+%H%M%S')
		# on met les droits sur tous les fichiers
		chmod 666 $path/*.jpg

	done

DHSLog Info "Fin de la boucle de prise de vue pour la camera $camera"

DHSLog EndTask $0
exit

#!/bin/bash
####################################
# kmra.sh Author : Simon Lhoir     #
# -------------------------------- #
#                                  #
# V 1.0 20160206                   #
####################################

# on récupère les variables globales
# et les fonctions de base
. envi.sh
. fnct.sh

DHSLog BeginTask $0

DHSLog Info "Début du script de prise de vue automatique de la camera $camera"

path=$KMRA_D_WWW/$(date '+%Y')/$(date '+%m')/$(date '+%d')
refresh=$1
end=$2
camera=$3

temps=$(date '+%H%M%S')

while [ $temps -le $end ]
	do
		retour=`ssh dhs@$camera '$KMRA_S_FRONT takeShot 1920 1080 $path'`

		sleep $refresh
		temps=$(date '+%H%M%S')

	done

DHSLog Info "Fin de la boucle de prise de vue pour la camera $camera"

DHSLog EndTask $0
exit
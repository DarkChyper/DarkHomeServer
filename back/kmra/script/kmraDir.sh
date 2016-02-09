#!/bin/bash
####################################
# kmraDir.sh  Author : Simon Lhoir #
# -------------------------------- #
#                                  #
# V 1.0 20160206                   #
####################################

# on récupère les variables globales
# et les fonctions de base
. env.sh
. fctn.sh

DHSLog BeginTask $0

annee=$KMRA_D_ARCHIVES/$(date '+%Y')
mois=$annee/$(date '+%m')
jour=$mois/$(date '+%d')

if [ ! -e "$annee" ]
	then
		DHSLog Info "Creation du dossier de l'annee : $annee"
		mkdir $annee
		CRA=$?
		if [ $CRA -ne 0 ]
			then
				exit 12
		fi
fi

if [ ! -e "$mois" ]
	then
		DHSLog Info "Creation du dossier du mois : $mois"
		mkdir $mois
		CRM=$?
		if [ $CRM -ne 0 ]
			then
				exit 12
		fi
fi

if [ ! -e "$jour" ]
	then
		DHSLog Info "Creation du dossier du jour : $jour"
		mkdir $jour
		CRD=$?
		if [ $CRD -ne 0 ]
			then
				exit 12
		fi
fi

DHSLog EndTask $0

exit 0
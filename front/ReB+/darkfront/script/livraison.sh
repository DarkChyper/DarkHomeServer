#!/bin/sh

# on récupère les variables globales
# et les fonctions de base
. envi.sh
. fctn.sh

DHSLog BeginTask $0

dateHeure=$(date '+%Y%m%d.%H%M%S')

DHSLog Info "Creation de l'archive .tar.gz"
tar $DIR_HOME/livraisons/ReB.$dateHeure.tar.gz /darfront

DHSLog Info "Envoie de l'archive vers le serveur de BackEnd"
scp dhs@back:$DIR_HOME/livraisons/ReB.$dateHeure.tar.gz

DHSLog EndTask $0
exit
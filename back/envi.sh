#############################################
#         fichier de configuration          #
#             du serveur local              #
# ------------------------------------------#
#                                           #
# paramètre les chemins d'acces aux         #
# dossiers et fichiers utiles               #
#                                           #
#-------------------------------------------#
# Jan 2016 v1.0 SLH                         #
#############################################

# dossier temporaire
export DHS_DIR_TEMP=/mnt/dhstmp

# dossier serveur 
export DHS_DIR_SERV=/mnt/dhsnas

# LOGIN
export LOGIN=dhs

# GLOBALES
# dossier et variables logs
export DHS_DIR_LOG=$DHS_DIR_SERV/log
export DHS_TYP_OUT=0 # 0 pour un fichier 1 pour la sortie standard
export DHS_FIC_LOG=$DHS_DIR_LOG/DHSLog.`date '+%Y%m%d'`.log

# FRONT SERVICE
#############################################
export REB_SERVICE=/darkfront/darkService.sh

#############################################
# KMRA
# dossiers des scripts
export KMRA_DIR_SCRIPT=$DHS_DIR_SERV/kmra/script
#echo $0 $KMRA_DIR_SCRIPT
export KMRA_DIR_SCRIPTEXP=$DHS_DIR_SERV/kmra/scriptExp

# dossier des archives
export KMRA_DIR_ARCHIVES=$DHS_DIR_SERV/kmra/archives

#############################################
# RADIO


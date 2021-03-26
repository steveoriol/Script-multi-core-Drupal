#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
filename=$DIR/sites.txt
DORIGINE=`pwd`
IDSITE=1
echo "#####################################################"
echo "#  Script de gestion de plusieurs instances drupal  #"
echo "#                 [ version 0.3 ]                   #"
echo "#####################################################"
echo ""
echo "Liste les instances traitées (Ajouter les dossiers racines dans le fichier $filename) : "

while IFS= read -r dpath; 
do
	#Si la ligne est commentée on passe a la suivante
        if [[ ${dpath:0:1} == '#' ]]; then
                continue
        fi
	echo "  => $dpath ($IDSITE)";
	((IDSITE=IDSITE+1))
done < $filename
((IDSITE=IDSITE-1))

echo "Note: les lignes débutant par '#', sont ignorées."
echo ""

# 2ème parametre
if [ $# -ne 2 ]
then
	SITETOUSE="ALL"
else
	SITETOUSE=$2
fi

# Infos & Confirmation:
if test "$1" == "" 
   then 
     echo "Il manque la commande à exécuter ;-)" 
     echo "Exemples : exeSites.sh \"drush status\""
     echo "           exeSites.sh \"composer require drupal/coffee:1.x-dev@dev\""
     echo "           exeSites.sh \"composer update\" 2  <-- (pour exécuter seulement sur le site n°2)"
     exit 1 
   else
     echo "exécuter la commande : $1"
     if [ $SITETOUSE = "ALL" ]
     then
	     echo " sur tous les sites listés [$IDSITE site(s)]"
     else
	     echo " sur le site numéro $SITETOUSE"
     fi
fi

getConfirmContinue() {
    local REPONSE=""

    echo -e "Confirmez ? (o/n) : \c"
    read REPONSE
    if test "$REPONSE" != "o" -a "$REPONSE" != "O"
    then
        echo "(reponse = non)"
        exit 1
    else
        return 0
    fi
}
getConfirmContinue

IDSITE=1

echo Début:

while IFS= read -r dpath; 
do
	#Si la ligne est commentée on passe a la suivante
	if [[ ${dpath:0:1} == '#' ]]; then
	       	continue
       	fi
	
	#ALL sites ou un seul.
	if [[ $SITETOUSE = "ALL" || $IDSITE = $SITETOUSE ]]; then
		echo ""
		echo ">>$dpath<<";
		if  cd $dpath 
		then
			$1	
		else
        		echo "Rien à faire ici ..."
		fi
	fi
	((IDSITE=IDSITE+1))

done < $filename

cd $DORIGINE
echo Fin..

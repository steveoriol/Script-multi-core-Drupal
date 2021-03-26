#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
filename=$DIR/sites.txt
DORIGINE=`pwd`
echo "#####################################################"
echo "#  Script de gestion de plusieurs instances drupal  #"
echo "#                 [ version 0.2 ]                   #"
echo "#####################################################"
echo ""
echo "Liste les instances traitées (Ajouter les dossiers racines dans le fichier $filename) : "
while IFS= read -r dpath; 
do
	echo "  => $dpath";
done < $filename
echo "Note: les lignes débutant par '#', sont ignorées."
echo ""

if test "$1" == "" 
   then 
     echo "Il manque la commande à exécuter ;-)" 
     echo "Exemples : exeSites.sh \"drush status\""
     echo "           exeSites.sh \"composer require drupal/coffee:1.x-dev@dev\""
     exit 1 
   else
     echo "la commande demander est : $1"
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


echo Début:

while IFS= read -r dpath; 
do
	#Si la ligne est commentée on passe a la suivante
	if [[ ${dpath:0:1} == '#' ]]; then
	       	continue
       	fi

	echo ""
	echo ">>$dpath<<";
	if  cd $dpath 
	then
		$1	
	else
        	echo "Rien à faire ici ..."
	fi

done < $filename

cd $DORIGINE
echo Fin..

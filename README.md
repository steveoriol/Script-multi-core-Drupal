# Script-multi-core-Drupal

Renommez le fichier `sites.txt.example` en `sites.txt` et renseignez le chemin de la racine de chaque site à traiter avec le script, un seul site par ligne.

> Note: les lignes débutant par `#`, sont ignorées.

Puis lancez le script en ajoutant la commande à exécuter en paramètre, exemples :
```sh
exeSites.sh "drush status"
exeSites.sh "composer require drupal/token"
```
Un deuxième paramètre facultatif peut être renseigné pour limiter la commande à un seul site, il faut pour cela rajouter le numéro du site que l'on trouve dans la liste.
exemple :
```sh
exeSites.sh "composer update" 2
```


# Script-multi-core-Drupal

Renommez le fichier `sites.txt.example` en `sites.txt` et renseignez le chemin de la racine de chaque site à traiter avec le script, un seul site par ligne.  

> Note: les lignes débutant par `#`, sont ignorées.  

Puis lancez le script en ajoutant la commande à exécuter en paramètre, exemples :
```bash
xcsites "drush status"
xcsites "composer require drupal/token"
```
Un deuxième paramètre facultatif peut être renseigné pour limiter la commande à un seul site, il faut pour cela rajouter le numéro du site que l'on trouve dans la liste.  
exemple :
```bash
xcsites "composer update" 2
```

## Syntaxe :
```bash
xcsites [options] [arguments]
```
*Options :*

```
-h|?            Affiche cette aide
-a              A utiliser avec l'option "f" pour entrer un chemin absolu
-[a]f FICHIER   Nom/Chemin du FICHIER des sites à gérer
-y              Confirmation automatique
-v              Verbeux (inactif actuellement)
```
## Astuce :

Ajouter un lien symbolique du script dans l'un de vos chemins la variable $PATH (```bash echo $PATH ```)  
Ou,  
rajoutez un chemin 'bin' perso ```bash mkdir ~/bin ```  
et le rajouter dans $PATH avec ```bash export PATH="$HOME/bin:$PATH"```,  
rajoutez ou modifiez cette ligne dans votre fichier de profil pour que la modification dure.  
Suivant les distributions Linux, ce fichier peut être différent : ```bash~/.bashrc```, ```bash~/.bash_profile```, ```bash~/.profile```, ...  
```bash
ln -s ~/Script-multi-core-Drupal/xcsites ~/bin/xcsites
```
Maintenant, <code>xcsites</code> devrait être accessible de n'importe où ;-)

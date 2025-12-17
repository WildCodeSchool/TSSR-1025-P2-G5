# À quoi sert le programme ?

Le projet consiste à créer un script Bash permettant d'administrer une machine Linux à distance via SSH depuis une machine Debian ( gestion d'utilisateurs, informations système, action sur la machine etc.). L'objectif est de proposer un outil simple, intuitif et efficace permettant d'automatiser des actions répétitives. 

# À qui s'adresse le programme ?

Ce programme est destiné aux administrateurs réseau souhaitant automatiser des tâches courantes sur une machine linux à distance.

## Prérequis pour exécuter le script 

- script installé et exécutable 
- droits nécessaire ( sudo )
- connexion SSH fonctionnelle entre le serveur Debian et le client Ubuntu 

## Lancement du programme 

```
#lancement du programme depuis le serveur Debian :

./script_projet2.sh

```

### Exécution du script - LANCEMENT

Lors de l'exécution du script, un menu principal s'affiche. Il propose une interface ergonomique en ligne de commande, structurée autour de sous-menus, permettant à l'utilisateur de naviguer facilement et de sélectionner les actions souhaitées.

![[lancement_menu.png]](.Ressources/lancement_menu.png)


### Une cible qui peut être un ordinateur ou un utilisateur

L'utilisateur commence par définir la cible sur laquelle il souhaite intervenir : 
- utilisateur : nom complet de l'utilisateur
- ordinateur : nom de la machine 
- option permettant de quitter le script à tout moment, garantissant une sortie propre.

### Un choix entre une/des action(s) à effectuer et de la recherche d’informations

Une fois la cible définie, l'utilisateur peut choisir entre l'exécution d'actions ou la consultation d'informations.

**Actions possibles :**
- **Actions sur les _utilisateurs_ :**
	- création ou suppression de comptes utilisateurs
	- modification du mot de passe 
	- ajout à un groupe local
	- retrait d'un groupe local
- **Actions sur les _ordinateurs_**
	- arrêt de la machine
	- redémarrer la machine

Après l'exécution d'une action, le script se termine automatiquement.

**Consultation d'informations :**
- **Informations sur les _utilisateurs_ :**
	- affichage de la date de dernière connexion 
- **Informations sur les _ordinateurs_ :**
	- version du système 
	- nombre de partitions
	- quantité totale de mémoire RAM

Si l’utilisateur saisit une option différente de celles proposées, un message « option invalide » s’affiche. 

![[option_invalide.png]](.Ressources/option_invalide.png)

# Gestion des Ordinateurs



![[gestion_ordinateur1.png]](.Ressources/gestion_ordinateur1.png)

Le menu affiche la machine sur laquelle se connecter 

CLILIN01 :

![[gestion_ordinateur3.png]](.Ressources/gestion_ordinateur3.png)


Menu 'Ordinateur' permettant d'effectuer des **actions** sur la machine distante (arrêt ou redémarrage) et de consulter les **informations systèmes** ( version de l'OS, nombre de partitions et mémoire RAM totale.)

##### 1) **ACTION sélectionné**

![[actions_ordinateur.png]](.Ressources/actions_ordinateur.png)

Possibilité d'arrêter la machine distante, la redémarrer ou de quitter le script.

##### 2) **INFORMATIONS sélectionné**

![[informations_ordinateur.png]](.Ressources/informations_ordinateur.png)


Affichage des informations système de la machine distante : version du système d'exploitation, nombre de partitions et quantité totale de mémoire RAM

# Gestion des Utilisateurs 

![[option_utilisateurs.png]](.Ressources/option_utilisateurs.png)

Menu 'utilisateurs' permettant la gestion des comptes ( création, suppression, modification du mot de passe, gestion des groupes) ainsi que l'affichage de la date de dernière connexion.

##### 1) **ACTIONS sélectionné :**  choisir un utilisateur

![[gestion_utilisateurs_actiond.png]](.Ressources/gestion_utilisateurs_actiond.png)

- changement de mot de passe pour l'utilisateur sélectionné
- ajout à un groupe local
- sortie d'un groupe local 
- sortie du script

##### 2)**CREER UN COMPTE UTILISATEUR LOCAL sélectionné**


![[gestion_utilisateur_création_compte_local.png]](.Ressources/gestion_utilisateur_création_compte_local.png)

Inscrire le nom d'utilisateur à créer. 

Si il existe déjà, un message d'erreur s'affiche :
" l'utilisateur existe déja"


![[utilisateur_existe_déja.png]](.Ressources/utilisateur_existe_déja.png)


##### 3) **INFORMATIONS SUR L'UTILISATEUR sélectionné**


![[gestion_utilisateurs_informations.png]](.Ressources/gestion_utilisateurs_informations.png)


Affiche la date de la dernière connexion de l'utilisateur en question. 

Si il ne s'est jamais encore connecté, le message "never logged in" s'affiche 


![[never_logged.png]](.Ressources/never_logged.png)

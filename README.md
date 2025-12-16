## Description 

Le projet consiste à créer un script Bash permettant d'administrer une machine Linux à distance via SSH depuis une machine Debian ( gestion d'utilisateurs, informations système, action sur la machine etc.). L'objectif est de proposer un outil simple, intuitif et efficace permettant d'automatiser des actions répétitives. 

le script permet notamment de :
- gérer des utilisateurs à distance 
- administrer des postes clients 
- interroger des informations systèmes
- exécuter des opérations ciblées
- automatiser certaines tâches répétitives 

## Contexte du projet 

- **formation** : TSSR (technicien système et réseaux)
- **objectif pédagogique** : Développer un script Bash qui capable d'administrer une machine cliente Ubuntu et réaliser des actions à distance, exécutable depuis un serveur Debian.
- **environnement utilisé** : VirtualBox

## Architecture technique

plage IP :  **172.16.50.0/24**
nom du script : script_projet2.sh

**CLIENT** :
- OS : Linux Ubuntu (64 bits)
- version : Ubuntu 24.04.3 LTS
- nom de la VM : CLILIN01
- Compte : wilder 
- mot de passe : Azerty1*
- adresse IP : 172.16.50.30
- masque : 255.255.255.0

**SERVEUR** :
- OS : Debian (64 bits)
- version : Debian GNU/Linux 13 (trixie)
- nom de la VM : SRVLX01
- compte : wilder
- mot de passe : Azerty1*
- adresse IP : 172.16.50.10
- masque : 255.255.255.0

## Fonctionnalités principales du script

#### Affichage du menu 
- ergonomique 
- choix entre deux cibles : ordinateur ou utilisateur
- sous menus
- possibilité de sortie du script à tout moment

#### Gestion de l'utilisateur 👤
- création de compte utilisateur local
- changement de mot de passe
- ajout et sortie d'un groupe local
- affichage de la date de la dernière connexion de l'utilisateur 
- possibilité de sortie du script

#### Gestion de l'ordinateur 🖥️
- arrêt de la machine à distance
- version de l'OS
- nombre de partitions
- mémoire RAM totale
- possibilité de sortie du script

## Difficultés rencontrées

- gestion des droits sudo à distance
- affichage de la liste des utilisateur via SSH 
- mise en forme de l'esthétique du menu 

## Suggestion d'améliorations futures 

- ajouter la gestion de plusieurs machines
- améliorer l'aspect graphique notamment grâce aux outils whiptail, dialog etc 

## Auteur 

Projet réalisé par Nahyla Kharbouche dans le cadre de la formation **TSSR de la Wild Code School**

# Prérequis technique

- VM Linux Ubuntu 64 bits 
- VM Debian GNU/Linux 13 
- Guest additions sur les deux VM 
- Git installé 
- SSH installé
- connexion SSH entre le client et le serveur établie 
- réseau interne configuré
- droits sudo 

# Configuration du réseau IP interne 

Chaque VM possède deux cartes réseau :
- adaptateur 1 : NAT
- adaptateur 2 : Réseau interne ( ici renommé lan1)

1) aller dans le menu de configuration des deux VM sur VirtualBox, puis dans la section 'réseau'.
ajouter ensuite un deuxième adaptateur que l'on renomme 'lan1', pour les deux machines :
![[configuration_reseau_interne.png]](.Ressources/configuration_reseau_interne.png)
2) configurer ensuite les adresses ip:
serveur DEBIAN : 172.16.50.10
client UBUNTU : 172.16.50.30

### Sur le serveur Debian :
le serveur Debian utilise une adresse IP configurée dans le fichier '/etc/network/interfaces'

On rajoute au fichier la partie :
```
allow-hotplug enp0s8
auto enp0s8
iface enp0s8 inet static
    address 172.16.50.10
    netmask 255.255.255.0
```

![[carte_réseau_debian.png]](.Ressources/carte_réseau_debian.png)

puis on redémarre 
```
sudo reboot 
```

### sur le client Ubuntu 
le client Ubuntu utilise une adresse IP configurée en GUI dans :  paramètre  → réseau  → Ethernet (enp0s8)  ( l'activer.)
![[configuration_ip_ubuntu1.png]](.Ressources/configuration_ip_ubuntu1.png)


Configurer manuellement l'adresse IP : 
Filaire → IPV4

![[configuraton_ip_ubuntu2.png]](.Ressources/configuraton_ip_ubuntu2.png)

- Adresse IP : 172.16.50.30  
- Masque : 255.255.255.0


Puis, redémarrer 
```
sudo reboot
```


# Installer les Guests Additions 

## sur Debian 

1) mettre la machine à jour 
```
sudo apt update
sudo apt upgrade -y 
```

2) installer les paquets nécessaires
````
sudo apt install build-essential dkms linux-headers-$(uname -r)
````

3) monter l'image CD

Insérer l'image CD des guest additions dans le menu _périphérique_ de la machine virtuelle VirtualBox, et monter l'image CD

![[guest_additions_debian.png]]


```
sudo mount /dev/cdrom /mnt
```

4) exécuter le script d'installation 
```
cd /mnt
sudo ./VBoxLinuxAdditions.run
```

5) redémarrer la machine virtuelle
```
sudo reboot
```

## sur Ubuntu 

1) mettre la machine à jour
````
sudo apt update
sudo apt upgrade -y 
````


2) installer les paquets nécessaires
````
sudo apt install build-essential dkms linux-headers-$(uname -r)
````


3) Cliquer sur Périphériques > **Insérer l’image CD des Additions invité**. 
![[guest_additions_ubuntu.png]]

5) Lancer le programme d’installation des additions invité 
	-  en graphique : ouvrir le gestionnaire de fichiers > lecteur CD > **VBoxLinuxAdditions.run** > **Lancer**.

![[guest_additions_ubuntu2.png]]



 En interface de commande : 


```
cd /media/[Utilisateur]/VBOX_GAs_xxx/
sudo ./VBoxLinuxAdditions.run
```


5) redémarrer la machine virtuelle```

```
sudo reboot
```


# Installer GIT 

1) installer GIT
```
sudo apt install git -y
```

2) vérifier l'installation 
```
git --version 
```
 


# Connexion SSH

## sur la machine cliente SSH ( Debian )

1) Générer une paire de clés sur le client 
```
ssh-keygen 
```


![[génération_paire_de_clées.png]]


2) copier la clé publique sur Ubuntu 
```
ssh-copy-id wilder@172.16.50.30
```
![[copier_clé_publique.png]]

3) connexion à la machine en ssh 
```
ssh wilder@172.16.50.30
```
![[connexion_en_ssh.png]]



# Installation du programme

Récupération du projet
```
git clone https://github.com/WildCodeSchool/TSSR-1025-P2-G5.git
cp script_projet2.sh
```


Attribution des droits 
```
chmod +x script_projet2.sh
```

Lancement du programme
```
./script_projet2.sh
```

Vérification 
- Le script affiche bien le menu principal 
- Les actions distantes fonctionnent grâce au SSH

Le menu après exécution du script :

![[menu.png]]

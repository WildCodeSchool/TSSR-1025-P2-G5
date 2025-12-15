

---

# 🟦 **FICHE TUTORIEL — Configurer un réseau interne entre Debian, Ubuntu et Windows (Server + Client)**

---

# 🟠 1) CONFIGURATION VIRTUALBOX (COMMUNE À TOUTES LES VMs)

Chaque VM doit avoir **deux cartes réseau** :

## ✔️ **Adaptateur 1 : NAT**

- Permet l’accès Internet
    
- On ne touche pas aux IP, c’est automatique
    

## ✔️ **Adaptateur 2 : Réseau interne**

- Permet aux VMs de se ping / SSH / RDP entre elles
    
- Toutes les VMs doivent utiliser **le même nom de réseau interne**  
    Exemple : `lan1`
    

👉 **Adaptateur 2 → Réseau interne → lan1**

---

# 🟡 2) ATTRIBUER DES ADRESSES IP (réseau interne)

On va choisir un petit réseau simple :  
**172.16.50.0/24**

|Machine|Rôle|IP interne|
|---|---|---|
|Debian|Serveur Linux|**172.16.50.30**|
|Ubuntu|Client Linux|**172.16.50.40**|
|Windows Server|AD/DNS etc.|**172.16.50.10**|
|Windows Client|Client Windows|**172.16.50.20**|

Masque pour tout : **255.255.255.0**  
Passerelle : **vide** (c’est un réseau interne, pas routé)

---

# 🟢 3) CONFIGURER L’IP SUR DEBIAN

Fichier :

```bash
sudo nano /etc/network/interfaces
```

Config :

```conf
allow-hotplug enp0s8
auto enp0s8
iface enp0s8 inet static
    address 172.16.50.30
    netmask 255.255.255.0
```

Appliquer :

```bash
sudo ifdown enp0s8 && sudo ifup enp0s8
```

---

# 🔵 4) CONFIGURER L’IP SUR UBUNTU (GUI OU NETPLAN)

## ✔️ Méthode graphique (easy)

Paramètres → Réseau → Filaire → ⚙️ → IPv4 :

- Manuel
    
- Adresse : **172.16.50.40**
    
- Masque : **255.255.255.0**
    
- Passerelle : (vide)
    

Appliquer.

## ✔️ Méthode Netplan

Fichier :

```
/etc/netplan/*.yaml
```

Exemple :

```yaml
network:
  version: 2
  ethernets:
    enp0s8:
      addresses: [172.16.50.40/24]
      dhcp4: no
```

Appliquer :

```bash
sudo netplan apply
```

---

# 🟣 5) CONFIGURER L’IP SUR WINDOWS SERVER

1. Panneau de config
    
2. Centre Réseau et partage
    
3. Modifier les paramètres de la carte
    
4. Clique droit → Propriétés
    
5. IPv4 → Propriétés
    

Mettre :

- Adresse IP : **172.16.50.10**
    
- Masque : **255.255.255.0**
    
- Passerelle : **vide**
    
- DNS : (laisser vide pour le moment)
    

Valider.

---

# 🟤 6) CONFIGURER L’IP SUR WINDOWS CLIENT

Même chemin :

- Adresse IP : **172.16.50.20**
    
- Masque : **255.255.255.0**
    
- Passerelle : vide
    
- DNS : vide (ou 172.16.50.10 si ton Windows Server devient DNS)
    

---

# 🧪 7) TEST DE COMMUNICATION ENTRE TOUTES LES MACHINES

Depuis Debian :

```bash
ping 172.16.50.10   # Windows Server
ping 172.16.50.20   # Windows Client
ping 172.16.50.40   # Ubuntu
```

Depuis Ubuntu :

```bash
ping 172.16.50.30   # Debian
ping 172.16.50.10   # Windows Server
ping 172.16.50.20   # Windows Client
```

Depuis Windows (cmd) :

```cmd
ping 172.16.50.30
ping 172.16.50.40
```

Si tout répond → TON RÉSEAU EST CONFIGURÉ PARFAITEMENT 🔥

---

# 🛑 8) ERREURS COURANTES À ÉVITER

|Erreur|Conséquence|
|---|---|
|Même IP sur 2 machines|Plus rien ne répond|
|Modifier l’adaptateur NAT|Plus d’Internet|
|Pas la bonne interface (enp0s3 au lieu de enp0s8)|IP ignorée|
|Mettre une passerelle|Paquet perdu, pas d’intérêt|
|Conflit DHCP|Windows se fâche|

---

# 🟢 9) RÉSUMÉ ULTRA RAPIDE (pour ton cerveau 🧠)

- Adaptateur 1 → NAT
    
- Adaptateur 2 → Réseau interne “lan1”
    
- Debian : `/etc/network/interfaces`
    
- Ubuntu : GUI / Netplan
    
- Windows Server & Client : IPv4 dans Panneau de config
    
- IP différentes → même plage
    
- Ping = OK
    

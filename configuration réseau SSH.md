
---

# 🟦 **FICHE TUTO — SSH avec Clés Publiques/Privées 

---

# 🟢 1) **Le principe (ultra simple)**

SSH peut t’authentifier de 2 manières :

- 🔐 avec un **mot de passe**
    
- 🔑 avec une **paire de clés** (clé publique + clé privée)
    

Avec les clés :

- La **clé publique** va sur le serveur (Ubuntu)
    
- La **clé privée** reste sur le client (Debian)
    
- SSH te reconnaît automatiquement → **connexion sans mot de passe**
    

C’est plus sûr, plus rapide, et parfait pour les scripts.

---

# 🟠 2) **Générer une paire de clés sur le client (Debian)**

Sur **la machine qui va SE CONNECTER** :

```bash
ssh-keygen
```

Réponds juste **Entrée** à tout.

Ça crée :

- clé privée → `~/.ssh/id_rsa`
    
- clé publique → `~/.ssh/id_rsa.pub`
    

👉 Ne JAMAIS montrer la clé privée  
👉 On partage seulement la clé publique

---

# 🟡 3) **Copier la clé publique vers le serveur (Ubuntu)**

Sur Debian :

```bash
ssh-copy-id wilder@172.16.50.40
```

Ton mot de passe Ubuntu te sera demandé une dernière fois.

Puis :

```
Number of key(s) added: 1
```

🔥 Boom → la clé est installée dans :

```
~/.ssh/authorized_keys
```

(côté Ubuntu)

---

# 🟣 4) **Connexion SSH sans mot de passe**

Toujours sur Debian :

```bash
ssh wilder@172.16.50.40
```

Si tout est bon → tu te connectes **direct**, sans rien taper.

---

# 🟤 5) **Méthode manuelle (si ssh-copy-id ne marche pas)**

### ① Debian (client) :

```bash
cat ~/.ssh/id_rsa.pub
```

Tu copies toute la ligne.

### ② Ubuntu (serveur) :

```bash
mkdir -p ~/.ssh
chmod 700 ~/.ssh
nano ~/.ssh/authorized_keys
```

Tu colles la clé  
→ Ctrl + O → Entrée  
→ Ctrl + X

Puis :

```bash
chmod 600 ~/.ssh/authorized_keys
```

---

# 🔵 6) **Vérifier que le serveur SSH fonctionne**

Sur Ubuntu :

```bash
sudo systemctl status ssh
```

Il doit être en :

```
active (running)
```

Si besoin :

```bash
sudo systemctl start ssh
sudo systemctl enable ssh
```

---

# 🟩 7) **Désactiver totalement l’accès par mot de passe (optionnel, sécurisé)**

Sur Ubuntu :

```bash
sudo nano /etc/ssh/sshd_config
```

Changer :

```conf
PasswordAuthentication no
PubkeyAuthentication yes
```

Puis :

```bash
sudo systemctl restart ssh
```

👉 Maintenant : connexion **SEULEMENT** via clé  
👉 Ultra sécurisé pour les serveurs

---

# 🧪 8) **Test rapide**

Sur Debian :

```bash
ssh -v wilder@172.16.50.40
```

Tu verras chaque étape :

- test clé privée
    
- envoi clé publique
    
- acceptation
    
- connexion
    

Très pratique pour débug.

---

# 🛑 9) Erreurs fréquentes (et solutions rapides)

|Erreur|Cause|Solution|
|---|---|---|
|Permission denied|Mauvais user / clé absente|Vérifier `authorized_keys`|
|Connection refused|SSH pas lancé|`systemctl start ssh`|
|No such file / no permission|Mauvais droits|`chmod 700 ~/.ssh` + `chmod 600 authorized_keys`|
|Impossible de coller dans nano depuis PuTTY|Clic droit pour coller|Pas Ctrl+V|

---

# 🟣 10) Résumé en 10 secondes

1. Client → `ssh-keygen`
    
2. Client → `ssh-copy-id user@serveur`
    
3. Serveur → clé = `~/.ssh/authorized_keys`
    
4. Client → `ssh user@serveur` (sans mdp)
    
5. Optionnel : désactiver PasswordAuthentication
    


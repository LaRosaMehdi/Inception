# Documentation du Projet Inception

## Description
Ce projet est une infrastructure Docker composée de trois services principaux : Nginx, WordPress et MariaDB. Il permet de déployer un site WordPress de manière sécurisée avec SSL.

## Architecture
Le projet utilise une architecture à trois conteneurs :
1. **Nginx** : Serveur web avec SSL
2. **WordPress** : CMS avec PHP-FPM
3. **MariaDB** : Base de données

## Structure du Projet
```
Inception/
├── Makefile
├── Readme
└── srcs/
    ├── .env
    ├── docker-compose.yaml
    └── requirements/
        ├── mariadb/
        │   ├── Dockerfile
        │   └── conf/
        ├── nginx/
        │   ├── Dockerfile
        │   ├── conf/
        │   └── ssl/
        └── wordpress/
            ├── Dockerfile
            └── conf/
```

## Configuration
### Variables d'Environnement (.env)
- **Domaine** : `mla-rosa.42.fr`
- **Ports** :
  - Nginx : 443
  - WordPress : 9000
  - MariaDB : 3306
- **Identifiants** :
  - MariaDB :
    - Root : root/root
    - Utilisateur : mla-rosa/mboy
  - WordPress :
    - Admin : mboy/mla-rosa
    - Email : mboy@student.42nice.fr

## Commandes Disponibles
Le projet utilise un Makefile avec les commandes suivantes :
- `make all` : Construit et démarre les conteneurs
- `make clean` : Arrête les conteneurs
- `make fclean` : Nettoie tout (conteneurs, images, volumes)
- `make re` : Nettoie et reconstruit tout
- `make usage` : Affiche l'aide

## Volumes
Deux volumes persistants sont créés :
1. `inception_mariadb_volume` : Stockage des données MariaDB
2. `inception_wordpress_volume` : Stockage des fichiers WordPress

## Sécurité
- Utilisation de SSL pour le trafic web
- Configuration sécurisée de PHP-FPM
- Gestion des permissions des volumes
- Configuration réseau isolée

## Dépendances
- Docker
- Docker Compose
- OpenSSL (pour les certificats)

## Installation
1. Cloner le dépôt
2. Configurer les variables dans `srcs/.env`
3. Exécuter `make all`

## Maintenance
- Les conteneurs sont configurés pour redémarrer automatiquement
- Les volumes sont persistants
- Les logs sont accessibles via Docker

## Notes
- Le projet nécessite des privilèges sudo pour modifier le fichier hosts
- Les certificats SSL doivent être générés avant le premier démarrage
- Les volumes sont montés en local pour la persistance des données 
# Monorepo Micro-Service

Architecture monorepo moderne avec deux applications Next.js conteneurisées.

## Vue d'ensemble

Ce projet utilise une architecture **monorepo** avec :
- **Admin** : Interface d'administration (port 3000)
- **Frontend** : Interface utilisateur (port 3001)

## Démarrage rapide

### Prérequis
- Docker 20.10+
- Docker Compose 2.0+

### Lancer l'ensemble
```bash
# Construire et démarrer tous les services
docker-compose up --build

# Mode détaché
docker-compose up -d --build
```

### Accès aux applications
- **Admin** : http://localhost:3000
- **Frontend** : http://localhost:3001

## Architecture

```
monorepo-micro-service/
├── apps/
│   ├── admin/                 # Application d'administration
│   │   ├── app/              # Pages Next.js 15
│   │   ├── docker/           # Scripts Docker
│   │   ├── dockerfile        # Configuration Docker
│   │   └── next.config.js    # Configuration Next.js
│   └── frontend/             # Application utilisateur
│       ├── app/              # Pages Next.js 15
│       ├── docker/           # Scripts Docker
│       ├── dockerfile        # Configuration Docker
│       └── next.config.js    # Configuration Next.js
├── docker-compose.yml        # Orchestration des services
└── README.md                # Documentation
```

## Configuration

### Services Docker

| Service | Port | Description |
|---------|------|-------------|
| admin | 3000 | Interface d'administration |
| frontend | 3001 | Interface utilisateur |

### Variables d'environnement
- `NODE_ENV=production`
- `PORT=3000` (interne)

### Volumes
- **Développement** : Montage des sources pour le hot-reload
- **Production** : Volumes anonymes pour node_modules et .next

## Dépannage

### Problèmes courants

1. **Ports déjà utilisés**
   ```bash
   # Vérifier les ports utilisés
   netstat -tulpn | grep :3000
   netstat -tulpn | grep :3001
   ```

2. **Problèmes de build**
   ```bash
   # Forcer la reconstruction
   docker-compose build --no-cache
   ```

3. **Problèmes de permissions**
   ```bash
   # Corriger les permissions
   sudo chown -R $USER:$USER ./apps/
   ```

### Debugging

```bash
# Accéder à un conteneur
docker-compose exec admin sh
docker-compose exec frontend sh

# Voir les logs d'erreur
docker-compose logs --tail=100

# Vérifier l'état des healthchecks
docker-compose ps
```

## Développement

### Mode développement local
```bash
# Dans apps/admin
cd apps/admin && npm run dev

# Dans apps/frontend  
cd apps/frontend && npm run dev
```

### Ajouter un nouveau service
1. Créer le dossier `apps/nouveau-service/`
2. Ajouter le Dockerfile
3. Configurer dans `docker-compose.yml`
4. Ajouter les volumes et ports appropriés

---

**Architecture conçue pour la scalabilité et la maintenabilité** 
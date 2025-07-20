# Monorepo Micro-Service

Architecture monorepo moderne avec deux applications Next.js conteneurisées. Le but étant de pouvoir ajouter autant de service personnalisés sur le répo, du GO, une API Express, etc...

**Ceci est un projet de test, ne pas utiliser en PRODUCTION**

## Vue d'ensemble

Ce projet utilise une architecture **monorepo** avec :
- **Admin** : Interface d'administration (port 3000)
- **Frontend** : Interface utilisateur (port 3001)

## Démarrage rapide

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
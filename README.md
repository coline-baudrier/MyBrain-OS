# 🧠 MyBrainOS

## Présentation

**MyBrainOS** est une application mobile conçue pour capturer et conserver des souvenirs personnels au quotidien : musiques, photos, citations, livres, humeurs, et bien plus.  
Développée comme projet personnel, l’objectif est un **déploiement complet d’ici fin 2025**.

---

## 🚀 Stack technique

- **Frontend** : [React Native](https://reactnative.dev/) (via Expo)
- **Backend** : [NestJS](https://nestjs.com/) (Node.js)
- **Base de données** : MySQL
- **API** : REST
- **Langage** : TypeScript
- **Outils** : ESLint, Prettier, Jest

---

## 🧩 Fonctionnalités prévues

- [ ] Ajouter un souvenir (texte, photo, musique, humeur, citation, livre, etc.)
- [ ] Visualiser les souvenirs par jour/mois/année
- [ ] Recherche et filtres
- [ ] Utilisation de tags
- [ ] Export/Import des données
- [ ] Authentification (JWT)
- [ ] Mode sombre

### Optionnelles

- [ ] Statistiques d’humeur (diagrammes, tendances)
- [ ] Notifications (optionnel)
- [ ] Intégrations externes (Spotify, Goodreads, etc.)
- [ ] Accessibilité améliorée
- [ ] Thèmes personnalisables

---

## ⚙️ Installation

### Prérequis

- Node.js (v18 ou supérieur)
- npm
- [Expo CLI](https://docs.expo.dev/get-started/installation/) (`npm install -g expo-cli`)
- MySQL (local ou distant)

### Lancement du projet

```bash
# Installer toutes les dépendances (frontend + backend)
npm run install:all

# Démarrer le backend
npm run start:backend

# Démarrer le frontend (Expo)
npm run start:frontend
```

> 💡 Si tu travailles avec des `.env`, assure-toi de les configurer dans les deux parties du projet.

---

## 📱 Utilisation

> Cette section sera enrichie après la mise en place des premières fonctionnalités UI/UX.

---

## 🧱 Architecture du projet

Le projet est structuré en deux parties principales :

### 📲 Frontend (`/frontend`)

Développé avec React Native (Expo), il utilise :

- **Navigation** : React Navigation
- **Gestion d’état** : Zustand
- **Appels API** : Axios
- **Gestion des assets** : Expo Media Library, ImagePicker

#### Structure proposée :

```
/frontend
├── assets/
├── components/
├── screens/
├── navigation/
├── services/        # appels API
├── store/           # gestion d'état globale
├── utils/
└── App.tsx
```

---

### 🖥️ Backend (`/backend`)

Basé sur NestJS, le backend fournit les endpoints de l'API REST et gère la logique métier, les utilisateurs, et l’accès à la base de données.

#### Structure :

```
/backend
├── src/
│   ├── modules/
│   │   ├── auth/
│   │   ├── memories/
│   │   ├── users/
│   ├── common/
│   ├── database/
│   └── main.ts
├── test/
└── .env
```

#### Principaux éléments :

- **Contrôleurs** : gèrent les routes REST
- **Services** : logique métier (création de souvenirs, filtrage, etc.)
- **Entités** : représentations des tables MySQL via TypeORM
- **DTOs** : validation des données en entrée

---

### 🗃️ Base de données

Utilise MySQL avec **TypeORM**.

#### Exemple de schéma (simplifié) :

- `User`: id, email, password, created_at
- `Memory`: id, user_id (FK), type, content, mood, created_at
- `Tag`: id, name
- `Memory_Tag`: memory_id, tag_id (relation N:N)

> 👉 Des migrations et des seeds seront intégrés pour faciliter les tests et le déploiement.

---

### 🗃️ Liste des endpoints API

> Catégorie mise à jour quand la base de données aura été parfaitement définies.

---

## ✅ Bonnes pratiques

- Utilisation systématique de **TypeScript**
- Linting et formatage automatique via **ESLint** + **Prettier**
- **Tests unitaires** (Jest) et **end-to-end**
- Respect de l’architecture modulaire (Clean Architecture)
- Commit messages clairs et fréquents (conventionnellement formatés)
- Documentation du code avec commentaires et fichiers `README` par module

---

## 🧪 Tests

Les tests seront ajoutés progressivement :

- **Unitaires** : services, utilitaires
- **E2E** : endpoints NestJS, via `@nestjs/testing`
- **Frontend** : à l’aide de `jest-expo`, `react-test-renderer`, et `@testing-library/react-native`

---

## 🚀 Déploiement

Le déploiement s’effectuera via une **pipeline CI/CD** (GitHub Actions ou GitLab CI) avec les étapes suivantes :

1. Lint & Tests
2. Build frontend et backend
3. Déploiement backend (Docker, VPS ou Railway)
4. Publication mobile (Expo Go ou build natif via EAS)

---

## ⚙️ Fonctionnement global

- Le **backend** expose des endpoints pour créer, récupérer et filtrer les souvenirs.
- Le **frontend** consomme cette API et affiche une interface intuitive pour naviguer dans ses souvenirs.
- Les données sont synchronisées en ligne, mais une stratégie de cache/local storage est prévue pour les utiliser hors ligne.

---

## 📅 Roadmap / TODO

| Tâche                        | État        |
| ---------------------------- | ----------- |
| Choisir la base de données   | ✅ MySQL    |
| Définir le modèle de données | 🔄 En cours |
| UI/UX - Maquettes Figma      | 🔲 À faire  |
| Authentification JWT         | 🔲 À faire  |
| Mise en place CI/CD          | 🔲 À faire  |
| Intégration souvenirs        | 🔲 À faire  |
| Statistiques d’humeur        | 🔲 À faire  |

---

## 🔗 Liens utiles

- [📚 Expo Documentation](https://docs.expo.dev/)
- [📘 NestJS Documentation](https://docs.nestjs.com/)
- [📘 Arborescence NestJS](https://chatgpt.com/s/t_6865080c89788191a6b92dac254cf2aa)
- [🎨 Figma (UI/UX)](https://www.figma.com/)
- [🔐 JWT Introduction](https://jwt.io/introduction/)

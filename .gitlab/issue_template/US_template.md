# 🧠 User Story : [titre résumé de l'objectif]

> 🔖 **Nom de l’issue GitLab conseillé** :  
> `US [Scope] - [Résumé clair et concis]`  
> _Exemples :_  
> `US Front - Sélectionner humeur du jour`  
> `US Back - Sauvegarder une journée complète en DB`  
> `US API - Récupérer souvenirs filtrés par date`

---

## 🎯 En tant que…

> [Décris le rôle de l’utilisateur cible]

## 🧾 Je veux…

> [Décris l’action que l’utilisateur veut accomplir]

## 🧠 Afin de…

> [Explique le bénéfice ou le pourquoi]

---

## ✅ Critères d’acceptation

- [ ] Fonction disponible via l'interface
- [ ] Le comportement correspond à ce qui est décrit
- [ ] Aucun bug bloquant
- [ ] Données sauvegardées correctement en base

---

## 🛠️ À faire

### 🔧 Backend

- [ ] Créer/modifier entité(s) TypeORM si nécessaire
- [ ] Créer endpoint REST (CRUD ou spécifique)
- [ ] Implémenter la logique métier (service)
- [ ] Valider le DTO / validation de données
- [ ] Écrire les tests unitaires (si pertinent)

### 🎨 Frontend

- [ ] Créer ou modifier l’écran
- [ ] Gérer l’appel API (service axios)
- [ ] Gérer l’état local/global (Zustand)
- [ ] Ajouter l’interaction utilisateur (UI/UX)
- [ ] Afficher les retours visuels / erreurs

### 📦 Tests / Validation

- [ ] Test manuel sur émulateur
- [ ] Données correctes dans la DB
- [ ] UX fluide sans bug
- [ ] Feature cross-device (portrait/paysage)

---

## 🏷️ Infos projet

- **Type** : `user-story`
- **Labels** : `frontend`, `backend`, `API`, `MVP`, `V1` (à adapter selon contexte)
- **Milestone** : `MVP` / `V1` / `futur`
- **Liée à la Story** : `[copie exacte du titre depuis USER_STORIES.md]`

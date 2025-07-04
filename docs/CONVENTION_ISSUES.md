# 🗂️ Convention de nommage des issues – MyBrainOS

## ✅ Structure recommandée

```
[Type] [Scope] - [Résumé clair]
```

- **[Type]** : nature de l’issue (`US`, `BUG`, `ENH`, `TASK`, etc.)
- **[Scope]** : zone concernée (`Front`, `Back`, `API`, `DB`, etc.)
- **[Résumé clair]** : objectif ou problème

---

## 🏷️ Types d’issues

| Code   | Signification      | Exemple                                         |
| ------ | ------------------ | ----------------------------------------------- |
| `US`   | User Story         | `US Front - Ajouter humeur à la journée`        |
| `BUG`  | Bug / comportement | `BUG Back - Mauvais format date dans souvenirs` |
| `ENH`  | Amélioration       | `ENH API - Ajout pagination souvenirs`          |
| `TASK` | Tâche technique    | `TASK Back - Config JWT et middleware`          |
| `DOC`  | Documentation      | `DOC - Structurer le README backend`            |

---

## 🎯 Exemples pour MyBrainOS

### User stories

```
US Front - Sélectionner une humeur prédéfinie
US Back - Sauvegarder une journée complète en DB
```

### Bugs

```
BUG Front - Crash quand aucune photo n’est sélectionnée
BUG API - Mauvais code retour sur erreur de validation
```

### Améliorations

```
ENH Front - Afficher l'humeur dans la carte résumé
ENH API - Ajouter tri des souvenirs par humeur
```

### Tâches techniques

```
TASK DB - Migration initiale souvenirs
TASK Back - Création DTOs de création/modification
```

---

# 🧠 User Story : [titre résumé de l'objectif]

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
- **Labels** : `frontend`, `backend`, `API`, `MVP`, `V1` (à adapter)
- **Milestone** : `MVP` / `V1`
- **Liée à la Story** : `[copie du titre dans USER_STORIES.md]`

---

# 🧠 User Story : Ajouter une humeur à ma journée

## 🎯 En tant qu’utilisatrice

> Je suis Kath, utilisatrice régulière

## 🧾 Je veux…

> Sélectionner mon humeur du jour parmi une liste prédéfinie

## 🧠 Afin de…

> Pouvoir relier mon état émotionnel à mes souvenirs quotidiens

---

## ✅ Critères d’acceptation

- [ ] Je peux sélectionner une humeur
- [ ] L'humeur est bien enregistrée
- [ ] Je la vois dans le récapitulatif de ma journée

---

## 🛠️ À faire

### 🔧 Backend

- [ ] Ajouter le champ `mood` dans l'entité `Memory`
- [ ] Ajouter `mood` dans les DTO de création
- [ ] Valider la valeur (enum : happy, sad, etc.)

### 🎨 Frontend

- [ ] Ajouter une carte “Humeur” dans le swipe
- [ ] Afficher les 5 humeurs disponibles
- [ ] Enregistrer l’humeur choisie dans l’état global
- [ ] L’envoyer via API au backend

### 📦 Tests / Validation

- [ ] Sélection = enregistrement
- [ ] Affichage correct dans le récap

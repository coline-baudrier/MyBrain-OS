# 🧠 MyBrainOS — Concept Fonctionnel

## 🎯 Objectif de l'application

**MyBrainOS** est une application mobile conçue pour aider l’utilisateur à enregistrer et visualiser ses souvenirs du quotidien.  
Chaque jour, il peut capturer les moments marquants dans plusieurs catégories : **photo**, **texte**, **musique**, **film/série**, **livre**, **humeur**.

L’interface est pensée pour être rapide, fluide, et centrée sur la régularité plutôt que sur l’exhaustivité.

---

## 👤 Persona : Kath

Kath utilise l'application au quotidien pour se recentrer sur ses émotions et garder une trace personnelle de sa vie.  
Elle ne cherche pas à tout documenter, mais à **garder l’essentiel émotionnel** de sa journée.

---

## 📲 Fonctionnement général

### Connexion

- L'utilisateur se connecte à son compte
- Si la journée précédente n’a pas été enregistrée :
  - Avant 16h → accès à la page d’accueil
  - Après 16h → proposition d’enregistrement de la journée précédente

---

### Enregistrement d'une journée

- L’utilisateur passe par une **interface à la Tinder** :
  - Chaque **catégorie** est présentée sous forme de **carte**
  - **Swipe à droite** → remplir la catégorie
  - **Swipe à gauche** → passer
- Catégories de base (préconfigurées) :
  - 📷 **Photo** (1 à 3 depuis galerie)
  - ✍️ **Texte libre** (souvenir ou description de la journée)
  - 🎵 **Musique** (titre + artiste)
  - 🎬 **Film/Série** (titre + réalisateur)
  - 📚 **Livre** (titre + auteur)
  - 😊 **Humeur** (choix parmi : joyeuse, triste, neutre, en colère, anxieuse)

🔒 Aucune prise de photo directe ou API dans le MVP (galerie uniquement).

---

### Visualisation des souvenirs

- Page d’accueil :
  - **Récapitulatif de la journée actuelle ou précédente**
  - **Scroll infini** vers les jours passés
  - **Filtrage par catégorie** (voir uniquement les photos, les musiques, etc.)
- Consultation d’un souvenir :
  - Visualisation des **détails**
  - Affichage des **souvenirs associés au même jour**

---

### Mise à jour partielle

- Si certaines catégories n’ont pas été remplies, elles apparaissent **en haut de l’écran** pour pouvoir les compléter plus tard.

---

## 📆 Exemple de flux utilisateur : une journée avec Kath

> 🎯 Objectif : visualiser les interactions principales et les écrans nécessaires.

### 🕘 Matin — Connexion

- Kath ouvre l'application à 9h.
- L’application détecte qu’elle n’a pas rempli la journée d’hier.
- Elle est redirigée vers l’interface d’enregistrement.

---

### 🧾 Enregistrement de la journée précédente (interface en cartes)

- L’interface propose la première carte : **Photo**
  - Kath swipe à droite → sélectionne 2 photos depuis sa galerie → valide
- Deuxième carte : **Texte**
  - Kath swipe à droite → écrit un texte libre → valide
- Troisième carte : **Musique**
  - Kath swipe à gauche → elle ne souhaite rien ajouter
- Quatrième carte : **Film/Série**
  - Kath swipe à droite → entre "The Bear - S3" et le nom du créateur
- Cinquième carte : **Livre**
  - Swipe à gauche → pas lu
- Dernière carte : **Humeur**
  - Swipe à droite → choisit "joyeuse" → valide

En fin de session, elle peut créer une **catégorie ponctuelle** :  
→ elle saute cette étape pour aujourd’hui.

---

### 🏠 Retour à la page d’accueil

- L’application affiche un **récapitulatif visuel** de sa journée :
  - Photos, texte, film, humeur (musique et livre sont absents)
- Elle scrolle vers le bas → voit les jours précédents
- Elle active un filtre "Photos" pour visualiser uniquement ses souvenirs visuels
- Elle clique sur une image du 12 juin → elle voit tous les souvenirs de ce jour

---

### ☀️ Fin de journée

- À 20h, elle retourne dans l’app.
- Elle appuie sur "Ajouter ma journée".
- Elle passe à travers les cartes, mais cette fois ne garde que :
  - une musique
  - une humeur
- Elle valide → ces souvenirs sont visibles immédiatement dans son récapitulatif

---

> 👉 Ce flux implique les écrans suivants :

- Connexion
- Redirection conditionnelle (journée remplie ou non)
- Swipe cards (par catégorie)
- Sélecteurs de contenus (texte, galerie, menus déroulants…)
- Page d’accueil (récap + scroll infini)
- Page de détail d’un souvenir
- Filtres par catégorie

---

## ⚙️ Menu utilisateur

- 🔐 Modifier le profil
- ➕ Ajouter une catégorie personnalisée
- 🛠️ Gérer les catégories créées (modifier/désactiver)
- 🚪 Déconnexion

---

## 🔮 Fonctionnalités futures (Pool d’idées)

### 🎧 Intégrations externes

- Spotify : récupérer les musiques écoutées dans la journée
- Goodreads : retrouver les livres lus
- IMDb : choisir un film vu récemment

### 🧩 Personnalisation

- Ajouter des **catégories personnalisées**
- Créer des **catégories ponctuelles** (événement spécial)
- Utiliser des **tags** (mots-clés) pour filtrer ou organiser les souvenirs

### ⏱ Notifications et rappels

- Rappels quotidiens pour enregistrer la journée
- Rappels de souvenirs passés selon :
  - Fréquence choisie
  - Tags
  - Dates-clés

### 📊 Statistiques

- Diagrammes d’humeur
- Tendances (ex : chansons les plus associées)
- Durée de lecture, fréquence des films, etc.

---

## 🧪 Fonctionnalités optionnelles

- Changer l’heure de "déclenchement" de la nouvelle journée
- Thèmes personnalisables (polices, couleurs)
- Lecture automatique de la musique choisie quand on ouvre l’app
- Mode hors-ligne (plus tard)

---

## 🧠 Résumé des blocs fonctionnels à coder

| Bloc                          | Priorité | MVP | V1  |
| ----------------------------- | -------- | --- | --- |
| Authentification              | Haute    | ✅  |     |
| Enregistrement des souvenirs  | Haute    | ✅  |     |
| Visualisation récap/journées  | Haute    | ✅  |     |
| Swipe interface (Tinder-like) | Moyenne  | ✅  |     |
| Filtres par catégorie         | Moyenne  | ✅  |     |
| Ajout de catégories perso     | Moyenne  |     | ✅  |
| Intégrations (Spotify, etc.)  | Basse    |     |     |
| Notifications                 | Basse    |     | ✅  |
| Stats & tags                  | Basse    |     |     |
| Thèmes et personnalisation    | Faible   |     |     |

---

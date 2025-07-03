# 🧩 Features — MyBrainOS

Ce fichier liste toutes les fonctionnalités prévues, organisées par catégorie, avec leur statut d’implémentation et leur priorité MoSCoW.

---

## 🔐 Authentification

| Statut | Priorité | Fonctionnalité                               |
| ------ | -------- | -------------------------------------------- |
| 🔲     | MUST     | Création de compte (email + mot de passe)    |
| 🔲     | MUST     | Connexion / déconnexion                      |
| 🔲     | SHOULD   | Reconnaissance automatique de session active |
| 🔲     | SHOULD   | Authentification JWT côté backend            |

---

## 👤 Compte utilisateur

| Statut | Priorité | Fonctionnalité                                           |
| ------ | -------- | -------------------------------------------------------- |
| 🔲     | MUST     | Modifier les informations de profil                      |
| 🔲     | SHOULD   | Accès au menu utilisateur                                |
| 🔲     | COULD    | Thèmes personnalisables (polices, couleurs, mode sombre) |
| 🔲     | COULD    | Définir l’heure limite de bascule de journée             |

---

## 📝 Enregistrement des souvenirs

| Statut | Priorité | Fonctionnalité                                                   |
| ------ | -------- | ---------------------------------------------------------------- |
| 🔲     | MUST     | Interface en cartes (type Tinder) pour enregistrer les souvenirs |
| 🔲     | MUST     | Passer ou remplir une catégorie via swipe                        |
| 🔲     | MUST     | Ajouter une photo (depuis galerie uniquement)                    |
| 🔲     | MUST     | Ajouter un texte libre                                           |
| 🔲     | MUST     | Ajouter une musique (titre + artiste)                            |
| 🔲     | MUST     | Ajouter un film/série (titre + réalisateur)                      |
| 🔲     | MUST     | Ajouter un livre (titre + auteur)                                |
| 🔲     | MUST     | Sélectionner une humeur (liste prédéfinie)                       |
| 🔲     | SHOULD   | Ajouter une catégorie ponctuelle pour un événement spécial       |
| 🔲     | COULD    | Ajouter une photo prise en direct (camera)                       |
| 🔲     | COULD    | Enregistrement vocal ou audio en tant que souvenir               |

---

## 🗂️ Visualisation & navigation

| Statut | Priorité | Fonctionnalité                              |
| ------ | -------- | ------------------------------------------- |
| 🔲     | MUST     | Récapitulatif visuel de la journée          |
| 🔲     | MUST     | Scroll infini sur les journées passées      |
| 🔲     | MUST     | Filtres par catégorie                       |
| 🔲     | MUST     | Page de détail d’un souvenir                |
| 🔲     | SHOULD   | Compléter une catégorie oubliée plus tard   |
| 🔲     | SHOULD   | Filtrer par humeur, tags ou autres critères |
| 🔲     | COULD    | Recherche par mot-clé                       |

---

## ➕ Gestion des catégories

| Statut | Priorité | Fonctionnalité                                                  |
| ------ | -------- | --------------------------------------------------------------- |
| 🔲     | SHOULD   | Ajouter une catégorie personnalisée (type : texte, photo, etc.) |
| 🔲     | SHOULD   | Modifier ou désactiver une catégorie existante                  |
| 🔲     | COULD    | Créer une catégorie temporaire liée à un événement ponctuel     |
| 🔲     | COULD    | Associer des couleurs ou icônes aux catégories                  |

---

## 🔗 Intégrations externes

| Statut | Priorité | Fonctionnalité                                                |
| ------ | -------- | ------------------------------------------------------------- |
| 🔲     | COULD    | Connexion à Spotify pour choisir une musique écoutée          |
| 🔲     | COULD    | Connexion à Goodreads pour choisir un livre lu                |
| 🔲     | COULD    | Connexion à IMDb pour choisir un film regardé                 |
| 🔲     | COULD    | Récupération automatique de métadonnées (pochette, nom, etc.) |

---

## 🧠 Mémoire & analyse

| Statut | Priorité | Fonctionnalité                                        |
| ------ | -------- | ----------------------------------------------------- |
| 🔲     | COULD    | Rappels aléatoires ou réguliers de souvenirs          |
| 🔲     | COULD    | Statistiques : humeur, musique, nombre de films, etc. |
| 🔲     | COULD    | Système de tags pour enrichir les souvenirs           |
| 🔲     | COULD    | Suggestions automatiques de souvenirs à revoir        |

---

## 🔔 Notifications

| Statut | Priorité | Fonctionnalité                                       |
| ------ | -------- | ---------------------------------------------------- |
| 🔲     | SHOULD   | Notification quotidienne pour enregistrer sa journée |
| 🔲     | COULD    | Notification personnalisée selon horaire défini      |
| 🔲     | COULD    | Notification intelligente (par humeur ou tag)        |

---

## ⚙️ Système et tech

| Statut | Priorité | Fonctionnalité                                    |
| ------ | -------- | ------------------------------------------------- |
| 🔲     | MUST     | Stockage des souvenirs en base de données (MySQL) |
| 🔲     | MUST     | API REST (NestJS) pour les opérations CRUD        |
| 🔲     | SHOULD   | Gestion des fichiers médias (upload photo)        |
| 🔲     | SHOULD   | Stratégie hors-ligne côté frontend                |
| 🔲     | COULD    | Export / import des souvenirs                     |
| 🔲     | COULD    | Mode hors-ligne avec synchronisation différée     |

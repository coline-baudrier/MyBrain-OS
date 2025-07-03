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

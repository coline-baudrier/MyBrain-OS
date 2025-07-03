# Notes BrainOS

---

# Principe de l'application

L'application MyBrainOS est conçue pour capturer et conserver des souvenirs personnels au quotidien :

- Musiques
- Photos
- Citations
- Livres
- Humeurs
- Etc.

## Principe de fonctionnement

L'utilisateur, qu'on va appeler Kath, se connecte à l'application depuis son téléphone.

Si elle se connecte avant 16 heures et qu'elle a enregistré sa journée de la veille, elle va arriver sur l'écran d'accueil et sur son récapitulatif.

Dans le cas où elle se connecte après 16 heures ou qu'elle n'a pas enregistré sa journée de la veille, elle va arriver sur l'écran d'accueil qui va lui proposer d'enregistrer sa journée.

Si elle décide d'enregistrer sa journée, elle va pouvoir ajouter les souvenirs ou moments marquants qu'elle a vécu. Dans une première version, Kath va être limitée aux catégories prédéfinies par l'application. Dans chaque cas elle peut décider de ne pas ajouter des souvenirs concernant cette catégorie :

- **Photo** : ajouter une à trois photos marquantes de sa journée (dans un premier temps, pas de possibilité de prendre une photo directement depuis l'application, mais possibilité de choisir une photo dans la galerie)
- **Texte** : ajouter un texte libre pour décrire sa journée ou un moment marquant de sa journée
- **Musique** : ajouter une musique qui résume sa journée ou alors la bande son de sa journée (dans un premier temps titre et artiste)
- **Film / Série** : ajouter un film qu'elle a regardé dans la journée (dans un premier temps titre et réalisateur)
- **Livre** : ajouter un livre qu'elle a lu dans la journée (dans un premier temps titre et auteur)
- **Humeur** : ajouter son humeur du jour (dans un premier temps, une liste de 5 humeurs prédéfinies : joyeuse, triste, neutre, en colère, anxieuse)

Une fois qu'elle a ajouté tous les souvenirs qu'elle souhaite, elle peut valider et enregistrer sa journée.

Ensuite, quand elle revient sur la page d'accueil, elle peut voir un récapitulatif de sa journée avec les souvenirs qu'elle a ajoutés à l'instant. En scrollant vers le bas, elle va voir sa journée passée et peut décider de cliquer sur "Voir +" pour voir les autres journées passées en scollant indéfiniment vers le bas.

Si elle continue de scroller sur la page d'accueil, elle va pouvoir décider de ne visualiser les souvenirs que d'une catégorie en particulier (par exemple, uniquement les photos, uniquement les musiques, etc.).

Qu'elle décide de visualiser les souvenirs d'une catégorie ou de toutes les catégories, elle peut cliquer sur un souvenir pour le visualiser en détail et avoir les données annexes (si elle a cliqué sur la musique du 11 juin, elle pourra en scrollant vers le bas, voir les autres souvenirs associés à cette journée, par exemple la photo, le texte, l'humeur, etc.).

Si Kath n'a pas enregistré la totalité des catégories lorsqu'elle a enregistré sa journée, les catégories concernées apparaissent en haut de l'écran d'accueil et elle peut cliquer dessus pour mettre à jour la catégorie sélectionnée.

Dans son menu, Kath va pouvoir trouver :

- **Son profil** et modifier les différentes informations
- **Ajouter une catégorie de souvenirs** : nom de la catégorie, est-ce que c'est du texte, des photos, contient de la musique, autre ?
- **Gérer les catégories créées** : liste des catégories avec la possibilité de les supprimer (mais ne supprimera pas l'historique : on les désactive plutôt) ou de modifier leur nom ou ce qu'elles contiennent (on ne supprimer pas l'historique non plus)
- **Déconnexion**

## Pool d'idées de base

- Connexion à **Spotify** pour choisir une musique qui a été écoutée dans la journée et récupérer les métadonnées (titre, artiste, album, photo)
- Connexion à **Goodreads** pour choisir un livre qui a été lu dans la journée et récupérer les métadonnées (titre, auteur, photo)
- Connexion à **IMDb** pour choisir un film qui a été regardé dans la journée
- Prendre une pghoto directement depuis l'application (avec possibilité de recadrer)
- Ajouter des catégories de souvenirs personnalisées (par exemple : "Événement spécial", "Voyage", etc.)
- Possibilité de mettre des catégories ponctuelles (juste une fois, sur une durée, etc)
- Utilisation de tags enregistrables et retrouvables qui vont servir pour les filtres
- Lorsque la catégorie **évènement spécial** (trouver un autre nom) est rajoutée, on va pouvoir lui ajouter toutes les mêmes choses que pour une journée juste pour cet évènement

## Pool d'idées optionnelles

- Changer l'heure à partir de laquelle l'utilisateur veut pouvoir enregistrer une nouvelle journée
- Thèmes personnalisables (couleurs, polices, etc.)
- Notifications pour rappeler à l'utilisateur d'enregistrer sa journée
- A partir du moment où on enregistre une musique, ça propose de la jouer pendant la durée de l'utilisation de l'application
- Rappel de souvenirs à une fréquence donnée
- Rappel de souvenirs à une fréquence choisie par l'utilisateur
- Rappel de souvenirs en fonction des tags
- Données et indicateurs en fonction des souvenirs : nombre de fois où apparaît une musique, combien de temps tel bouquin, regardé combien de films

---

# Prise de notes à la volée

## Aspect application

- Un aspect à la Tinder, la liste des catégories apparaît sous format de cartes quand on veut enregistrer la journée, on swipe à droite si on veut enregistrer le souvenir et ça ouvre directement l'enregistrement, on swipe à gauche si on ne veut pas, lorsque c'est fini ça propose d'enregistrer une catégorie ponctuelle pour la journée ou de revenir à la page d'accueil

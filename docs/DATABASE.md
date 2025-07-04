# 📚 MyBrainOS – DATABASE

Ce document décrit en détail la structure de la base de données de l’application **MyBrainOS**, incluant les entités principales, leurs relations, et les exemples de données `JSON` utilisées dans certains champs.

---

## 🔑 `User`

Représente un utilisateur de l'application.

**Champs :**

- `id`, `email`, `password`, `display_name`, `created_at`, `updated_at`

---

## 🛡️ `UserLoginHistory`

Historique des connexions d'un utilisateur (succès ou échec).

**Relations :**

- 🔗 `user_id` → `User.id`

**Champ JSON : `metadata`**

```json
{
  "country": "France",
  "city": "Lyon",
  "device": "iPhone 14",
  "app_version": "1.2.3"
}
```

---

## 📱 `UserSession`

Représente une session persistante d'un utilisateur (pour mobile ou PC).

**Relations :**

- 🔗 `user_id` → `User.id`

**Champ JSON : `metadata`**

```json
{
  "app_version": "1.2.1",
  "os": "iOS 17.4",
  "location": "Paris"
}
```

---

## 🧠 `Entry`

Souvenir journalier enregistré par l'utilisateur.

**Relations :**

- 🔗 `user_id` → `User.id`
- 🔗 `type_id` → `EntryType.id`
- 🔗 `mood_id` → `Mood.id` (optionnel)

**Champ JSON : `metadata`**

```json
{
  "custom_type": "rêve",
  "description": "J’ai rêvé que je nageais dans l’espace",
  "tags": ["rêve", "surréaliste"]
}
```

---

## 📂 `EntryType`

Type d'entrée (texte, humeur, musique, etc.). Peut être global ou propre à un utilisateur.

**Relations :**

- 🔗 `user_id` → `User.id` (optionnel)

**Champs spéciaux :**

- `is_default`: TRUE pour les types globaux
- `is_daily_prompt`: TRUE pour les types proposés chaque jour

**Champ JSON : `metadata`**

```json
{
  "has_text_input": true,
  "has_media": true,
  "linked_service": "Spotify"
}
```

---

## 😊 `Mood`

Humeurs sélectionnables associées aux entrées.

**Relations :**

- 🔗 `user_id` → `User.id` (optionnel)

---

## 🏷️ `Tag` + `EntryTag`

Système de tags personnalisés pour les `Entry`.  
Relation many-to-many via `EntryTag`.

**Relations :**

- 🔗 `user_id` → `User.id` (optionnel)
- 🔗 `EntryTag.entry_id` → `Entry.id`
- 🔗 `EntryTag.tag_id` → `Tag.id`

---

## 🎞️ `Media`

Fichiers associés à une `Entry` (image, audio, vidéo...).

**Relations :**

- 🔗 `entry_id` → `Entry.id`

**Champ JSON : `metadata`**

```json
{
  "width": 1920,
  "height": 1080,
  "format": "jpeg",
  "size_kb": 450
}
```

---

## 🔗 `ExternalLink`

Lien vers des contenus externes enrichis (Spotify, IMDb, etc.)

**Relations :**

- 🔗 `entry_id` → `Entry.id`

**Champ JSON : `metadata`**

```json
{
  "artist": "Tame Impala",
  "track": "Let It Happen",
  "album": "Currents",
  "duration": 462
}
```

---

## 📌 Résumé des relations clés

- Un `User` a :

  - plusieurs `Entry`
  - plusieurs `UserSession`
  - plusieurs `UserLoginHistory`
  - des `EntryType`, `Mood`, et `Tag` personnalisés

- Un `Entry` peut avoir :
  - un `Mood`
  - un `EntryType`
  - plusieurs `Tag` via `EntryTag`
  - plusieurs `Media`
  - plusieurs `ExternalLink`

---

Ce modèle est conçu pour être **flexible, extensible, et orienté utilisateur**, tout en gardant une base solide pour la structuration de souvenirs dans MyBrainOS.

---

# Script SQL

```sql

-- ===============================
-- MyBrainOS - Base de données SQL
-- ===============================

-- Table : User
CREATE TABLE User (
  id INT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  display_name VARCHAR(100),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Table : UserLoginHistory
CREATE TABLE UserLoginHistory (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  login_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  ip_address VARCHAR(45),
  user_agent TEXT,
  success BOOLEAN DEFAULT TRUE,
  is_daily_prompt BOOLEAN DEFAULT FALSE,
  metadata JSON,
  FOREIGN KEY (user_id) REFERENCES User(id) ON DELETE CASCADE
);

-- Table : UserSession
CREATE TABLE UserSession (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  refresh_token_hash VARCHAR(255) NOT NULL,
  device_name VARCHAR(100),
  device_type VARCHAR(50),
  last_ip VARCHAR(45),
  last_user_agent TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  last_used_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  revoked BOOLEAN DEFAULT FALSE,
  is_daily_prompt BOOLEAN DEFAULT FALSE,
  metadata JSON,
  FOREIGN KEY (user_id) REFERENCES User(id) ON DELETE CASCADE
);

-- Table : EntryType
CREATE TABLE EntryType (
  id INT PRIMARY KEY AUTO_INCREMENT,
  label VARCHAR(50) NOT NULL UNIQUE,
  icon VARCHAR(50),
  is_default BOOLEAN DEFAULT TRUE,
  user_id INT,
  is_daily_prompt BOOLEAN DEFAULT FALSE,
  metadata JSON,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES User(id) ON DELETE CASCADE
);

-- Table : Mood
CREATE TABLE Mood (
  id INT PRIMARY KEY AUTO_INCREMENT,
  label VARCHAR(50) NOT NULL UNIQUE,
  emoji VARCHAR(10),
  color VARCHAR(7),
  is_default BOOLEAN DEFAULT TRUE,
  user_id INT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES User(id) ON DELETE CASCADE
);

-- Table : Entry
CREATE TABLE Entry (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  date DATE NOT NULL,
  type_id INT NOT NULL,
  mood_id INT,
  content TEXT,
  is_daily_prompt BOOLEAN DEFAULT FALSE,
  metadata JSON,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES User(id) ON DELETE CASCADE,
  FOREIGN KEY (type_id) REFERENCES EntryType(id),
  FOREIGN KEY (mood_id) REFERENCES Mood(id)
);

-- Table : Tag
CREATE TABLE Tag (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  color VARCHAR(7),
  is_default BOOLEAN DEFAULT TRUE,
  user_id INT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES User(id) ON DELETE CASCADE,
  UNIQUE (name, user_id)
);

-- Table : EntryTag (relation many-to-many)
CREATE TABLE EntryTag (
  entry_id INT NOT NULL,
  tag_id INT NOT NULL,
  PRIMARY KEY (entry_id, tag_id),
  FOREIGN KEY (entry_id) REFERENCES Entry(id) ON DELETE CASCADE,
  FOREIGN KEY (tag_id) REFERENCES Tag(id) ON DELETE CASCADE
);

-- Table : Media
CREATE TABLE Media (
  id INT PRIMARY KEY AUTO_INCREMENT,
  entry_id INT NOT NULL,
  media_type VARCHAR(20) NOT NULL,
  url TEXT NOT NULL,
  thumbnail_url TEXT,
  is_daily_prompt BOOLEAN DEFAULT FALSE,
  metadata JSON,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (entry_id) REFERENCES Entry(id) ON DELETE CASCADE
);

-- Table : ExternalLink
CREATE TABLE ExternalLink (
  id INT PRIMARY KEY AUTO_INCREMENT,
  entry_id INT NOT NULL,
  service VARCHAR(50) NOT NULL,
  url TEXT NOT NULL,
  label VARCHAR(100),
  icon_url TEXT,
  is_daily_prompt BOOLEAN DEFAULT FALSE,
  metadata JSON,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (entry_id) REFERENCES Entry(id) ON DELETE CASCADE
);
```

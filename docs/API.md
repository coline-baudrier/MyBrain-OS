# Gestion API

L'API de MyBrainOS est construite avec NestJS et suit les principes REST. Elle permet de gérer les utilisateurs, les souvenirs, et les interactions avec la base de données. Le but est de l'utiliser sans ORM avec des requêtes SQL brutes pour une flexibilité maximale.

---

# 🧠 Objectifs du module de présentation

Créer un module `memories` qui permet de :

- Ajouter un souvenir (`POST /memories`)
- Récupérer tous les souvenirs (`GET /memories`)

Chaque souvenir doit contenir :

- un `content` : le texte du souvenir
- un `type` (`text`, `photo`, etc.)
- un `mood` (optionnel)
- une `createdAt` : la date de création (automatique)
- un `userId`

---

# 🗂️ Arborescence des fichiers

```
src/
└── /modules/
    └── memories/
        ├── memories.controller.ts
        ├── memories.service.ts
        ├── memories.repository.ts       <-- Requêtes SQL
        ├── memories.dto.ts
        ├── memories.types.ts
        └── memories.sql.ts              <-- SQL pur
```

## 1. `memories.types.ts` - Types TypeScript

```typescript
// memories.types.ts
export type MemoryType = "text" | "photo" | "music" | "quote" | "book";
export type MoodType = "happy" | "sad" | "neutral" | "angry" | "anxious";

export interface Memory {
  id: number;
  userId: number;
  content: string;
  type: MemoryType;
  mood?: MoodType;
  createdAt: string; // ISO string
}
```

## 2. `memories.dto.ts` - Validation des entrées

```typescript
// memories.dto.ts
import { IsNotEmpty, IsOptional, IsString } from "class-validator";

export class CreateMemoryDto {
  @IsNotEmpty()
  @IsString()
  content: string;

  @IsNotEmpty()
  @IsString()
  type: "text" | "photo" | "music" | "quote" | "book";

  @IsOptional()
  @IsString()
  mood?: "happy" | "sad" | "neutral" | "angry" | "anxious";
}
```

## 3. `memories.sql.ts` - Requêtes SQL pures

```typescript
// memories.sql.ts
export const SQL = {
  insertMemory: `
    INSERT INTO memories (user_id, content, type, mood, created_at)
    VALUES (?, ?, ?, ?, NOW())
  `,

  selectUserMemories: `
    SELECT id, user_id as userId, content, type, mood, created_at as createdAt
    FROM memories
    WHERE user_id = ?
    ORDER BY created_at DESC
  `,
};
```

## 4. `memories.repository.ts` - Exécution des requêtes SQL (via mysql2/promise)

```typescript
// memories.repository.ts
import { Injectable } from "@nestjs/common";
import { CreateMemoryDto } from "./memories.dto";
import { Memory } from "./memories.types";
import { SQL } from "./memories.sql";
import { Pool } from "mysql2/promise";
import { Inject } from "@nestjs/common";

@Injectable()
export class MemoriesRepository {
  constructor(@Inject("DB_POOL") private readonly db: Pool) {}

  async createMemory(userId: number, dto: CreateMemoryDto): Promise<number> {
    const [result] = await this.db.execute(SQL.insertMemory, [
      userId,
      dto.content,
      dto.type,
      dto.mood ?? null,
    ]);
    const insertResult = result as any;
    return insertResult.insertId;
  }

  async getUserMemories(userId: number): Promise<Memory[]> {
    const [rows] = await this.db.execute(SQL.selectUserMemories, [userId]);
    return rows as Memory[];
  }
}
// memories.repository.ts
import { Injectable } from "@nestjs/common";
import { CreateMemoryDto } from "./memories.dto";
import { Memory } from "./memories.types";
import { SQL } from "./memories.sql";
import { Pool } from "mysql2/promise";
import { Inject } from "@nestjs/common";

@Injectable()
export class MemoriesRepository {
  constructor(@Inject("DB_POOL") private readonly db: Pool) {}

  async createMemory(userId: number, dto: CreateMemoryDto): Promise<number> {
    const [result] = await this.db.execute(SQL.insertMemory, [
      userId,
      dto.content,
      dto.type,
      dto.mood ?? null,
    ]);
    const insertResult = result as any;
    return insertResult.insertId;
  }

  async getUserMemories(userId: number): Promise<Memory[]> {
    const [rows] = await this.db.execute(SQL.selectUserMemories, [userId]);
    return rows as Memory[];
  }
}
```

## 5. `memories.service.ts` - Logique métier

```typescript
// memories.service.ts
import { Injectable } from "@nestjs/common";
import { CreateMemoryDto } from "./memories.dto";
import { MemoriesRepository } from "./memories.repository";
import { Memory } from "./memories.types";

@Injectable()
export class MemoriesService {
  constructor(private repo: MemoriesRepository) {}

  async create(userId: number, dto: CreateMemoryDto): Promise<{ id: number }> {
    const id = await this.repo.createMemory(userId, dto);
    return { id };
  }

  async findAll(userId: number): Promise<Memory[]> {
    return this.repo.getUserMemories(userId);
  }
}
```

6. `memories.controller.ts` - Routes REST

```typescript
// memories.controller.ts
import { Body, Controller, Get, Post, Req, UseGuards } from "@nestjs/common";
import { MemoriesService } from "./memories.service";
import { CreateMemoryDto } from "./memories.dto";
import { AuthGuard } from "../auth/auth.guard"; // si tu protèges avec JWT
import { Request } from "express";

@Controller("memories")
@UseGuards(AuthGuard) // optionnel si tu veux protéger par JWT
export class MemoriesController {
  constructor(private service: MemoriesService) {}

  @Get()
  async getAll(@Req() req: Request) {
    const userId = req.user.id; // injecté par un middleware d'auth
    return this.service.findAll(userId);
  }

  @Post()
  async create(@Req() req: Request, @Body() dto: CreateMemoryDto) {
    const userId = req.user.id;
    return this.service.create(userId, dto);
  }
}
```

## 7. Base de données - Exemple de table SQL

```sql
CREATE TABLE memories (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  content TEXT NOT NULL,
  type VARCHAR(20) NOT NULL,
  mood VARCHAR(20),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

```

## 8. Fournisseur de connexion à la base de données (`app.module.ts`)

```typescript
// app.module.ts
import { Module } from "@nestjs/common";
import { createPool } from "mysql2/promise";
import { MemoriesModule } from "./memories/memories.module";

@Module({
  imports: [MemoriesModule],
  providers: [
    {
      provide: "DB_POOL",
      useFactory: async () => {
        return createPool({
          host: "localhost",
          user: "root",
          password: "password",
          database: "mybrainos",
          connectionLimit: 10,
        });
      },
    },
  ],
})
export class AppModule {}
```

---

# Résumé des points importants

| Elément         | But                                           |
| --------------- | --------------------------------------------- |
| `types.ts`      | Typage pur TypeScript                         |
| `dto.ts`        | Validation et structure des données entrantes |
| `sql.ts`        | Centralisation des requêtes SQL brutes        |
| `repository.ts` | Communication avec la base de données         |
| `service.ts`    | Logique métier                                |
| `controller.ts` | Routes API REST                               |
| `app.module.ts` | Fournisseur MySQL via `createPool()`          |

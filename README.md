# Express + Prisma + PostgreSQL Backend Template (with Docker)
A minimal, production-ready backend boilerplate built with Express.js, Prisma ORM, and PostgreSQL fully containerized using Docker and Docker Compose. Designed for rapid development with a clean, modular architecture and built-in support for environment configs, logging, and API validation.

🔥 Features

⚡ Minimal and modular Express.js setup

🧱 PostgreSQL with Prisma ORM for schema-safe database access

🐳 Docker & Docker Compose ready (development and production)

🛠 Centralized config, logging, and error handling

🧪 Testing-ready structure (unit/integration test-ready folders)

🔐 Environment-based configuration with .env support

📦 Sample CRUD operations (e.g., Users)

📜 API request validation and middleware support

📁 Clean architecture: routes, services, controllers, middleware layers


Tech Stack

Node.js + Express — web server framework

Prisma ORM — Type-safe database toolkit

PostgreSQL — relational database

Docker + Docker Compose — Containerization 

TypeScript — Strongly-typed development



# docker compose


services:
  client:
    build: ./hoodie-nation-app
    ports:
      - "5174:5173"  # Host:Container
    volumes:
      - ./hoodie-nation-app:/app
      - /app/node_modules
    depends_on:
      - server

  server:
    build: ./service
    ports:
      - "5000:5000"
    volumes:
      - ./service:/app
      - /app/node_modules
    env_file:
      - ./service/.env
    depends_on:
      - db

  db: 
    image: postgres:latest
    restart: always
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: admin1234
      POSTGRES_DB: hnation-db
    ports:
      - "5434:5433" 
    volumes:
      - pgdata:/var/lib/postgresql/data

volumes:
  pgdata:



# docker compose template

version: '3.8'

services:
  client:
    build: ./client-app
    ports:
      - "${CLIENT_PORT:-5173}:5173"  # Host:Container
    volumes:
      - ./client-app:/app
      - /app/node_modules
    depends_on:
      - server

  server:
    build: ./backend-service
    ports:
      - "${SERVER_PORT:-5000}:5000"
    volumes:
      - ./backend-service:/app
      - /app/node_modules
    env_file:
      - ./backend-service/.env
    depends_on:
      - db

  db:
    image: postgres:latest
    restart: always
    environment:
      POSTGRES_USER: ${POSTGRES_USER:-postgres}
      POSTGRES_PASSWORD: ${POSTGRES_PASSWORD:-password}
      POSTGRES_DB: ${POSTGRES_DB:-app_db}
    ports:
      - "${DB_PORT:-5432}:5432"
    volumes:
      - pgdata:/var/lib/postgresql/data

volumes:
  pgdata:






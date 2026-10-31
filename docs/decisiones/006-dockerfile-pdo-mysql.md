# 006 — Dockerfile propio para el backend (extensión pdo_mysql)

**Fecha:** 2026-08-29

## Contexto
La imagen oficial `php:8.2-apache` no incluye la extensión `pdo_mysql`
activada por defecto (solo trae `pdo_sqlite`), así que la conexión con
PDO a MySQL fallaba con un error genérico de conexión.

## Decisión
Se sustituye `image: php:8.2-apache` por `build: ./backend` en el servicio
`backend`, usando un `Dockerfile` propio que parte de esa misma imagen base
y añade la extensión que falta con `docker-php-ext-install pdo_mysql`.

## Consecuencias
- Arrancar el proyecto por primera vez (o tras cambiar el Dockerfile)
  requiere `docker compose up -d --build` en vez de un `up -d` normal.
- El resto del proyecto no cambia: el contenedor sigue llamándose
  `backend` y comportándose igual en todo lo demás.
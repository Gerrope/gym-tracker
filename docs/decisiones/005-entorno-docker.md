# 005 — Entorno de desarrollo con Docker Compose (4 contenedores)

**Fecha:** 2026-08-29

## Contexto
El proyecto se desarrolla en Fedora Linux, donde XAMPP no es la opción
habitual. Se necesitaba un entorno reproducible que no dependiera de
instalar PHP/MySQL directamente en el sistema.

## Decisión
Se usa Docker Compose con 4 contenedores separados: `db` (MySQL), `phpmyadmin`,
`backend` (PHP 8.2 + Apache) y `frontend` (Nginx), siguiendo el modelo de
separación completa en vez de un único contenedor.

## Consecuencias
- El proyecto es transportable: cualquiera con Docker instalado puede
  levantarlo igual, sin instalar nada más en su sistema.
- Al separar `frontend` y `backend` en puertos distintos, hace falta
  configurar cabeceras CORS en el backend (ver `backend/db.php`).
- Dentro de los contenedores, los servicios se llaman entre sí por su
  nombre (ej. `db`), no por `localhost`.
- En Fedora, los volúmenes montados necesitan la etiqueta `:Z` (SELinux)
  para que los contenedores puedan leer/escribir esas carpetas.
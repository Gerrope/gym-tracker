# Gym Tracker

## Descripción

Aplicación personal de seguimiento de entrenamientos de gimnasio, hecha con
JavaScript (vanilla) en el cliente y PHP + MySQL en el servidor. Permite
registrar sesiones de entrenamiento (ejercicios, series, repeticiones y peso)
y consultar el progreso a lo largo del tiempo: progresión de peso por
ejercicio, volumen total por sesión y evolución del peso corporal.

## Estado del proyecto

En desarrollo: Fase 4 (backend PHP) en curso.

## Stack

- **Frontend:** HTML + CSS + JavaScript vanilla (fetch API)
- **Backend:** PHP 8 nativo + PDO
- **Base de datos:** MySQL 8
- **Entorno local:** Docker Compose (Nginx, PHP + Apache, MySQL y phpMyAdmin)
- **Control de versiones:** Git + GitHub, Conventional Commits

## Estructura del repositorio

```
gym-tracker/
├── backend/
│   ├── api/             # un archivo PHP por recurso
│   ├── Dockerfile       # imagen PHP + Apache con pdo_mysql
│   └── db.php           # conexión PDO a MySQL
├── frontend/
│   ├── index.html
│   ├── css/
│   ├── js/
│   │   ├── api.js       # llamadas fetch al backend
│   │   ├── ui.js        # pintar datos en el DOM
│   │   └── main.js      # punto de entrada
│   └── assets/
│       └── ejercicios/  # SVG de ejercicios descargados (ver Créditos)
├── database/
│   └── schema.sql       # creación de tablas + datos de ejemplo
├── docs/
│   └── decisiones/      # un documento por decisión técnica (ADR)
├── docker-compose.yml
├── .gitignore
└── README.md
```

## Decisiones técnicas

Registro completo en `docs/decisiones/`. Resumen:

1. **[Sin sistema de usuarios/login](docs/decisiones/001-sin-sistema-de-usuarios.md)**
   — la app es de uso personal para un único usuario.
2. **[Modelo de datos normalizado por series](docs/decisiones/002-diseno-base-de-datos.md)**
   — cada serie es una fila independiente, para poder calcular progresión y
   volumen con SQL directo.
3. **[Equipo como columna de texto simple](docs/decisiones/003-equipo-como-texto.md)**
   — se empieza sin tabla de máquinas; ampliable en el futuro sin perder datos.
4. **[Ilustraciones descargadas localmente](docs/decisiones/004-ilustraciones-locales.md)**
   — para no depender de un catálogo externo; requiere atribución (ver Créditos).
5. **[Entorno con Docker Compose](docs/decisiones/005-entorno-docker.md)**
   — 4 contenedores, reproducible en cualquier máquina.
6. **[Dockerfile propio para el backend](docs/decisiones/006-dockerfile-pdo-mysql.md)**
   — la imagen oficial de PHP no trae el driver `pdo_mysql`.

## Cómo levantar el proyecto en local

### Requisitos
- Git
- Docker y Docker Compose

### Pasos
```bash
git clone https://github.com/Gerrope/gym-tracker.git
cd gym-tracker
docker compose up -d
```

La primera vez tarda unos minutos porque descarga y construye las imágenes.
La base de datos se crea sola a partir de `database/schema.sql`.

### Servicios

| Servicio | URL | Para qué |
|---|---|---|
| Frontend | http://localhost | La aplicación |
| Backend (API) | http://localhost:8080 | Endpoints PHP |
| phpMyAdmin | http://localhost:8081 | Ver la base de datos (usuario `root`, contraseña `rootpass`) |

Para pararlo: `docker compose down`

## Endpoints de la API

| Método | Endpoint | Qué hace | Devuelve |
|---|---|---|---|
| GET | `/api/ejercicios.php` | Lista el catálogo de ejercicios | Array de ejercicios |
| GET | `/api/entrenamientos.php` | Lista entrenamientos (resumen) | Array de {id, fecha, notas} |
| GET | `/api/entrenamientos.php?id=5` | Detalle de un entrenamiento | Objeto con sus series incluidas |
| POST | `/api/entrenamientos.php` | Crea un entrenamiento con sus series | {id del nuevo entrenamiento} |
| PUT | `/api/entrenamientos.php?id=5` | Reemplaza un entrenamiento entero (fecha, notas y todas sus series) | Confirmación |
| DELETE | `/api/entrenamientos.php?id=5` | Borra un entrenamiento (y sus series, en cascada) | Confirmación |
| GET | `/api/progreso.php?ejercicio_id=1` | Progresión de peso en ese ejercicio a lo largo del tiempo | Array de {fecha, peso} |
| GET | `/api/peso_corporal.php` | Histórico de peso corporal | Array de {fecha, peso} |
| POST | `/api/peso_corporal.php` | Registra un peso corporal nuevo | {id del nuevo registro} |

## Créditos

Las ilustraciones de ejercicios en `frontend/assets/ejercicios/` provienen del
catálogo abierto [Workout Guide](https://bryllim.github.io/workout-guide/) de
**Bryl Lim**, basado en las poses originales de **Everkinetic**. Ambas fuentes
están licenciadas bajo [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/).

## Roadmap de fases

- [x] Fase 1 — Análisis y requisitos
- [x] Fase 2 — Diseño de base de datos
- [x] Fase 3 — Diseño de la API
- [ ] Fase 4 — Backend (PHP) (en curso)
- [ ] Fase 5 — Frontend (JavaScript)
- [ ] Fase 6 — Pruebas
- [ ] Fase 7 — Despliegue

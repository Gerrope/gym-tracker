# Gym Tracker

   Aplicación personal de seguimiento de entrenamientos de gimnasio, hecha con JavaScript (vanilla) en el cliente y PHP + MySQL en el servidor.

## Descripción

Aplicación personal de seguimiento de entrenamientos de gimnasio. Permite
registrar sesiones de entrenamiento (ejercicios, series, repeticiones y peso)
y consultar el progreso a lo largo del tiempo: progresión de peso por
ejercicio, volumen total por sesión, y evolución del peso corporal.

## Estado del proyecto

En desarrollo — Fase 2 (diseño de base de datos) completada.

## Stack

- **Frontend:** HTML + CSS + JavaScript vanilla (fetch API)
- **Backend:** PHP 8 nativo + PDO
- **Base de datos:** MySQL
- **Entorno local:** XAMPP (Docker queda como posible mejora futura)
- **Control de versiones:** Git + GitHub, Conventional Commits

## Estructura del repositorio

```
gym-tracker/
├── backend/
│   ├── api/            # un archivo PHP por recurso (aún por crear en Fase 4)
│   └── db.php           # conexión PDO a MySQL
├── frontend/
│   ├── index.html
│   ├── css/
│   ├── js/
│   │   ├── api.js       # llamadas fetch al backend
│   │   ├── ui.js         # pintar datos en el DOM
│   │   └── main.js       # punto de entrada
│   └── assets/
│       └── ejercicios/    # SVG de ejercicios descargados (ver Créditos)
├── database/
│   └── schema.sql        # creación de tablas + datos de ejemplo
├── docs/
│   └── decisiones/        # un documento por decisión técnica (ADR)
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

## Cómo levantar el proyecto en local

**Pendiente de decidir.** El equipo de desarrollo usa **Fedora Linux**, donde
XAMPP no es la opción más habitual (está pensado sobre todo para
Windows/macOS). Las alternativas reales en Fedora son instalar PHP + MySQL
de forma nativa con `dnf`, o usar Docker (ver `docs/decisiones/` cuando se
tome esta decisión en la fase de entorno). Esta sección se completará
entonces con los pasos exactos.

De momento, lo único necesario para probar la base de datos es tener MySQL
instalado y ejecutar:
```
mysql -u root -p < database/schema.sql
```

## Endpoints de la API

_Pendientes de diseñar en la Fase 3._

| Método | Endpoint | Descripción |
|---|---|---|
| — | — | — |

## Créditos

Las ilustraciones de ejercicios en `frontend/assets/ejercicios/` provienen del
catálogo abierto [Workout Guide](https://bryllim.github.io/workout-guide/) de
**Bryl Lim**, basado en las poses originales de **Everkinetic**. Ambas fuentes
están licenciadas bajo [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/).

## Roadmap de fases

- [x] Fase 1 — Análisis y requisitos
- [x] Fase 2 — Diseño de base de datos
- [ ] Fase 3 — Diseño de la API
- [ ] Fase 4 — Backend (PHP)
- [ ] Fase 5 — Frontend (JavaScript)
- [ ] Fase 6 — Pruebas
- [ ] Fase 7 — Despliegue

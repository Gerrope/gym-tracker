# 004 — Ilustraciones de ejercicios descargadas y guardadas localmente

**Fecha:** 2026-08-29
**Estado:** Aceptada

## Contexto
Se quiere mostrar una ilustración por ejercicio. Se encontró el catálogo
abierto [Workout Guide](https://bryllim.github.io/workout-guide/) (Bryl Lim,
basado en ilustraciones de Everkinetic), con 302 ejercicios en SVG.

## Alternativas consideradas
1. Enlazar directamente a las URLs del catálogo externo.
2. Descargar los SVG de los ejercicios usados y guardarlos dentro del propio
   proyecto, en `frontend/assets/ejercicios/`.

## Decisión
Se elige la opción 2.

## Consecuencias
- La app no depende de que la web externa siga disponible en el futuro
  (importante para un proyecto que se va a entregar y evaluar).
- Hay que descargar manualmente el SVG de cada ejercicio que se añada al
  catálogo (buscarlo en la galería, copiar `frames/<slug>/frame-1.svg`).
- **Atribución obligatoria** (licencia CC BY-SA 4.0 de los assets):
  se debe citar a **Bryl Lim** (autor del catálogo) y a **Everkinetic**
  (autor original de las poses) en el README del proyecto.
- La columna `imagen` en `ejercicios` guarda la ruta relativa al archivo
  local (ej. `assets/ejercicios/press-banca.svg`), no una URL externa.

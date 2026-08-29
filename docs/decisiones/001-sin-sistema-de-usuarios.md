# 001 — No se implementa sistema de usuarios/login

**Fecha:** 2026-08-29
**Estado:** Aceptada

## Contexto
El proyecto es un gym tracker de uso personal.

## Decisión
No se construye sistema de autenticación ni gestión de usuarios en la v1.
Toda la app asume un único usuario implícito.

## Consecuencias
- Simplifica muchísimo el modelo de datos (no hace falta tabla `usuarios`
  ni relacionar `entrenamientos`/`peso_corporal` con un `usuario_id`).
- Simplifica la API: no hay que proteger endpoints ni gestionar sesiones/tokens.
- Si en el futuro se quisiera compartir la app con más gente, habría que:
  añadir tabla `usuarios`, añadir `usuario_id` como clave foránea en
  `entrenamientos` y `peso_corporal`, y añadir autenticación (sesiones PHP
  o JWT) en cada endpoint.

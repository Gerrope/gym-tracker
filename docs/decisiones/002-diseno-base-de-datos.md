# 002 — Modelo de datos normalizado por series

**Fecha:** 2026-08-29
**Estado:** Aceptada

## Contexto
La app necesita cubrir cuatro vistas de "progreso": progresión de peso
por ejercicio, volumen total por sesión, evolución del peso corporal, y
un historial simple de sesiones pasadas.

## Alternativas consideradas
1. **Guardar cada entrenamiento como un JSON** en una sola columna de
   `entrenamientos`. Más rápido de escribir al principio, pero imposible
   de consultar con SQL (no se puede hacer `SUM`/`GROUP BY` por ejercicio
   sin traer todo a PHP y procesarlo a mano).
2. **Una fila por serie** (tabla `series`), relacionada con `entrenamientos`
   y `ejercicios`.

## Decisión
Se elige la opción 2: cada serie realizada (ejercicio + repeticiones + peso)
es una fila independiente en la tabla `series`.

## Consecuencias
- La progresión de peso por ejercicio es un `SELECT ... WHERE ejercicio_id = ?
  ORDER BY fecha` directo.
- El volumen por sesión es un `SUM(repeticiones * peso) GROUP BY entrenamiento_id`.
- `peso_corporal` se mantiene como tabla independiente porque no tiene
  relación con las sesiones de entrenamiento.
- Coste: insertar un entrenamiento completo requiere varios `INSERT`
  (uno por serie) en vez de uno solo — se resuelve en el backend con una
  transacción PDO en el endpoint de creación (Fase 4).

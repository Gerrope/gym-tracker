# 003 — "Equipo" como columna de texto simple

**Fecha:** 2026-08-29
**Estado:** Aceptada

## Contexto
Cada ejercicio se puede realizar con distinto equipo (barra, mancuernas,
peso corporal...). Se planteó si esto merecía una tabla `maquinas`
independiente relacionada mediante una tabla puente (relación
muchos-a-muchos: un ejercicio admite varios equipos, un equipo sirve para
varios ejercicios).

## Decisión
Se empieza con una columna de texto simple `equipo` en la tabla `ejercicios`,
en vez de tablas `maquinas` + `ejercicio_maquina`.

## Consecuencias
- Un ejercicio solo puede tener un valor de equipo. Si en el futuro un mismo
  ejercicio necesita varios equipos posibles, habrá que migrar a una tabla
  puente (ver alternativa considerada más abajo).
- Migración futura sin pérdida de datos: se crearían las tablas nuevas,
  se poblarían a partir de los valores actuales de `equipo`, y opcionalmente
  se eliminaría la columna. Los datos de `entrenamientos`, `series` y
  `peso_corporal` no se ven afectados por este cambio.
- Si se amplía en el futuro, el catálogo de equipos se modelará como
  **tipos de equipo genéricos** (ej. "Máquina Smith", "Polea"), no como
  máquinas físicas de un gimnasio concreto — así el diseño no depende de
  a qué gimnasio se vaya.

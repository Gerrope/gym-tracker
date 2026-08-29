-- Gym Tracker — esquema de base de datos
-- Fase 2: Diseño de base de datos

CREATE DATABASE IF NOT EXISTS gym_tracker CHARACTER SET utf8mb4;
USE gym_tracker;

-- Catálogo de ejercicios (evita duplicados / typos, permite filtrar progreso por ejercicio)
-- equipo: texto simple (ej. "Barra", "Mancuernas", "Peso corporal"). Ver docs/decisiones/003.
-- imagen: ruta relativa al SVG descargado en frontend/assets/ejercicios/. Ver docs/decisiones/004.
CREATE TABLE ejercicios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    grupo_muscular VARCHAR(50),
    equipo VARCHAR(50),
    imagen VARCHAR(255)
);

-- Una fila por sesión de entrenamiento
CREATE TABLE entrenamientos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    notas VARCHAR(255)
);

-- Tabla clave: una fila POR CADA SERIE realizada.
-- Al estar normalizada así, tanto la progresión de peso por ejercicio
-- como el volumen total por sesión (SUM(repeticiones * peso)) se calculan
-- con SQL directo, sin lógica extra en PHP.
CREATE TABLE series (
    id INT AUTO_INCREMENT PRIMARY KEY,
    entrenamiento_id INT NOT NULL,
    ejercicio_id INT NOT NULL,
    numero_serie INT NOT NULL,
    repeticiones INT NOT NULL,
    peso DECIMAL(6,2) NOT NULL,
    FOREIGN KEY (entrenamiento_id) REFERENCES entrenamientos(id) ON DELETE CASCADE,
    FOREIGN KEY (ejercicio_id) REFERENCES ejercicios(id)
);

-- Tabla independiente: no tiene relación directa con las sesiones de entrenamiento
CREATE TABLE peso_corporal (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    peso DECIMAL(5,2) NOT NULL
);

-- Datos de ejemplo para poder probar la API desde el primer día
-- La columna "imagen" se deja NULL por ahora: se rellenará cuando se descarguen
-- los SVG correspondientes a frontend/assets/ejercicios/ (ver README).
INSERT INTO ejercicios (nombre, grupo_muscular, equipo) VALUES
    ('Press banca', 'Pecho', 'Barra'),
    ('Sentadilla', 'Pierna', 'Barra'),
    ('Peso muerto', 'Espalda', 'Barra'),
    ('Press militar', 'Hombro', 'Barra');

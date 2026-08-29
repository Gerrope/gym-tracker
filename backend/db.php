<?php
// db.php — conexión a la base de datos con PDO
// TODO (Fase 7): mover estas credenciales a un .env con phpdotenv antes de desplegar

$host = 'localhost';
$dbname = 'gym_tracker';
$user = 'root';
$pass = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    http_response_code(500);
    die(json_encode(['error' => 'Error de conexión a la base de datos']));
}

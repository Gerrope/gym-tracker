<?php
// db.php — conexión a la base de datos con PDO

// Cabeceras CORS: el frontend vive en otro origen (puerto 80 vs 8080),
// así que hay que permitir explícitamente que llame a esta API.
header('Access-Control-Allow-Origin: http://localhost');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type');
header('Content-Type: application/json');

$host = 'db';           // nombre del servicio en docker-compose.yml, no "localhost"
$dbname = 'gym_tracker';
$user = 'gymuser';
$pass = 'gympass';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    http_response_code(500);
    die(json_encode(['error' => 'Error de conexión a la base de datos']));
}
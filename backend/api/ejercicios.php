<?php

require __DIR__ . '/../db.php';

$metodo = $_SERVER['REQUEST_METHOD'];

if ($metodo === 'GET') {
    $stmt = $pdo->query('SELECT * FROM ejercicios');
    echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
} else {
    http_response_code(405);
    echo json_encode(['error' => 'Método no permitido']);
}


<?php
// Configurações do banco de dados
$host = 'localhost';
$dbname = 'bdLibre';
$username = 'root';
$password = '';

try {
    $conexao = new PDO(
        "mysql:host=$host;dbname=$dbname;charset=utf8mb4", 
        $username, 
        $password,
        [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES => false,
            PDO::ATTR_PERSISTENT => true // Adicionado para conexões persistentes
        ]
    );

    
} catch (PDOException $e) {
    error_log("[" . date('Y-m-d H:i:s') . "] Erro na conexão com o BD: " . $e->getMessage() . "\n", 3, "logs/db_errors.log");
    die("Erro na conexão com o banco de dados. Tente novamente mais tarde.");
}

try {
    $pdo = new PDO( // Note que agora usamos $pdo em vez de $conexao
        "mysql:host=$host;dbname=$dbname;charset=utf8mb4", 
        $username, 
        $password,
        [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES => false
        ]
    );
    
    // Retorne a conexão para garantir que está disponível
    return $pdo;
    
} catch (PDOException $e) {
    error_log("Erro na conexão com o BD: " . $e->getMessage());
    die("Erro na conexão com o banco de dados.");
}


?>
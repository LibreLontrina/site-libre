<?php

require_once __DIR__ . '/../includes/bd.php';
session_start();

//GERENCIAMENTO DE LIVROS 
//CREATE 
function cadastrarLivro($titulo, $autor, $descricao, $capa, $arquivo, $pdo) {
    $stmt = $pdo->prepare("INSERT INTO livros (titulo, autor, descricao, capa, arquivo) VALUES (?, ?, ?, ?, ?)");
    return $stmt->execute([$titulo, $autor, $descricao, $arquivo]);
}
//READ
function procurarLivro($termo, $pdo) {
    $sql = "SELECT * FROM livros 
            WHERE titulo LIKE :termo 
               OR autor LIKE :termo 
               OR descricao LIKE :termo
            ORDER BY id DESC";
    
    $stmt = $pdo->prepare($sql);
    $stmt->bindValue(':termo', '%' . $termo . '%');
    $stmt->execute();
    
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}



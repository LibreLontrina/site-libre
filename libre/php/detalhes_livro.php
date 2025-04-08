<?php
session_start();
require_once __DIR__ . '/../includes/bd.php';

if (!isset($_GET['id']) || !ctype_digit($_GET['id'])) {
    header("Location: indexupload.php");
    exit;
}

try {
    $stmt = $pdo->prepare("SELECT * FROM livros WHERE id = ?");
    $stmt->execute([$_GET['id']]);
    $livro = $stmt->fetch();

    if (!$livro) {
        header("Location: indexupload.php");
        exit;
    }
} catch (PDOException $e) {
    die("Erro ao carregar livro: " . $e->getMessage());
}
?>

<!DOCTYPE html>
<html>
<head>
    <title><?= htmlspecialchars($livro['titulo']) ?> - Detalhes</title>
</head>
<body>
    <div class="livro-container">
        <h1><?= htmlspecialchars($livro['titulo']) ?></h1>
        
        <p><strong>Autor:</strong> <?= htmlspecialchars($livro['autor'])?></p>
        
        <p><strong>Descrição:</strong></p>
        <p><?= nl2br(htmlspecialchars($livro['descricao'])) ?></p>
        
        <a href="download.php?id=<?= $livro['id'] ?>" class="btn-download">
            Baixar Arquivo
        </a>
        
        <p><a href="indexupload.php">Voltar para a lista de livros</a></p>
    </div>
</body>
</html>
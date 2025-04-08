<?php
session_start();
$pdo = require_once __DIR__ . '/../includes/bd.php';

if (!($pdo instanceof PDO)) {
    die("Falha na conexão com o banco de dados.");
}

try {
    $stmt = $pdo->query("SELECT id, titulo FROM livros ORDER BY id DESC");
    $livros = $stmt->fetchAll();
} catch (PDOException $e) {
    die("Erro ao consultar livros: " . $e->getMessage());
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Libre</title>
</head>
<body>
    <h1>Libre</h1>
    
    <?php if (empty($livros)): ?>
        <p>Nada para ver por aqui, faça seu primeiro upload e ele aparecerá aqui!</p>
    <?php else: ?>
        <div class="livros-list">
            <?php foreach ($livros as $livro): ?>
                <a href="detalhes_livro.php?id=<?= $livro['id'] ?>" class="livro-link">
                    <?= htmlspecialchars($livro['titulo']) ?>
                </a>
            <?php endforeach; ?>
        </div>
    <?php endif; ?>
    
    <a href="upload.php"><button>Upload</button></a>
</body>
</html>
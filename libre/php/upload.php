<?php
session_start();
require_once __DIR__ . '/../includes/bd.php';

// Verificar se o usuário está logado
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

// Processar o formulário de upload
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $titulo = trim($_POST['titulo'] ?? '');
    $autor = trim($_POST['autor'] ?? '');
    $descricao = trim($_POST['descricao'] ?? '');
    
    // Validação básica
    if (empty($titulo) || empty($_FILES['arquivo']['name'])) {
        die("Preencha todos os campos obrigatórios!");
    }
    
    // Se o autor for vazio, usa o username do usuário com @
    if (empty($autor)) {
        $autor = '@' . $_SESSION['username'];
    }
    
    // Processar o arquivo
    $arquivo_nome = $_FILES['arquivo']['name'];
    $tipo_arquivo = strtolower(pathinfo($arquivo_nome, PATHINFO_EXTENSION));
    $arquivo_tmp = $_FILES['arquivo']['tmp_name'];
    
    // Verifica se é PDF ou EPUB (sem restrição adicional)
    if (!in_array($tipo_arquivo, ['pdf', 'epub'])) {
        die("Apenas arquivos PDF ou EPUB são permitidos!");
    }
    
    // Lê o conteúdo do arquivo
    $arquivo_blob = file_get_contents($arquivo_tmp);
    
    try {
        $stmt = $pdo->prepare("INSERT INTO livros (titulo, autor, descricao, arquivo_blob, arquivo_nome, tipo_arquivo, usuario_id) VALUES (?, ?, ?, ?, ?, ?, ?)");
        $stmt->execute([$titulo, $autor, $descricao, $arquivo_blob, $arquivo_nome, $tipo_arquivo, $_SESSION['user_id']]);
        
        header("Location: indexupload.php?sucesso=1");
        exit;
    } catch (PDOException $e) {
        die("Erro ao enviar livro: " . $e->getMessage());
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Upload de Livro</title>
</head>
<body>
    <h1>Enviar Livro</h1>
    
    <form action="upload.php" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="titulo">Título *</label>
            <input type="text" id="titulo" name="titulo" required>
        </div>
        
        <div class="form-group">
            <label for="autor">Autor (deixe em branco para usar <strong>@<?= htmlspecialchars($_SESSION['username'] ?? '') ?></strong>)</label>
            <input type="text" id="autor" name="autor">
        </div>
        
        <div class="form-group">
            <label for="descricao">Descrição</label>
            <textarea id="descricao" name="descricao"></textarea>
        </div>
        
        <div class="form-group">
            <label for="arquivo">Arquivo (PDF ou EPUB) *</label>
            <input type="file" id="arquivo" name="arquivo" accept=".pdf,.epub" required>
        </div>
        
        <button type="submit">Enviar Livro</button>
    </form>
</body>
</html>
<?php
require_once __DIR__ . '/../includes/bd.php';

// Verificação rigorosa do ID
if (!isset($_GET['id']) || !ctype_digit($_GET['id'])) {
    header("HTTP/1.0 400 Bad Request");
    die("ID do livro inválido.");
}

try {
    // Consulta ao banco de dados
    $stmt = $pdo->prepare("SELECT arquivo_blob, arquivo_nome, tipo_arquivo FROM livros WHERE id = ?");
    $stmt->execute([$_GET['id']]);
    $livro = $stmt->fetch();

    // Verifica se o livro foi encontrado e se tem conteúdo no blob
    if (!$livro || empty($livro['arquivo_blob'])) {
        header("HTTP/1.0 404 Not Found");
        die("Livro não encontrado ou arquivo corrompido.");
    }

    // Define o tipo MIME correto
    $mimeTypes = [
        'pdf' => 'application/pdf',
        'epub' => 'application/epub+zip'
    ];
    $contentType = $mimeTypes[$livro['tipo_arquivo']] ?? 'application/octet-stream';

    // Configuração do download
    header('Content-Description: File Transfer');
    header('Content-Type: ' . $contentType);
    header('Content-Disposition: attachment; filename="' . $livro['arquivo_nome'] . '"');
    header('Content-Length: ' . strlen($livro['arquivo_blob']));
    header('Expires: 0');
    header('Cache-Control: must-revalidate');
    header('Pragma: public');

    // Envia o arquivo binário para o navegador
    echo $livro['arquivo_blob'];
    exit;

} catch (PDOException $e) {
    error_log("Erro no banco de dados: " . $e->getMessage());
    header("HTTP/1.0 500 Internal Server Error");
    die("Erro no servidor. Código: DL500");
}
?>
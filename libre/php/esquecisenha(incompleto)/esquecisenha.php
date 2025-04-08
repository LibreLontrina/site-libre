<?php
require_once __DIR__ . '/../includes/bd.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = trim($_POST["email"]);
    
    // Verifica se o email existe
    $stmt = $conexao->prepare("SELECT id_cadastro FROM usuarios WHERE email_cadastro = ?");
    $stmt->execute([$email]);
    $usuario = $stmt->fetch();
    
    if ($usuario) {
        // Define expiração (1 hora)
        $expira = date('Y-m-d H:i:s', strtotime('+1 hour'));
        
        // Remove pedidos antigos
        $stmt = $conexao->prepare("DELETE FROM esquecisenha WHERE id_usuario = ?");
        $stmt->execute([$usuario['id_cadastro']]);
        
        // Insere novo pedido
        $stmt = $conexao->prepare("INSERT INTO esquecisenha (id_usuario, expire) VALUES (?, ?)");
        $stmt->execute([$usuario['id_cadastro'], $expira]);
        
        // Gera link (adaptar para seu ambiente)
        $link = "http://http://localhost/logincad/redefinirsenha.php" . urlencode($email);
        
        // Exibe link (em localhost) - substituir por envio de email em produção
        echo "<h3>Link de recuperação (simulado):</h3>";
        echo "<a href='$link'>$link</a>";
        echo "<p><small>Em produção, este link seria enviado por email.</small></p>";
    } else {
        echo "Email não encontrado em nosso sistema.";
    }
}
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recuperar Senha</title>
</head>
<body>
    <h1>Recuperar Senha</h1>
    <form method="POST">
        <label>Digite seu email:</label>
        <input type="email" name="email" required>
        <button type="submit">Enviar Link de Recuperação</button>
    </form>
</body>
</html>
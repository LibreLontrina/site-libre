<?php
require_once __DIR__ . '/../includes/bd.php';

$mensagem = "";
$mostrar_form = false;

// Verifica se veio pelo link de recuperação
if (isset($_GET['email'])) {
    $email = trim($_GET['email']);
    
    // Verifica pedido válido
    $stmt = $conexao->prepare("SELECT u.id_cadastro 
                              FROM usuarios u 
                              JOIN esquecisenha es ON u.id_cadastro = es.id_usuario 
                              WHERE u.email_cadastro = ? AND es.expire > NOW()");
    $stmt->execute([$email]);
    $usuario = $stmt->fetch();
    
    if ($usuario) {
        $mostrar_form = true;
    } else {
        $mensagem = "Pedido inválido ou expirado!";
    }
}

// Processa o formulário
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = trim($_POST["email"]);
    $novaSenha = $_POST["nova_senha"];
    
    // Verifica novamente antes de atualizar
    $stmt = $conexao->prepare("SELECT u.id_cadastro 
                              FROM usuarios u 
                              JOIN esquecisenha es ON u.id_cadastro = es.id_usuario 
                              WHERE u.email_cadastro = ? AND es.expire > NOW()");
    $stmt->execute([$email]);
    $usuario = $stmt->fetch();

    if ($usuario) {
        // Atualiza senha (sem hash conforme solicitado)
        $stmt = $conexao->prepare("UPDATE usuarios SET senha_cadastro = ? WHERE id_cadastro = ?");
        $stmt->execute([$novaSenha, $usuario['id_cadastro']]);

        // Remove o pedido
        $stmt = $conexao->prepare("DELETE FROM esquecisenha WHERE id_usuario = ?");
        $stmt->execute([$usuario['id_cadastro']]);

        $mensagem = "Senha alterada com sucesso!";
    } else {
        $mensagem = "Pedido inválido ou expirado!";
    }
}
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Redefinir Senha</title>
</head>
<body>
    <h1>Redefinir Senha</h1>
    
    <?php if (!empty($mensagem)): ?>
        <div class="msg <?= strpos($mensagem, 'sucesso') !== false ? 'sucesso' : 'erro' ?>">
            <?= htmlspecialchars($mensagem) ?>
        </div>
    <?php endif; ?>
    
    <?php if ($mostrar_form || $_SERVER["REQUEST_METHOD"] == "POST"): ?>
        <form method="POST">
            <input type="hidden" name="email" value="<?= htmlspecialchars($email) ?>">
            <label>Nova Senha:</label>
            <input type="password" name="nova_senha" required minlength="6">
            <button type="submit">Alterar Senha</button>
        </form>
    <?php elseif (!isset($_GET['email'])): ?>
        <p>Acesse esta página através do link enviado por email.</p>
    <?php endif; ?>
</body>
</html>
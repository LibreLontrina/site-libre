<?php
session_start();

// Habilitar erros para debug (remova em produção)
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Inclui o arquivo de conexão
require_once __DIR__ . '/../includes/bd.php';

// Verifica mensagem de sucesso do cadastro
if (isset($_SESSION['mensagem'])) {
    $mensagem = $_SESSION['mensagem'];
    unset($_SESSION['mensagem']);
}

// Processa o formulário de login
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["Botao"])) {
    $usuario = trim($_POST["usuario_login"]);
    $senha = trim($_POST["senha_usuario"]);
    
    if (empty($usuario) || empty($senha)) {
        $erro = "Preencha todos os campos!";
    } else {
        try {
            // Busca o usuário
            $stmt = $conexao->prepare("SELECT * FROM usuarios WHERE email_cadastro = ? OR username_cadastro = ?");
            $stmt->execute([$usuario, $usuario]);
            $usuarioDB = $stmt->fetch();
            
            if ($usuarioDB) {
                // Verificação simples SEM HASH (não recomendado para produção)
                if ($senha === $usuarioDB['senha_cadastro']) {
                    // Login bem-sucedido - armazena dados na sessão
                    $_SESSION['user_id'] = $usuarioDB['id_cadastro'];
                    $_SESSION['user_name'] = $usuarioDB['nome_cadastro'];
                    $_SESSION['username'] = $usuarioDB['username_cadastro']; // Adicionado para o upload
                    
                    header("Location: bemvindo.php");
                    exit();
                } else {
                    $erro = "Senha incorreta!";
                }
            } else {
                $erro = "Usuário não encontrado!";
            }
        } catch (PDOException $e) {
            error_log("ERRO LOGIN: " . $e->getMessage());
            $erro = "Erro no sistema. Tente novamente mais tarde.";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/login.css">
    <title>Login</title>
</head>
<div class="principal">
        <div class="tela-esquerda">
            <h1>Que bom te ver novamente!<br>Faça seu login para poder fazer avaliações <br>e postar sobre seus livros favoritos!</h1>
           <img src="img/login.jpg" class="img-esquerda" alt="Imagem de três pessoas e um cadeado, representando a realização do login">
        </div>
<body>
    <div class="tela-direita">
    <div class="box-login">
    <h1>Login</h1>
    
    <?php if (isset($erro)): ?>
        <p style="color: red;"><?= htmlspecialchars($erro) ?></p>
    <?php endif; ?>
    
    <form method="POST">
        <div>
            <label>Email ou Username:</label>
            <input type="text" name="usuario_login" required placeholder="E-mail ou Usuário">
        </div>
        
        <div>
            <label>Senha:</label>
            <input type="password" name="senha_usuario" required placeholder="Senha">
        </div>
        
        <button type="submit" name="botao" value="logar">Entrar</button>
    </form>
    
    <p>Não possui um cadastro? <a href="cadastro.php">Cadastre-se</a></p>
    <p><a href="esquecisenha.php">Esqueceu a senha?</a></p>
    </div>
    </div>
</body>
</html>

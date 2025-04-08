<?php
session_start();

// Habilitar erros para debug (remova em produção)
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Inclui o arquivo de conexão com caminho absoluto
require_once __DIR__ . '/../includes/bd.php';

// Verifica se o formulário foi enviado
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Recebe e sanitiza os dados
    $nome = trim($_POST["nome_cadastro"]);
    $dataNasc = $_POST["dataNasc_cadastro"];
    $telefone = trim($_POST["telefone_cadastro"]);
    $email = trim($_POST["email_cadastro"]);
    $username = trim($_POST["username_cadastro"]);
    $senha = $_POST["senha_cadastro"];
    $confSenha = $_POST["confsenha_cadastro"];

    // Validações
    $erro = null;
    if (empty($nome) || empty($dataNasc) || empty($telefone) || empty($email) || 
        empty($username) || empty($senha) || empty($confSenha)) {
        $erro = "Todos os campos são obrigatórios!";
    } elseif ($senha !== $confSenha) {
        $erro = "As senhas não coincidem!";
    } elseif (strlen($senha) < 6) {
        $erro = "A senha deve ter no mínimo 6 caracteres!";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $erro = "Email inválido!";
    }

    if (!$erro) {
        try {
            // Verifica se usuário já existe
            $verifica = $conexao->prepare("SELECT id_cadastro FROM usuarios WHERE email_cadastro = ? OR username_cadastro = ?");
            $verifica->execute([$email, $username]);
            
            if ($verifica->rowCount() > 0) {
                $erro = "Email ou username já cadastrados!";
            } else {
                // Insere no banco SEM HASH
                $inserir = $conexao->prepare("INSERT INTO usuarios (email_cadastro, nome_cadastro, username_cadastro, 
                                            telefone_cadastro, data_nasc_cadastro, senha_cadastro) 
                                            VALUES (?, ?, ?, ?, ?, ?)");

                if ($inserir->execute([$email, $nome, $username, $telefone, $dataNasc, $senha])) {
                    $_SESSION['mensagem'] = "Cadastro realizado com sucesso!";
                    header("Location: login.php");
                    exit();
                } else {
                    $erro = "Erro ao cadastrar usuário. Tente novamente.";
                }
            }
        } catch (PDOException $e) {
            error_log("ERRO CADASTRO: " . $e->getMessage());
            $erro = "Erro no sistema. Por favor, tente novamente.";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro</title>
</head>
<body>
    <h1>Cadastro</h1>
    
    <?php if (isset($erro)): ?>
        <p style="color: red;"><?= htmlspecialchars($erro) ?></p>
    <?php endif; ?>
    
    <form method="POST">
        <div>
            <label>Nome:</label>
            <input type="text" name="nome_cadastro" required>
        </div>
        
        <div>
            <label>Username:</label>
            <input type="text" name="username_cadastro" required>
        </div>
        
        <div>
            <label>Data de Nascimento:</label>
            <input type="date" name="dataNasc_cadastro" required>
        </div>
        
        <div>
            <label>Telefone:</label>
            <input type="tel" name="telefone_cadastro" required>
        </div>
        
        <div>
            <label>Email:</label>
            <input type="email" name="email_cadastro" required>
        </div>
        
        <div>
            <label>Senha (mínimo 6 caracteres):</label>
            <input type="password" name="senha_cadastro" minlength="6" required>
        </div>
        
        <div>
            <label>Confirmar Senha:</label>
            <input type="password" name="confsenha_cadastro" required>
        </div>
        
        <button type="submit" name="Botao" value="Cadastrar">Cadastrar</button>
    </form>
    
    <p>Já tem uma conta? <a href="login.php">Faça login</a></p>
</body>
</html>


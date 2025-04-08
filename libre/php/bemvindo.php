<?php
session_start();

// Verifica se o usuário está logado
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

// Recupera o nome do usuário da sessão
$nomeUsuario = htmlspecialchars($_SESSION['user_name']);
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bem-vindo</title>
</head>
<body>
    <h1>Bem-vindo, <?php echo $nomeUsuario; ?>!</h1>
    <p>Você está logado no sistema.</p>
    <a href="upload.php">Fazer um upload</a>
    <a href="logout.php">Sair</a>
    <a href="indexupload.php"><button>Nossa bribribrioteca</button></a>
</body>
</html>
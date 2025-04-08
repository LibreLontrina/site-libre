<?php
session_start();

// Verifica se o usuário está logado
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

// Recupera o nome do usuário
$nomeUsuario = htmlspecialchars($_SESSION['user_name']);
?>
<?php
session_start();
session_destroy(); // Destroi todas as sessões

header("Location: index.php"); // Redireciona para a página inicial
exit();
?>

</body>
</html>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/style.css">

    <title>Catálogo dos livros</title>
</head>

<header>
    <?php
    include_once '../includes/header.php';
    ?>
</header>

<main>
<div class="container">

                <!--ainda não está estilizado-->
                <!--fazer uma classe para os carrosséis-->
                <div class="box">
                    <h1>Em alta</h1>
                    <p>Sua mais nova plataforma virtual focada em leitura e escrita.</p>
                    <h2>Leia. Avalie. Comente.

                    </h2>
                </div>
                <div class="box">
                    <p>Sinta-se livre para explorar.<br>
                    Leia um livro, veja avaliações,<br>
                    coloque um comentário e brilhe!</p>
                    <br>
                    <p>Conheça os nossos livros:<a href="./php/catalogo.php">Teste***</a>                    </p>
                </div>
                <div class="box">
                    <p>Baixe o <strong>LIBRE</strong> no seu dispositivo móvel!<br>
                    Leia mais e comente de onde quiser!<br>
                    Disponível para dispositivos iOS e Android.</p>
                </div>
            </div>
</main>
<footer>
    <?php
    include_once '../includes/footer.php';
    ?>
</footer>
</body>

</html>
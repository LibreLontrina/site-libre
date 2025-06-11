<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Perfil do Usuário</title>
    <link rel="stylesheet" href="perfil-usuario.css">
</head>
<body>
    <?php
include "../header/header.php"
?>
<main>
    <div class="capa-perfil">
        <div class="foto-perfil"></div>
        <div class="nome-usuario">@nomeusuario</div>
    </div>

    <div class="botao-editar-espaco">
        <button class="botao-editar">Editar perfil</button>
    </div>

    <section class="perfil">
        <div class="coluna consumo">
            <h3>Consumo</h3>
            <div class="grafico-consumo">
                <div class="linha-consumo">
                    <span class="rotulo-genero">Horror</span>
                    <div class="barra-genero" style="width: 90%;"></div>
                </div>
                <div class="linha-consumo">
                    <span class="rotulo-genero">Mistério</span>
                    <div class="barra-genero" style="width: 70%;"></div>
                </div>
                <div class="linha-consumo">
                    <span class="rotulo-genero">Romance</span>
                    <div class="barra-genero" style="width: 65%;"></div>
                </div>
                <div class="linha-consumo">
                    <span class="rotulo-genero">Ficção<br>científica</span>
                    <div class="barra-genero" style="width: 45%;"></div>
                </div>
            </div>
        </div>

        <div class="coluna descricao">
            <h3>Descrição</h3>
            <p>Leitor apaixonado por livros de fantasia, romance e histórias com mistério.</p><br>

            <h3>Gêneros preferidos</h3>
            <button class="botao-generos">Crônica</button>
            <button class="botao-generos">Conto</button>
            <button class="botao-generos">Poema</button>
            <button class="botao-generos">Infantojuvenil</button>
            <button class="botao-generos">Ficção-cientifíca</button>
            <button class="botao-generos">Romance</button>
            <button class="botao-generos">Suspense</button>
            <button class="botao-generos">Fantasia</button>
        </div>

        <div class="coluna amigos">
            <h3>Amigos</h3>
            <ul>
                <li><div class="amigo-foto"></div> Apus not Achado</li>
                <li><div class="amigo-foto"></div> Isa(homem-aranha)</li>
                <li><div class="amigo-foto"></div> Gaspar</li>
                <li><div class="amigo-foto"></div> Nome 4</li>
                <li><div class="amigo-foto"></div> Nome 5</li>
                <li><div class="amigo-foto"></div> Nome 6</li>
                <li><div class="amigo-foto"></div> Nome 7</li>
            </ul>
        </div>
    </section>

    <section class="estantes">
        <div class="carrosel-container">
            <div class="carrosel-livros" id="carrosel">
                <h2>Favoritos</h2>
                <div class="livros-container centralizado">
                    <div class="livro">Livro 1</div>
                    <div class="livro">Livro 2</div>
                    <div class="livro">Livro 3</div>
                    <div class="livro">Livro 4</div>
                </div>

                <h2>Lidos Recentemente</h2>
                <div class="livros-container centralizado">
                    <div class="livro">Livro 1</div>
                    <div class="livro">Livro 2</div>
                    <div class="livro">Livro 3</div>
                    <div class="livro">Livro 4</div>
                </div>

                <h2>Publicados</h2>
                <div class="livros-container centralizado">
                    <div class="livro">Livro 1</div>
                    <div class="livro">Livro 2</div>
                    <div class="livro">Livro 3</div>
                    <div class="livro">+</div>
                </div>
            </div>
        </div>
    </section>
</main>
</body>
<?php
include "../footer/footer.php"
?>
</html>

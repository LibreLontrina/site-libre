<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Livro 123 - Detalhes | Biblioteca Digital</title>
    <link rel="stylesheet" href="pag-livro.css">
</head>
<body>
    <?php
include "../header/header.php"
?>
    <main class="pagina-livro">
        <section class="detalhes-livro">
            <img class="capa-livro" alt="Capa do Livro">

            <div class="info-livro">
                <h1 class="info-livro__titulo">Livro 123</h1>
                <div class="info-livro__meta">
                    <p>Autor: Apus Not Found</p>
                    <p>Editora: Edições Perdidas</p>
                    <p>Publicação: 1769</p>
                </div>

                <div class="generos-lista">
                    <button class="botao-generos">Crônica</button>
                    <button class="botao-generos">Conto</button>
                    <button class="botao-generos">Poema</button>
                    <button class="botao-generos">Infantojuvenil</button>
                    <button class="botao-generos">Ficção-cientifíca</button>
                    <button class="botao-generos">Romance</button>
                    <button class="botao-generos">Suspense</button>
                    <button class="botao-generos">Fantasia</button>
                </div>

                <p class="sinopse">
                    Uma jornada épica através de mundos desconhecidos, combinando elementos de ficção científica
                    com um romance profundamente humano.
                </p>

                <div class="acoes-livro">
                    <button class="botao-acao">📥 Download</button>
                    <button class="botao-acao">📖 Ler Online</button>
                    <button class="botao-acao">＋ Adicionar à Estante</button>
                    <button class="botao-acao">❤ Favoritar</button>

                </div>
            </div>
        </section>

        <section class="secao-carrossel">
            <h2 class="secao-carrossel__titulo">Livros Relacionados</h2>
            <p>será substituído por um carrosel futuramente</p>
        </section>

        <section class="avaliacoes-amigos">
            <h2>Avaliações de Amigos</h2>
            <div class="avaliacao">
                <div class="avaliacao__avatar"></div>
                <div class="avaliacao__conteudo">
                    <div class="avaliacao__cabecalho">
                        <h3>Maria Silva</h3>
                        <div class="estrelas">★★★★★</div>
                    </div>
                    <p class="avaliacao__texto">
                        Adorei este livro! A história me prendeu do início ao fim. Mal posso esperar pela continuação.
                    </p>
                </div>
            </div>
            <div class="avaliacao">
                <div class="avaliacao__avatar"></div>
                <div class="avaliacao__conteudo">
                    <div class="avaliacao__cabecalho">
                        <h3>João Pereira</h3>
                        <div class="estrelas">★★★☆☆</div>
                    </div>
                    <p class="avaliacao__texto">
                        Uma leitura interessante, com alguns pontos altos, mas achei o ritmo um pouco lento em algumas partes.
                    </p>
                </div>
            </div>
        </section>

        <h2>Avaliações</h2>

        <div class="container-input-comentario">
            <div class="avatar-usuario"></div>
            <div class="wrapper-input">
                <input type="text" class="input-comentario" placeholder="Adicionar um comentário...">
                <button class="botao-comentario">Enviar</button>
            </div>
        </div>

        <br>
        <section class="avaliacoes-lista">
            <div class="avaliacao">
                <div class="avaliacao__avatar"></div>
                <div class="avaliacao__conteudo">
                    <div class="avaliacao__cabecalho">
                        <h3>Leitor Anônimo</h3>
                        <div class="estrelas">★★★★☆</div>
                        <button class="botao-curtir-comentario">❤ Curtir</button>
                    </div>
                    <p class="avaliacao__texto">
                        Uma obra que mistura habilmente elementos de ficção científica com
                        um enredo profundamente humano. Recomendo!
                    </p>
                    <div class="respostas-comentario">
                        <button class="botao-mostrar-respostas">Mostrar Respostas (1)</button>
                        <div class="resposta">
                            <div class="avaliacao resposta__avaliacao">
                                <div class="avaliacao__avatar resposta__avatar"></div>
                                <div class="avaliacao__conteudo resposta__conteudo">
                                    <div class="avaliacao__cabecalho resposta__cabecalho">
                                        <h3>Biblioteca Digital</h3>
                                    </div>
                                    <p class="avaliacao__texto resposta__texto">
                                        Que bom que gostou da recomendação! 😊
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
    <script src="pag-livro.js"></script>
</body>
<?php
include "../footer/footer.php"
?>
</html>
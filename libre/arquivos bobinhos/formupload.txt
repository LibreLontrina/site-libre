<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload de Livros</title>
</head>
<body>
    <h1>Upload de Livros</h1>
    <form action="upload.php" method="POST" enctype="multipart/form-data">
        <div>
            <label for="titulo">Título do Livro:</label>
            <input type="text" id="titulo" name="titulo" required>
        </div>
        
        <div>
            <label for="autor">Autor:</label>
            <input type="text" id="autor" name="autor">
            <small>Deixe em branco para usar seu nome de usuário</small>
        </div>
        
        <div>
            <label for="descricao">Descrição:</label>
            <textarea id="descricao" name="descricao"></textarea>
        </div>
        
        <div>
            <label for="arquivo">Arquivo do Livro (PDF ou EPUB):</label>
            <input type="file" id="arquivo" name="arquivo" accept=".pdf,.epub" required>
        </div>
        
        <div>
            <button type="submit">Enviar Livro</button>
        </div>
    </form>
</body>
</html>
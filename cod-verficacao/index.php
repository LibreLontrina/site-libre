<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Verificação de Código</title>
  <link rel="stylesheet" href="cod-verificacao.css"/>
<body>

  <main class="container">
    <div class="header">
      <h2>Digite o código de verificação</h2>
      <p>Enviamos um código de verificação de 6 dígitos para o seu e-mail cadastrado</p>
    </div>
    
    <div class="codigo">
  <input type="text" maxlength="1" pattern="[A-Za-z0-9]" />
  <input type="text" maxlength="1" pattern="[A-Za-z0-9]" />
  <input type="text" maxlength="1" pattern="[A-Za-z0-9]" />
  <input type="text" maxlength="1" pattern="[A-Za-z0-9]" />
  <input type="text" maxlength="1" pattern="[A-Za-z0-9]" />
  <input type="text" maxlength="1" pattern="[A-Za-z0-9]" />
</div>

<!-- O código fica concatenado e tá salvando nesse input escondido para enviar pra a api ou pra um formulário -->
<input type="hidden" id="codigoFinal" name="codigoFinal" />

<button onclick="enviarCodigo()">Confirmar</button>

  </main>
  <script src="cod-verificacao.js"></script>
</body>
</html>
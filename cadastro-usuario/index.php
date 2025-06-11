<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Cadastro</title>
  <link href="https://fonts.googleapis.com/css2?family=Kanit:wght@400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="cadastro-usuario.css">
</head>
<body>
  <div class="container">
    <form id="formCadastro">
      <label for="nome">Nome</label>
      <input type="text" id="nome" name="nome" required>
      
      <label for="usuario">Nome de usuário</label>
      <input type="text" id="usuario" name="usuario" required>
      <br>
      <div class="linha">
        <div>
          <label for="nascimento">Data de Nascimento</label>
          <input type="date" id="nascimento" name="nascimento" required>
        </div>
        <br>
        <div>
          <label for="telefone">Telefone</label>
          <input type="tel" id="telefone" name="telefone" placeholder="(00) 00000-0000" maxlength="15"> 
          <div class="error-message" id="telefone-error"></div>
        </div>
      </div>
      <label for="email">Email</label>
      <input type="email" id="email" name="email" required>
      <div class="error-message" id="email-error"></div>
      
      <div class="linha">
        <div>
          <label for="senha">Senha</label>
          <input type="password" id="senha" name="senha" placeholder="Digite a sua senha" required>
        </div>
        <div>
          <label for="confirmar">Confirmar Senha</label>
          <input type="password" id="confirmar" name="confirmar" placeholder="Confirme a sua senha  " required>
        </div>
      </div>
      <div class="error-message" id="senha-error"></div>
      
      <p class="requisitos">Sua senha deve conter ao menos uma letra maiúscula, uma letra minúscula e um número.</p>
      
      <div class="termos">
        <input type="checkbox" id="termos" name="termos" required>
        <label for="termos">Eu concordo com os <a href="#">Termos de Serviço</a></label>
      </div>
      <br>
      <div class="irlogin">
        <a href="../login-usuario/login-usuario.php">Já possui cadastro? Faça Login!</a>
      </div>
      <br>
      
      <button type="submit">Cadastrar</button>
    </form>
  </div>
  <script src="cadastro-usuario.js"></script> 
</body>
</html>
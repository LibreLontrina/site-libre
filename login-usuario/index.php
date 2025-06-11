<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Libre</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="login-usuario.css">
</head>
<body>
    <main>
       <div class="main-wrapper"> 
        <div class="tela-direita"> 
            <div class="container"> 
                <img src="../images/logo-libre-certa.png" alt="Libre Logo" class="img-login-logo">
                
                <form id="loginForm">
                    <h1>Bem-Vindo de Volta!</h1>
 
                    <div class="input-group">
                        <label for="email">Email</label>
                        <i class="fas fa-envelope input-icon"></i>
                        <input type="email" id="email" name="email" placeholder="Digite seu email" required>
                        <div class="error-message" id="email-error"></div>
                    </div>
                    
                    <div class="input-group">
                        <label for="senha">Senha</label>
                        <i class="fas fa-lock input-icon"></i>
                        <input type="password" id="senha" name="senha" placeholder="Digite sua senha" required>
                        <div class="error-message" id="password-error"></div>
                    </div>
                    
                    <div class="links-auxiliares">
                        <a href="../cadastro-usuario" aria-label="Criar uma conta">
                            Não possui login? Cadastre-se!
                        </a>
                        <a href="../esqueceu-senha" aria-label="Recuperar senha">
                            Esqueceu a senha?
                        </a>
                    </div>

                    <button type="submit">Entrar</button>
                    
                    <div class="social-login">
                        <p>Ou entre com</p>
                        <div class="social-icons">
                            <a href="#" aria-label="Entrar com Google"><i class="fab fa-google"></i></a>
                        </div>
                    </div>
            </div>
        </div>
    </div>        
                </form>
            </div>
        </div>
    </div>
</main>
    <script src="login-usuario.js"></script>
</body>
</html>
// Validação básica com feedback visual
document.getElementById('loginForm').addEventListener('submit', function(e) {
    e.preventDefault();
    let isValid = true;
    
    // Validação de email
    const email = document.getElementById('email').value;
    const emailError = document.getElementById('email-error');
    if (!email || !email.includes('@') || !email.includes('.')) {
        emailError.textContent = 'Por favor, insira um email válido';
        emailError.style.display = 'block';
        isValid = false;
    } else {
        emailError.style.display = 'none';
    }
    
    // Validação de senha
    const password = document.getElementById('senha').value;
    const passwordError = document.getElementById('password-error');
    if (!password || password.length < 6) {
        passwordError.textContent = 'A senha deve ter pelo menos 6 caracteres';
        passwordError.style.display = 'block';
        isValid = false;
    } else {
        passwordError.style.display = 'none';
    }
    
    if (isValid) {
        // Simulação de login bem-sucedido
        this.classList.add('submitting');
        button = this.querySelector('button');
        button.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Entrando...';
        button.disabled = true;
        
        setTimeout(() => {
            alert('Login realizado com sucesso! Redirecionando...');
            this.reset();
            button.innerHTML = 'Entrar';
            button.disabled = false;
            this.classList.remove('submitting');
        }, 1500);
    }
});

// Efeito de foco nos campos
const inputs = document.querySelectorAll('input');
inputs.forEach(input => {
    input.addEventListener('focus', () => {
        input.parentElement.style.transform = 'scale(1.02)';
    });
    
    input.addEventListener('blur', () => {
        input.parentElement.style.transform = 'scale(1)';
    });
});
// Lista de DDDs válidos no Brasil (11-99, exceto alguns não utilizados)
const DDS_VALIDOS = [
    11, 12, 13, 14, 15, 16, 17, 18, 19, 
    21, 22, 24, 27, 28, 
    31, 32, 33, 34, 35, 37, 38, 
    41, 42, 43, 44, 45, 46, 47, 48, 49, 
    51, 53, 54, 55, 
    61, 62, 63, 64, 65, 66, 67, 68, 69, 
    71, 73, 74, 75, 77, 79, 
    81, 82, 83, 84, 85, 86, 87, 88, 89, 
    91, 92, 93, 94, 95, 96, 97, 98, 99
  ];

  document.getElementById('formCadastro').addEventListener('submit', function(e) {
    e.preventDefault();
    
    // Limpa mensagens de erro anteriores
    clearErrors();
    
    let isValid = true;
    
    // Validação do telefone
    const telefone = document.getElementById('telefone').value;
    if (telefone) {
      if (!validarTelefone(telefone)) {
        showError('telefone-error', 'Por favor, insira um telefone válido (ex: (00) 00000-0000)');
        isValid = false;
      } else {
        const ddd = parseInt(telefone.substring(1, 3));
        if (!validarDDD(ddd)) {
          showError('telefone-error', 'DDD inválido. Insira um código de área brasileiro válido.');
          isValid = false;
        }
      }
    }
    
    // Validação do email
    const email = document.getElementById('email').value;
    if (!validarEmail(email)) {
      showError('email-error', 'Por favor, insira um email válido (ex: exemplo@dominio.com)');
      isValid = false;
    }
    
    // Validação da senha
    const senha = document.getElementById('senha').value;
    const confirmar = document.getElementById('confirmar').value;
    
    // As mensagens de erro da senha agora são tratadas em tempo real com o 'input' event listener
    // Mas ainda precisamos verificar a igualdade no submit
    if (senha !== confirmar) {
      showError('senha-error', 'As senhas não coincidem');
      isValid = false;
    } else if (!validarSenha(senha)) { // Re-verifica a validação completa da senha no submit
        // Não mostra a mensagem genérica aqui, pois a validação em tempo real já a trata
        isValid = false;
    }
    
    if (isValid) {
      // Aqui você pode enviar o formulário ou fazer o que for necessário
      alert('Cadastro realizado com sucesso!');
      // this.submit(); // Descomente para enviar o formulário
    }
  });
  
  // Validação em tempo real para o telefone (formatação)
  document.getElementById('telefone').addEventListener('input', function(e) {
    const telefone = e.target.value.replace(/\D/g, ''); // Remove tudo que não é dígito
    let formatted = '';

    // Limita o número de dígitos para 11 (2 DDD + 9 números)
    const maxDigits = 11; 
    const telefoneNumericoLimitado = telefone.substring(0, maxDigits);

    if (telefoneNumericoLimitado.length > 0) {
      formatted = '(' + telefoneNumericoLimitado.substring(0, 2);
    }
    if (telefoneNumericoLimitado.length > 2) {
      // Diferencia 9 e 8 dígitos (celular e fixo)
      if (telefoneNumericoLimitado.length <= 10) { // Telefone com 8 dígitos (sem o 9 extra)
        formatted += ') ' + telefoneNumericoLimitado.substring(2, 6); 
      } else { // Telefone com 9 dígitos (com o 9 extra)
        formatted += ') ' + telefoneNumericoLimitado.substring(2, 7); 
      }
    }
    if (telefoneNumericoLimitado.length > 6) { // Considerando 7 dígitos após o DDD para o 9º dígito
      if (telefoneNumericoLimitado.length <= 10) { // Telefone com 8 dígitos (sem o 9 extra)
        formatted += '-' + telefoneNumericoLimitado.substring(6, 10);
      } else { // Telefone com 9 dígitos (com o 9 extra)
        formatted += '-' + telefoneNumericoLimitado.substring(7, 11);
      }
    }
    
    e.target.value = formatted;
    
    // Validação em tempo real do DDD
    if (telefoneNumericoLimitado.length >= 2) { // Use o telefoneNumericoLimitado para o DDD
      const ddd = parseInt(telefoneNumericoLimitado.substring(0, 2));
      if (!validarDDD(ddd)) {
        showError('telefone-error', 'DDD inválido. Insira um código de área brasileiro válido.');
      } else {
        clearError('telefone-error');
      }
    } else { // Limpa o erro do DDD se o campo for esvaziado
        clearError('telefone-error');
    }
  });

  // Validação em tempo real para o email
  document.getElementById('email').addEventListener('input', function(e) {
      if (!validarEmail(e.target.value) && e.target.value.length > 0) {
          showError('email-error', 'Por favor, insira um email válido (ex: exemplo@dominio.com)');
      } else {
          clearError('email-error');
      }
  });

  // Validação em tempo real para a senha e confirmação
  document.getElementById('senha').addEventListener('input', function(e) {
    const senha = e.target.value;
    const confirmar = document.getElementById('confirmar').value;
    const senhaErrorElement = document.getElementById('senha-error');
    
    let messages = [];

    const hasUpperCase = /[A-Z]/.test(senha);
    const hasLowerCase = /[a-z]/.test(senha);
    const hasNumber = /\d/.test(senha);
    
    // Feedback visual para os requisitos
    if (senha.length > 0) {
        if (!hasUpperCase) {
            messages.push('• Pelo menos uma letra maiúscula');
        }
        if (!hasLowerCase) {
            messages.push('• Pelo menos uma letra minúscula');
        }
        if (!hasNumber) {
            messages.push('• Pelo menos um número');
        }
    }

    if (messages.length > 0) {
        senhaErrorElement.innerHTML = messages.join('<br>');
        senhaErrorElement.style.display = 'block';
        document.getElementById('senha').style.border = '2px solid #ff4d4d';
        document.getElementById('senha').style.backgroundColor = '#fff0f0';
    } else {
        clearError('senha-error');
    }

    // Se a confirmação de senha já tiver algo digitado, revalida a correspondência
    if (confirmar.length > 0) {
        if (senha !== confirmar) {
            showError('senha-error', 'As senhas não coincidem');
        } else {
            // Só limpa se a validação de requisitos também estiver ok
            if (hasUpperCase && hasLowerCase && hasNumber) {
                clearError('senha-error');
            }
        }
    }
  });

  document.getElementById('confirmar').addEventListener('input', function(e) {
    const senha = document.getElementById('senha').value;
    const confirmar = e.target.value;
    
    if (confirmar.length > 0 && senha !== confirmar) {
      showError('senha-error', 'As senhas não coincidem');
    } else if (confirmar.length > 0 && validarSenha(senha)) { // Só limpa se a senha original for válida também
      clearError('senha-error');
    } else if (confirmar.length === 0) { // Limpa se o campo de confirmação for esvaziado
        clearError('senha-error');
    }
  });
  
  // Funções de validação
  function validarTelefone(telefone) {
    const regex = /^\(\d{2}\) \d{4,5}-\d{4}$/; // Aceita 8 ou 9 dígitos no meio (00) 0000-0000 ou (00) 00000-0000
    return regex.test(telefone);
  }
  
  function validarDDD(ddd) {
    return DDS_VALIDOS.includes(ddd);
  }
  
  function validarEmail(email) {
    const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return regex.test(email);
  }
  
  function validarSenha(senha) {
    const regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$/;
    return regex.test(senha);
  }
  
  // Funções auxiliares para exibir/limpar erros
  function showError(id, message) {
    const element = document.getElementById(id);
    element.innerHTML = message; // Use innerHTML para permitir tags HTML como <br>
    element.style.display = 'block';
    
    // Adiciona classe de erro ao campo correspondente
    const inputId = id.replace('-error', '');
    const input = document.getElementById(inputId);
    if (input) {
      input.style.border = '2px solid #ff4d4d';
      input.style.backgroundColor = '#fff0f0';
    }
  }
  
  function clearError(id) {
    const element = document.getElementById(id);
    element.textContent = '';
    element.style.display = 'none';
    
    // Remove estilos de erro do campo correspondente
    const inputId = id.replace('-error', '');
    const input = document.getElementById(inputId);
    if (input) {
      // Restaura a borda padrão e o fundo, ajuste conforme o seu CSS se for diferente
      input.style.border = '1px solid #ccc'; 
      input.style.backgroundColor = '#fff'; 
    }
  }
  
  function clearErrors() {
    const errors = document.querySelectorAll('.error-message');
    errors.forEach(error => {
      error.textContent = '';
      error.style.display = 'none';
    });
    
    // Remove estilos de erro de todos os inputs
    const inputs = document.querySelectorAll('input');
    inputs.forEach(input => {
      // Restaura a borda padrão e o fundo, ajuste conforme o seu CSS se for diferente
      input.style.border = '1px solid #ccc'; 
      input.style.backgroundColor = '#fff'; 
    });
  }
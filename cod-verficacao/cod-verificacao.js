const inputs = document.querySelectorAll('.codigo input');
const hiddenInput = document.getElementById('codigoFinal');

inputs.forEach((input, index) => {
  input.addEventListener('input', (e) => {
    const value = e.target.value.toUpperCase().replace(/[^A-Z0-9]/g, '');
    e.target.value = value;

    if (value && index < inputs.length - 1) {
      inputs[index + 1].focus();
    }
    atualizarCodigoFinal();
  });

  input.addEventListener('keydown', (e) => {
    if (e.key === 'Backspace' && e.target.value === '' && index > 0) {
      inputs[index - 1].focus();
    }
  });
});

function atualizarCodigoFinal() {
  const codigo = Array.from(inputs).map(input => input.value).join('');
  hiddenInput.value = codigo;
}

function enviarCodigo() {
  atualizarCodigoFinal();
  const codigo = hiddenInput.value;

  // PARA FAZER ENVIO PRA A API
  console.log("Enviando para a API:", codigo);
  // fetch('/api', { method: 'POST', body: JSON.stringify({ codigo }) });
}

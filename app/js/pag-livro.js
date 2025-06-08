document.addEventListener('DOMContentLoaded', () => {
    const botoesMostrarRespostas = document.querySelectorAll('.botao-mostrar-respostas');

    botoesMostrarRespostas.forEach(botao => {
        botao.addEventListener('click', () => {
            const respostasContainer = botao.nextElementSibling;
            if (respostasContainer && respostasContainer.classList.contains('resposta')) {
                respostasContainer.classList.toggle('escondida');
                botao.textContent = respostasContainer.classList.contains('escondida') ?
                    `Mostrar Respostas (${respostasContainer.querySelectorAll('.avaliacao').length})` :
                    `Esconder Respostas (${respostasContainer.querySelectorAll('.avaliacao').length})`;
            }
        });
    });
});
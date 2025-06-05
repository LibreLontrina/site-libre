//const { exists } = require("cropit");

document.addEventListener('DOMContentLoaded', function() //essa function é um prototipo doque será usado para a previsualização do perfil
{
    tela();
});


async function preVisuLogin()
{
    try
    {
        const fetchUrl = await fetch('/TESTE5/api/usuario/preVisuLogin', {
            method: 'POST',
            headers: { "Dispositivo" : "web" }
        });
        const resultado = await fetchUrl.json();    //O .json é oque faz funcionar, mas para
                                                    //teste .TEXT é melhor para ver os erros
        return resultado;
    }
    catch (E) //SignatureInvalidException
    {
        console.log('ERRO: ' + E);
    }
}

async function tela()
{
    try
    {
        const resultado = await preVisuLogin();

        const lblnome = document.getElementById("nome");
        const lblemail = document.getElementById("email");
        const btnLogout = document.getElementById("logout");

        //console.log(resultado['status']);
        //console.log(resultado);
        
        if(resultado['status'] === true)
        {
            console.log('Verificação feita com sucesso. Atualização de tela feita com sucesso');
            //console.log(resultado);
            
            const nome = resultado['dados']['nome'];
            const email = resultado['dados']['email'];
    
            lblnome.textContent = "Logado como: " + nome;
            lblemail.textContent = "Seu email é: " + email;
    
        }
        else if (resultado['status'] === false)
        {
            const texto = "você não está logado";
            lblnome.textContent = texto;
            lblemail.classList.add("invisible");
            btnLogout.classList.add("invisible");
        }
        else
        {
            const res = resultado['status'];
            console.log('Erro ao verificar o login do usuario:' + res);
            console.log(resultado);
        }
    
    }
    catch (E) //SignatureInvalidException
    {
        console.log('Erro: ' + E);
    }

}


const LinkscomLogin = document.querySelectorAll('a[data-login="true"]');
    LinkscomLogin.forEach(link => {

    link.addEventListener("click", async function(e) {
        e.preventDefault();

        const fetchUrl = await fetch('/TESTE5/api/comum/verifToken');
        const resp = await fetchUrl.json();

        if ('status' in resp && resp['status'] === false)
        {
            console.log("n tem statsi");
            window.location.href = "index.html";
        }
        else if ('status' in resp && resp['status'] === true)
        {
            console.log("tem status");
            window.location.href = link.href;
        }

    });
    
});

const btnLogout = document.getElementById("logout");
btnLogout.addEventListener("click", async () => {

    const logout = await fetch('/TESTE5/api/comum/logout');
    //console.log(logout['status']);
    window.location.reload();

});

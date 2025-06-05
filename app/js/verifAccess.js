addEventListener("DOMContentLoaded", async () => {

    verifAccess();
   
});

async function verifAccess() 
{
    const fetchUrl = await fetch('/TESTE5/api/comum/verifAccess', {
        method: "POST",
        headers: { "Dispositivo" : "web",
                    "Content-Type" : "application/json"
        }, //talvez eu precise do content Type mesmo, não vou esquecer se bugar
        body: JSON.stringify({
            url: window.location.pathname // ou outra string fixa de teste
        })
    });
    const resp = await fetchUrl.json(); //ou text

    //console.log(resp);

    if ('status' in resp && resp['status'] === false)
    {
        console.log("Sem acesso necessário");
        window.location.href = "index.html";
    }
    else if ('status' in resp && resp['status'] === true)
    {
        console.log("Acesso aceito");
    }







}
const forms = document.querySelectorAll("form[data-endpoint]");

forms.forEach(form => {
    form.addEventListener("submit", async function(e) {
        e.preventDefault();
        
        const endpoint = form.dataset.endpoint;
        const method = form.dataset.method || 'POST';
        const formdata = new FormData(form);
        
        let redirect = null;
        if(form.hasAttribute("data-redirect"))
        {
            redirect = form.dataset.redirect;
        }
        
        try {
            const fetchUrl = await fetch(`/TESTE5/api/${endpoint}`, {
                method: method,
                body: formdata,
                headers: {"Dispositivo" : "web"}
            });

            const resultado = await fetchUrl.json();
            
            if(resultado['status'] && resultado['status'] === true)
            {
                if (redirect !== null)
                {
                    window.location.href = redirect; //talvez precise mudar para pushstate pra react
                }
            }

            console.log(resultado);
            
        } 
        catch (error) 
        {
            console.error('ERRO: ', error);
        }
       
    });
});

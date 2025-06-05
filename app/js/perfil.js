const editar = document.getElementById("editar");
    const descricao = document.getElementById("descricao");

    //COMENTÁRIO
    editar.addEventListener("click", () =>{
            
        if(descricao.hasAttribute("disabled"))
        {
            descricao.removeAttribute("disabled");
            descricao.classList.add("abled");
            descricao.classList.add("btnEditar");
        }
        else
        {
            descricao.setAttribute("disabled", "true");
            descricao.classList.remove("abled");
            descricao.classList.remove("btnEditar");

        }
    });

    const foto = document.getElementById("fotoPerfil");
    const preVisuFoto = document.getElementById("preVisuFoto");

    //Para a parecer a pré visualização
    foto.addEventListener("click", () =>{
        preVisuFoto.classList.toggle("visible");
            
    });

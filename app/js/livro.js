addEventListener("DOMContentLoaded", async () => {
    await carregarLivro();

});

async function carregarLivro() 
{
    const params = new URLSearchParams(window.location.search);
    const id_livro = params.get("l");

    console.log(id_livro);

    const fetches = await fetch(`/TESTE5/api/livro/buscarDados?l=${id_livro}`,{
        method: 'GET',
        headers: {"Dispositivo" : "web"}
    });
    /*
    const fetchBook = await fetch(`https://www.googleapis.com/books/v1/volumes/${id_livro}`, {
        method: 'GET'
    });
    */
    const resposta = await fetches.json();
    colocarTela(resposta['dados']);


    console.log(resposta);

}

async function colocarTela(dados) 
{
    const imgCapa = document.getElementById("capa-livro");
    const Autor = document.getElementById("autor-livro");
    const Editora = document.getElementById("editora-livro");
    const DtaPuclic = document.getElementById("dtaPublic-livro");
    const Desc = document.getElementById("descricao");
    const Titulo = document.getElementById("titulo-livro");
    

    Titulo.innerHTML = dados.nome_livro;
    Desc.innerHTML = dados.descricao_livro;
    DtaPuclic.innerHTML = dados.data_livro;
    Editora.innerHTML = dados.editora_livro;
    Autor.innerHTML = dados.autor_livro;
    imgCapa.setAttribute("src", dados.capa_livro);

    // Titulo.innerHTML = dados.volumeInfo.title;
    // Desc.innerHTML = dados.volumeInfo.description;
    // DtaPuclic.innerHTML = dados.volumeInfo.publishedDate;
    // Editora.innerHTML = dados.volumeInfo.publisher;
    // Autor.innerHTML = dados.volumeInfo.authors;
    // imgCapa.setAttribute("src", dados.volumeInfo.imageLinks.large);



}
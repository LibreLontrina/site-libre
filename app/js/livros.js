addEventListener("DOMContentLoaded", async (e) => {

    const url = new URLSearchParams(window.location.search);
    if(!url.get("procura"))
    {
        buscar();
    }
    else
    {
        const procura = url.get("procura");
        buscar(procura);
    }

});

//const key = 'AIzaSyD4Tcze5e8jwtrIxJgBoOzEKlC-hcpXH3s';
const conteiner = document.getElementById("conteiner");
const barra = document.getElementById("barra");
const pesquisar = document.getElementById("pesquisar");
const cards = document.querySelectorAll(".card");

pesquisar.addEventListener("submit", async (e) => {
e.preventDefault();

    const input = barra.value ?? null;
    window.location.href = `?p=${input}`;
    //buscar(input);
});

async function buscar(input)
{
   
    if(input == null)
    {
        input = "Depois de você";
    }
    /*
    const response = await fetch(`https://www.googleapis.com/books/v1/volumes?q=${input}`, {
        method : 'GET'

    });*/
    const response = await fetch(`/TESTE5/api/livro/carroceuLivros?p=${input}`, {
        method : 'GET'

    });

    const resp = await response.json();
    console.log(resp);
    //const infoLivro = resp.volumeInfo;
    conteiner.innerHTML = "";
    for(i = 0; i < resp.items.length; i++)
    {
        livro = resp.items[i];

        titulo = livro.volumeInfo.title;
        autor = livro.volumeInfo.authors;
        id = livro.id;

        if(livro.volumeInfo.imageLinks)
        {
            capa = livro.volumeInfo.imageLinks.thumbnail ?? "";
        }
        else
        {
            capa = "";
        }

        dados = {
            'idBook' : id,
            'titulo' : titulo,
            'autor' : autor,
            'capa' : capa
        }

        await criarCards(dados);
    }
}

async function criarCards(dados)
{

    idBook = dados.idBook; 
    imgCapa = dados.capa;
    txtAuthor = dados.autor;
    txtTitle = dados.titulo;

    //CRIAÇÃO DO CARD
    const card = document.createElement("div");
    card.classList.add("card");
    card.setAttribute("id", "card");
    card.setAttribute("data-id-book-google",idBook);

    card.addEventListener("click", () => {
        const id = card.getAttribute("data-id-book-google"); 
        window.location.href = `livro.html?l=${id}`;
    });

    //CRIAÇÃO DO TITULO
    const title = document.createElement("span");
    title.classList.add("info_card");
    title.classList.add("titulo");
    title.setAttribute("id", "titulo");
    title.appendChild(document.createTextNode(txtTitle));

    //CRIAÇÃO DO AUTOR
    const author = document.createElement("span");
    author.classList.add("info_card");
    author.classList.add("autor");
    author.setAttribute("id", "autor");
    author.appendChild(document.createTextNode(txtAuthor));

    //CRIAÇÃO DA CAPA
    const capa = document.createElement("img");
    capa.setAttribute("id", "img");
    capa.setAttribute("src", imgCapa);

    //cartao.appendChild(textCard);
    card.appendChild(author);
    card.appendChild(title);
    card.appendChild(capa);

    conteiner.appendChild(card);
    console.log(card);



}
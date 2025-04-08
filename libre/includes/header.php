<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <title>Libre</title>
    <link rel="stylesheet" href="../assets/css/style.css">

</head>

<style>
@import url("https://fonts.googleapis.com/css2?family=Kalnia:wght@100..700&display=swap");
@import url("https://fonts.googleapis.com/css2?family=Kalnia:wght@100..700&family=Kanit:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap");

.fonte1 {
  /*usados atualmente por sobre e descubra*/
  font-family: "kanit", sans-serif;
  font-size: 18px;
  font-weight: 400;
}
.fonte2 {
  /*logo*/
  font-family: "kalnia", serif;
  font-size: 300%;
  font-weight: 700;
}
.fonte3 {
  /*footer*/
  font-family: "kalnia", serif;
  font-size: 300%;
  font-weight: 700;
  color: white;
}

a {
  color: black;
  text-decoration: none;
}
ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

body {
  border: 0px;
  margin: 0px;
  padding: 0px;

  background-color: rgb(255, 249, 240);
}

header {
  width: 100%;
  height: auto;

  /*border: 2px double yellowgreen;*/
  box-sizing: border-box;

  display: flex;
  flex-direction: column;
}

.header1 {
  z-index: 10;

  height: 85px;
  width: 100%;
  background-color: rgb(222, 195, 255);
  box-sizing: border-box;

  position: fixed;

  display: flex;
  justify-content: space-between;
  align-items: center;

  padding: 0px 30px;
}
.logo {
  flex: 0;
  background-color: rgb(241, 241, 241);

  height: 60px;
  width: 156.5px;
}
.outros {
  display: flex;
  flex: 0;

  box-sizing: border-box;

  height: 60px;

  gap: 12px;

  /*background-color: lightseagreen;*/

  justify-content: space-between;
  align-items: center;

  padding: 5px 15px 5px 15px;
}
.outroslayout {
  display: flex;
  flex: 0 1 auto;
}
.outroslayout:hover {
  color: white;
  transition: 0.2s;
}
.conta {
  display: flex;
  flex: 0 1 auto;

  width: 50px;
  height: 50px;

  margin-left: 15px;

  background-color: rgb(255, 255, 255);
  border-radius: 50px;
}

.navbar {
  height: auto;
  width: 700px;
  z-index: 11;

  display: flex;
  flex: 0;

  transform: translateY(120px);

  flex-direction: column;

  box-sizing: border-box;
  transition: 0.5s;
}
.navbar form {
  display: flex;
}

.navbar.fixed {
  transform: translateY(-0px);
  transition: 0.5s;
  width: 700px;
}
.navbar.fixed .barra {
  width: 700px;
  transition: 0.5s;
}
.navbar.fixed .barra:focus {
  transform: translateY(105px);
  transition: 0.5s;
}
.barra {
  flex-shrink: 0;
  height: 40px;
  width: 750px;
  box-sizing: border-box;

  border: none;
  border-top-left-radius: 30px;
  border-bottom-left-radius: 30px;

  padding-left: 15px;

  font-size: 18px;

  background-color: rgb(218, 218, 218);

  position: relative;
  z-index: 2;
  transition: 0.5s;

  box-shadow: 0px 2px 5px rgb(121, 121, 121);
}
.barra:focus {
  background-color: rgb(236, 236, 236);
  border-style: none;
  outline: none;

  box-shadow: 0px 2px 5px rgb(121, 121, 121);
}
.btnPesq {
  border: none;

  display: flex;
  justify-items: center;
  justify-content: space-around;
  align-items: center;

  border-top-right-radius: 30px;
  border-bottom-right-radius: 30px;

  /*padding: 0px 40px 0px 10px;*/
  box-sizing: border-box;

  background-color: rgb(184, 184, 184);

  box-shadow: 0px 2px 5px rgb(121, 121, 121);
  flex-shrink: 0;

  width: 50px;
  height: 40px;

  transition: 0.5s;
}
.btnPesq:hover {
  background-color: rgb(236, 236, 236);
  transition: 0.5s;
}
.btnPesq img {
  width: 22px;
}
.opcoes {
  position: absolute;
  z-index: 1;

  display: none;
  grid-template-columns: 1fr 3fr;
  grid-template-rows: 300px;
  grid-template-areas: "barralateral pesquisa";

  transform: translateY(50px);

  align-self: flex-start;

  border-radius: 20px;
  box-sizing: border-box;

  box-shadow: 2px 2px 10px rgb(121, 121, 121);

  height: 300px;
  width: 800px;

  background-color: white;
}
.opcoes.visible {
  display: grid;

  opacity: 1;
  visibility: visible;
}
.barralateral {
  /*background-color: rgb(54, 137, 221);*/
  box-sizing: border-box;
  margin-top: 10px;
  margin-bottom: 10px;

  padding: 10px 0px 10px 0px;
  padding-left: 30px;

  border-right: 1px solid rgb(80, 80, 80);
}
.listgen {
  list-style: none;
  padding: 0px 5px;
  margin-right: 10px;
}
.listgen li {
  margin: 15px 0px;
}
.listgen li span {
  font-family: "Kanit", sans-serif;
  font-weight: 300;
}

.listpes {
  margin-top: 16px;
  list-style: none;
  padding: 0px 10px 0px 10px;
}
.listpes span {
  font-family: "Kanit";
  font-weight: 300;
}
.listpes li {
  padding: 10px 0px 10px 0px;
}
.listpes li:hover {
  background-color: rgb(236, 236, 236);
}

.pesquisa {
  grid: pesquisa;
  box-sizing: border-box;
}
.itensopc {
  font-size: 18px;
  margin-bottom: 5px;
}

.preperfil {
  display: none;
  flex-direction: column;

  position: absolute;
  box-sizing: border-box;

  width: 240px;
  height: 320px;
  background-color: rgb(238, 238, 238);

  transform: translate(-79.2%, 50px);

  box-shadow: 0px 2px 5px rgb(121, 121, 121);

  z-index: 100;
}
.preperfil.visivel {
  display: flex;
}
.backperf {
  position: relative;
  background-color: rgb(134, 134, 134);
  width: 100%;
  height: 100px;
}
.fotoperf {
  display: flex;
  position: absolute;

  left: 135px;
  top: 50px;

  width: 90px;
  height: 90px;
  border-radius: 70px;
  background-color: rgb(114, 114, 114);
}
.linksperf {
  display: flex;
  flex-direction: column;

  box-sizing: border-box;

  height: 220px;
  width: 100%;

  padding-top: 20px;
  padding-left: 15px;
  padding-bottom: 15px;
  gap: 2px;

  justify-content: space-between;
}
.linksperf span {
  font-family: "kanit", sans-serif;
  font-size: 18px;
  font-weight: 300;
}

</style>

<script>
    const barra = document.querySelector('.barra');
const opcoes = document.querySelector('.opcoes');
const navbar = document.querySelector('.navbar');

barra.addEventListener('focus', focoBarra);
barra.addEventListener('blur', focoBarra);

function focoBarra(event){
    if(event.type === 'focus')
    {
        opcoes.classList.add('visible');
        navbar.classList.remove('fixed');
    }
    else if(event.type === 'blur')
    {
        if(window.scrollY > 50 )
        {
            opcoes.classList.remove('visible');
            navbar.classList.add('fixed');
        }
        else
        {
            opcoes.classList.remove('visible');
        }
        
    }

}



window.addEventListener('scroll', () =>{
    if (window.scrollY > 50 && !opcoes.classList.contains('visible')) {
        // Adiciona a classe "fixed" à barra de pesquisa
        navbar.classList.add('fixed');
    } else {
        // Remove a classe "fixed" quando voltar ao topo
        navbar.classList.remove('fixed');
    }
});

const preperfil = document.getElementById("preperfil");
const perfilbtn = document.getElementById("conta")

perfilbtn.addEventListener('mouseover', hoverperf)
perfilbtn.addEventListener('mouseout', hoverperf)

function hoverperf(event)
{
    if (event.type === 'mouseover' && !preperfil.classList.contains('visivel'))
    {
        preperfil.classList.add('visivel');
    }
    else if(event.type === 'mouseout' && preperfil.classList.contains('visivel'))
    {
        preperfil.classList.remove('visivel');
    }    
}


</script>
<body>
<header>
        <div class="header1"> <!--div header-->
            <div class="logo fonte2">LIBRE</div>

            <nav class="navbar"> <!--local da barra de pesquisa-->
                <form action="#" method="POST">
                    <input type="text" class="barra"> <!--Será que é Search??-->
                    <button class='btnPesq' type="submit">
                    <img src="img/loupe.png" alt="">
                    </button>
                </form>


                <div class="opcoes" name="opcoes" id="opcoes">
                    <div class="barralateral">
                        <span class="fonte1">GENEROS</span>
                        <ul class="listgen">
                            <li>
                                <a href="#">
                                    <span>
                                        genero
                                    </span>
                                </a>
                            </li>
    
                            <li>
                                <a href="#">
                                    <span>
                                        genero
                                    </span>
                                </a>
                            </li>
    
                            <li>
                                <a href="#">
                                    <span>
                                        genero
                                    </span>
                                </a>
                            </li>
    
                            <li>
                                <a href="#">
                                    <span>
                                        genero
                                    </span>
                                </a>
                            </li>
    
                            <li>
                                <a href="#">
                                    <span>
                                        genero
                                    </span>
                                </a>
                            </li>
    
                            <li>
                                <a href="#">
                                    <span>
                                        genero
                                    </span>
                                </a>
                            </li>
    
                        </ul>
    
                    </div>
                    <div class="pesquisa">
                        <ul class="listpes">
    
                            <a href="#">
                                <li>
                                    <span>
                                        Autopreenchimento 
                                    </span>
                                </li>
                            </a>
                            <a href="#">
                                <li>
                                    <span>
                                        Autopreenchimento 
                                    </span>
                                </li>
                            </a>
                            <a href="#">
                                <li>
                                    <span>
                                        Autopreenchimento 
                                    </span>
                                </li>
                            </a>
                            <a href="#">
                                <li>
                                    <span>
                                        Autopreenchimento 
                                    </span>
                                </li>
                            </a>
                            <a href="#">
                                <li>
                                    <span>
                                        Autopreenchimento 
                                    </span>
                                </li>
                            </a>
                            <a href="#">
                                <li>
                                    <span>
                                        Autopreenchimento 
                                    </span>
                                </li>
                            </a>
    
                        </ul>
                    </div>
    
                </div>
            </nav>

            <div class="outros">
                <div class="outroslayout fonte1">Descubra</div>
                <div class="outroslayout fonte1">Sobre</div>
                <div class="conta" id="conta">
                    <div class="preperfil" id="preperfil">
                        <div class="backperf">
                            
                        </div>
                        <div class="fotoperf"></div>
                        
                        <div class="linksperf">

                            <ul>
                                <li>
                                    <a href="">
                                        <span>
                                            Link1
                                        </span>
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <span>
                                            Link1
                                        </span>
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <span>
                                            Link1
                                        </span>
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <span>
                                            Link1
                                        </span>
                                    </a>
                                </li>
                            </ul>

                            <ul>
                                <li>
                                    <a href="">
                                        <span>
                                            Sair da conta
                                        </span>
                                    </a>
                                </li>
                            </ul>

                        </div>
                    </div>
                </div>

            </div>


        </div> <!--div header-->
    </header>

    <script src="js/java.js"></script>
    
</body>
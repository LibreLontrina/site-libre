<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Footer</title>
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Kalnia:wght@100..700&display=swap");
@import url("https://fonts.googleapis.com/css2?family=Kalnia:wght@100..700&family=Kanit:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap");


html,
body {
    height: 100%;
    margin: 0;
    padding: 0;
}

body {
     display: flex;
    flex-direction: column;
    min-height: 100vh; 
}

main {
    flex: 1;
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

.footer {
    background-color: rgb(107, 107, 107);
    display: flex;
    flex-direction: column;

    height: 100%;
    /* Precisa estar com a altura 100% para que 
    fique preso ao final da página */
    padding: 40px 50px;
}

#titulofooter {
    color: white;
}

.footer1 {
    display: flex;
    flex: 1 0 auto;

    justify-content: space-between;

    gap: 15px;
}

.links {
    display: flex;
    width: 600px;

    box-sizing: border-box;

    gap: 10px;
}

.sectfoot {
    display: flex;
    flex-direction: column;
    flex: 0 1 auto;

    width: 200px;

    box-sizing: border-box;
    padding: 30px 0px 0px 20px;

    font-family: "Kanit", sans-serif;
    font-weight: 300;
    color: white;
}

.sectfoot ul {
    list-style: none;
    padding: 0;

    margin-top: 10px;
}

.sectfoot a {
    color: white;
}

.sectfoot a:hover {
    text-decoration: underline;
}

.sectfoot span {
    font-weight: 400;
    font-size: 20px;
}

.redessociais {
    display: flex;

    width: 250px;

    flex-direction: column;

    padding-top: 30px;
}

.redessociais img {
    width: 40px;
}

.redessociais span {
    font-family: "Kanit";
    color: white;
    font-weight: 400;
    font-size: 20px;
}

.linksRedSoc {
    display: flex;
    margin-top: 10px;
    gap: 10px;
}

.instalar {
    display: flex;
    flex-direction: column;

    padding: 30px 20px 0px 0px;
}

.instalar img {
    height: 45px;
}

.instalar span {
    font-family: "Kanit";
    color: white;
    font-weight: 400;
    font-size: 20px;
}

.linksInst {
    margin-top: 10px;
    display: flex;
    flex-direction: column;
}

/* RESPONSIVO */
        @media (max-width: 768px) {
            .footer1 {
                flex-direction: column;
                gap: 30px;
            }

            .links {
                flex-direction: column;
                align-items: flex-start;
            }

            .sectfoot {
                width: 100%;
            }

            .redessociais, .instalar {
                width: 100%;
            }

            .linksRedSoc {
                justify-content: flex-start;
            }
        }

        @media (max-width: 480px) {
            .footer {
                padding: 30px 15px;
            }

            #titulofooter {
                font-size: 1.5rem;
            }

            .sectfoot span, .redessociais span, .instalar span {
                font-size: 16px;
            }

            .redessociais img, .linksRedSoc img {
                width: 25px;
            }

            .instalar img {
                height: 35px;
            }
        }
        </style>
</head>
<!-- Esse div é uma gambiarra para o footer poder ficar no final da página -->
<div>
    </div>
    <footer>
        <div class="footer">
            <label class="fonte2" id="titulofooter">LIBRE</label>
            <div class="footer1">
                
                <div class="links">
                    <section class="sectfoot">
                        <Span>Links</Span>
                        <ul>
                            <li><a href="#">Sobre</a></li>
                            <li><a href="#">Descubra</a></li>
                        </ul>
                    </section>
                    <section class="sectfoot">
                        <Span>Suporte ao Usuário</Span>
                        <ul>
                            <li><a href="#">Suporte</a></li>
                            <li><a href="#">Contato</a></li>
                            <li><a href="#">Fale conosco(Feedback)</a></li>
                        </ul>
                    </section>
                    <section class="sectfoot">
                        <Span>Outros recursos</Span>
                        <ul>
                            <li><a href="#">Termos de uso</a></li>
                            <li><a href="#">Politica de privacidade</a></li>
                        </ul>
                    </section>
                </div>
                
                <div class="redessociais">
                        <span>Redes Sociais</span>
                            <div class="linksRedSoc">
                                <a href="#">
                                    <img src="../images/instagram.svg" alt="">
                                </a>
                                <a href="#">
                                    <img src="../images/linkedin.svg" alt="">
                                </a>
                                <a href="#">
                                    <img src="../images/youtube.svg" alt="">
                                </a>
                                <a href="#">
                                    <img src="../images/x.svg" alt="">
                                </a>
                            </div>
                        
                        
                </div>

                <div class="instalar">
                    <span>Baixe o app</span>
                    <div class="linksInst">
                        <a href="#">
                            <img src="../images/GooglePlay.svg" alt="">
                        </a>
                        <a href="#">
                            <img src="../images/ApStore.svg" alt="">
                        </a>
                    </div>
                </div>
                
            </div>
        </div>
    </footer>
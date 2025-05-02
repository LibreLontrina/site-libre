import React from "react";
import "../home/home.css";
import Header from "../../components/header";
import Footer from "../../components/footer";

const Home = () => {
    return (
        <>
            <Header>
                <div className="header1">
                    <div className="logo fonte2">LIBRE</div>

                    <nav className="navbar">
                        <form action="#" method="POST">
                            <input type="text" className="barra" />
                            <button className="btnPesq" type="submit">
                                <img src="img/loupe.png" alt="" />
                            </button>
                        </form>

                        <div className="opcoes" name="opcoes" id="opcoes">
                            <div className="barralateral">
                                <span className="fonte1">GENEROS</span>
                                <ul className="listgen">
                                    <li>
                                        <a href="#">
                                            <span>genero</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <span>genero</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <span>genero</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <span>genero</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <span>genero</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <span>genero</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div className="pesquisa">
                                <ul className="listpes">
                                    <a href="#">
                                        <li>
                                            <span>Autopreenchimento</span>
                                        </li>
                                    </a>
                                    <a href="#">
                                        <li>
                                            <span>Autopreenchimento</span>
                                        </li>
                                    </a>
                                    <a href="#">
                                        <li>
                                            <span>Autopreenchimento</span>
                                        </li>
                                    </a>
                                    <a href="#">
                                        <li>
                                            <span>Autopreenchimento</span>
                                        </li>
                                    </a>
                                    <a href="#">
                                        <li>
                                            <span>Autopreenchimento</span>
                                        </li>
                                    </a>
                                    <a href="#">
                                        <li>
                                            <span>Autopreenchimento</span>
                                        </li>
                                    </a>
                                </ul>
                            </div>
                        </div>
                    </nav>

                    <div className="outros">
                        <div className="outroslayout fonte1">Descubra</div>
                        <div className="outroslayout fonte1">Sobre</div>
                        <div className="conta" id="conta">
                            <div className="preperfil" id="preperfil">
                                <div className="backperf"></div>
                                <div className="fotoperf"></div>

                                <div className="linksperf">
                                    <ul>
                                        <li>
                                            <a href="php/login.php">
                                                <span>Login</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                <span>Link1</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                <span>Link1</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="">
                                                <span>Link1</span>
                                            </a>
                                        </li>
                                    </ul>

                                    <ul>
                                        <li>
                                            <a href="">
                                                <span>Sair da conta</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </Header>

            <main>
                <div className="container">
                    <div className="box">
                        <h1>LIBRE</h1>
                        <p>Sua mais nova plataforma virtual focada em leitura e escrita.</p>
                        <h2>Leia. Avalie. Comente.</h2>
                    </div>
                    <div className="box">
                        <p>
                            Sinta-se livre para explorar.
                            <br />
                            Leia um livro, veja avaliações,
                            <br />
                            coloque um comentário e brilhe!
                        </p>
                        <br />
                        <p>
                            Conheça os nossos livros:
                            <a href="./php/catalogo.php">Teste***</a>
                        </p>
                    </div>
                    <div className="box">
                        <p>
                            Baixe o <strong>LIBRE</strong> no seu dispositivo móvel!
                            <br />
                            Leia mais e comente de onde quiser!
                            <br />
                            Disponível para dispositivos iOS e Android.
                        </p>
                    </div>
                </div>
            </main>

            <Footer>
                <div className="footer">
                    <label className="fonte2" id="titulofooter">
                        LIBRE
                    </label>
                    <div className="footer1">
                        <div className="links">
                            <section className="sectfoot">
                                <span>Links</span>
                                <ul>
                                    <li>
                                        <a href="#">Sobre</a>
                                    </li>
                                    <li>
                                        <a href="#">Descubra</a>
                                    </li>
                                </ul>
                            </section>
                            <section className="sectfoot">
                                <span>Suporte ao Usuário</span>
                                <ul>
                                    <li>
                                        <a href="#">Suporte</a>
                                    </li>
                                    <li>
                                        <a href="#">Contato</a>
                                    </li>
                                    <li>
                                        <a href="#">Fale conosco(Feedback)</a>
                                    </li>
                                </ul>
                            </section>
                            <section className="sectfoot">
                                <span>Outros recursos</span>
                                <ul>
                                    <li>
                                        <a href="#">Termos de uso</a>
                                    </li>
                                    <li>
                                        <a href="#">Politica de privacidade</a>
                                    </li>
                                </ul>
                            </section>
                        </div>

                        <div className="redessociais">
                            <span>Redes Sociais</span>
                            <div className="linksRedSoc">
                                <a href="#">
                                    <img src="img/instagram.svg" alt="" />
                                </a>
                                <a href="#">
                                    <img src="img/linkedin.svg" alt="" />
                                </a>
                                <a href="#">
                                    <img src="img/youtube.svg" alt="" />
                                </a>
                                <a href="#">
                                    <img src="img/x.svg" alt="" />
                                </a>
                            </div>
                        </div>

                        <div className="instalar">
                            <span>Baixe o app</span>
                            <div className="linksInst">
                                <a href="#">
                                    <img src="img/GooglePlay.svg" alt="" />
                                </a>
                                <a href="#">
                                    <img src="img/ApStore.svg" alt="" />
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </Footer>
        </>
    );
};

export default Home;
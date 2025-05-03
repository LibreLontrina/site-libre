import React from "react";
import "../home/home.css";
import Header from "../../components/header";
import Footer from "../../components/footer";

const Home = () => {
    return (
        <>
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
        </>
    );
}

export default Home;
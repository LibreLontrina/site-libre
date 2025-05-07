import livros from "../livros"
import { Links } from "react-router-dom";
import LinkHome from "./link/LinkHome";
const home = () => {

    const links = [
        {
            link: "/livros",
            text: "livros"
        }
    ];
    return (
        <main>
        <div className="Home">
        <br />
            <div className="box">
                <h1>LIBRE</h1>
                <br />
                <p>Sua mais nova plataforma virtual focada em leitura e escrita.</p>
                <h2>Leia. Avalie. Comente.
                </h2>
            </div>
            <br />
            <div className="box">
                <p>Sinta-se livre para explorar. <br /></p>
                Leia um livro, veja avaliações,<br />
                <p>coloque um comentário e brilhe!</p>
                <br />
                <p>
                Conheça os nossos:  <LinkHome link="/livros" text="Livros" /> 
                </p>
            </div>
            <br />
            <div className="box">
                <p>Baixe o <strong>LIBRE</strong> no seu dispositivo móvel!<br />
                Leia mais e comente de onde quiser!<br />
                Disponível para dispositivos iOS e Android.</p>
            </div> 
        </div>
</main>
    );
}

export default home;
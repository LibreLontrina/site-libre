// importa o hook de navegação, usado para navegar entre as páginas
import { useNavigate } from "react-router-dom";
import "./header.css";
import loupeIcon from "../../assets/img/loupe.png"; // importa o ícone da lupa
import LinkHeader from "./link/LinkHeader";
// importa hooks do React
// useState: permite adicionar estado a um componente funcional
// useEffect: permite executar efeitos colaterais em componentes funcionais
// useRef: permite criar referências mutáveis que persistem entre renderizações
import { useState, useEffect, useRef } from "react";

//array de objetos que contém os links e textos para o cabeçalho
// cada objeto representa um link com um caminho e um texto
const links = [
  {
    link: "/",
    text: "Home"
  },
  /*
  {
    link: "/catalogo",
    text: "Catálogo"
  },
  { 
    link: "/livros",
    text: "Livros"
  },
  */
  {
    link: "/sobre",
    text: "Sobre"
  },
  /*
  {
    link: "/login", 
    text: "Login"
  },
  */
];  

// componente Header
export function Header() {
  const navigate = useNavigate();
  //controle de navegação
  const [showOptions, setShowOptions] = useState(false);
  // fixa a barra de navegação quando o usuário rola a página
  const [fixed, setFixed] = useState(false);
  // controle de exibição do perfil
  const [showProfile, setShowProfile] = useState(false);
  // referência para o campo de pesquisa
  // useRef é usado para acessar diretamente o DOM, permitindo manipulações diretas
  const barraRef = useRef();

  useEffect(() => {
    const handleScroll = () => {
      if (window.scrollY > 50 && !showOptions) {
        setFixed(true);
      } else {
        setFixed(false);
      }
    };

    window.addEventListener("scroll", handleScroll);
    return () => window.removeEventListener("scroll", handleScroll);
  }, [showOptions]);

  return (
    <header>
      <div className="header1">

        <button onClick={() => navigate("/")}>
        <div className="logo fonte2">LIBRE</div>
        </button>
        

        <nav className={`navbar ${fixed ? "fixed" : ""}`}>
          <form onSubmit={(e) => e.preventDefault()}>
            <input
              ref={barraRef}
              type="text"
              className="barra"
              onFocus={() => setShowOptions(true)}
              onBlur={() => {
                if (window.scrollY > 50) setFixed(true);
                setShowOptions(false);
              }}
            />
            <button className="btnPesq" type="submit">
              <img src={loupeIcon} alt="Buscar" />
            </button>
          </form>

          <div className={`opcoes ${showOptions ? "visible" : ""}`} id="opcoes">
            <div className="barralateral">
              <span className="fonte1">GENEROS</span>
              <ul className="listgen">
                {/* Adicione os gêneros aqui */}
              </ul>
            </div>
            <div className="pesquisa">
              <ul className="listpes">
                {/* Resultados da pesquisa */}
              </ul>
            </div>
          </div>
        </nav>

        <div className="outros">
          <LinkHeader link="/sobre" text="Sobre" />
          <LinkHeader link="/descubra" text="Descubra" />
          
          
          <div
            className="conta"
            onMouseEnter={() => setShowProfile(true)}
            onMouseLeave={() => setShowProfile(false)}
          >
            <div className={`preperfil ${showProfile ? "visivel" : ""}`}>
              <div className="backperf"></div>
              <div className="fotoperf"></div>

              <div className="linksperf">
                <ul>
                  <li><a href="#"><span>Faça seu login</span></a></li>
                  <li><a href="#"><span>Link2</span></a></li>
                  <li><a href="#"><span>Link3</span></a></li>
                  <li><a href="#"><span>Link4</span></a></li>
                </ul>
                <ul>
                  <li><a href="#"><span>Sair da conta</span></a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </header>
  );
};

export default Header;

import React, { useState, useEffect, useRef } from "react";
import "../header/header.css";
import loupe from "../../assets/img/loupe.png";

const Header = () => {
  const [showOptions, setShowOptions] = useState(false);
  const [fixed, setFixed] = useState(false);
  const [showProfile, setShowProfile] = useState(false);
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
        <div className="logo fonte2">LIBRE</div>

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
              <img src={loupe} alt="Buscar" />
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
          <div className="outroslayout fonte1">Descubra</div>
          <div className="outroslayout fonte1">Sobre</div>

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
                  <li><a href="#"><span>Link1</span></a></li>
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



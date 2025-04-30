import React from "react";
import "./../assets/css/Sobre.css"
const Sobre = () => {
  return (
    <main>
        <div className="Sobre">
    {/* Seção 1: Topo com ícone + título "Sobre" */}
    <section className="sobreTopo">
        
        <div className="boxSobreContainer">
        <div className="boxSobreFundo"></div>
        <div className="boxSobreIcon boxMenor"></div>
        </div>
      

      <div className="boxSobreTexto">
        <h1>O que é Libre</h1>
        <p>
          O Libre é um projeto focado em compartilhar o amor pelos livros,
          proporcionando um ambiente interativo, acessível e colaborativo para
          leitores de todas as idades.
        </p>
      </div>
    </section>

    {/* Seção 2: Propósito */}
    <section className="sobreSection">
      <div className="textoSobre">
        <h1>Qual nosso propósito</h1>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla
          facilisi. Integer vehicula, nisl nec bibendum convallis, sapien
          purus tincidunt velit, vel hendrerit nisl metus nec libero.
          Suspendisse potenti. Aenean sed risus nec arcu tempor convallis.
          Donec suscipit, augue id luctus tincidunt, metus odio feugiat
          tortor, non suscipit lectus eros a libero.
        </p>
      </div>

      <div className="boxSobreContainer">
        <div className="boxSobreFundo"></div>
        <div className="boxSobreIcon boxMenor"></div>
      </div>
    </section>

    {/* Seção 3: Conteúdo extra */}
    <section className="conteudoExtra">
      <h2>Mais sobre nós</h2>
      <p>
        Esta seção pode ser usada para descrever os valores, missão ou visão
        do projeto Libre. Você também pode adicionar imagens, ícones ou links
        aqui para enriquecer a experiência do usuário.
      </p>
    </section>
    </div>
  </main>

  );
};

export default Sobre;



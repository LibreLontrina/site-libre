import React from "react";
import CardSobre from "./../../components/card-sobre";
import lontra from "./../../assets/img/favicon-16x16.png";
import "./sobre.css";


export default function Sobre() {
    return (
      <div className="sobre sction">

        <CardSobre
          imagem={lontra}
          title="O que é o Libre?"
          backgroundIcon={true}
          invertido={false}
          embaixo={false}
          description="O Libre é um projeto focado em compartilhar o amor pelos livros, proporcionando um ambiente interativo, acessível e colaborativo para leitores de todas as idades."
        />
        <CardSobre
          imagem={lontra}
          title="Qual nosso propósito?"
          backgroundIcon={true}
          invertido={true}
          embaixo={false}
          description="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla facilisi. Integer vehicula, nisl nec bibendum convallis, sapien purus tincidunt velit, vel hendrerit nisl metus nec libero. Suspendisse potenti. Aenean sed risus nec arcu tempor convallis. Donec suscipit, augue id luctus tincidunt, metus odio feugiat tortor, non suscipit lectus eros a libero."
        />
        <CardSobre
          imagem={lontra}
          title="Mais sobre nós"
          backgroundIcon={true}
          invertido={false}
          embaixo={true}
          description="Esta seção pode ser usada para descrever os valores, missão ou visão do projeto Libre. Você também pode adicionar imagens, ícones ou links aqui para enriquecer a experiência do usuário."
        />
      </div>
 
    );
}


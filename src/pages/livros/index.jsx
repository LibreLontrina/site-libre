import React from "react";
import CarouselLivros from "./../../components/carousel-livros";

export default function Livros() {
  return (
    <div className="livros section">
      <div className="livrosContainer">
        <h1>Livros</h1>
        <p>Explore nossa coleção de livros e descubra novas histórias!</p>

        <div className="livrosCarousel">
          <CarouselLivros title="Livros mais lidos" />
          <CarouselLivros title="Livros Recentes" />
          <CarouselLivros title="Livros Populares" />
        </div>
      </div>
    </div>
  );
}

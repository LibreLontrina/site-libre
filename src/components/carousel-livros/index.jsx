import { useRef, useState, useEffect } from "react";
import "./carousel-livros.css";

export default function CarouselLivros({ title }) {
    const carouselRef = useRef(null);
    const [livros, setLivros] = useState([]);

    // Buscando os livros da API (descomente quando a API estiver disponível)
    useEffect(() => {
        fetch("http://localhost/api/livros")
            .then((res) => res.json())
            .then((data) => setLivros(data))
            .catch((err) => console.error("Erro ao buscar livros:", err));
    }, []);

    const scroll = (direction) => {
        if (!carouselRef.current) return;
        const scrollAmount = direction === "left" ? -200 : 200;
        carouselRef.current.scrollBy({ left: scrollAmount, behavior: "smooth" });
    };

    return (
        <div className="carousel-container">
            <div className="carousel-header">
                <h2>{title}</h2>
                <a href="#">Ver mais</a>
            </div>

            <div className="carousel-wrapper">
                <button className="arrow left" onClick={() => scroll("left")}>
                    &#10094;
                </button>

                <div className="carousel" ref={carouselRef}>
                    {livros.map((livro) => (
                        <div className="card" key={livro.id}>
                            <img className="livro-capa" src={livro.imagem} alt={livro.titulo} />
                            <p className="livro-titulo">{livro.titulo}</p>
                            <p className="livro-avaliacao">{livro.avaliacoes} ★</p>
                        </div>
                    ))}
                </div>

                <button className="arrow right" onClick={() => scroll("right")}>
                    &#10095;
                </button>
            </div>
        </div>
    );
}

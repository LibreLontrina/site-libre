import "./card-sobre.css";

export default function CardSobre({ imagem, title, backgroundIcon, invertido, embaixo, description }) {
  return (
    <>
      {!embaixo ? (
        <section className={invertido ? "sobreSection invertido" : "sobreTopo"}>
          {!invertido && (
            <div className="boxSobreContainer">
              <div className="boxSobreFundo"></div>
              <div className={`boxSobreIcon ${backgroundIcon ? "boxMenor" : ""}`}>
                {imagem && <img src={imagem} alt="ícone" style={{ width: "100%", height: "100%", objectFit: "cover" }} />}
              </div>
            </div>
          )}

          <div className={invertido ? "textoSobre" : "boxSobreTexto"}>
            <h1>{title}</h1>
            <p>{description}</p>
          </div>

          {invertido && (
            <div className="boxSobreContainer">
              <div className="boxSobreFundo"></div>
              <div className={`boxSobreIcon ${backgroundIcon ? "boxMenor" : ""}`}>
                {imagem && <img src={imagem} alt="ícone" style={{ width: "100%", height: "100%", objectFit: "cover" }} />}
              </div>
            </div>
          )}
        </section>
      ) : (
        <section className="conteudoExtra">
          <h2>{title}</h2>
          <p>{description}</p>
        </section>
      )}
    </>
  );
}

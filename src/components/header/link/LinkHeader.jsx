/*Esse Link importa um componente da biblioteca react-router-dom 
 ela é usada para navegar entre as pag, sem carregar o site, usado principalmente em spa ;)*/
import { Link } from 'react-router-dom';
/*Importa a estilização do link*/
import './link.css';

/*Criação e exportação de uma função
Função do componente react*/
/*Essa função é responsável por criar um link que leva a uma página específica.
Ele recebe dois parâmetros: link e text. O parâmetro link é o caminho para a página que o link deve levar, enquanto o parâmetro text é o texto que será exibido no link.*/
export default function LinkHeader({ link, text }) {
  return (
    //Cria um Link (ao invés de <a>, usamos <Link> para navegação sem recarregar)
    //"to" é o caminho para a página que o link deve levar, enquanto "text" é o texto que será exibido no link.
    //O componente Link é importado da biblioteca react-router-dom, que é usada para navegação em aplicativos React.
    <Link to={link} className="link">
      {text}
    </Link>
  );
}
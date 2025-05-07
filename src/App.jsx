import { Route, Routes } from 'react-router-dom';
import { Header } from './components/header/Header';
import { Footer } from './components/footer/footer';
import Home from './pages/home';
import Descubra from './pages/Descubra';
import Sobre from './pages/sobre';
import Livros  from './pages/livros';
import './App.css';

function App() {
  return (
    <>
      <Header id="header" />
      <div id="page-container">
        <main id="main">
          <div id="content-wrap">
            <Routes>
              <Route path="/" element={<Home />} />
              <Route path="/Descubra" element={<Descubra />} />
              <Route path="/Sobre" element={<Sobre />} />
              <Route path="/Livros" element={<Livros />} />
            </Routes>
          </div>
        </main>
      </div >
      <Footer id="footer" />
    </>
  );
}

export default App;


import { Route, Routes } from 'react-router-dom';
import { Header } from './components/header/Header';
import { Footer } from './components/footer/footer';
import Home from './pages/Home';
import Descubra from './pages/Descubra';
import Sobre from './pages/Sobre';
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
            </Routes>
          </div>
        </main>
      </div >
      <Footer id="footer" />
    </>
  );
}

export default App;


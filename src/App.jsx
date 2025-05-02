import { useState } from 'react'
import Home from "../src/pages/home";
import Header from './components/header'
import Footer from "./components/footer";
import './App.css'

function App() {
  const [count, setCount] = useState()

  return (
    <>
      <Header />
      <Home />
      <Footer />
    </>
  )
}

export default App

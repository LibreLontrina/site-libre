<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>LIBRE</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Kanit:wght@400;500&family=Kalnia:wght@700&display=swap');
    
    :root {
      --cor-primaria:rgb(190, 155, 234);
      --cor-secundaria: #f1f1f1;
      --cor-texto: #333;
      --cor-hover: rgba(0, 0, 0, 0.1);
      --cor-borda: #ccc;
      --cor-destaque: #8a2be2;
      --sombra: 0 4px 6px rgba(0, 0, 0, 0.1);
      --sombra-pesquisa: 0 2px 10px rgba(0, 0, 0, 0.1);
      --borda-arredondada: 8px;
      --transicao: all 0.3s ease;
    }
    
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    
    a {
      text-decoration: none;
      color: inherit;
      font-family: 'Kanit', sans-serif;
      transition: var(--transicao);
    }
    
    header {
      font-family: 'Kanit', sans-serif;
      background-color: var(--cor-primaria);
      padding: 0.8rem 1rem;
      position: sticky;
      top: 0;
      z-index: 1000;
      box-shadow: var(--sombra);
    }
    
    .container {
      display: flex;
      justify-content: space-between;
      align-items: center;
      max-width: 1200px;
      margin: 0 auto;
      gap: 1rem;
    }
    
    .logo-container {
      display: flex;
      align-items: center;
      gap: 0.5rem;
      flex-shrink: 0;
    }
    
    .logo-img {
      height: 40px;
      width: auto;
      transition: var(--transicao);
    }
    
    .logo-container:hover .logo-img {
      transform: rotate(-10deg);
    }
    
    .logo-text {
      font-family: 'Kalnia', serif;
      font-size: 1.8rem;
      font-weight: 700;
      color: #ffff;
      letter-spacing: -0.5px;
    }
    
    /* Barra de Pesquisa */
    .search-container {
      flex-grow: 1;
      max-width: 500px;
      position: relative;
      margin: 0 1rem;
    }
    
    .search-bar {
      width: 100%;
      padding: 0.6rem 1rem;
      padding-right: 2.5rem;
      border: 1px solid var(--cor-borda);
      border-radius: 50px;
      font-family: 'Kanit', sans-serif;
      font-size: 0.95rem;
      transition: var(--transicao);
      background-color: white;
    }
    
    .search-bar:focus {
      outline: none;
      border-color: var(--cor-destaque);
      box-shadow: 0 0 0 2px rgba(138, 43, 226, 0.2);
    }
    
    .search-button {
      position: absolute;
      right: 0.8rem;
      top: 50%;
      transform: translateY(-50%);
      background: none;
      border: none;
      cursor: pointer;
      color: var(--cor-texto);
      opacity: 0.7;
      transition: var(--transicao);
    }
    
    .search-button:hover {
      opacity: 1;
      color: var(--cor-destaque);
    }
    
    /* Resultados da Pesquisa */
    .search-results {
      position: absolute;
      top: 100%;
      left: 0;
      width: 100%;
      background: white;
      border-radius: var(--borda-arredondada);
      box-shadow: var(--sombra-pesquisa);
      margin-top: 0.5rem;
      max-height: 300px;
      overflow-y: auto;
      display: none;
      z-index: 1001;
    }
    
    .search-results.active {
      display: block;
      animation: fadeIn 0.2s ease;
    }
    
    .search-result-item {
      padding: 0.8rem 1rem;
      border-bottom: 1px solid var(--cor-secundaria);
      cursor: pointer;
      transition: var(--transicao);
    }
    
    .search-result-item:hover {
      background-color: var(--cor-hover);
    }
    
    .search-result-item:last-child {
      border-bottom: none;
    }
    
    .nav-links {
      display: flex;
      align-items: center;
      gap: 1.5rem;
    }
    
    .nav-links a {
      font-size: 1rem;
      padding: 0.5rem 0.75rem;
      transition: var(--transicao);
      border-radius: var(--borda-arredondada);
      font-weight: 500;
      white-space: nowrap;
      position: relative;
    }
    
    .nav-links a::after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 50%;
      width: 0;
      height: 2px;
      background-color: var(--cor-texto);
      transition: var(--transicao);
      transform: translateX(-50%);
    }
    
    .nav-links a:hover::after {
      width: 70%;
    }
    
    .profile-section {
      display: flex;
      align-items: center;
      gap: 1.5rem;
      position: relative;
    }
    
    .profile-pic {
      width: 40px;
      height: 40px;
      border-radius: 50%;
      object-fit: cover;
      border: 2px solid var(--cor-secundaria);
      transition: var(--transicao);
      cursor: pointer;
    }
    
    .profile-pic:hover {
      transform: scale(1.1);
      box-shadow: var(--sombra);
    }
    
    .profile-menu {
      position: absolute;
      right: 0;
      top: 60px;
      background-color: white;
      border: 1px solid var(--cor-borda);
      border-radius: var(--borda-arredondada);
      padding: 1.5rem;
      display: none;
      box-shadow: var(--sombra);
      min-width: 220px;
      z-index: 1001;
    }
    
    .profile-menu.ativo {
      display: block;
      animation: fadeIn 0.3s ease;
    }
    
    .profile-menu-content {
      display: flex;
      flex-direction: column;
      gap: 1.5rem;
    }
    
    .profile-menu-content ul {
      list-style: none;
      padding: 0;
      margin: 0;
      display: flex;
      flex-direction: column;
      gap: 0.75rem;
    }
    
    .profile-menu-content li a {
      display: block;
      padding: 0.5rem 0;
      border-radius: 4px;
      padding-left: 0.5rem;
      font-weight: 500;
    }
    
    .profile-menu-content li a:hover {
      background-color: var(--cor-hover);
      padding-left: 1rem;
    }
    
    .profile-menu-pic {
      width: 60px;
      height: 60px;
      border-radius: 50%;
      border: 2px solid var(--cor-borda);
      object-fit: cover;
      margin: 0 auto;
      display: block;
    }
    
    .profile-menu-name {
      text-align: center;
      font-weight: 500;
      margin-top: 0.5rem;
    }
    
    /* Menu Hamburger */
    .hamburger-menu {
      display: none;
      flex-direction: column;
      justify-content: space-between;
      width: 30px;
      height: 21px;
      cursor: pointer;
      position: relative;
      z-index: 1002;
    }
    
    .hamburger-menu span {
      display: block;
      height: 3px;
      width: 100%;
      background-color: var(--cor-texto);
      border-radius: 3px;
      transition: var(--transicao);
    }
    
    .hamburger-menu.ativo span:nth-child(1) {
      transform: translateY(9px) rotate(45deg);
    }
    
    .hamburger-menu.ativo span:nth-child(2) {
      opacity: 0;
    }
    
    .hamburger-menu.ativo span:nth-child(3) {
      transform: translateY(-9px) rotate(-45deg);
    }
    
    /* Mobile Menu */
    .mobile-nav {
      position: fixed;
      top: 0;
      right: -100%;
      width: 280px;
      height: 100vh;
      background-color: white;
      box-shadow: -5px 0 15px rgba(0, 0, 0, 0.1);
      transition: var(--transicao);
      z-index: 1001;
      padding: 5rem 1.5rem;
      overflow-y: auto;
    }
    
    .mobile-nav.ativo {
      right: 0;
    }
    
    .mobile-nav ul {
      list-style: none;
      display: flex;
      flex-direction: column;
      gap: 1rem;
    }
    
    .mobile-nav li a {
      display: block;
      padding: 0.75rem;
      border-radius: var(--borda-arredondada);
      font-size: 1.1rem;
      font-weight: 500;
    }
    
    .mobile-nav li a:hover {
      background-color: var(--cor-hover);
    }
    
    .mobile-profile-info {
      display: flex;
      align-items: center;
      gap: 1rem;
      margin-bottom: 2rem;
      padding-bottom: 1rem;
      border-bottom: 1px solid var(--cor-borda);
    }
    
    .mobile-profile-pic {
      width: 50px;
      height: 50px;
      border-radius: 50%;
      object-fit: cover;
    }
    
    .mobile-profile-name {
      font-weight: 500;
    }
    
    .mobile-search {
      margin-bottom: 1.5rem;
      position: relative;
    }
    
    .mobile-search input {
      width: 100%;
      padding: 0.7rem 1rem;
      border: 1px solid var(--cor-borda);
      border-radius: 50px;
      font-family: 'Kanit', sans-serif;
    }
    
    .mobile-search button {
      position: absolute;
      right: 0.8rem;
      top: 50%;
      transform: translateY(-50%);
      background: none;
      border: none;
      cursor: pointer;
    }
    
    .overlay {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.5);
      z-index: 1000;
      display: none;
    }
    
    .overlay.ativo {
      display: block;
    }
    
    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(-10px); }
      to { opacity: 1; transform: translateY(0); }
    }
    
    /* Responsividade */
    @media (max-width: 1024px) {
      .nav-links {
        display: none;
      }
      
      .hamburger-menu {
        display: flex;
      }
      
      .profile-section {
        margin-left: auto;
      }
    }
    
    @media (max-width: 768px) {
      .search-container {
        display: none;
      }
      
      .mobile-search {
        display: block;
      }
    }
    
    @media (min-width: 769px) {
      .mobile-search {
        display: none;
      }
    }
    
    @media (max-width: 480px) {
      .logo-text {
        font-size: 1.5rem;
      }
      
      .logo-img {
        height: 30px;
      }
      
      .mobile-nav {
        width: 85%;
      }
      
      .container {
        gap: 0.5rem;
      }
    }
  </style>
</head>
<body>
  <header>
    <div class="container">
      <div class="logo-container">
        <a href="../home"><img src="../images/logo-libre-certa.png" alt="Logo LIBRE" class="logo-img" /></a>
        <a href="../home"><span class="logo-text">LIBRE</span></a>
      </div>
      
      <div class="search-container">
        <input type="text" class="search-bar" placeholder="Pesquisar livros, autores..." id="search-input">
        <button class="search-button" id="search-button">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
          </svg>
        </button>
        <div class="search-results" id="search-results">
          <!-- Resultados serão inseridos aqui via JavaScript -->
        </div>
      </div>
      
      <nav class="nav-links">
        <a href="../descubra">Descubra</a>
      </nav>
      
      <div class="profile-section">
        <img src="../images/login.jpg" alt="Foto do perfil" class="profile-pic" id="profile-pic" />
        <div class="profile-menu" id="profile-menu">
          <div class="profile-menu-content">
            <img src="../images/login.jpg" alt="Foto do perfil" class="profile-menu-pic" />
            <div class="profile-menu-name">Usuário</div>
            <ul>
              <li><a href="../perfil-usuario">Perfil</a></li>
              <li><a href="#">Favoritos</a></li>
              <li><a href="../login-usuario">Login</a></li>
              <li><a href="../cadastro-usuario">Cadastro</a></li>
              <li><a href="#">Sair da conta</a></li>
            </ul>
          </div>
        </div>
        
        <button class="hamburger-menu" id="hamburger-menu" aria-label="Abrir menu de navegação">
          <span></span>
          <span></span>
          <span></span>
        </button>
      </div>
    </div>
  </header>
  
  <!-- Menu Mobile -->
  <div class="overlay" id="overlay"></div>
  <nav class="mobile-nav" id="mobile-nav">
    <div class="mobile-profile-info">
      <img src="../images/login.jpg" alt="Foto do perfil" class="mobile-profile-pic" />
      <div class="mobile-profile-name">Usuário</div>
    </div>
    
    <div class="mobile-search">
      <input type="text" placeholder="Pesquisar livros..." id="mobile-search-input">
      <button class="search-button" id="mobile-search-button">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
          <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
        </svg>
      </button>
    </div>
    
    <ul>
      <li><a href="../descubra">Descubra</a></li>
      <li><a href="../perfil-usuario">Perfil</a></li>
      <li><a href="#">Favoritos</a></li>
      <li><a href="../login-usuario">Login</a></li>
      <li><a href="../cadastro-usuario">Cadastro</a></li>
      <li><a href="#">Sair da conta</a></li>
    </ul>
  </nav>
  
  <script>
    // Menu de perfil
    const profilePic = document.getElementById('profile-pic');
    const profileMenu = document.getElementById('profile-menu');
    
    profilePic.addEventListener('click', function(e) {
      e.stopPropagation();
      profileMenu.classList.toggle('ativo');
    });
    
    // Fechar menu de perfil ao clicar fora
    document.addEventListener('click', function(event) {
      if (!profilePic.contains(event.target) && !profileMenu.contains(event.target)) {
        profileMenu.classList.remove('ativo');
      }
    });
    
    // Menu hamburger
    const hamburgerMenu = document.getElementById('hamburger-menu');
    const mobileNav = document.getElementById('mobile-nav');
    const overlay = document.getElementById('overlay');
    
    hamburgerMenu.addEventListener('click', function() {
      this.classList.toggle('ativo');
      mobileNav.classList.toggle('ativo');
      overlay.classList.toggle('ativo');
      document.body.style.overflow = mobileNav.classList.contains('ativo') ? 'hidden' : '';
      
      // Fechar menu de perfil se estiver aberto
      profileMenu.classList.remove('ativo');
    });
    
    // Fechar menu mobile ao clicar no overlay
    overlay.addEventListener('click', function() {
      hamburgerMenu.classList.remove('ativo');
      mobileNav.classList.remove('ativo');
      this.classList.remove('ativo');
      document.body.style.overflow = '';
    });
    
    // Fechar menu mobile ao clicar em um link
    mobileNav.querySelectorAll('a').forEach(link => {
      link.addEventListener('click', function() {
        hamburgerMenu.classList.remove('ativo');
        mobileNav.classList.remove('ativo');
        overlay.classList.remove('ativo');
        document.body.style.overflow = '';
      });
    });
    
    // Barra de pesquisa - funcionalidade básica
    const searchInput = document.getElementById('search-input');
    const searchButton = document.getElementById('search-button');
    const searchResults = document.getElementById('search-results');
    const mobileSearchInput = document.getElementById('mobile-search-input');
    
    // Dados de exemplo para a pesquisa (substitua por dados reais)
    const sampleBooks = [
      { title: "Dom Casmurro", author: "Machado de Assis", link: "#" },
      { title: "O Cortiço", author: "Aluísio Azevedo", link: "#" },
      { title: "Memórias Póstumas de Brás Cubas", author: "Machado de Assis", link: "#" },
      { title: "Iracema", author: "José de Alencar", link: "#" },
      { title: "Vidas Secas", author: "Graciliano Ramos", link: "#" }
    ];
    
    function performSearch(query) {
      if (query.length < 2) {
        searchResults.classList.remove('active');
        return;
      }
      
      const filteredBooks = sampleBooks.filter(book => 
        book.title.toLowerCase().includes(query.toLowerCase()) || 
        book.author.toLowerCase().includes(query.toLowerCase())
      );
      
      displayResults(filteredBooks);
    }
    
    function displayResults(results) {
      searchResults.innerHTML = '';
      
      if (results.length === 0) {
        searchResults.innerHTML = '<div class="search-result-item">Nenhum resultado encontrado</div>';
      } else {
        results.forEach(book => {
          const item = document.createElement('div');
          item.className = 'search-result-item';
          item.innerHTML = `
            <strong>${book.title}</strong>
            <div style="font-size: 0.8rem; color: #666;">${book.author}</div>
          `;
          item.addEventListener('click', () => {
            window.location.href = book.link;
          });
          searchResults.appendChild(item);
        });
      }
      
      searchResults.classList.add('active');
    }
    
    searchInput.addEventListener('input', (e) => {
      performSearch(e.target.value);
    });
    
    searchButton.addEventListener('click', () => {
      if (searchInput.value.trim()) {
        // Aqui você pode implementar a ação de pesquisa completa
        alert(`Pesquisando por: ${searchInput.value}`);
      }
    });
    
    searchInput.addEventListener('focus', () => {
      if (searchInput.value.length >= 2) {
        searchResults.classList.add('active');
      }
    });
    
    document.addEventListener('click', (e) => {
      if (!searchInput.contains(e.target) && !searchResults.contains(e.target)) {
        searchResults.classList.remove('active');
      }
    });
    
    // Funcionalidade similar para a versão mobile
    mobileSearchInput.addEventListener('input', (e) => {
      // Implementação similar para mobile se necessário
    });
    
    document.getElementById('mobile-search-button').addEventListener('click', () => {
      if (mobileSearchInput.value.trim()) {
        alert(`Pesquisando por: ${mobileSearchInput.value}`);
      }
    });
  </script>
</body>
</html>
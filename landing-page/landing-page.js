document.addEventListener('DOMContentLoaded', function() {
    setTimeout(function() {
      document.querySelector('.box1').classList.add('show');
      document.querySelector('.logo-posicao').classList.add('show');
    }, 300);
    
    // Observador de interseção para o efeito de scroll
    const fadeSections = document.querySelectorAll('.fade-section');
    
    const observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.classList.add('show');
        }
      });
    }, {
      threshold: 0.1
    });
    
    fadeSections.forEach(section => {
      observer.observe(section);
    });
  });
  
  // Efeito de fade suave ao rolar a página
  window.addEventListener('scroll', function() {
    const scrollPosition = window.scrollY;
    const box1 = document.querySelector('.box1');
    const logo = document.querySelector('.logo-posicao');
    
    // Ajusta a opacidade dos elementos fixos conforme o scroll
    if (box1 && logo) {
      const opacity = 1 - (scrollPosition / 300);
      box1.style.opacity = Math.max(opacity, 0);
      logo.style.opacity = Math.max(opacity, 0);
    }
  });
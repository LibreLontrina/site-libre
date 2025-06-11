//Carrossel botões direita e esquerda.

document.addEventListener('DOMContentLoaded', () => {
  const wrappers = document.querySelectorAll('.carousel-wrapper');

  wrappers.forEach(wrapper => {
    const track = wrapper.querySelector('.carousel-track');
    const btnLeft = wrapper.querySelector('.carousel-button.left');
    const btnRight = wrapper.querySelector('.carousel-button.right');
    const scrollAmount = 400;

    const updateButtons = () => {
      const maxScroll = track.scrollWidth - track.clientWidth;
      btnLeft.disabled = track.scrollLeft <= 0;
      btnRight.disabled = track.scrollLeft >= maxScroll - 1;
    };

    btnLeft.addEventListener('click', () => {
      track.scrollBy({ left: -scrollAmount, behavior: 'smooth' });
    });

    btnRight.addEventListener('click', () => {
      track.scrollBy({ left: scrollAmount, behavior: 'smooth' });
    });

    track.addEventListener('scroll', updateButtons);
    window.addEventListener('resize', updateButtons);
    updateButtons();
  });
});


//Carrosel menu.

document.querySelectorAll('.menu-button').forEach(button => 
  {
  button.addEventListener('click', function(e) 
  {
    e.stopPropagation();
    const menu = this.nextElementSibling;
    
    document.querySelectorAll('.menu-options').forEach(opt => 
      {
      if (opt !== menu) opt.style.display = 'none';
    });
    
    menu.style.display = menu.style.display === 'block' ? 'none' : 'block';
  });
});


document.addEventListener('click', function() {
  document.querySelectorAll('.menu-options').forEach(menu => {
    menu.style.display = 'none';
  });
});
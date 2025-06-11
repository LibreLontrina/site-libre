<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Libre</title>
  <?php include "../header/header.php" ?>
  <style>
    body {
      margin: 0;
      font-family: 'Kanit', sans-serif;
      background-color: #f9f9f9;
    }

    .titulo-card1 {
      font-family: 'Kalnia', serif;
      color: rgb(190, 155, 234);
      font-size: 50px;
    }

    .titulo-card2 {
      font-family: 'Kalnia', serif;
      color: #2b134b;
      font-size: 40px;
    }
 
    .button-home {
      background-color: #2b134b;
      color:white;
      border-radius: 20px;
      border:none;
      padding: 15px;
      font-size: 20px;
      cursor: pointer;
    }

    .titulo-card3 {
      font-family: 'Kalnia', serif;
      color: #2b134b;
      font-size: 40px;
    }

    .box1,
    .box2 {
      width: 100%;
      max-width: 750px;
      background: white;
      border-radius: 30px;
      box-shadow: 0 4px 6px rgba(0.5, 0.5, 0.5, 0.3);
      padding: 20px;
      text-align: center;
      margin: 40px auto;
    }

    .box2 {
      background-color: #DF8DE3;
      color: white;
    }

    .inicio-cards {
  display: flex;
  flex-direction: column;
  gap: 40px;
  padding: 40px 20px;
}

.inicio-card {
  display: flex;
  align-items: center;
  gap: 30px;
  max-width: 1000px;
  margin: 0 auto;
  flex-wrap: wrap;
}

.inicio-card.invertido {
  flex-direction: row-reverse;
}

.card1-img {
  flex: 1;
  max-width: 300px;
  border-radius: 25px;
  box-shadow: 0 4px 8px rgba(0,0,0,0.2);
}

.card2-img {
  flex: 1;
  max-width: 250px;
  border-radius: 25px;
  padding: 20px 20px 20px 20px;
  box-shadow: 0 4px 8px rgba(0,0,0,0.2);
}

.card3-img {
  flex: 1;
  max-width: 300px;
  border-radius: 25px;
  box-shadow: 0 4px 8px rgba(0,0,0,0.2);
}

.card-texto {
  flex: 2;
  font-family: 'Kanit', sans-serif;
  font-size: 1.1rem;
  color: #333;
}

    .logo-posiçao {
      height: 300px;
      display: block;
      margin: 20px auto;
    }

    .card-container {
      display: flex;
      flex-wrap: wrap;
      gap: 20px;
      justify-content: center;
      padding: 40px 20px;
    }

    .card {
      background-color: white;
      width: 300px;
      border-radius: 20px;
      padding: 20px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
      text-align: center;
    }

    .card h3 {
      margin-top: 0;
      color: #D495E3;
    }

    .card p {
      color: #555;
    }

    @media (max-width: 768px) {
      .titulo-card1 {
        font-size: 36px;
      }
      .titulo-card2 {
        font-size: 20px;
      }

      .card {
        width: 90%;
      }

      .logo-posiçao {
        height: 200px;
      }
    }
    @media (max-width: 768px) {
  .inicio-card {
    flex-direction: column;
    text-align: center;
  }

  .inicio-card.invertido {
    flex-direction: column;
  }

  .card-img {
    max-width: 100%;
  }
}
  </style>
</head>
<body>
  <main>
    <div class="Home">
      <section class="fade-section inicio-cards">

  <div class="inicio-card">
    <img src="../images/logo-libre-certa.png" alt="Lontra roxa, logo do site Libre" class="card1-img">
    <div class="card-texto">
      <h2 class="titulo-card1">LIBRE</h2>
      <p>É uma plataforma virtual focada em leitura e escrita.</p>
      <p><strong>Leia. Avalie. Comente.</strong></p>
    </div>
  </div>

  <div class="inicio-card invertido">
    <div class="card-texto">
      <h2 class="titulo-card2">Sinta-se livre para explorar.</h2>
      <p>Escolha um livro, faça avaliações, coloque na estante e leia!</p>
      <br><br>
     <a href="../home" class="button-home">Me leve até os livros!</a>
    </div>
    <img src="../images/observacao.png" alt="Ilustração 2" class="card2-img">
  </div>

  <div class="inicio-card">
    <img src="../images/aplicativo-movel.png" alt="Ilustração 3" class="card3-img">
    <div class="card-texto">
      <h3 class="titulo-card3">Baixe o <strong>LIBRE</strong> no seu dispositivo móvel!</h3>
      <p>Leia, avalie e comente de onde quiser!</p>
      <p>Disponível para Android e iOS.</p>
    </div>
  </div>
</section>
      <section class="fade-section">
        <div class="box2">
          <p>Bem-vindo à Libre! Conecte-se com outros leitores e compartilhe suas histórias.</p>
        </div>
      </section>

      <section class="fade-section card-container">
        <!-- Card original -->
        <div class="card">
          <h3>Fantasia</h3>
          <p>Explore mundos mágicos, criaturas incríveis e aventuras épicas.</p>
        </div>
        <!-- Novos cards -->
        <div class="card">
          <h3>Romance</h3>
          <p>Emocione-se com histórias de amor, encontros e desencontros.</p>
        </div>
        <div class="card">
          <h3>Terror</h3>
          <p>Arrepie-se com contos sombrios e mistérios que tiram o sono.</p>
        </div>
        <div class="card">
          <h3>Ficção Científica</h3>
          <p>Viaje pelo espaço, descubra tecnologias e o futuro da humanidade.</p>
        </div>
        <div class="card">
          <h3>Biografias</h3>
          <p>Conheça a trajetória de grandes nomes da história e da atualidade.</p>
        </div>
        <div class="card">
          <h3>Infantil</h3>
          <p>Livros educativos e divertidos para os pequenos leitores.</p>
        </div>
      </section>
    </div>
  </main>

  <script src="landing-page.js"></script>
</body>
<?php include "../footer/footer.php" ?>
</html>

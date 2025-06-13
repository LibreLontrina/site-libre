-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 12/06/2025 às 20:51
-- Versão do servidor: 9.1.0
-- Versão do PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `amizades`
--

DROP TABLE IF EXISTS `amizades`;
CREATE TABLE IF NOT EXISTS `amizades` (
  `id_amizade` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_perfil` int NOT NULL,
  `data_amizade` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status_amizade` enum('pendente','aceita','bloqueada') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_amizade`),
  UNIQUE KEY `unq_amizade` (`id_usuario`,`id_perfil`),
  KEY `FK_20` (`id_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `avaliacoes`
--

DROP TABLE IF EXISTS `avaliacoes`;
CREATE TABLE IF NOT EXISTS `avaliacoes` (
  `id_avaliacao` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_livro` int NOT NULL,
  `data_avaliacao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nota_avaliacao` int NOT NULL,
  `descricao_avaliacao` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `like_avaliacao` int NOT NULL DEFAULT '0',
  `deslike_avaliacao` int NOT NULL DEFAULT '0',
  `util_avaliacao` int NOT NULL DEFAULT '0',
  `nao_util_avaliacao` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_avaliacao`),
  KEY `FK_11` (`id_usuario`),
  KEY `FK_12` (`id_livro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `codigos_verificacao`
--

DROP TABLE IF EXISTS `codigos_verificacao`;
CREATE TABLE IF NOT EXISTS `codigos_verificacao` (
  `id_codigo` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `codigo` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `tipo_codigo` enum('verif_email','esqueci_senha') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_codigo`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
CREATE TABLE IF NOT EXISTS `comentarios` (
  `id_comentario` int NOT NULL AUTO_INCREMENT,
  `id_post` int NOT NULL,
  `id_perfil` int NOT NULL,
  `data_comentario` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `descricao_comentario` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `like_comentario` int NOT NULL DEFAULT '0',
  `deslike_comentario` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_comentario`),
  KEY `FK_5` (`id_post`),
  KEY `FK_6` (`id_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `comentario_avaliacoes`
--

DROP TABLE IF EXISTS `comentario_avaliacoes`;
CREATE TABLE IF NOT EXISTS `comentario_avaliacoes` (
  `id_coment_avalia` int NOT NULL AUTO_INCREMENT,
  `id_avaliacao` int NOT NULL,
  `id_usuario` int NOT NULL,
  `descricao_coment_avalia` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `like_coment_avalia` int NOT NULL DEFAULT '0',
  `deslike_coment_avalia` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_coment_avalia`),
  KEY `FK_21` (`id_avaliacao`),
  KEY `FK_22` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `comentario_comentarios`
--

DROP TABLE IF EXISTS `comentario_comentarios`;
CREATE TABLE IF NOT EXISTS `comentario_comentarios` (
  `id_coment_coment` int NOT NULL AUTO_INCREMENT,
  `id_comentario` int DEFAULT NULL,
  `id_perfil` int DEFAULT NULL,
  `descricao_coment_coment` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_coment_coment` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `like_coment_coment` int NOT NULL DEFAULT '0',
  `deslike_coment_coment` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_coment_coment`),
  KEY `FK_13` (`id_comentario`),
  KEY `FK_14` (`id_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `favoritos`
--

DROP TABLE IF EXISTS `favoritos`;
CREATE TABLE IF NOT EXISTS `favoritos` (
  `id_favorito` int NOT NULL AUTO_INCREMENT,
  `id_vitrine` int DEFAULT NULL,
  `id_livro` int DEFAULT NULL,
  `id_perfil` int NOT NULL,
  `data_favorito` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_favorito`),
  KEY `FK_9` (`id_livro`),
  KEY `FK_9_1` (`id_vitrine`),
  KEY `FK_10` (`id_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `generos`
--

DROP TABLE IF EXISTS `generos`;
CREATE TABLE IF NOT EXISTS `generos` (
  `id_genero` int NOT NULL AUTO_INCREMENT,
  `genero` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_genero`),
  UNIQUE KEY `genero` (`genero`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `generos`
--

INSERT INTO `generos` (`id_genero`, `genero`) VALUES
(8, 'Action & adventure'),
(7, 'Dystopian'),
(11, 'Epic'),
(10, 'Fantasia'),
(1, 'Ficção'),
(5, 'Filosofia'),
(3, 'Geral'),
(15, 'Greek & roman'),
(9, 'Horror'),
(6, 'Juvenile fiction'),
(14, 'Legends, myths, fables'),
(12, 'Love & romance'),
(16, 'Mystery & detective'),
(4, 'Romance'),
(13, 'Short stories'),
(2, 'Young adult fiction');

-- --------------------------------------------------------

--
-- Estrutura para tabela `likes`
--

DROP TABLE IF EXISTS `likes`;
CREATE TABLE IF NOT EXISTS `likes` (
  `id_perfil` int DEFAULT NULL,
  `id_livro` int DEFAULT NULL,
  `id_vitrine` int DEFAULT NULL,
  KEY `FK_23` (`id_perfil`),
  KEY `FK_24` (`id_livro`),
  KEY `FK_25` (`id_vitrine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `livros`
--

DROP TABLE IF EXISTS `livros`;
CREATE TABLE IF NOT EXISTS `livros` (
  `id_livro` int NOT NULL AUTO_INCREMENT,
  `nome_livro` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `autor_livro` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_livro` date DEFAULT NULL,
  `data_cadastro_livro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `descricao_livro` text COLLATE utf8mb4_unicode_ci,
  `caminho_livro` longblob,
  `ISBN_livro` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `favoritos_livro` int NOT NULL DEFAULT '0',
  `like_livro` int NOT NULL DEFAULT '0',
  `deslike_livro` int NOT NULL DEFAULT '0',
  `id_google_book` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `editora_livro` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capa_livro` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_livro`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `livros`
--

INSERT INTO `livros` (`id_livro`, `nome_livro`, `autor_livro`, `data_livro`, `data_cadastro_livro`, `descricao_livro`, `caminho_livro`, `ISBN_livro`, `favoritos_livro`, `like_livro`, `deslike_livro`, `id_google_book`, `editora_livro`, `capa_livro`) VALUES
(2, 'Teste', 'Eu', '2000-02-20', '2025-06-11 18:37:07', 'sla', NULL, '1234567891234', 0, 0, 0, 'abdc1234', '', NULL),
(3, 'Como eu era antes de você', 'Jojo Moyes', '2013-04-19', '2025-06-11 18:49:59', 'Aos 26 anos, Louisa Clark não tem muitas ambições. Ela mora com os pais, a irmã mãe solteira, o sobrinho pequeno e um avô que precisa de cuidados constantes desde que sofreu um derrame. Trabalha como garçonete num café, um emprego que não paga muito, mas ajuda nas despesas, e namora Patrick, um triatleta que não parece interessado nela. Não que ela se importe.Quando o café fecha as portas, Lou é obrigada a procurar outro emprego. Sem muitas qualificações, consegue trabalho como cuidadora de um tetraplégico. Will Traynor, de 35 anos, é inteligente, rico e mal-humorado. Preso a uma cadeira de rodas depois de um acidente de moto, o antes ativo e esportivo Will desconta toda a sua amargura em quem estiver por perto. Tudo parece pequeno e sem graça para ele, que sabe exatamente como dar um fim a esse sentimento. O que Will não sabe é que Lou está prestes a trazer cor a sua vida. E nenhum dos dois desconfia de que irá mudar para sempre a história um do outro.Como eu era antes de você é uma história de amor e uma história de família, mas acima de tudo é uma história sobre a coragem e o esforço necessários para retomar a vida quando tudo parece acabado.“Incrivelmente comovente.” Marie Claire (Reino Unido)“Uma leitura extremamente envolvente e maravilhosamente romântica.” Daily Telegraph“Um livro impossível de largar.” USA Today“Como eu era antes de você é uma história sobre amor, aprendizado e perda. Um livro extraordinário.” Daily Mail“Uma história sobre como o amor é capaz de florescer nas situações mais improváveis.” Elle, Reino Unido“Em sua essência, um livro sobre duas pessoas que aprendem a ouvir uma a outra.” Independent on Sunday“Uma história de amor improvável. Um livro para ser devorado entre lágrimas.” O, The Oprah MagazineBEST-SELLER VEJA', NULL, '9788580573268', 0, 0, 0, '3wohEJsBaI0C', 'Editora Intrinseca', NULL),
(4, 'Ainda sou eu', 'Jojo Moyes', '2018-02-05', '2025-06-11 19:23:47', 'Sequência dos romances Como eu era antes de você e Depois de você, que arrebataram o coração de milhares de fãs, Ainda sou eu conta, pela perspectiva delicada e bem-humorada de Lou Clark, uma história comovente sobre escolhas, lealdade e esperança.Lou Clark chega em Nova York pronta para recomeçar a vida, confiante de que pode abraçar novas aventuras e manter seu relacionamento a distância. Ela é jogada no mundo dos super-ricos Gopnik — Leonard e a esposa bem mais nova, e um sem-fim de empregados e puxa-sacos. Lou está determinada a extrair o máximo dessa experiência, por isso se lança no trabalho e, antes que perceba, está inserida na alta sociedade nova-iorquina, onde conhece Joshua Ryan, um homem que traz consigo um sopro do passado de Lou.Enquanto tenta manter os dois lados de seu mundo unidos, ela tem que guardar segredos que não são seus e que podem mudar totalmente sua vida. E, quando a situação atinge um ponto crítico, ela precisa se perguntar: Quem é Louisa Clark? E como é possível reconciliar um coração dividido?Sequência dos romances Como eu era antes de você e Depois de você, que arrebataram o coração de milhares de fãs, Ainda sou eu conta, pela perspectiva delicada e bem-humorada de Lou Clark, uma história comovente sobre escolhas, lealdade e esperança.', NULL, '9788551002827', 0, 0, 0, 'ytFCDwAAQBAJ', 'Editora Intrinseca', 'http://books.google.com/books/publisher/content?id=ytFCDwAAQBAJ&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE71MKSK7o5sYkFXJ6mg_wMwjWsIWGyBcxPVnYVq0JQyDVPbnaeTDT6fumpWWqLqv12kT0g1blv7f-hcV_-F9iEDvqNTh0qodkQmnMCZesCv2Kd3PJEtDoWoNZwBqU-JxoilTDtgU&s'),
(5, 'A Loja dos Sonhos', 'Jojo Moyes', '2021-11-29', '2025-06-11 19:44:27', 'Inédito no Brasil, terceiro livro publicado por Jojo Moyes, A loja dos sonhos, trata de família e recomeços em meio a cafés, segredos e amigosAthene Forster abraçou a década de 1960 como poucos. Uma das jovens mais glamourosas de sua geração, era uma garota mimada e sem controle. Quando ela concorda em se casar, seus pais enfim respiram aliviados. Dois anos depois do casamento, contudo, os boatos de uma traição começaram a circular.Trinta e cinco anos depois, Suzanna Peacock percebe que ainda tem dificuldades para se desvencilhar das famigeradas histórias da mãe. Ao retornar a Dere Hampton, sua cidade natal, o único lugar onde encontra paz é em sua loja: uma mistura de cafeteria e brechó que vende de tudo um pouco, desde bijuterias de segunda mão a um expresso decente. Lá ela faz amigos de verdade pela primeira vez, entre eles Jessie, uma jovem curiosa e muito criativa, e Alejandro, um argentino solitário que trabalha no hospital local e compartilha com Suzanna o gosto por um bom café e um histórico familiar complicado.Mas, apesar dos esforços de Suzanna, o fantasma de Athene ainda a persegue. E só ao enfrentar tanto a família quanto seus medos ela será capaz de se reconciliar com o passado e encontrar a chave para sua própria história.', NULL, '9786555603361', 0, 0, 0, '_jRKEAAAQBAJ', 'Editora Intrinseca', 'http://books.google.com/books/publisher/content?id=_jRKEAAAQBAJ&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE72A-7OJQUy_EJcbc0VCRnOManBxu9YVScjEpX37DCflg-iYx-nst-T3JkuTZGiuL0rsSMjTIDOx4Eiyc78TeSy6WDH4kifjZaVIMOTrmucLjRdLFFhI3uQ4nwIufOkTClA1h4jz&s'),
(6, 'Harry Potter e a Câmara Secreta', 'J.K. Rowling', '2015-12-08', '2025-06-11 19:46:12', 'Há uma trama, Harry Potter. Uma trama para fazer coisas terríveis acontecerem na Escola de Magia e Bruxaria de Hogwarts este ano.\'O verão de Harry Potter incluiu o pior aniversário de todos, avisos macabros de um elfo doméstico chamado Dobby, e ser resgatado dos Dursleys por seu amigo Rony Weasley em um carro voador mágico! De volta à Escola de Magia e Bruxaria de Hogwarts para seu segundo ano, Harry ouve estranhos sussurros ecoando pelos corredores vazios - e então, os ataques começam! Estudantes são encontrados transformados em pedra... As previsões sinistras de Dobby parecem estar se tornando realidade.', NULL, '9781781103692', 0, 0, 0, 'hjcQCwAAQBAJ', 'Pottermore Publishing', 'http://books.google.com/books/publisher/content?id=hjcQCwAAQBAJ&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE72eNcj500wbV-ktzcKE3xFACFz3oJLASHoMVFgH4rc7xOmBZ9qFBuoIRitISMA3YCz0fxWNcAvFNL0toiShoSjYJCxN5BFwEHDHIK0HavdsHg4ju5oKM9O1mG2_7mYgl87JkSjc&s'),
(7, 'Os seguidores', 'Sara Shepard', '2022-01-28', '2025-06-11 19:46:49', 'Quando Helena Kelly desapareceu, Seneca Frazier, uma jovem envolvida em um site dedicado a buscar pistas para casos não solucionados, decidiu que iria até o fundo daquele mistério. E ela conseguiu... ou era o que achava. Conforme surgem revelações surpreendentes sobre o grupo de detetives amadores que a auxiliou naquela investigação, de repente Seneca começa a questionar tudo. E quando uma garota que poderia ser irmã gêmea de Helena desaparece, Seneca tem certeza: entre os milhares de seguidores que Chelsea tem nas redes sociais, existe um que tem planos mais sombrios para a influencer.  \"Era o dia perfeito para uma festa...\"  Até Chelsea Dawson, de vinte e um anos, desaparecer. A influencer foi vista pela última vez se divertindo em uma festa de verão no litoral de Nova Jersey com os amigos. Mas, depois de uma briga feia com o ex-namorado, ela some sem deixar vestígios. Quando Seneca, Maddox, Aerin e Madison recebem uma pista sobre esse suposto sequestro, eles percebem um detalhe sobre a vítima: ela é muito parecida com irmã de Aerin, Helena, morta cinco anos antes. Seneca está convencida de que sabe quem a matou e não consegue se livrar da sensação de que a mesma pessoa está envolvida no desaparecimento de Chelsea. Desesperada por respostas sobre as duas garotas e em busca da verdade por trás da morte de sua mãe, Seneca não vai parar até descobrir se os casos estão interligados. Depois que Maddox recebe um convite para uma visita ao litoral de ninguém menos que seu principal suspeito, o grupo de investigadores amadores começa uma nova e intensa perseguição. Cheio de segredos surpreendentes, reviravoltas e revelações comprometedoras, o segundo livro da série Os amadores, da autora bestseller do New York Times Sara Shepard, segue o rastro de um assassino brilhante e das pistas que inevitavelmente são deixadas quando alguém tem tantos seguidores. \"Os amadores é Sara Shepard em seu melhor: assustador, romântico e cheio de surpresas.\" – Cecily von Ziegesar, autora de Gossip Girl    \"Vida longa à rainha dos segredos! Os amadores é um thriller sombrio e sinistro para preencher o vazio que Pretty Little Liars  deixou no meu coração!\" – Danielle Paige, autora de Dorothy tem que morrer   \"Os amadores faz você querer entrar em uma aventura com Sara Shepard. Ela consegue juntar pessoas, situações e encontrar mistério na vida cotidiana. E faz isso com facilidade, página por página.\" – Caroline Kepnes, autora de Você  ', NULL, '9786555950953', 0, 0, 0, '8flVEAAAQBAJ', 'Editora Rocco', 'http://books.google.com/books/publisher/content?id=8flVEAAAQBAJ&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE71oCKsiONR4lltWlgXORsjNAOqyvp0mUgUDDrSPH_SzieeDbh-mVesCBzh2FWJG5E3NOXTFU8LPzrpLu3Beo784mGQfhRa1ToI1fayRWjaw9-lDN-LVQA9s_e5GXUg49uUAjZ6F&s'),
(8, 'Antropoceno', 'John Green', '2021-08-24', '2025-06-11 19:48:25', 'Em seu primeiro livro de não ficção, o premiado autor de A culpa é das estrelas analisa as contradições e as maravilhas da humanidadeQue John Green é um dos autores contemporâneos mais queridos não é novidade. Sua sensibilidade e seu talento para traçar histórias inesquecíveis tornaram seus romances sucessos mundiais, e agora o celebrado escritor nos oferece uma necessária dose de esperança em sua estreia na não ficção. Refletindo sobre temas que vão de Super Mario Kart e o pôr do sol a pinturas rupestres e o hábito de procurar estranhos no Google, os ensaios perspicazes e bem-humorados reunidos nesta coletânea são uma celebração genuína da capacidade humana de se apaixonar pelo mundo.O termo “Antropoceno” foi proposto para designar a era geológica atual, em que os seres humanos remodelaram o planeta e sua biodiversidade de maneira profunda, para o bem e para o mal. A humanidade é cheia de facetas contraditórias e invenções intrigantes, e John Green se propõe a avaliá-las de forma nada imparcial. Afinal, no Antropoceno, não há observadores desinteressados, apenas participantes. Como o próprio autor reconhece, esses ensaios também são, de certa forma, uma autobiografia.Escrito em parte durante o turbulento período de pandemia global e baseado em seu podcast de sucesso,Antropoceno: notas sobre a vida na Terra nos guia pelas sutilezas dessa nova realidade e nos dá a segurança de que podemos até desconhecer o caminho que estamos seguindo, mas com certeza estamos em boa companhia.', NULL, '9786555602739', 0, 0, 0, 'obs8EAAAQBAJ', 'Editora Intrinseca', 'http://books.google.com/books/publisher/content?id=obs8EAAAQBAJ&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE71-ShVglFRtEdY8o8duw56xiANJbCP8MqgahGxXSISDuSCVF3H-3UOJqtxAJnN7bl3nmM5Dmme4Xrro3-2k0LCyAZUa1mZjD97bKtNtkwBLBiWfd2cv9Q3d8sqWgIsuhTCAkUxt&s'),
(9, 'Harry Potter e o Cálice de Fogo', 'J.K. Rowling', '2015-12-08', '2025-06-11 19:48:57', 'Haverá três tarefas, espaçadas durante o ano letivo, que servirão para testar os campeões de diferentes maneiras... sua perícia em magia, sua coragem, seus poderes de dedução e, naturalmente, sua capacidade de enfrentar o perigo.\'O Torneio Tribruxo será realizado em Hogwarts. Apenas bruxos acima dos dezessete anos de idade podem se inscrever - mas isso não impede que Harry sonhe em vencer a competição. E então, no Dia das Bruxas, quando o Cálice de Fogo faz sua seleção, Harry se surpreende ao ver que seu nome é um dos que a taça mágica escolhe. Ele terá de enfrentar tarefas mortais, dragões e bruxos das trevas, mas com a ajuda de seus melhores amigos, Ron e Hermione, talvez ele consiga sair dessa - vivo!', NULL, '9781781103715', 0, 0, 0, 'ZDgQCwAAQBAJ', 'Pottermore Publishing', 'http://books.google.com/books/publisher/content?id=ZDgQCwAAQBAJ&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE73llOh7LoWTg_HbxsD0iNSXN16fKbTd4F0lafI5uUBwIcJ0-kysamnz5aDt9g-QQqKuWSq1torlR7cVs7tVcb2el6YEK3NApxsSzrbz7cUDphWvdlOZiIyWuqO-Uvi4PdCOv2s6&s'),
(10, 'Honestamente: sinceramente?', 'Bruna Zielinski', '2021-05-28', '2025-06-11 19:50:20', 'Honestamente: Benjamin Park e Leonardo Guimarães não se suportam. Não foi sempre assim, mas uma grande briga há sete meses destruiu a amizade dos dois. Apesar de estudarem na mesma sala da faculdade e terem o mesmo grupo de amigos, Leo e Ben passaram a se evitar e, quando se esbarravam, discutiam até pelos motivos mais bobos. Porém, tudo muda entre eles quando se reencontram em uma festa. Sinceramente? O ódio jamais conseguiu mascarar o desejo ou a mágoa. Quando os dois percebem que não são capazes de ficar longe um do outro, decidem estabelecer regras. O Acordo Guimarães-Park coloca restrições na \"inimizade colorida\", e o difícil é não quebrar justamente a primeira regra: não se apaixonar. Esta história, escrita por Bruna Zielinski e publicada a partir de seleção da autora Babi Dewet, nasceu de uma fanfic inspirada em dois idols do k-pop e é recheada de atração e conflitos. Nela, a busca pela sintonia em um relacionamento parece sempre ter o efeito contrário. Enquanto navegam por problemas familiares e por suas próprias vulnerabilidades, Benjamin e Leonardo, tão diferentes quanto chá de hortelã e café, precisarão estar dispostos a conversar, perdoar e ouvir se quiserem se dar uma segunda chance. TAGS: DRAMA, FICANDO JUNTOS, FLUFFY, LEVEMENTE TRISTE, LISTAS, LOVE&HATE, MACHUCAR/CONFORTAR, POST-ITS, POV PRIMEIRA PESSOA', NULL, '9786555950663', 0, 0, 0, 'ZeYsEAAAQBAJ', 'Editora Rocco', 'http://books.google.com/books/publisher/content?id=ZeYsEAAAQBAJ&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE71FzDoCJE42bv9P5vFdnR8-dBijY0SvRnSmSvuPZ_pKRYP1n-YtjohhHpYn6oWGOL-VaC4xthJG0c2OOuzV2grpDRzJmt8Ju0kjIcN5tU3yzncBoMhWoibZ78ZcEwiz1f653nro&s'),
(11, 'A Flecha de Fogo', 'Leonel Caldela', '2018-12-01', '2025-06-11 20:56:31', 'Uma antiga profecia esconde a última esperança de um povo... E a ruína de outro. Ele está chegando. A profecia nos avisou que, com o eclipse, viria o Arauto da Destruição, tingindo os campos de vermelho. Ele já destruiu o Reino dos Elfos com seu exército de monstros. Só existe uma coisa que pode detê-lo, mas ninguém sabe o que é. Passei minha vida toda estudando a profecia. Todos nós dedicamos cada minuto a tentar decifrá-la, em busca de uma arma, de uma esperança. Mas a última barreira caiu e ele está chegando. A sombra da morte cobrirá nossos reinos, a menos que alguém responda a pergunta que nos atormenta desde o início. O que é a Flecha de Fogo? Leonel Caldela (A Lenda de Ruff Ghanor, Ozob, O Código Élfico) volta ao cenário de Tormenta para desvendar um mistério de décadas. A Flecha de Fogo narra o embate épico entre a civilização humana e a monstruosa Aliança Negra, num romance de volume único que conquistará tanto veteranos quanto recém-chegados ao maior universo de fantasia do Brasil.', NULL, '9788583650935', 0, 0, 0, 'M94NEAAAQBAJ', 'Jambô Editora', 'http://books.google.com/books/publisher/content?id=M94NEAAAQBAJ&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE727K0PkFwAC1HFIzRCryqtuyANhy0m-TwWww-_jwxIg3USGdpEGtT-fayXOs6n920i97rMNRoQL572TJ9_EobGVHAfM_YrDmGNYt0WPp-JSrXCidX7QPgmY77JPSlYI3zJMQHfi&s'),
(12, 'Marés da guerra - World of Warcraft', 'Christie Golden', '2012-10-18', '2025-06-12 10:49:01', 'As cinzas do Cataclismo se espalharam por todos os reinos de Azeroth. Enquanto o mundo se recupera do desastre, a renomada feiticeira Jaina Proudmore continua sua eterna luta para forjar a paz entre as forças da Horda e da Aliança. Mas seus esforços podem não ser suficientes... Os últimos acontecimentos e antigas tensões deixam as duas facções à beira da guerra. E ameaçam destruir a pouca estabilidade conquistada... As forças da Aliança se dirigem a Theramore para repelir o ataque da Horda. Mas os defensores estão despreparados para enfrentar a estratégia vil e astuta de Garrosh. O ataque irá transformar Jaina de modo irrevogável, engolfando a ardorosa pacifista nas caóticas e desesperadoras... marés da guerra.', NULL, '9788501401717', 0, 0, 0, '0OOr1GNFhPcC', 'Editora Record', 'http://books.google.com/books/content?id=0OOr1GNFhPcC&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE71zHD7cHcdf-iULwCjx2P8wFEVoGAOC0kNprC21Z12tie2t5apkE0hF5LgpjbNvcKrJeEwP1hJF2x4MzK9FW_yPJD6ADV12gx0nSXDF1xzzgZ1es67nV8sSYZlrDaRNEqVfrv3x&source=gbs_'),
(13, 'A ruptura - World of Warcraft', 'Christie Golden', '2013-08-29', '2025-06-12 14:18:35', 'Da mesma coleção iniciada com Marés da Guerra, A ruptura, novo volume de World of Warcraft, é mais um livro que consagra a parceria com a Blizzard Entertainment, uma das maiores desenvolvedoras de softwares de entretenimento do mercado.  Este novo volume apresenta os acontecimentos que são um prelúdio do Cataclismo. E tudo começa quando, num passado distante, os poderosos e hostis espíritos elementais de Azeroth assolavam o mundo, até que os titãs benevolentes os prenderam no Plano Elemental. Apesar da intervenção dos titãs, muitos deles regressaram a Azeroth. Porém, ao longo do tempo, xamãs como Thrall, Chefe Guerreiro da Horda e líder sábio e corajoso, comungaram com estes espíritos e, com paciência e dedicação, aprenderam a acalmar ruidosas discórdias. Mas agora Thrall descobriu que eles não mais atendem aos apelos dos xamãs. Enquanto isso, o rei Varian Wrynn de Ventobravo planeja uma ação violenta em resposta ao aumento das tensões entre a Aliança e a Horda, uma operação linha-dura que ameaça alienar as pessoas mais próximas a ele, incluindo seu filho, Anduin. O jovem príncipe em conflito tem que descobrir o próprio caminho, mas ao fazê-lo, corre o risco de ficar preso na instabilidade política que está levando o mundo ao seu ponto crítico. O destino das grandes raças de Azeroth está envolta em uma névoa de incerteza, e o preocupante comportamento dos espíritos elementais parece ser o primeiro sinistro aviso do Cataclismo por vir. Christie Golden, best seller do New York Times e vencedora de vários prêmios, é autora de mais de 35 romances e diversos contos nos gêneros de ficção científica, fantasia e terror — entre eles mais de 10 romances da célebre série Star Trek e três da saga Star Wars. Jogadora contumaz da série World of Warcraft, ela já publicou dois contos em mangá e vários romances sobre esse universo.', NULL, '9788501100412', 0, 0, 0, 'UTipAAAAQBAJ', 'Galera', 'http://books.google.com/books/publisher/content?id=UTipAAAAQBAJ&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE70VG6S3NeeNbZAs_1Kn_esyw7xf-IlRsGjO1lPdm2ZZNe4DAc-LlEYN4fs3w_jK4vyvYFDPK4vD36zIqPsWVRbM1NK7yDJ2XrZL51JpFzrPK6wb3K0da16CEYJXbz24Pukzyi7I&s'),
(14, 'O segredo do oceano', 'Natasha Bowen', '2021-12-10', '2025-06-12 14:23:48', 'Uma fantasia inesquecível inspirada na mitologia africana e com um toque de A pequena sereiaUm jeito de sobreviver. Um jeito de servir. Um jeito de salvar. Simidele rezou para os deuses uma vez. Agora, ela serve a eles como uma sereia Mami Wata, coletando as almas dos que caíram no mar e abençoando a jornada delas até em casa, junto ao Deus Supremo. Mas quando um garoto que ainda está vivo é jogado de um navio ao mar, Simi faz o impensável e o salva, desobedecendo a um decreto antigo. E uma punição aguarda aqueles que ousarem desafiá-lo.Para proteger as outras Mami Wata, Simi precisa embarcar em uma jornada para apelar ao Deus Supremo. Mas as probabilidades não estão ao seu lado. O garoto resgatado sabe mais do que deveria, e há alguma coisas seguindo Semi bem de perto —um ser que adoraria vê-la falhar. O perigo está à espreita em cada curva, enquanto mais Simi se aproxima de seu objetivo, mais tem que enfrentar deuses vingativos, terras traiçoeiras e criaturas lendárias. Se não fizer isso, arriscará não só o destino de todas as Mami Wata, mas também o mundo como ela conhece.', NULL, '9786588131404', 0, 0, 0, 'nDlPEAAAQBAJ', 'Alt', 'http://books.google.com/books/publisher/content?id=nDlPEAAAQBAJ&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE71sA4A3Mf9JsIl6zDRKmSycEPVJoIsl0J9BhazSUbJh9zyHfse4piEvzOvrM7vvtNP2-smVJXyR17IzqWMgZj39xV2b2JUB6BYvc4j_hqwG0ZnomKsLknAb5EgThqiwBnKWXo74&s'),
(15, 'O Senhor dos Anéis: A Sociedade do Anel', 'J.R.R. Tolkien', '2019-11-25', '2025-06-12 14:26:17', 'A Sociedade do Anel O volume inicial de O Senhor dos Anéis, lançado originalmente em julho de 1954, foi o primeiro grande épico de fantasia moderno, conquistando milhões de leitores e se tornando o padrão de referência para todas as outras obras do gênero até hoje. A imaginação prodigiosa de J.R.R. Tolkien e seu conhecimento profundo das antigas mitologias da Europa permitiram que ele criasse um universo tão complexo e convincente quanto o mundo real. A Sociedade do Anel começa no Condado, a região rural do oeste da Terra-média onde vivem os diminutos e pacatos hobbits. Bilbo Bolseiro, um dos raros aventureiros desse povo, cujas peripécias foram contadas em O Hobbit, resolve ir embora do Condado e deixa sua considerável herança nas mãos de seu jovem parente Frodo. O mais importante legado de Bilbo é o anel mágico que costumava usar para se tornar invisível. No entanto, o mago Gandalf, companheiro de aventuras do velho hobbit, revela a Frodo que o objeto é o Um Anel, a raiz do poder demoníaco de Sauron, o Senhor Sombrio, que deseja escravizar todos os povos da Terra-média. A única maneira de eliminar a ameaça de Sauron é destruir o Um Anel nas entranhas da própria montanha de fogo onde foi forjado. A revelação faz com que Frodo e seus companheiros hobbits Sam, Merry e Pippin deixem a segurança do Condado e iniciem uma perigosa jornada rumo ao leste. Ao lado de representantes dos outros Povos Livres que resistem ao Senhor Sombrio, eles formam a Sociedade do Anel. Alguém uma vez disse que o mundo dos leitores de língua inglesa se divide entre os que já leram O Senhor dos Anéis e os que um dia lerão o livro. Com esta nova tradução da obra, o fascínio dessa aventura atemporal ficará ainda mais evidente para os leitores brasileiros, tanto os que já conhecem a saga como os que estão prestes a descobrir seu encanto.', NULL, '9788595086333', 0, 0, 0, 'R7KuDwAAQBAJ', 'HARLEQUIN', 'http://books.google.com/books/publisher/content?id=R7KuDwAAQBAJ&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE71t4EKblLedxtE1PiuAGoCqE_4SCftx73Z0KLKy4FG-hfNVjbn-CVLu7VnqPjsWqwa9J9crDXXmL6nqikef_MaGnhAk3tS_LoSvwpunlgfcRX1BCelwa1TkHz1Tt8xEZUGDvGSf&s'),
(16, 'Senhor Dos Aneis - 01 - Capa Nova', 'John Ronald Reuel Tolkien', '0000-00-00', '2025-06-12 14:32:21', NULL, NULL, '9788533615557', 0, 0, 0, 'nkD1QgAACAAJ', 'Martins Fontes', NULL),
(17, 'Lágrimas de amor e café', 'Babi A. Sette', '2019-08-05', '2025-06-12 14:33:38', 'Novo romance da autora do best-seller Senhorita Aurora.  Fragilizada pela morte da mãe e a miséria na Itália, Angelina aceita a proposta de um estrangeiro rico que oferece não só casamento, mas também conforto para seu pai e sua irmã caçula. Decidida a ajudar a família, ela embarca para um país distante tendo como companhia somente a escrita e os romances que ama, já que durante a viagem o marido se revela muito diferente do príncipe que sonhou um dia conhecer. Vincenzo também tem o Brasil como destino e, por uma traição, vê seus sonhos roubados logo que desembarca no novo país. E é na fazenda de um barão do café, onde Angelina é senhora e também vítima do marido cruel, que Vincenzo acaba achando trabalho. Em meio a encontros e conversas nasce entre ambos uma amizade verdadeira e uma paixão secreta que pode colocar em risco não apenas a vida deles, mas também a segurança de outras pessoas. Vincenzo e Angelina teriam coragem o bastante para esquecer as proibições, passar por cima dos perigos e viver esse grande amor?', NULL, '9788576867906', 0, 0, 0, 'mOSmDwAAQBAJ', 'Verus Editora', 'http://books.google.com/books/publisher/content?id=mOSmDwAAQBAJ&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE72OmoQiTC7HEy0j95rXu4VN2rOOtDgL3zmVjRF9oGF7ecP6q76aZXVG_ubJ7XYkL9Op-Gu2nGNLLABwtSLF0aL3cfImbc5bvn56eZZXBBK90QmTaYEevRiUaYaD4E1bVfTbQ092&s'),
(18, 'O Hobbit e a filosofia', 'William Irwin, Eric Bronson, Gregory Bassham', '2013-02-15', '2025-06-12 14:35:17', 'Em O hobbit e a filosofia os leitores poderão entender – com a ajuda de um grupo de professores e pensadores modernos — o impacto filosófico de O hobbit e  O Senhor dos anéis na sociedade e cultura contemporânea. Com a ajuda de nomes como Platão, Nietzsche, Santo Agostinho e até mesmo Buda, o livro percorre a Terra-média e descobre por que a possessividade em relação a um objeto (como um anel mágico, por exemplo) pode ser tão destrutiva. O que é mais importante na vida - a comida e a bebida ou o ouro acumulado? Ou nenhum dos dois? Os hobbits são taoistas? Afinal, Bilbo trapaceou e roubou o Um Anel de Gollum? A partir dessas e muitas outras questões, o livro procura fazer uma análise filosófica dessa obra da literatura fantástica.', NULL, '9788576846758', 0, 0, 0, 'Z2b0Bl5MyYoC', 'Editora Best Seller', 'http://books.google.com/books/content?id=Z2b0Bl5MyYoC&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE723cjSL2OLI8PAn2L_f6MS_buEXxHdidYCMZegMXLa-okLHd2VVmO4l4pHLy81sFsIQIXDZgwmX0i4FXIrq9Xke_aJPkXmihSWB2HIg28WvS4U9GeMyGDqPArB2L0Gu1K8Leuw6&source=gbs_'),
(19, 'Roverando', 'J.R.R. Tolkien', '2021-02-20', '2025-06-12 14:36:48', 'Quando tinha 4 anos, Michael, um dos filhos de J.R.R. Tolkien perdeu seu amado cachorro de brinquedo na praia. Para consolá-lo, seu pai improvisou uma história sobre Rover, um cachorro real que é magicamente transformado em um brinquedo e precisa encontrar o mago que o enfeitiçou para poder voltar ao normal. Rover pede ajuda a um feiticeiro-da-areia, que o envia à Lua e, mais tarde, ao mar. Rico em inteligência e jogo de palavras, Roverando, referência ao nome do cachorrinho – Rover – que vive suas aventuras andando por aí, foi editado por Christina Scull e Wayne G. Hammond. Alé disso, o livro contém ilustrações do próprio Tolkien.', NULL, '9786555110920', 0, 0, 0, 'YvkTEAAAQBAJ', 'HARLEQUIN', 'http://books.google.com/books/publisher/content?id=YvkTEAAAQBAJ&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE70uZcykMGyxHQkPbUY9Bts8wBGtU6Av2rjGe3DjRp4tccQ3PszmrwvWbNdaU4MZxOLxCglsHjGoyo7dV1rmAS4OKFlS9HLgmK33GYJd4Ag4nWAHa9zPxGzt7nAFdAJsoS1AnREd&s'),
(20, 'Senhor Dos Aneis, O - as Duas Torres - Vol 2', 'John Ronald Reuel Tolkien', '0000-00-00', '2025-06-12 14:37:57', NULL, NULL, '9788533613386', 0, 0, 0, 'W65gOgAACAAJ', 'Martins Fontes', NULL),
(21, 'A vida porca', 'Arlt, Roberto', NULL, '2025-06-12 14:43:33', ' Os leitores e leitoras encontrarão nessa obra o relato da iniciação de um adolescente, Silvio Astier, no submundo portenho, zona cinzenta de uma sociedade em que a educação burguesa perdeu as suas cores luminosas. Astier e seus amigos leem livros baratos em traduções ruins, cometem crimes por meio dos quais ascendem à cultura letrada de que foram excluídos, falsificam, blasfemam, elaboram inventos precários, etc. O conjunto dessas características se potencializa nos romances posteriores de Arlt, Os sete loucos e Os lança-chamas. Tudo isso nos dá a chave para ler a literatura argentina como o invento de uma tradição da conspiração sobre o papel: o vínculo entre o delito e a poiseis, ou melhor, uma poiesis do delito bibliográfico. A forma precisa dessa equação está na frase de Astier: &quot;Oh!, ironia, logo eu que havia sonhado ser um grande bandido feito Rocambole e um poeta genial feito Baudelaire!&quot;Quanto à tessitura narrativa, cabe dizer que A vida porca inovou ao dar corpo a uma espessura verbal até então ignorada na literatura argentina, a voz partilhada entre o espanhol rio-platense e a dicção dos imigrantes que passam a povoar o país vizinho a partir da virada do século XIX para o XX. O texto arltiano se escreve por meio da ausência das vozes daqueles homens e mulheres que falavam à Argentina por meio do desterro territorial e linguístico. No princípio do século passado, Buenos Aires é uma cidade cuja metade da população é constituída por gente estrangeira. A vida porca conforma, por tudo isso, um torvelinho babélico ao reunir ventos contrários a fim de aproximar Nossa América do mundo europeu. Será precisamente a essa dissonância verbal da língua moderna que recorrerá Arlt (ele mesmo filho da imigração) para plasmar a sua dicção literária.A vida porca traz um balbucio profético de tudo isso que, hoje, escutamos nas melhores páginas da literatura argentina e para além dela. E é por isso que – apesar de ser um romance do princípio do século passado – poderá surpreender o público de nossos dias ao trazer consigo o ganho estético característico de todo texto literário que segue merecendo ser lido no tempo: a inesgotável superação da normatividade da língua a partir de seu mais íntimo estranhamento.  ', NULL, '9788566786316', 0, 0, 0, '6fvwCgAAQBAJ', 'Relicário', 'http://books.google.com/books/publisher/content?id=6fvwCgAAQBAJ&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE72PM_AQGyj2-RjIwWdiiQDagBzQvhBbtiB5KHUNDUkjxKlzWsxx4TsM-M7icou2MlPVbvKcEU1xSEV4REHG41FtpSeMqpM3LmXtsvYiL9WF0t4LZ06QkiydfscIwUuSP56HUzRf&s'),
(22, 'Jogos vorazes ilustrado', 'Suzanne Collins', '2024-10-31', '2025-06-12 14:44:32', 'Katniss Everdeen tem apenas dezesseis anos, mas sabe que é preciso esforço, muita observação e resiliência para sobreviver em Panem. O Distrito 12, seu lar, vive sob o domínio implacável da Capital, continuamente forçado a pagar pelos pecados de uma guerra civil perdida há muito tempo. Os Jogos Vorazes anuais são a maneira de a Capital se manter no poder, transformando em espetáculo uma luta até a morte com dois jovens tributos de cada um dos doze distritos de Panem. Essa batalha terrível tem como objetivo enviar uma mensagem assustadora: qualquer rebelião sempre será punida. Quando Katniss se vê na arena dos jogos, ela sabe que a sorte não está a seu favor. Qualquer erro pode resultar em sua morte – e até mesmo as decisões certas têm um preço. Mas, se ela for capaz de vencer, há uma chance de que os distritos também possam sobreviver. A série Jogos Vorazes já conquistou milhões de leitores pelo mundo. Agora, o primeiro livro da saga ganha uma inédita edição ilustrada de luxo, com artes fascinantes do internacionalmente aclamado ilustrador Nico Delort.', NULL, '9786555953008', 0, 0, 0, 'p3QlEQAAQBAJ', 'Editora Rocco', 'http://books.google.com/books/publisher/content?id=p3QlEQAAQBAJ&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE70fopQ3_TDKQ1OvZ5KYhco9PSBkoqk5Z1KMgneSnKhp3iPOu5CcqW0zqZT0OP1pjNv0H-skwS8qaqEyOpWUOUTAe1bqt5CG3xtsB70GqDyq547mQQsnyAd6Zqqds6tXEBeF4b1G&s'),
(23, 'Jogos Vorazes e a filosofia', 'Dean A. Kowalski, William Irwin', '2013-12-02', '2025-06-12 14:46:44', 'Cometer um assassinato com a finalidade de se autopreservar pode ser considerado moral? É possível que algo tão simples quanto uma música dê início a uma revolução? A filosofia pode ajudar Katniss a escolher entre Peeta e Gale? Tocando em temas profundos, como lealdade e moralidade, Jogos Vorazes e a filosofia nos ajuda a analisar uma das mais famosas distopias de nosso tempo.', NULL, '9788576848394', 0, 0, 0, '_XNOAgAAQBAJ', 'Editora Best Seller', 'http://books.google.com/books/publisher/content?id=_XNOAgAAQBAJ&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE73nAYqhy9l2IYk2XUWtGaAADwUIzSNY5-xh2NyZbN_84YFU1mEH7nxfftVPeSdAqaQ7RMt1fxT1Bck2FcL7JQQIfZuM4JpAKcXNdbzAD1Gs2WIQ0Y04AvW5833OP7JZsrYLXL1z&s'),
(24, 'Em chamas', 'Suzanne Collins', '2012-02-15', '2025-06-12 14:47:43', ' AS FAGULHAS SE ACENDEM. AS CHAMAS SE ESPALHAM. E A CAPITAL QUER VINGANÇA.  Depois da improvável e inusitada vitória de Katniss Everdeen e Peeta Mellark nos últimos Jogos Vorazes, algo parece ter mudado para sempre em Panem. Aqui e ali, distúrbios e agitações nos distritos dão sinais de que uma revolta é iminente. Katniss e Peeta, representantes do paupérrimo Distrito 12, não apenas venceram os Jogos, mas ridicularizaram o governo e conseguiram fazer todos – incluindo o próprio Peeta – acreditarem que são um casal apaixonado. A confusão na cabeça de Katniss não é menor do que a das ruas. Em meio ao turbilhão, ela pensa cada vez mais em seu melhor amigo, o jovem caçador Gale, mas é obrigada a fingir que o romance com Peeta é real. Já o governo parece especialmente preocupado com a influência que os dois adolescente vitoriosos – transformados em verdadeiros ídolos nacionais – podem ter na população. Por isso, existem planos especiais para mantê-los sob controle, mesmo que isso signifique forçá-los a lutar novamente.  Em chamas é o segundo livro da trilogia Jogos Vorazes que foi adaptada para o cinema e estrelada por Jennifer Lawrence.  \"Além das fronteiras da criação de um mundo poderoso, da crítica aguçada à sociedade, e de um elenco de personagens tão diversos e verdadeiros, surgem ação, romance, e uma grande mensagem de esperança. Esta é uma história que irá absorver completamente os leitores que nela se aventurarem. Mas pode ser uma experiência muito mais rica para os leitores da trilogia Jogos Vorazes já apaixonados por Katniss, Peeta, Haymitch e os outros residentes desta distopia. A trama de suspense deixará os leitores ávidos pelo terceiro volume.\" - Kirkus Reviews', NULL, '9788581220314', 0, 0, 0, 'uLrUpMscQqcC', 'Editora Rocco', 'http://books.google.com/books/content?id=uLrUpMscQqcC&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE72R14lHb4Gl6f4OwQtcQ6uzlrokrZUdnocLvzvrKl8ilqn_q7TP9J4YcamT33y3BeIn3hw7MpEFKCG4mRvvMjFAQctx897aD-Sb97M46lkjUw_zKvzVfR3D1gOG-XVqNUeiAkJa&source=gbs_'),
(25, 'A cantiga dos pássaros e das serpentes', 'Suzanne Collins', '2020-06-15', '2025-06-12 14:48:11', ' UMA HISTÓRIA DA SÉRIE JOGOS VORAZES   AMBIÇÃO O ALIMENTARÁ.  COMPETIÇÃO O CONDUZIRÁ.  MAS O PODER TEM O SEU PREÇO.  É a manhã do dia da colheita que iniciará a décima edição dos Jogos Vorazes. Na Capital, o jovem de dezoito anos Coriolanus Snow se prepara para sua oportunidade de glória como um mentor dos Jogos. A outrora importante casa Snow passa por tempos difíceis e o destino dela depende da pequena chance de Coriolanus ser capaz de encantar, enganar e manipular seus colegas estudantes para conseguir mentorar o tributo vencedor. A sorte não está a favor dele. A ele foi dada a tarefa humilhante de mentorar a garota tributo do Distrito 12, o pior dos piores. Os destinos dos dois estão agora interligados – toda escolha que Coriolanus fizer pode significar sucesso ou fracasso, triunfo ou ruína. Na arena, a batalha será mortal. Fora da arena, Coriolanus começa a se apegar a já condenada garota tributo... e deverá pesar a necessidade de seguir as regras e o desejo de sobreviver custe o que custar.', NULL, '9786556670010', 0, 0, 0, 'tq3kDwAAQBAJ', 'Editora Rocco', 'http://books.google.com/books/publisher/content?id=tq3kDwAAQBAJ&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE70P-JmdvQjm1XYU2QPmsjsbFp4nc36d5wHWSu8Yt_6mwquhimGhdjuJCdq0Vph2HZRz6rsOBaDc-x_nRzb6Zprr9u0Th69g7zAXG0ohDJrmftWIEIkynoZrjaHv02n7i7gJk45-&s'),
(26, 'Ed & Lorraine Warren - Lugar Sombrio', 'Ed Warren, Lorraine Warren, Carmen Reed, Al Snedeker, Ray Garton', '2018-02-28', '2025-06-12 14:49:06', 'O casal de investigadores paranormais favorito dos darksiders está de volta. Depois do grande sucesso de Ed & Lorraine Warren: Demonologistas, a DarkSide Books reabre seus Arquivos Sobrenaturais para desenterrar um dos casos mais assustadores dos últimos 30 anos. Descubra a verdadeira história por trás do exorcismo de Connecticut em Ed & Lorraine Warren: Lugar Sombrio. Mesmo quem tem medo do assunto certamente já ouviu falar deles. Seus casos mais famosos, como os de Amityville, Rhode Island e de Enfield, por exemplo, foram adaptados para o cinema. Até mesmo a endiabrada Annabelle está no currículo de assombrações, poltergeists e espíritos obsessores enfrentados pelo casal Warren. Claro, a boneca legítima faz parte da coleção que Lorraine, hoje com 90 anos, mantém em casa. Ed & Lorraine Warren: Lugar Sombrio é o relato meticuloso dos fenômenos que infernizaram a vida de um casal norte-americano após sua mudança para uma antiga casa em que havia funcionado uma funerária anos antes. O exorcismo de Connecticut ganhou notoriedade na mídia norte-americana na época. Em 2009, a história serviu de inspiração para o filme Evocando Espíritos, de Peter Cornwell, que usou Ed & Lorraine Warren: Lugar Sombrio como principal fonte de pesquisa. Nos fóruns da internet, os fãs e a mídia especializada apostam que James Wan (Annabelle, Jogos Mortais) também vai contar sua visão dessa mesma história em breve, no aguarda do Invocação do Mal 3.', NULL, '9788594541147', 0, 0, 0, 'oWlODwAAQBAJ', 'Darkside Entretenimento LTDA', 'http://books.google.com/books/publisher/content?id=oWlODwAAQBAJ&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE72o07JxkouQ2Bnl0X44yNh_5JIjK9NGx58bufniyy77poKImIYndyqD9aBKSCzQqUHjAi2rDFuqmrHtkBiA8Dc9FiZJa7rTQZRR7xdLK67eqTAu2DaW-r-48E0sWBKTqORG2Lkn&s'),
(27, 'Box O povo do ar', 'Holly Black', '2021-07-05', '2025-06-12 14:49:37', 'Os três volumes da série O povo do ar e o spin-off reunidos pela primeira vez em um box com conteúdos especiais. O conto inédito  \"As irmãs perdidas\", o mapa de Elfhame atualizado no verso das capas, uma capa nova para O canto mais escuro da floresta, e brindes como uma cinta em formato de coroa de papel, marcadores, pôster exclusivo com uma fan art da Arda Arts e uma flâmula. Na série O povo do ar, a autora best-seller Holly Black transporta os leitores para Reino das Fadas. Não aquelas dos contos clássicos, fadas que podem ser cruéis e mortais, especialmente se motivadas pelo poder. Uma aventura que mistura magia, intrigas palacianas e romance.  O canto mais escuro da floresta  Hazel e seu irmão, Ben, moram em uma cidade onde humanos e fadas convivem. A magia aparentemente inofensiva desses seres atrai turistas de todas as partes, que querem ver de perto as maravilhas do lugar e, principalmente, o garoto de chifres e orelhas pontudas que descansa em um caixão de vidro. Hazel e Ben eram fascinados pelo garoto quando crianças. Mas, eles sabem que o garoto de chifres nunca acordará... Até que um dia ele acorda. Agora, os irmãos precisam se tornar os heróis que fingiam ser e desvendar os mistérios que envolvem aquele príncipe com chifres.  O príncipe cruel   Jude tinha 7 anos quando seus pais foram assassinados e foi forçada a viver no Reino das Fadas. Dez anos depois, tudo o que ela quer é ser como eles – lindos e imortais – e realmente pertencer ao Reino das Fadas, apesar de sua mortalidade. Para ganhar um lugar na Alta Corte, ela deve desafiar o Príncipe Cardan, o filho mais bonito e mais cruel do Grande Rei... e enfrentar as consequências.  O rei perverso   Jude achou que, depois de enganar Cardan para que ele jurasse obedecê-la por um ano e um dia, sua vida se tornaria mais fácil. Mas ter qualquer influência sobre o Grande Rei de Elfhame parece uma tarefa impossível, principalmente quando ele faz de tudo em seu poder para humilhá-la e prejudicá-la, mesmo que seu fascínio pela garota humana permaneça intacto.  A rainha do nada   Jude carrega o outrora impensável título de Grande Rainha de Elfhame, mas as condições são longe de ser ideais. Exilada por Cardan no mundo mortal, Jude se encontra impotente e frustrada enquanto planeja reivindicar tudo que Cardan tomou dela.', NULL, '9786559810130', 0, 0, 0, 'KX4wEAAAQBAJ', 'Editora Record', 'http://books.google.com/books/publisher/content?id=KX4wEAAAQBAJ&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE704tMsb0xq0MVxZmYziKQjGfizDpOvAEsw-5VI8juQnNjRF6FaZ_BK_9nKlY4SC2AhgKFDdqbJuVDQ5mzgE88a84dGx68EdqxBBOpMVk5UoRXaeAN7pY7lIFO3EB__by5fHZoQQ&s'),
(28, 'O grande deus Pã', 'Arthur Machen', '2022-08-08', '2025-06-12 14:52:40', '\"O único homem capaz de inspirar horror verdadeiramente profundo e espiritual.\" Foi assim que H. P. Lovecraft descreveu, em uma carta, o autor desta novela aterrorizante. Numa época em que as fronteiras entre ciência e misticismo eram menos definidas, O grande deus Pã abre com um experimento médico. Um cientista realiza uma pequena cirurgia cerebral numa mulher, com o objetivo de colocá-la em contato direto com o mundo espiritual. A experiência era chamada pelos antigos de \"ver o deus Pã\", mas a tentativa fracassa, e a mulher perde totalmente a razão, deixando atônito o sr. Clarke, que havia aceitado a contragosto testemunhar o procedimento. Anos mais tarde, Clarke ouve falar dos acontecimentos sombrios envolvendo uma mulher chamada Helen Vaughan. Um garoto, que a vê na floresta com um \"estranho homem nu\", enlouquece. Uma vizinha de Helen aparece em casa seminua e transtornada após uma incursão na floresta com a amiga. A vizinha retorna para a floresta e nunca mais é vista. Marco do terror gótico, O grande deus Pã é um mergulho no mundo sobrenatural e nos pavores da sociedade vitoriana. Numa trama de paganismo, sexo e morte, Machen extrapolou os códigos sociais de sua época e revelou um tipo de horror que influenciaria uma geração de autores. Com tradução e apresentação de Guilherme da Silva Braga, O grande deus Pã segue tão assombroso hoje quanto no seu lançamento original.', NULL, '9786556923215', 0, 0, 0, 'wTZ7EAAAQBAJ', 'Todavia', 'http://books.google.com/books/publisher/content?id=wTZ7EAAAQBAJ&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE709X5cZtk8Y77Ql0BR8NhPpecdu7zV6JmvNpUKRDJdJGJlIr8-ZSEW1kUNA3_aZRDsLGONw2FrPfVGM1dqyx_r50p7Q4uK40IIomSUUGO93vJL2pXyLyrnyEXMLQEXzW9svgAgG&s'),
(29, 'No canto dos ladinos', 'Quito Ribeiro', '2022-08-08', '2025-06-12 15:03:26', 'Aqueles que leram Também os brancos sabem dançar, de Kalaf Epalanga, devem ter reparado na presença de um afiadíssimo e bem-conectado personagem brasileiro que introduz o próprio autor em nosso universo cultural e musical. Pois esse amigo baiano do escritor e músico angolano é nada menos do que Quito Ribeiro, autor deste romance que tem tudo para ocupar um espaço bastante especial em nossa ficção.  No canto dos ladinos enfeixa e dá sentido a um conjunto de histórias que vão compondo um quadro muito original. São personagens que vivem em bairros afluentes, viajam para conferências no exterior, frequentam bons restaurantes ou trabalham no comércio. Um traço em comum é sua negritude. Outro, o fato de serem figuras difíceis de acomodar nos padrões sociais — e ainda racistas — do Brasil. \"E no Brasil pode ser bem estranho um negro sentar-se num restaurante chique de um bairro de classe alta, usando uma roupa descolada, indo tomar um café da manhã no dia seguinte à virada de ano. Esse é um hábito para brancos brasileiros\", diz a certa altura um personagem de No canto dos ladinos. Com grande habilidade narrativa, Quito Ribeiro traça um quadro amplo do ponto de vista social e delicado do ponto de vista subjetivo. O resultado do encontro desses dois campos de força é uma leitura no mínimo atordoante de nossa vida social. O ingresso de milhares de estudantes negros às universidades nas últimas duas décadas; a recente e enorme difusão da obra de Frantz Fanon, o fundamental pensador antirracista e anticolonial; a busca por uma ancestralidade cujos registros foram apagados pelos escravizadores; as tradições familiares; o espaço movediço dos negros que dispõem de recursos materiais mas que ainda assim estão sujeitos ao preconceito e à ofensa. Tudo isso aparece neste romance que oferece — com inteligência e num texto que lança mão da ficção, do ensaio e do memorialismo — um painel singular da vida contemporânea brasileira.', NULL, '9786556923222', 0, 0, 0, 'vTZ7EAAAQBAJ', 'Todavia', 'http://books.google.com/books/publisher/content?id=vTZ7EAAAQBAJ&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE70y7X0bgT7AFQXf6GPriTNzQIWLia50RHDuCd4LLA_9-kLz_y0oDVQN4sB-tCK1buMO9HZabBu1r1CUcOj2IyFlYDDMHUbDxDVuThWeW7aVNQic7MTpwgQQQYKtiWeF8wRWfVf_&s'),
(30, 'Felizes para sempre', 'Kiera Cass', '2015-10-09', '2025-06-12 15:06:10', 'Revisite o universo da série que já vendeu mais de 1 milhão de exemplares no Brasil através desta encantadora coletânea ilustrada. Esta coletânea traz os contos A rainha, O príncipe, O guarda e A favorita ilustrados e com introduções de Kiera Cass. Conheça o príncipe Maxon antes de ele se apaixonar por America, e a rainha Amberly antes de ser escolhida por Clarkson. Veja a Seleção através dos olhos de um guarda que perdeu seu primeiro amor e de uma Selecionada que se apaixonou pelo garoto errado. Você encontrará, ainda, cenas inéditas da série narradas pelos pontos de vista de Celeste e Lucy, um texto contando o que aconteceu com as outras Selecionadas depois do fim da competição e um trecho exclusivo de A sereia, o novo romance de Kiera Cass. Este é um livro essencial para os fãs de A Seleção, que poderão mergulhar mais nesse universo tão apaixonante.', NULL, '9788543804347', 0, 0, 0, 'whLYCgAAQBAJ', 'Editora Seguinte', 'http://books.google.com/books/publisher/content?id=whLYCgAAQBAJ&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE71QBulqzk-01KNM159ZMHl2VCtG4WCP7re-yW50oNT2UwTIso3GFD3ZhN1Ox8zHcI9swOeEZVNY8dsphJK1cIHxagAsIHGJxBtoUki83a4qxZJrKO8I9nrrCI7rMXBDBR92NWtq&s'),
(31, 'O Ladrão de raios', 'Rick Riordan', '2011-12-15', '2025-06-12 15:13:05', 'Primeiro volume da saga Percy Jackson e os olimpianos, O ladrão de raios esteve entre os primeiros lugares na lista das séries mais vendidas do The New York Times. O autor conjuga lendas da mitologia grega com aventuras no século XXI. Nelas, os deuses do Olimpo continuam vivos, ainda se apaixonam por mortais e geram filhos metade deuses, metade humanos, como os heróis da Grécia antiga. Marcados pelo destino, eles dificilmente passam da adolescência. Poucos conseguem descobrir sua identidade. O garoto-problema Percy Jackson é um deles. Tem experiências estranhas em que deuses e monstros mitológicos parecem saltar das páginas dos livros direto para a sua vida. Pior que isso: algumas dessas criaturas estão bastante irritadas. Um artefato precioso foi roubado do Monte Olimpo e Percy é o principal suspeito. Para restaurar a paz, ele e seus amigos – jovens heróis modernos – terão de fazer mais do que capturar o verdadeiro ladrão: precisam elucidar uma traição mais ameaçadora que fúria dos deuses.', NULL, '9788598078397', 0, 0, 0, 'DNeCPgAACAAJ', 'Editora Intríseca', NULL),
(32, 'O mar de monstros', 'Rick Riordan', '2012-11-13', '2025-06-12 15:14:25', 'O Mar de Monstros é o segundo volume da série Percy Jackson e os olimpianos, best-seller do The New York Times.Nessa nova aventura, Percy e seus amigos estão em busca do Velocino de Ouro, único artefato mágico capaz de proteger da destruição seu lugar predileto e, até então, o mais seguro do mundo: o Acampamento Meio-Sangue. Com o envenenamento da árvore de Thalia por um inimigo misterioso, as fronteiras mágicas que protegem o Acampamento estão ameaçadas, e é preciso buscar o antídoto.Assim, nossos heróis partem em uma arriscada e incrível viagem pelo Mar de Monstros, localizado nas coordenadas 30-31-75-12: uma referência ao Triângulo das Bermudas. Lá, enfrentam seres fantásticos e muitos perigos e situações inusitadas, que põem à prova seu heroísmo e sua herança – quando Percy irá questionar se ser filho de Poseidon é uma honra ou uma terrível maldição. Combinando fatos contemporâneos com mitologia, fantasia com erudição, O Mar de Monstros diverte, encanta e ensina pais e filhos.Best-seller da Veja', NULL, '9788580570229', 0, 0, 0, 'mORT0kN1uBwC', 'Editora Intrinseca', 'http://books.google.com/books/content?id=mORT0kN1uBwC&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE70I9ckBRQpF_H-K8HjCVxBFibcLvlFai_IZrJPE2d0Sye5OTTX1H9jYnLc5GoponRyocpN2OayTpCKAPyvjxY9_0lQpo8v1pCmfbcCGgQhMv37MKq10iOF7wDRbDigQL1WEalDf&source=gbs_'),
(33, 'Os arquivos do semideus', 'Rick Riordan', '2012-11-13', '2025-06-12 15:16:58', 'Atenção jovens semideuses: preparem-se para ter acesso a arquivos altamente sigilosos.Compilado pelo escriba sênior do Acampamento Meio-Sangue, o sr. Rick Riordan, o conteúdo supersecreto apresentado em Os arquivos do semideus inclui os relatórios de três das mais perigosas aventuras de Percy Jackson, informações valiosas conseguidas em entrevistas com os mais importantes heróis da saga, um utilíssimo mapa do acampamento e muito, muito mais. Leiam e tornem-se especialistas no universo dos deuses e heróis do Olimpo.', NULL, '9788580570892', 0, 0, 0, '8cESU6jXAOgC', 'Editora Intrinseca', 'http://books.google.com/books/content?id=8cESU6jXAOgC&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE737A4KFwaat6f9uWrJA1XicW-hKo2jkveA_AnpgiMNlU07CD8hCI5DPaiGTQ4rHv2xF27AZgA4_ODj6M2Ot0MJZ4-ximDKiMgQdXL5W3guMP_ky_q8Sn_R0RFejqYHbMaQ2igUW&source=gbs_');
INSERT INTO `livros` (`id_livro`, `nome_livro`, `autor_livro`, `data_livro`, `data_cadastro_livro`, `descricao_livro`, `caminho_livro`, `ISBN_livro`, `favoritos_livro`, `like_livro`, `deslike_livro`, `id_google_book`, `editora_livro`, `capa_livro`) VALUES
(34, 'A dança do viúvo - Tres Navarre - vol. 2', 'Rick Riordan', '2014-06-10', '2025-06-12 15:18:44', 'Segundo volume da série Tres Navarre. A cantora Miranda Daniels está fazendo um sucesso literalmente de matar nas casas de show do Texas. Seu produtor e uma das integrantes de sua banda foram assassinados, e seu agente está desaparecido. Para piorar, sua fita demo, que deveria ser enviada a uma grande gravadora para o fechamento de um contrato milionário, também sumiu. Agora, cabe ao detetive particular apreciador de tequila e mestre de tai chi chuan Tres Navarre desvendar esse mistério e proteger Miranda das armadilhas da indústria musical, antes que haja novas vítimas.', NULL, '9788501042736', 0, 0, 0, '2IXGAwAAQBAJ', 'Editora Record', 'http://books.google.com/books/publisher/content?id=2IXGAwAAQBAJ&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE72SMRH3IcGlkn9f2VhInUhKlllNjxTdwW2VE1bmZqrsMCg6CbtIyEt3QGwpDyLAWz4Acuqx7LLgYdVMuqmyQVX-0JEaqln4k9MlI3c2g_08qhelJcifwl3uJO3sAl8bpAcppU-A&s'),
(35, 'A batalha do labirinto', 'Rick Riordan', '2012-11-13', '2025-06-12 15:23:30', 'O Monte Olimpo está em perigo. Cronos, o perverso titã que foi destronado e feito em pedaços pelos doze deuses olimpianos, prepara um retorno triunfal. O primeiro passo de suas tropas será atacar e destruir o campo de treinamento dos heróis, filhos de deuses com mortais, que desde a Grécia Antiga combatem na linha de frente em defesa dos olimpianos.Para assegurar que o refúgio de semideuses, o Acampamento Meio-Sangue, não seja invadido, Percy Jackson, Tyson, Annabeth e Grover são destacados para uma importante missão: deter as forças de Cronos antes que se aproximem do acampamento, no emaranhado de corredores do temido Labirinto de Dédalo – um interminável universo subterrâneo que, a cada curva, revela as mais aterrorizantes surpresas.', NULL, '9788580570847', 0, 0, 0, '5zEUw9jXaB4C', 'Editora Intrinseca', 'http://books.google.com/books/content?id=5zEUw9jXaB4C&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE71TAIkrrrtsmGiD0VhaOt74VpY318_EykONJsABtAMqyBPbc0JMT45w301NoRttmCKTfElmHs4YDskgPz6YyiEmHg_96MNiooB29rgQtekxMq_n52iNan7TUVSbSi4-5MjzxMeW&source=gbs_'),
(36, 'Os segredos de Baker Street', 'Arthur Conan Doyle', '2021-05-01', '2025-06-12 15:24:50', 'Sherlok Holmes é o detetive mais famoso da literatura.Criação do autor e médico, Sir Arthur Conan Doyle, o personagem utiliza métodos científicos e lógica dedutiva em suas investigações e se tornou um ícone cultural britânico. Os contos de Conan Doyle foram adaptados para rádio e também cinema e se consagrou na cultura popular, influenciando outras obras e impactando o romance policial e as escritas de mistério. Conheça algumas das aventuras de Holmes e seu amigo Dr. Watson na coleção Os segredos de Baker Street com as obras: Um estudo em vermelho, O signo dos quatro e Memórias de Sherlock Holmes.', NULL, '9786589678700', 0, 0, 0, '3QQpEAAAQBAJ', 'Tricaju', 'http://books.google.com/books/publisher/content?id=3QQpEAAAQBAJ&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE73rcH94AZXgeEKtDxmMG4AQKIj4iEMNBpq0RYFzxNkhMmPkyjJyPlIUBY6h-YYIyKvPAoesNUPqgfNCgyTu_S0EfaMuV01z5oTsQWdwjVedms9IPlThYJqHgqUYYo8DiUhn9saN&s'),
(37, 'Sherlock Holmes: Volume 1', 'Arthur Conan Doyle', '2015-05-15', '2025-06-12 15:28:28', '\"Todo mundo sabe quem foi o detetive Sherlock Holmes, pode enumerar boa parte dos seus hábitos ou objetos preferidos e repetir algumas de suas frases célebres. Elementar. Mas o fato é que esse notável cavalheiro britânico, de astúcia incomparável e vícios mundanos, que povoa o imaginário coletivo dos ingleses desde 1887, \'jamais viveu e nunca morrerá\'.\" — O GloboESTE VOLUME CONTÉM OS LIVROS: VOLUME 1  Um estudo em vermelho (romance) - 1887  O sinal dos quatro (romance) - 1890  As aventuras de Sherlock Holmes (contos) - 1892CONHEÇA OS DEMAIS LIVROS DESTA COLEÇÃO! VOLUME 2  Memórias de Sherlock Holmes (contos) - 1894  O cão dos Baskerville (romance) - 1902 VOLUME 3  A volta de Sherlock Holmes (contos) - 1905  O vale do medo (romance) - 1915 VOLUME 4  Os últimos casos de Sherlock Holmes (contos) - 1917  Histórias de Sherlock Holmes (contos) - 1927', NULL, '9788520924112', 0, 0, 0, 'KYarDwAAQBAJ', 'HarperCollins Brasil', 'http://books.google.com/books/publisher/content?id=KYarDwAAQBAJ&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE73LE0qg3yLH0qcTdZWfJGDKiOR5FYEMBoRZwY4oFb0rLatImHx6URsoSdgBwjOcDWBnay0Ah9aiqgUa9HPniYXGuWkH_Gi3-IcW6Lf75hrovM0lDzd_W_v64uE4ynbwguV_VGwg&s'),
(38, 'A tumba do tirano', 'Rick Riordan', '2019-10-11', '2025-06-12 15:49:25', 'O deus mais injustiçado do Olimpo está de volta em novo livro de Rick Riordan, autor que já vendeu 6,5 milhões de exemplares no BrasilOs tempos estão difíceis para ex-deidades que quase destruíram a humanidade, foram expulsas do Olimpo, perderam os poderes divinos e, de quebra, conquistaram a antipatia de imperadores sanguinários. Apolo, o deus mais glorioso e belo que já existiu, agora é Lester Papadopoulos, um adolescente desajeitado de 16 anos que, para reconquistar seu lugar, precisa libertar cinco oráculos que estão na mais completa escuridão.Não é de hoje que Apolo tem passado por poucas e boas em sua temporada terrena. Nos três livros já publicados da série As provações de Apolo, vimos o ex-deus enfrentar terríveis inimigos: um psicopata piromaníaco, um crush das antigas com sede de vingança e até um dos imperadores mais temidos da Antiguidade. Como se isso já não fosse o bastante, ele só pôde contar com sua inteligência e sagacidade humanas (bem reduzidas, como é de se esperar), já que seus poderes foram extintos por tempo indeterminado. A sorte é que nessa jornada ele teve a ajuda de amigos valiosos, como Percy Jackson, Leo Valdez e Meg McCaffrey.Em A tumba do tirano, sua mais nova aventura, Apolo precisa correr até o Acampamento Júpiter, lar dos semideuses romanos, para ajudá-los a se defenderem da fúria do Triunvirato de imperadores, que fará de tudo para destruí-los. É hora de unir forças com Hazel, Reyna, Frank, Tyson, Ella e muitos outros nessa batalha que promete ser a mais difícil e dramática de suas vidas. Infelizmente, a chance de eles saírem vivos reside na tumba de um dos tiranos romanos mais odiados e ardilosos da história, conhecido pela soberba e pela crueldade. Se alguém achou que seria fácil voltar ao Olimpo, achou errado, é claro.', NULL, '9788551005712', 0, 0, 0, 'zgqyDwAAQBAJ', 'Editora Intrinseca', 'http://books.google.com/books/publisher/content?id=zgqyDwAAQBAJ&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE73Oxc3j-RcRJDrQ_ExbDHp6poMXgAd-rPTKgMs-SVewYvfj0j04k4XCE1PKLI42OOtLRSExNACxrRG3f9rSSjC3HOHNl_7-RTTlG_DFnWjTL3IGZgG0vkBkrqa6OCOQwQGF6Y_U&s'),
(39, 'Segredos do acampamento meio-sangue', 'Rick Riordan', '2018-03-26', '2025-06-12 16:29:55', 'O livro definitivo sobre o Acampamento Meio-Sangue para os fãs de Percy Jackson Todo leitor apaixonado pelos livros de Rick Riordan e fã de Percy Jackson já se imaginou passando uns dias no famoso Acampamento Meio-Sangue. Nesse livro extra da série As provações de Apolo, o leitor será guiado por Percy Jackson e outros residentes para sentir na pele como é a vida de um semideus e conhecer a rotina, curiosidades e segredos do acampamento e seus chalés mágicos. Segredos do Acampamento Meio-Sangue reúne diversas histórias de feitos heroicos de semideuses que moraram ou apenas visitaram o acampamento antes de seguirem seus destinos, além das palavras de sabedoria divina do deus Apolo e uma imperdível sessão de perguntas e respostas. • Rick Riordan tem cinco séries de aventura publicadas sobre as mitologias grega, romana, egípcia e nórdica que somam 6 milhões de exemplares vendidos no Brasil. • Divertido, informativo e com belas ilustrações, Segredos do Acampamento Meio-Sangue reúne os elementos clássicos do universo de Rick Riordan. É o livro perfeito para o fã que aguarda ansiosamente os próximos volumes da série As provações de Apolo. “Este guia é a leitura ideal para qualquer fã de Rick Riordan. Faz o leitor se sentir como se fizesse parte daquele universo.” Deseret News', NULL, '9788551002988', 0, 0, 0, 'ox_8zwEACAAJ', 'Intrínseca', NULL),
(40, 'O oráculo oculto', 'Rick Riordan', '2016-05-03', '2025-06-12 16:30:22', 'Como você pune um deus imortal? Transformando-o em humano, claro!Depois de despertar a fúria de Zeus por causa da guerra com Gaia, Apolo é expulso do Olimpo e vai parar na Terra, mais precisamente em uma caçamba de lixo em um beco sujo de Nova York. Fraco e desorientado, ele agora é Lester Papadopoulos, um adolescente mortal com cabelo encaracolado, espinhas e sem abdome tanquinho. Sem seus poderes, a divindade de quatro mil anos terá que descobrir como sobreviver no mundo moderno e o que fazer para cair novamente nas graças de Zeus.O problema é que isso não vai ser tão fácil. Apolo tem inimigos para todos os gostos: deuses, monstros e até mortais. Com a ajuda de Meg McCaffrey, uma semideusa sem-teto e maltrapilha, e Percy Jackson, ele chega ao Acampamento Meio-Sangue em busca de ajuda, mas acaba se deparando com ainda mais problemas. Vários semideuses estão desaparecidos e o Oráculo de Delfos, a fonte de profecias, está na mais completa escuridão.Agora, o ex-deus terá que solucionar esses mistérios, recuperar o oráculo e, mais importante, voltar a ser o imortal belo e gracioso que todos amam.Em O oráculo oculto Rick Riordan retoma os acontecimentos do último livro da série Os heróis do Olimpo.Personagens queridos do público, como Percy Jackson, Will Solace e Nico di Angelo, estão de volta, vivendo novas aventuras e desvendando novos mistérios.Best seller VEJA', NULL, '9788580579291', 0, 0, 0, 'BXnhCwAAQBAJ', 'Editora Intrinseca', 'http://books.google.com/books/publisher/content?id=BXnhCwAAQBAJ&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE7105kOwvtFmarUa3O1Tnv86WQQcGD9fPUAtWqIvCWf31Tkd3RRpRr5P01xyQRe9cYLRCJWx_A7CFw500jBkWG1l-kCutt613K7DwMVK8ga_v2gTk73qSIPL5nNg2F7Q_n1258lJ&s'),
(41, 'O labirinto de fogo', 'Rick Riordan', '2018-05-03', '2025-06-12 16:39:37', 'No terceiro livro da série, o deus Apolo vai ser posto à prova ao enfrentar uma perigosa armadilha.Apolo, o deus mais glorioso e belo que já existiu, causou a ira de Zeus e foi expulso do Olimpo. Ele foi parar na terra, mais precisamente em uma caçamba de lixo em Nova York. Agora, ele é Lester Papadopoulos, um mortal desajeitado e sem poderes divinos. Para reconquistar seu lugar ao lado do todo-poderoso, Apolo terá que libertar cinco oráculos desaparecidos.Com a ajuda de alguns amigos semideuses, como Percy Jackson, Leo Valdez e a desbocada Meg McCaffrey, Apolo conseguiu sobreviver às duas primeiras provações de sua temporada terrena. Agora, ele vai ter que enfrentar mais um componente do triunvirato do mal formado por antigos imperadores romanos e deve descer até o Labirinto de Dédalo para impedir que o terceiro imperador destrua o próximo oráculo da lista.Outros livros da série:O oráculo oculto, A profecia das sombras e Segredos do acampamento meio-sangue', NULL, '9788551003329', 0, 0, 0, 'tPFUDwAAQBAJ', 'Editora Intrinseca', 'http://books.google.com/books/publisher/content?id=tPFUDwAAQBAJ&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE73_jEjO4LyJreugf2tYhjk_IFEXnHfUn5nFit8A5qW-oKYvx_LOme-Y3arT3K5DklyrEmSwTf20SR21I4pDKua33Wkqs3z2j_jlhEc6S2V69eZUpyNzXsaTQ_9eQObjX2K-nCYT&s'),
(42, 'A Filha das Profundezas', 'Rick Riordan', '2021-11-09', '2025-06-12 16:47:34', '  Em sua mais nova aventura, Rick Riordan constrói uma releitura apaixonante e divertida de Vinte mil léguas submarinas , clássico de Júlio Verne    Depois de nos encantar e nos fazer gargalhar com as façanhas e confusões de inúmeros deuses, semideuses e pobres mortais desavisados, o autor best-seller da série Percy Jackson e os olimpianos se lança em uma nova aventura, dessa vez no fundo do mar. Inspirado em  Vinte mil léguas submarinas, clássico de Júlio Verne, Riordan nos conduz em uma viagem eletrizante até as profundezas do oceano.  Ainda em terra firme, conhecemos Ana Dakkar, uma das estudantes mais dedicadas da Academia Harding-Pencroft, uma escola que forma os melhores cientistas marinhos, guerreiros navais, navegadores e exploradores submarinos do mundo. Seus pais morreram em uma expedição científica dois anos antes, e a única família que lhe restou foi o irmão mais velho, Dev. A jovem e os demais alunos de sua turma se preparam para uma prova final importante e secreta. Ana tem muitas expectativas para a atividade, que vão por água abaixo quando testemunha uma terrível tragédia que mudará para sempre sua vida e a de seus amigos. Para piorar, a escola rival, o Instituto Land, está determinada a transformar os alunos da Harding-Pencroft em comida de peixe. Animador, não? Correndo contra o tempo, contra inimigos ameaçadores e contra as próprias inseguranças, Ana descobre ser herdeira de um legado ancestral lendário, e precisará liderar uma missão mortal para salvar seus companheiros e o lugar que aprendeu a chamar de lar.  Com uma trama que reúne mistério, aventura, personagens apaixonantes e inúmeras referências à obra de Júlio Verne,  A filha das profundezas é uma história imperdível sobre família, amizade e coragem, trazendo o olhar único de Rick Riordan sobre os erros e acertos daqueles que vieram antes de nós. ', NULL, '9786555601084', 0, 0, 0, 'aY3_zwEACAAJ', 'Intrínseca', NULL),
(43, 'Alice no País das Maravilhas', 'Lewis Carroll', '2021-12-06', '2025-06-12 17:44:09', ' Escrita em 1862, fruto da imaginação extraordinária de Lewis Carroll, esta obra transporta o leitor a uma viagem psicodélica e repleta de disparates. Tudo começa quando Alice se depara com um coelho branco que passa por ela correndo, apressado, e decide segui-lo até sua toca. A partir daí, um novo mundo se descortina diante dessa garotinha curiosa, que vai viver fantásticas aventuras repletas de acontecimentos absurdos ao lado de personagens excêntricos como o Chapeleiro Maluco, a Rainha de Copas, a Tartaruga Falsa e o Gato de Cheshire. Uma obra dinâmica, carregada de simbolismos e que, há mais de 150 anos, vem encantando leitores de todas as idades.  ', NULL, '9786587817651', 0, 0, 0, 'miq7zwEACAAJ', 'Instituto Brasileiro de Cultura Ltda', 'http://books.google.com/books/content?id=miq7zwEACAAJ&printsec=frontcover&img=1&zoom=1&imgtk=AFLRE73jjo4-R2yZvWNdqxSwJ7wMhIl_r046kRp1Z-10MBvNxdjgNKdi9cxTb1OEeM6oXqyFld03HzJH2031qBrUfOlAQS6zVikNRovPVgVczMm2_Oqp5JCKM74J9Ke37FuKrwVsFYcp&source=gbs_api');

-- --------------------------------------------------------

--
-- Estrutura para tabela `livro_generos`
--

DROP TABLE IF EXISTS `livro_generos`;
CREATE TABLE IF NOT EXISTS `livro_generos` (
  `id_livro_genero` int NOT NULL AUTO_INCREMENT,
  `id_genero` int NOT NULL,
  `id_livro` int NOT NULL,
  PRIMARY KEY (`id_livro_genero`),
  KEY `FK_15` (`id_livro`),
  KEY `FK_16` (`id_genero`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `livro_generos`
--

INSERT INTO `livro_generos` (`id_livro_genero`, `id_genero`, `id_livro`) VALUES
(4, 6, 33),
(5, 1, 34),
(6, 2, 35),
(7, 1, 36),
(8, 1, 37),
(9, 16, 37),
(10, 3, 37),
(11, 2, 38),
(12, 8, 38),
(13, 3, 38),
(14, 1, 39),
(15, 3, 39),
(16, 2, 40),
(17, 8, 40),
(18, 3, 40),
(19, 2, 41),
(20, 8, 41),
(21, 3, 41),
(22, 2, 42),
(23, 3, 42),
(24, 8, 42),
(25, 6, 43),
(26, 8, 43),
(27, 3, 43);

-- --------------------------------------------------------

--
-- Estrutura para tabela `perfis`
--

DROP TABLE IF EXISTS `perfis`;
CREATE TABLE IF NOT EXISTS `perfis` (
  `id_perfil` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `descricao_perfil` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sem descrição',
  `foto_perfil` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `username_perfil` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_perfil` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_perfil`),
  UNIQUE KEY `id_usuario` (`id_usuario`),
  UNIQUE KEY `username_perfil` (`username_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `perfis_adm`
--

DROP TABLE IF EXISTS `perfis_adm`;
CREATE TABLE IF NOT EXISTS `perfis_adm` (
  `id_perfil_adm` int NOT NULL AUTO_INCREMENT,
  `id_usuario_adm` int NOT NULL,
  `descricao_perfil_adm` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sem descrição',
  `foto_perfil_adm` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `username_perfil_adm` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_perfil_adm` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_perfil_adm`),
  UNIQUE KEY `id_usuario_adm` (`id_usuario_adm`),
  UNIQUE KEY `username_perfil_adm` (`username_perfil_adm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id_post` int NOT NULL AUTO_INCREMENT,
  `id_perfil` int NOT NULL,
  `descricao_post` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagem_post` blob,
  `data_post` datetime DEFAULT CURRENT_TIMESTAMP,
  `like_post` int NOT NULL DEFAULT '0',
  `deslike_post` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_post`),
  KEY `FK_3` (`id_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `preferencias`
--

DROP TABLE IF EXISTS `preferencias`;
CREATE TABLE IF NOT EXISTS `preferencias` (
  `id_preferencia` int NOT NULL,
  `id_genero` int NOT NULL,
  `id_perfil` int NOT NULL,
  PRIMARY KEY (`id_preferencia`),
  KEY `FK_17` (`id_perfil`),
  KEY `FK_18` (`id_genero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `progressos`
--

DROP TABLE IF EXISTS `progressos`;
CREATE TABLE IF NOT EXISTS `progressos` (
  `id_progresso` int NOT NULL AUTO_INCREMENT,
  `id_livro` int NOT NULL,
  `id_perfil` int NOT NULL,
  `data_inicio_progresso` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `progresso` decimal(5,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id_progresso`),
  KEY `FK_7` (`id_livro`),
  KEY `FK_8` (`id_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `suporte`
--

DROP TABLE IF EXISTS `suporte`;
CREATE TABLE IF NOT EXISTS `suporte` (
  `id_suporte` int NOT NULL AUTO_INCREMENT,
  `login_suporte` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha_suporte` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_suporte`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `suporte`
--

INSERT INTO `suporte` (`id_suporte`, `login_suporte`, `senha_suporte`) VALUES
(1, 'suporte', '$2y$10$TOOgIYS7A0eCo3i5nGniRObmiM4AEzAOHVvxA/QWqrG2bmT7bNv4K'),
(2, 'adm', 'adm');

-- --------------------------------------------------------

--
-- Estrutura para tabela `temas`
--

DROP TABLE IF EXISTS `temas`;
CREATE TABLE IF NOT EXISTS `temas` (
  `id_tema` int NOT NULL AUTO_INCREMENT,
  `id_perfil` int NOT NULL,
  `tema` enum('claro','esuro','do dispositivo') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_tema`),
  KEY `FK_4` (`id_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `email_usuario` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha_usuario` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apelido_usuario` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username_usuario` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone_usuario` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_nasc_usuario` date NOT NULL,
  `data_cadas_usuario` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status_usuario` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT (_utf8mb4'Confirmação de email pendente'),
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email_usuario` (`email_usuario`),
  UNIQUE KEY `username_usuario` (`username_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `email_usuario`, `senha_usuario`, `apelido_usuario`, `username_usuario`, `telefone_usuario`, `data_nasc_usuario`, `data_cadas_usuario`, `status_usuario`) VALUES
(97, 'libre.noreply@gmail.com', '$2y$10$w4XfsKBnl8ZldHsP8Hv68uBsKbtPDaWrIMKuDnMtEEkHmTMSPIA7u', 'Libre', 'Libre', '11943553988', '2000-02-20', '2025-05-30 23:16:59', 'ativo'),
(116, 'allanmelo979@gmail.com', '$2y$10$81T7EvqW5k.JRFFUND0Y4O86ki6cpdGPFDPieLwV1ik0.8FDGpuMy', 'allan', 'allanwrynn', '11945335338', '2000-02-20', '2025-06-04 15:43:19', 'ativo'),
(117, 'pa@email.com', '$2y$10$IEpVz.GxufAmBFer2bnVRu3/Yg3aMZ09YX1Hb3jnY76.YCczfLeTm', 'pa', 'papa', '11943553518', '2000-02-20', '2025-06-04 16:21:18', 'ativo'),
(122, 'na2c@email.com', '$2y$10$Hzl8mdXBY8HiuW028j5k4Omduc8JtFJVT3V0F4DgJg7Vh5psTw5rS', 'Naczx', 'Nac12x', '11943578978', '2000-02-20', '2025-06-06 21:11:31', 'ativo'),
(124, 'sla@email.com', '$2y$10$y2OK5zTZpKSSHD4lRu7VL.TlVV.LSpCtpkpfu1NtzjtRnuIGovc4S', 'sla', 'sla123', '11987654981', '2000-02-20', '2025-06-11 18:26:03', 'ativo'),
(125, 'Cas@email.com', '$2y$10$cIH/jRj6QLwkOPdpAUeZG.GNVs6jLkYXohZmpXV3TUIaKLbA/uQZC', 'Cas', 'cas', '11943553458', '2000-02-20', '2025-06-11 19:11:08', 'ativo');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios_adm`
--

DROP TABLE IF EXISTS `usuarios_adm`;
CREATE TABLE IF NOT EXISTS `usuarios_adm` (
  `id_usuario_adm` int NOT NULL AUTO_INCREMENT,
  `email_usuario_adm` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha_usuario_adm` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apelido_usuario_adm` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username_usuario_adm` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone_usuario_adm` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_nasc_usuario_adm` date NOT NULL,
  `data_cadas_usuario_adm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuario_adm`),
  UNIQUE KEY `email_usuario_adm` (`email_usuario_adm`),
  UNIQUE KEY `username_usuario_adm` (`username_usuario_adm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `vitrines`
--

DROP TABLE IF EXISTS `vitrines`;
CREATE TABLE IF NOT EXISTS `vitrines` (
  `id_vitrine` int NOT NULL AUTO_INCREMENT,
  `nome_vitrine` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `autor_vitrine` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_vitrine` datetime DEFAULT NULL,
  `data_cadastro_vitrine` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `descricao_vitrine` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sem descrição',
  `ISBN_vitrine` int DEFAULT NULL,
  `favoritos_vitrine` int NOT NULL DEFAULT '0',
  `like_vitrine` int NOT NULL DEFAULT '0',
  `deslike_vitrine` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_vitrine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `amizades`
--
ALTER TABLE `amizades`
  ADD CONSTRAINT `FK_19` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `FK_20` FOREIGN KEY (`id_perfil`) REFERENCES `perfis` (`id_perfil`);

--
-- Restrições para tabelas `avaliacoes`
--
ALTER TABLE `avaliacoes`
  ADD CONSTRAINT `FK_11` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `FK_12` FOREIGN KEY (`id_livro`) REFERENCES `livros` (`id_livro`);

--
-- Restrições para tabelas `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `FK_5` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id_post`),
  ADD CONSTRAINT `FK_6` FOREIGN KEY (`id_perfil`) REFERENCES `perfis` (`id_perfil`);

--
-- Restrições para tabelas `comentario_avaliacoes`
--
ALTER TABLE `comentario_avaliacoes`
  ADD CONSTRAINT `FK_21` FOREIGN KEY (`id_avaliacao`) REFERENCES `avaliacoes` (`id_avaliacao`),
  ADD CONSTRAINT `FK_22` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Restrições para tabelas `comentario_comentarios`
--
ALTER TABLE `comentario_comentarios`
  ADD CONSTRAINT `FK_13` FOREIGN KEY (`id_comentario`) REFERENCES `comentarios` (`id_comentario`),
  ADD CONSTRAINT `FK_14` FOREIGN KEY (`id_perfil`) REFERENCES `perfis` (`id_perfil`);

--
-- Restrições para tabelas `favoritos`
--
ALTER TABLE `favoritos`
  ADD CONSTRAINT `FK_10` FOREIGN KEY (`id_perfil`) REFERENCES `perfis` (`id_perfil`),
  ADD CONSTRAINT `FK_9` FOREIGN KEY (`id_livro`) REFERENCES `livros` (`id_livro`),
  ADD CONSTRAINT `FK_9_1` FOREIGN KEY (`id_vitrine`) REFERENCES `vitrines` (`id_vitrine`);

--
-- Restrições para tabelas `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `FK_23` FOREIGN KEY (`id_perfil`) REFERENCES `perfis` (`id_perfil`),
  ADD CONSTRAINT `FK_24` FOREIGN KEY (`id_livro`) REFERENCES `livros` (`id_livro`),
  ADD CONSTRAINT `FK_25` FOREIGN KEY (`id_vitrine`) REFERENCES `vitrines` (`id_vitrine`);

--
-- Restrições para tabelas `livro_generos`
--
ALTER TABLE `livro_generos`
  ADD CONSTRAINT `FK_15` FOREIGN KEY (`id_livro`) REFERENCES `livros` (`id_livro`),
  ADD CONSTRAINT `FK_16` FOREIGN KEY (`id_genero`) REFERENCES `generos` (`id_genero`);

--
-- Restrições para tabelas `perfis`
--
ALTER TABLE `perfis`
  ADD CONSTRAINT `FK_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Restrições para tabelas `perfis_adm`
--
ALTER TABLE `perfis_adm`
  ADD CONSTRAINT `FK_1_1` FOREIGN KEY (`id_usuario_adm`) REFERENCES `usuarios_adm` (`id_usuario_adm`);

--
-- Restrições para tabelas `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `FK_3` FOREIGN KEY (`id_perfil`) REFERENCES `perfis` (`id_perfil`);

--
-- Restrições para tabelas `preferencias`
--
ALTER TABLE `preferencias`
  ADD CONSTRAINT `FK_17` FOREIGN KEY (`id_perfil`) REFERENCES `perfis` (`id_perfil`),
  ADD CONSTRAINT `FK_18` FOREIGN KEY (`id_genero`) REFERENCES `generos` (`id_genero`);

--
-- Restrições para tabelas `progressos`
--
ALTER TABLE `progressos`
  ADD CONSTRAINT `FK_7` FOREIGN KEY (`id_livro`) REFERENCES `livros` (`id_livro`),
  ADD CONSTRAINT `FK_8` FOREIGN KEY (`id_perfil`) REFERENCES `perfis` (`id_perfil`);

--
-- Restrições para tabelas `temas`
--
ALTER TABLE `temas`
  ADD CONSTRAINT `FK_4` FOREIGN KEY (`id_perfil`) REFERENCES `perfis` (`id_perfil`);

DELIMITER $$
--
-- Eventos
--
DROP EVENT IF EXISTS `delete_exp_codigo`$$
CREATE DEFINER=`root`@`localhost` EVENT `delete_exp_codigo` ON SCHEDULE EVERY 1 MINUTE STARTS '2025-06-05 21:09:26' ON COMPLETION NOT PRESERVE ENABLE DO DELETE FROM codigos_verificacao WHERE expires_at <= NOW()$$

DROP EVENT IF EXISTS `delete_user_non_verif`$$
CREATE DEFINER=`root`@`localhost` EVENT `delete_user_non_verif` ON SCHEDULE EVERY 10 MINUTE STARTS '2025-06-06 19:05:19' ON COMPLETION NOT PRESERVE ENABLE DO DELETE FROM usuarios 
WHERE status_usuario = 'Confirmação de email pendente' 
AND data_nasc_usuario <= NOW() - INTERVAL 15 MINUTE$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

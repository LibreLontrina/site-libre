-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 11/06/2025 às 22:50
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
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `data_livro` datetime DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `livros`
--

INSERT INTO `livros` (`id_livro`, `nome_livro`, `autor_livro`, `data_livro`, `data_cadastro_livro`, `descricao_livro`, `caminho_livro`, `ISBN_livro`, `favoritos_livro`, `like_livro`, `deslike_livro`, `id_google_book`, `editora_livro`, `capa_livro`) VALUES
(1, 'Harry Potter e a Pedra Filosofal', 'J.K. Rowling', '1997-06-26 00:00:00', '2025-06-11 18:13:49', 'Um jovem bruxo descobre sua verdadeira origem e vai estudar em Hogwarts.', 0x63616d696e686f2f706172612f6f2f6c6976726f2f68617272795f706f747465722e706466, '2147483647', 0, 0, 0, 'abc123def456', '', NULL),
(2, 'Teste', 'Eu', '2000-02-20 00:00:00', '2025-06-11 18:37:07', 'sla', NULL, '1234567891234', 0, 0, 0, 'abdc1234', '', NULL),
(3, 'Como eu era antes de você', 'Jojo Moyes', '2013-04-19 00:00:00', '2025-06-11 18:49:59', 'Aos 26 anos, Louisa Clark não tem muitas ambições. Ela mora com os pais, a irmã mãe solteira, o sobrinho pequeno e um avô que precisa de cuidados constantes desde que sofreu um derrame. Trabalha como garçonete num café, um emprego que não paga muito, mas ajuda nas despesas, e namora Patrick, um triatleta que não parece interessado nela. Não que ela se importe.Quando o café fecha as portas, Lou é obrigada a procurar outro emprego. Sem muitas qualificações, consegue trabalho como cuidadora de um tetraplégico. Will Traynor, de 35 anos, é inteligente, rico e mal-humorado. Preso a uma cadeira de rodas depois de um acidente de moto, o antes ativo e esportivo Will desconta toda a sua amargura em quem estiver por perto. Tudo parece pequeno e sem graça para ele, que sabe exatamente como dar um fim a esse sentimento. O que Will não sabe é que Lou está prestes a trazer cor a sua vida. E nenhum dos dois desconfia de que irá mudar para sempre a história um do outro.Como eu era antes de você é uma história de amor e uma história de família, mas acima de tudo é uma história sobre a coragem e o esforço necessários para retomar a vida quando tudo parece acabado.“Incrivelmente comovente.” Marie Claire (Reino Unido)“Uma leitura extremamente envolvente e maravilhosamente romântica.” Daily Telegraph“Um livro impossível de largar.” USA Today“Como eu era antes de você é uma história sobre amor, aprendizado e perda. Um livro extraordinário.” Daily Mail“Uma história sobre como o amor é capaz de florescer nas situações mais improváveis.” Elle, Reino Unido“Em sua essência, um livro sobre duas pessoas que aprendem a ouvir uma a outra.” Independent on Sunday“Uma história de amor improvável. Um livro para ser devorado entre lágrimas.” O, The Oprah MagazineBEST-SELLER VEJA', NULL, '9788580573268', 0, 0, 0, '3wohEJsBaI0C', 'Editora Intrinseca', NULL),
(4, 'Ainda sou eu', 'Jojo Moyes', '2018-02-05 00:00:00', '2025-06-11 19:23:47', 'Sequência dos romances Como eu era antes de você e Depois de você, que arrebataram o coração de milhares de fãs, Ainda sou eu conta, pela perspectiva delicada e bem-humorada de Lou Clark, uma história comovente sobre escolhas, lealdade e esperança.Lou Clark chega em Nova York pronta para recomeçar a vida, confiante de que pode abraçar novas aventuras e manter seu relacionamento a distância. Ela é jogada no mundo dos super-ricos Gopnik — Leonard e a esposa bem mais nova, e um sem-fim de empregados e puxa-sacos. Lou está determinada a extrair o máximo dessa experiência, por isso se lança no trabalho e, antes que perceba, está inserida na alta sociedade nova-iorquina, onde conhece Joshua Ryan, um homem que traz consigo um sopro do passado de Lou.Enquanto tenta manter os dois lados de seu mundo unidos, ela tem que guardar segredos que não são seus e que podem mudar totalmente sua vida. E, quando a situação atinge um ponto crítico, ela precisa se perguntar: Quem é Louisa Clark? E como é possível reconciliar um coração dividido?Sequência dos romances Como eu era antes de você e Depois de você, que arrebataram o coração de milhares de fãs, Ainda sou eu conta, pela perspectiva delicada e bem-humorada de Lou Clark, uma história comovente sobre escolhas, lealdade e esperança.', NULL, '9788551002827', 0, 0, 0, 'ytFCDwAAQBAJ', 'Editora Intrinseca', 'http://books.google.com/books/publisher/content?id=ytFCDwAAQBAJ&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE71MKSK7o5sYkFXJ6mg_wMwjWsIWGyBcxPVnYVq0JQyDVPbnaeTDT6fumpWWqLqv12kT0g1blv7f-hcV_-F9iEDvqNTh0qodkQmnMCZesCv2Kd3PJEtDoWoNZwBqU-JxoilTDtgU&s'),
(5, 'A Loja dos Sonhos', 'Jojo Moyes', '2021-11-29 00:00:00', '2025-06-11 19:44:27', 'Inédito no Brasil, terceiro livro publicado por Jojo Moyes, A loja dos sonhos, trata de família e recomeços em meio a cafés, segredos e amigosAthene Forster abraçou a década de 1960 como poucos. Uma das jovens mais glamourosas de sua geração, era uma garota mimada e sem controle. Quando ela concorda em se casar, seus pais enfim respiram aliviados. Dois anos depois do casamento, contudo, os boatos de uma traição começaram a circular.Trinta e cinco anos depois, Suzanna Peacock percebe que ainda tem dificuldades para se desvencilhar das famigeradas histórias da mãe. Ao retornar a Dere Hampton, sua cidade natal, o único lugar onde encontra paz é em sua loja: uma mistura de cafeteria e brechó que vende de tudo um pouco, desde bijuterias de segunda mão a um expresso decente. Lá ela faz amigos de verdade pela primeira vez, entre eles Jessie, uma jovem curiosa e muito criativa, e Alejandro, um argentino solitário que trabalha no hospital local e compartilha com Suzanna o gosto por um bom café e um histórico familiar complicado.Mas, apesar dos esforços de Suzanna, o fantasma de Athene ainda a persegue. E só ao enfrentar tanto a família quanto seus medos ela será capaz de se reconciliar com o passado e encontrar a chave para sua própria história.', NULL, '9786555603361', 0, 0, 0, '_jRKEAAAQBAJ', 'Editora Intrinseca', 'http://books.google.com/books/publisher/content?id=_jRKEAAAQBAJ&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE72A-7OJQUy_EJcbc0VCRnOManBxu9YVScjEpX37DCflg-iYx-nst-T3JkuTZGiuL0rsSMjTIDOx4Eiyc78TeSy6WDH4kifjZaVIMOTrmucLjRdLFFhI3uQ4nwIufOkTClA1h4jz&s'),
(6, 'Harry Potter e a Câmara Secreta', 'J.K. Rowling', '2015-12-08 00:00:00', '2025-06-11 19:46:12', 'Há uma trama, Harry Potter. Uma trama para fazer coisas terríveis acontecerem na Escola de Magia e Bruxaria de Hogwarts este ano.\'O verão de Harry Potter incluiu o pior aniversário de todos, avisos macabros de um elfo doméstico chamado Dobby, e ser resgatado dos Dursleys por seu amigo Rony Weasley em um carro voador mágico! De volta à Escola de Magia e Bruxaria de Hogwarts para seu segundo ano, Harry ouve estranhos sussurros ecoando pelos corredores vazios - e então, os ataques começam! Estudantes são encontrados transformados em pedra... As previsões sinistras de Dobby parecem estar se tornando realidade.', NULL, '9781781103692', 0, 0, 0, 'hjcQCwAAQBAJ', 'Pottermore Publishing', 'http://books.google.com/books/publisher/content?id=hjcQCwAAQBAJ&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE72eNcj500wbV-ktzcKE3xFACFz3oJLASHoMVFgH4rc7xOmBZ9qFBuoIRitISMA3YCz0fxWNcAvFNL0toiShoSjYJCxN5BFwEHDHIK0HavdsHg4ju5oKM9O1mG2_7mYgl87JkSjc&s'),
(7, 'Os seguidores', 'Sara Shepard', '2022-01-28 00:00:00', '2025-06-11 19:46:49', 'Quando Helena Kelly desapareceu, Seneca Frazier, uma jovem envolvida em um site dedicado a buscar pistas para casos não solucionados, decidiu que iria até o fundo daquele mistério. E ela conseguiu... ou era o que achava. Conforme surgem revelações surpreendentes sobre o grupo de detetives amadores que a auxiliou naquela investigação, de repente Seneca começa a questionar tudo. E quando uma garota que poderia ser irmã gêmea de Helena desaparece, Seneca tem certeza: entre os milhares de seguidores que Chelsea tem nas redes sociais, existe um que tem planos mais sombrios para a influencer.  \"Era o dia perfeito para uma festa...\"  Até Chelsea Dawson, de vinte e um anos, desaparecer. A influencer foi vista pela última vez se divertindo em uma festa de verão no litoral de Nova Jersey com os amigos. Mas, depois de uma briga feia com o ex-namorado, ela some sem deixar vestígios. Quando Seneca, Maddox, Aerin e Madison recebem uma pista sobre esse suposto sequestro, eles percebem um detalhe sobre a vítima: ela é muito parecida com irmã de Aerin, Helena, morta cinco anos antes. Seneca está convencida de que sabe quem a matou e não consegue se livrar da sensação de que a mesma pessoa está envolvida no desaparecimento de Chelsea. Desesperada por respostas sobre as duas garotas e em busca da verdade por trás da morte de sua mãe, Seneca não vai parar até descobrir se os casos estão interligados. Depois que Maddox recebe um convite para uma visita ao litoral de ninguém menos que seu principal suspeito, o grupo de investigadores amadores começa uma nova e intensa perseguição. Cheio de segredos surpreendentes, reviravoltas e revelações comprometedoras, o segundo livro da série Os amadores, da autora bestseller do New York Times Sara Shepard, segue o rastro de um assassino brilhante e das pistas que inevitavelmente são deixadas quando alguém tem tantos seguidores. \"Os amadores é Sara Shepard em seu melhor: assustador, romântico e cheio de surpresas.\" – Cecily von Ziegesar, autora de Gossip Girl    \"Vida longa à rainha dos segredos! Os amadores é um thriller sombrio e sinistro para preencher o vazio que Pretty Little Liars  deixou no meu coração!\" – Danielle Paige, autora de Dorothy tem que morrer   \"Os amadores faz você querer entrar em uma aventura com Sara Shepard. Ela consegue juntar pessoas, situações e encontrar mistério na vida cotidiana. E faz isso com facilidade, página por página.\" – Caroline Kepnes, autora de Você  ', NULL, '9786555950953', 0, 0, 0, '8flVEAAAQBAJ', 'Editora Rocco', 'http://books.google.com/books/publisher/content?id=8flVEAAAQBAJ&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE71oCKsiONR4lltWlgXORsjNAOqyvp0mUgUDDrSPH_SzieeDbh-mVesCBzh2FWJG5E3NOXTFU8LPzrpLu3Beo784mGQfhRa1ToI1fayRWjaw9-lDN-LVQA9s_e5GXUg49uUAjZ6F&s'),
(8, 'Antropoceno', 'John Green', '2021-08-24 00:00:00', '2025-06-11 19:48:25', 'Em seu primeiro livro de não ficção, o premiado autor de A culpa é das estrelas analisa as contradições e as maravilhas da humanidadeQue John Green é um dos autores contemporâneos mais queridos não é novidade. Sua sensibilidade e seu talento para traçar histórias inesquecíveis tornaram seus romances sucessos mundiais, e agora o celebrado escritor nos oferece uma necessária dose de esperança em sua estreia na não ficção. Refletindo sobre temas que vão de Super Mario Kart e o pôr do sol a pinturas rupestres e o hábito de procurar estranhos no Google, os ensaios perspicazes e bem-humorados reunidos nesta coletânea são uma celebração genuína da capacidade humana de se apaixonar pelo mundo.O termo “Antropoceno” foi proposto para designar a era geológica atual, em que os seres humanos remodelaram o planeta e sua biodiversidade de maneira profunda, para o bem e para o mal. A humanidade é cheia de facetas contraditórias e invenções intrigantes, e John Green se propõe a avaliá-las de forma nada imparcial. Afinal, no Antropoceno, não há observadores desinteressados, apenas participantes. Como o próprio autor reconhece, esses ensaios também são, de certa forma, uma autobiografia.Escrito em parte durante o turbulento período de pandemia global e baseado em seu podcast de sucesso,Antropoceno: notas sobre a vida na Terra nos guia pelas sutilezas dessa nova realidade e nos dá a segurança de que podemos até desconhecer o caminho que estamos seguindo, mas com certeza estamos em boa companhia.', NULL, '9786555602739', 0, 0, 0, 'obs8EAAAQBAJ', 'Editora Intrinseca', 'http://books.google.com/books/publisher/content?id=obs8EAAAQBAJ&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE71-ShVglFRtEdY8o8duw56xiANJbCP8MqgahGxXSISDuSCVF3H-3UOJqtxAJnN7bl3nmM5Dmme4Xrro3-2k0LCyAZUa1mZjD97bKtNtkwBLBiWfd2cv9Q3d8sqWgIsuhTCAkUxt&s'),
(9, 'Harry Potter e o Cálice de Fogo', 'J.K. Rowling', '2015-12-08 00:00:00', '2025-06-11 19:48:57', 'Haverá três tarefas, espaçadas durante o ano letivo, que servirão para testar os campeões de diferentes maneiras... sua perícia em magia, sua coragem, seus poderes de dedução e, naturalmente, sua capacidade de enfrentar o perigo.\'O Torneio Tribruxo será realizado em Hogwarts. Apenas bruxos acima dos dezessete anos de idade podem se inscrever - mas isso não impede que Harry sonhe em vencer a competição. E então, no Dia das Bruxas, quando o Cálice de Fogo faz sua seleção, Harry se surpreende ao ver que seu nome é um dos que a taça mágica escolhe. Ele terá de enfrentar tarefas mortais, dragões e bruxos das trevas, mas com a ajuda de seus melhores amigos, Ron e Hermione, talvez ele consiga sair dessa - vivo!', NULL, '9781781103715', 0, 0, 0, 'ZDgQCwAAQBAJ', 'Pottermore Publishing', 'http://books.google.com/books/publisher/content?id=ZDgQCwAAQBAJ&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE73llOh7LoWTg_HbxsD0iNSXN16fKbTd4F0lafI5uUBwIcJ0-kysamnz5aDt9g-QQqKuWSq1torlR7cVs7tVcb2el6YEK3NApxsSzrbz7cUDphWvdlOZiIyWuqO-Uvi4PdCOv2s6&s'),
(10, 'Honestamente: sinceramente?', 'Bruna Zielinski', '2021-05-28 00:00:00', '2025-06-11 19:50:20', 'Honestamente: Benjamin Park e Leonardo Guimarães não se suportam. Não foi sempre assim, mas uma grande briga há sete meses destruiu a amizade dos dois. Apesar de estudarem na mesma sala da faculdade e terem o mesmo grupo de amigos, Leo e Ben passaram a se evitar e, quando se esbarravam, discutiam até pelos motivos mais bobos. Porém, tudo muda entre eles quando se reencontram em uma festa. Sinceramente? O ódio jamais conseguiu mascarar o desejo ou a mágoa. Quando os dois percebem que não são capazes de ficar longe um do outro, decidem estabelecer regras. O Acordo Guimarães-Park coloca restrições na \"inimizade colorida\", e o difícil é não quebrar justamente a primeira regra: não se apaixonar. Esta história, escrita por Bruna Zielinski e publicada a partir de seleção da autora Babi Dewet, nasceu de uma fanfic inspirada em dois idols do k-pop e é recheada de atração e conflitos. Nela, a busca pela sintonia em um relacionamento parece sempre ter o efeito contrário. Enquanto navegam por problemas familiares e por suas próprias vulnerabilidades, Benjamin e Leonardo, tão diferentes quanto chá de hortelã e café, precisarão estar dispostos a conversar, perdoar e ouvir se quiserem se dar uma segunda chance. TAGS: DRAMA, FICANDO JUNTOS, FLUFFY, LEVEMENTE TRISTE, LISTAS, LOVE&HATE, MACHUCAR/CONFORTAR, POST-ITS, POV PRIMEIRA PESSOA', NULL, '9786555950663', 0, 0, 0, 'ZeYsEAAAQBAJ', 'Editora Rocco', 'http://books.google.com/books/publisher/content?id=ZeYsEAAAQBAJ&printsec=frontcover&img=1&zoom=6&edge=curl&imgtk=AFLRE71FzDoCJE42bv9P5vFdnR8-dBijY0SvRnSmSvuPZ_pKRYP1n-YtjohhHpYn6oWGOL-VaC4xthJG0c2OOuzV2grpDRzJmt8Ju0kjIcN5tU3yzncBoMhWoibZ78ZcEwiz1f653nro&s');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(116, 'allanmelo979@gmail.com', '$2y$10$caJbGFBGL7ec4/S44aYyB.I5ACpWlceoDk8maeTZyhI44951b/Z6m', 'allan', 'allanwrynn', '11945335338', '2000-02-20', '2025-06-04 15:43:19', 'ativo'),
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

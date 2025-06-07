-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 07/06/2025 às 01:07
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
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `codigos_verificacao`
--

INSERT INTO `codigos_verificacao` (`id_codigo`, `id_usuario`, `codigo`, `expires_at`, `created_at`, `tipo_codigo`) VALUES
(58, 116, 'DA4CD1', '2025-06-06 22:07:51', '2025-06-06 21:51:11', 'esqueci_senha');

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
  `id_perfil` int NOT NULL,
  `nome_livro` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `autor_livro` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_livro` datetime DEFAULT NULL,
  `data_cadastro_livro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `descricao_livro` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sem descrição',
  `caminho_livro` longblob NOT NULL,
  `ISBN_livro` int DEFAULT NULL,
  `favoritos_livro` int NOT NULL DEFAULT '0',
  `like_livro` int NOT NULL DEFAULT '0',
  `deslike_livro` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_livro`),
  KEY `FK_2` (`id_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `email_usuario`, `senha_usuario`, `apelido_usuario`, `username_usuario`, `telefone_usuario`, `data_nasc_usuario`, `data_cadas_usuario`, `status_usuario`) VALUES
(97, 'libre.noreply@gmail.com', '$2y$10$w4XfsKBnl8ZldHsP8Hv68uBsKbtPDaWrIMKuDnMtEEkHmTMSPIA7u', 'Libre', 'Libre', '11943553988', '2000-02-20', '2025-05-30 23:16:59', 'ativo'),
(111, 'cas@email.com', '$2y$10$fJMQI4NNadJz4LnxBs0G7u7.Del7ZERGv9Y4XeJQtbF5LeDgpN6PO', 'Cas', 'cas', '11943553448', '2000-02-20', '2025-06-04 13:27:53', 'ativo'),
(116, 'allanmelo979@gmail.com', '$2y$10$caJbGFBGL7ec4/S44aYyB.I5ACpWlceoDk8maeTZyhI44951b/Z6m', 'allan', 'allanwrynn', '11945335338', '2000-02-20', '2025-06-04 15:43:19', 'ativo'),
(117, 'pa@email.com', '$2y$10$IEpVz.GxufAmBFer2bnVRu3/Yg3aMZ09YX1Hb3jnY76.YCczfLeTm', 'pa', 'papa', '11943553518', '2000-02-20', '2025-06-04 16:21:18', 'ativo'),
(122, 'na2c@email.com', '$2y$10$Hzl8mdXBY8HiuW028j5k4Omduc8JtFJVT3V0F4DgJg7Vh5psTw5rS', 'Naczx', 'Nac12x', '11943578978', '2000-02-20', '2025-06-06 21:11:31', 'ativo');

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
-- Restrições para tabelas `livros`
--
ALTER TABLE `livros`
  ADD CONSTRAINT `FK_2` FOREIGN KEY (`id_perfil`) REFERENCES `perfis` (`id_perfil`);

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

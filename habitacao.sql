-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.5.8-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para habitacao
CREATE DATABASE IF NOT EXISTS `habitacao` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `habitacao`;

-- Copiando estrutura para tabela habitacao.cadastro
CREATE TABLE IF NOT EXISTS `cadastro` (
  `idcadastro` int(11) NOT NULL AUTO_INCREMENT,
  `titular_id` int(11) NOT NULL,
  `modalidade_id` int(11) NOT NULL,
  `dt_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idcadastro`),
  KEY `titular_id` (`titular_id`),
  KEY `cadastro_id` (`modalidade_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela habitacao.cadastro: 0 rows
DELETE FROM `cadastro`;
/*!40000 ALTER TABLE `cadastro` DISABLE KEYS */;
/*!40000 ALTER TABLE `cadastro` ENABLE KEYS */;

-- Copiando estrutura para tabela habitacao.conjuge
CREATE TABLE IF NOT EXISTS `conjuge` (
  `idconjuge` int(11) NOT NULL AUTO_INCREMENT,
  `titular_id` int(11) NOT NULL DEFAULT 0,
  `nome_conjuge` varchar(100) NOT NULL,
  `sexo_conjuge` char(1) NOT NULL,
  `cpf_conjuge` varchar(15) NOT NULL,
  `rg_conjuge` varchar(15) NOT NULL,
  `naturalidade_conjuge` varchar(50) NOT NULL,
  `orgao_exp_conjuge` varchar(50) NOT NULL,
  `dt_exp_conjuge` date NOT NULL,
  `escolaridade_conjuge` varchar(50) NOT NULL,
  `pcd_conjuge` char(1) NOT NULL,
  `tipo_pcd_conjuge` varchar(15) NOT NULL,
  `cid_conjuge` varchar(15) NOT NULL,
  `dt_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idconjuge`),
  UNIQUE KEY `cpf` (`cpf_conjuge`) USING BTREE,
  UNIQUE KEY `titular_id` (`titular_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela habitacao.conjuge: ~0 rows (aproximadamente)
DELETE FROM `conjuge`;
/*!40000 ALTER TABLE `conjuge` DISABLE KEYS */;
/*!40000 ALTER TABLE `conjuge` ENABLE KEYS */;

-- Copiando estrutura para tabela habitacao.enfermidade
CREATE TABLE IF NOT EXISTS `enfermidade` (
  `idenfermidade` int(11) NOT NULL AUTO_INCREMENT,
  `profissao_id` int(11) NOT NULL,
  `enfermidade` longtext NOT NULL,
  PRIMARY KEY (`idenfermidade`) USING BTREE,
  UNIQUE KEY `profissao_id` (`profissao_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela habitacao.enfermidade: 0 rows
DELETE FROM `enfermidade`;
/*!40000 ALTER TABLE `enfermidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `enfermidade` ENABLE KEYS */;

-- Copiando estrutura para tabela habitacao.enfermidadec
CREATE TABLE IF NOT EXISTS `enfermidadec` (
  `idenfermidadec` int(11) NOT NULL AUTO_INCREMENT,
  `profissaoc_id` int(11) NOT NULL,
  `enfermidade_conjuge` longtext NOT NULL,
  PRIMARY KEY (`idenfermidadec`) USING BTREE,
  UNIQUE KEY `profissao_id` (`profissaoc_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela habitacao.enfermidadec: 0 rows
DELETE FROM `enfermidadec`;
/*!40000 ALTER TABLE `enfermidadec` DISABLE KEYS */;
/*!40000 ALTER TABLE `enfermidadec` ENABLE KEYS */;

-- Copiando estrutura para tabela habitacao.historico
CREATE TABLE IF NOT EXISTS `historico` (
  `idhistorico` int(11) NOT NULL AUTO_INCREMENT,
  `cadastro_id` int(11) NOT NULL,
  `historico` text NOT NULL,
  `dt_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idhistorico`),
  KEY `cadastro_id` (`cadastro_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela habitacao.historico: 0 rows
DELETE FROM `historico`;
/*!40000 ALTER TABLE `historico` DISABLE KEYS */;
/*!40000 ALTER TABLE `historico` ENABLE KEYS */;

-- Copiando estrutura para tabela habitacao.modalidade
CREATE TABLE IF NOT EXISTS `modalidade` (
  `idmodalidade` int(11) NOT NULL AUTO_INCREMENT,
  `modalidade` varchar(100) NOT NULL,
  `edital` varchar(100) NOT NULL,
  `prazo` datetime NOT NULL,
  `vagas` int(11) NOT NULL,
  `dt_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idmodalidade`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela habitacao.modalidade: 3 rows
DELETE FROM `modalidade`;
/*!40000 ALTER TABLE `modalidade` DISABLE KEYS */;
INSERT INTO `modalidade` (`idmodalidade`, `modalidade`, `edital`, `prazo`, `vagas`, `dt_update`) VALUES
	(1, 'Modalidade I', '1', '2021-05-10 13:49:00', 11, '2021-05-10 13:50:01'),
	(2, 'Modalidade II', '22', '2021-05-09 13:48:00', 22, '2021-05-10 13:48:47'),
	(3, 'Modalidade III', '1', '2021-05-13 13:50:00', 11, '2021-05-10 14:01:36');
/*!40000 ALTER TABLE `modalidade` ENABLE KEYS */;

-- Copiando estrutura para tabela habitacao.moradia
CREATE TABLE IF NOT EXISTS `moradia` (
  `idmoradia` int(11) NOT NULL AUTO_INCREMENT,
  `titular_id` int(11) NOT NULL,
  `municipio` varchar(100) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `logradouro` varchar(100) NOT NULL,
  `numero_casa` varchar(10) NOT NULL,
  `situacao` varchar(10) NOT NULL,
  `tipo` varchar(10) NOT NULL,
  `condicao` varchar(10) NOT NULL,
  `caracteristica_uso` varchar(15) NOT NULL,
  `terreno` varchar(10) NOT NULL,
  `area_risco` char(1) NOT NULL DEFAULT 'N',
  `tipo_sinistro` varchar(50) DEFAULT NULL,
  `numero_sinistro` varchar(50) DEFAULT NULL,
  `dt_emissao_sinistro` date DEFAULT NULL,
  `tempo_moradia` varchar(20) NOT NULL,
  `comodo` text NOT NULL,
  `dt_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idmoradia`) USING BTREE,
  UNIQUE KEY `titular_id` (`titular_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela habitacao.moradia: 0 rows
DELETE FROM `moradia`;
/*!40000 ALTER TABLE `moradia` DISABLE KEYS */;
/*!40000 ALTER TABLE `moradia` ENABLE KEYS */;

-- Copiando estrutura para tabela habitacao.pcd
CREATE TABLE IF NOT EXISTS `pcd` (
  `idpdc` int(11) NOT NULL AUTO_INCREMENT,
  `titular_id` int(11) NOT NULL,
  `laudo` longtext NOT NULL,
  `dt_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idpdc`) USING BTREE,
  UNIQUE KEY `titular_id` (`titular_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela habitacao.pcd: 0 rows
DELETE FROM `pcd`;
/*!40000 ALTER TABLE `pcd` DISABLE KEYS */;
/*!40000 ALTER TABLE `pcd` ENABLE KEYS */;

-- Copiando estrutura para tabela habitacao.pcdc
CREATE TABLE IF NOT EXISTS `pcdc` (
  `idpdc` int(11) NOT NULL AUTO_INCREMENT,
  `conjuge_id` int(11) NOT NULL,
  `laudo_conjuge` longtext NOT NULL,
  `dt_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idpdc`) USING BTREE,
  UNIQUE KEY `titular_id` (`conjuge_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela habitacao.pcdc: 0 rows
DELETE FROM `pcdc`;
/*!40000 ALTER TABLE `pcdc` DISABLE KEYS */;
/*!40000 ALTER TABLE `pcdc` ENABLE KEYS */;

-- Copiando estrutura para tabela habitacao.profissao
CREATE TABLE IF NOT EXISTS `profissao` (
  `idprofissao` int(11) NOT NULL AUTO_INCREMENT,
  `titular_id` int(11) NOT NULL,
  `orgao` varchar(50) NOT NULL,
  `ativo` char(1) NOT NULL DEFAULT 'S',
  `unidade_lotacao` varchar(100) DEFAULT NULL,
  `municipio_lotacao` varchar(100) DEFAULT NULL,
  `cargo` varchar(100) DEFAULT NULL,
  `dt_ingresso` date DEFAULT NULL,
  `invalido` char(1) DEFAULT NULL,
  `renda_bruta` decimal(10,2) DEFAULT NULL,
  `dt_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idprofissao`),
  UNIQUE KEY `titular_id` (`titular_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela habitacao.profissao: 0 rows
DELETE FROM `profissao`;
/*!40000 ALTER TABLE `profissao` DISABLE KEYS */;
/*!40000 ALTER TABLE `profissao` ENABLE KEYS */;

-- Copiando estrutura para tabela habitacao.profissaoc
CREATE TABLE IF NOT EXISTS `profissaoc` (
  `idprofissaoc` int(11) NOT NULL AUTO_INCREMENT,
  `conjuge_id` int(11) NOT NULL,
  `orgao_conjuge` varchar(50) NOT NULL,
  `ativo_conjuge` char(1) NOT NULL DEFAULT 'S',
  `unidade_lotacao_conjuge` varchar(100) DEFAULT NULL,
  `municipio_lotacao_conjuge` varchar(100) DEFAULT NULL,
  `cargo_conjuge` varchar(100) DEFAULT NULL,
  `dt_ingresso_conjuge` date DEFAULT NULL,
  `invalido_conjuge` char(1) DEFAULT NULL,
  `renda_bruta_conjuge` decimal(10,2) DEFAULT NULL,
  `dt_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idprofissaoc`) USING BTREE,
  UNIQUE KEY `titular_id` (`conjuge_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela habitacao.profissaoc: 0 rows
DELETE FROM `profissaoc`;
/*!40000 ALTER TABLE `profissaoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `profissaoc` ENABLE KEYS */;

-- Copiando estrutura para tabela habitacao.renda
CREATE TABLE IF NOT EXISTS `renda` (
  `idrenda` int(11) NOT NULL AUTO_INCREMENT,
  `profissao_id` int(11) NOT NULL,
  `renda` longtext NOT NULL,
  PRIMARY KEY (`idrenda`),
  UNIQUE KEY `profissao_id` (`profissao_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela habitacao.renda: 0 rows
DELETE FROM `renda`;
/*!40000 ALTER TABLE `renda` DISABLE KEYS */;
/*!40000 ALTER TABLE `renda` ENABLE KEYS */;

-- Copiando estrutura para tabela habitacao.rendac
CREATE TABLE IF NOT EXISTS `rendac` (
  `idrendac` int(11) NOT NULL AUTO_INCREMENT,
  `profissaoc_id` int(11) NOT NULL,
  `renda_conjuge` longtext NOT NULL,
  PRIMARY KEY (`idrendac`) USING BTREE,
  UNIQUE KEY `profissao_id` (`profissaoc_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela habitacao.rendac: 0 rows
DELETE FROM `rendac`;
/*!40000 ALTER TABLE `rendac` DISABLE KEYS */;
/*!40000 ALTER TABLE `rendac` ENABLE KEYS */;

-- Copiando estrutura para tabela habitacao.rg
CREATE TABLE IF NOT EXISTS `rg` (
  `idrg` int(11) NOT NULL AUTO_INCREMENT,
  `titular_id` int(11) NOT NULL,
  `base64_rg` longtext NOT NULL,
  `dt_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idrg`) USING BTREE,
  UNIQUE KEY `titular_id` (`titular_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela habitacao.rg: 0 rows
DELETE FROM `rg`;
/*!40000 ALTER TABLE `rg` DISABLE KEYS */;
/*!40000 ALTER TABLE `rg` ENABLE KEYS */;

-- Copiando estrutura para tabela habitacao.titular
CREATE TABLE IF NOT EXISTS `titular` (
  `idtitular` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contato` varchar(15) NOT NULL,
  `sexo` char(1) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `escolaridade` varchar(50) NOT NULL,
  `rg` varchar(15) NOT NULL,
  `orgao_expedidor` varchar(50) NOT NULL,
  `dt_expedicao` date NOT NULL,
  `estado_civil` varchar(20) NOT NULL,
  `dt_nascimento` date NOT NULL,
  `naturalidade` varchar(100) NOT NULL,
  `pcd` char(1) DEFAULT NULL,
  `tipo_pcd` varchar(15) DEFAULT NULL,
  `cid` varchar(50) DEFAULT NULL,
  `dt_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idtitular`) USING BTREE,
  UNIQUE KEY `cpf` (`cpf`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `contato` (`contato`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela habitacao.titular: 0 rows
DELETE FROM `titular`;
/*!40000 ALTER TABLE `titular` DISABLE KEYS */;
/*!40000 ALTER TABLE `titular` ENABLE KEYS */;

-- Copiando estrutura para tabela habitacao.transacao
CREATE TABLE IF NOT EXISTS `transacao` (
  `idtransacao` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `transacao` text NOT NULL,
  `dt_transacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idtransacao`),
  KEY `usuario_id` (`usuario_id`)
) ENGINE=MyISAM AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela habitacao.transacao: 145 rows
DELETE FROM `transacao`;
/*!40000 ALTER TABLE `transacao` DISABLE KEYS */;
INSERT INTO `transacao` (`idtransacao`, `usuario_id`, `transacao`, `dt_transacao`) VALUES
	(1, 1, 'entrou', '2021-05-10 10:52:16'),
	(2, 1, 'entrou', '2021-05-10 10:55:17'),
	(3, 1, 'entrou', '2021-05-10 11:03:13'),
	(4, 1, 'entrou', '2021-05-10 11:03:42'),
	(5, 1, 'entrou', '2021-05-10 11:06:47'),
	(6, 1, 'entrou', '2021-05-10 11:11:05'),
	(7, 1, 'entrou', '2021-05-10 11:11:34'),
	(8, 1, 'SELECT * FROM usuario', '2021-05-10 11:18:28'),
	(9, 1, 'SELECT * FROM usuario', '2021-05-10 11:19:15'),
	(10, 1, 'SELECT * FROM usuario', '2021-05-10 11:19:36'),
	(11, 1, 'SELECT * FROM usuario', '2021-05-10 11:19:57'),
	(12, 1, 'SELECT * FROM usuario', '2021-05-10 11:20:24'),
	(13, 1, 'SELECT * FROM usuario', '2021-05-10 11:20:32'),
	(14, 1, 'SELECT * FROM usuario', '2021-05-10 11:32:36'),
	(15, 1, 'SELECT * FROM usuario', '2021-05-10 11:39:04'),
	(16, 1, 'SELECT * FROM usuario', '2021-05-10 11:39:09'),
	(17, 1, 'alterou usuario #1', '2021-05-10 11:39:40'),
	(18, 1, 'alterou usuario #1', '2021-05-10 11:40:14'),
	(19, 1, 'SELECT * FROM usuario', '2021-05-10 11:40:14'),
	(20, 1, 'alterou usuario #1', '2021-05-10 11:40:17'),
	(21, 1, 'SELECT * FROM usuario', '2021-05-10 11:40:17'),
	(22, 1, 'SELECT * FROM usuario', '2021-05-10 11:40:21'),
	(23, 1, 'alterou usuario #1', '2021-05-10 11:40:25'),
	(24, 1, 'SELECT * FROM usuario', '2021-05-10 11:40:25'),
	(25, 1, 'SELECT * FROM usuario', '2021-05-10 11:40:55'),
	(26, 1, 'SELECT * FROM usuario', '2021-05-10 11:41:02'),
	(27, 1, 'alterou usuario #1', '2021-05-10 11:41:48'),
	(28, 1, 'SELECT * FROM usuario', '2021-05-10 11:41:48'),
	(29, 1, 'alterou usuario #1', '2021-05-10 11:41:50'),
	(30, 1, 'SELECT * FROM usuario', '2021-05-10 11:41:50'),
	(31, 1, 'alterou usuario #1', '2021-05-10 11:41:55'),
	(32, 1, 'SELECT * FROM usuario', '2021-05-10 11:41:55'),
	(33, 1, 'alterou usuario #1', '2021-05-10 11:42:00'),
	(34, 1, 'SELECT * FROM usuario', '2021-05-10 11:42:00'),
	(35, 1, 'inseriu usuario #2', '2021-05-10 11:42:51'),
	(36, 1, 'SELECT * FROM usuario', '2021-05-10 11:42:51'),
	(37, 1, 'SELECT * FROM usuario', '2021-05-10 11:45:45'),
	(38, 1, 'SELECT * FROM usuario', '2021-05-10 11:46:37'),
	(39, 1, 'SELECT * FROM usuario', '2021-05-10 11:47:05'),
	(40, 1, 'SELECT * FROM usuario', '2021-05-10 11:47:51'),
	(41, 1, 'SELECT * FROM usuario', '2021-05-10 11:50:09'),
	(42, 1, 'SELECT * FROM usuario', '2021-05-10 11:50:35'),
	(43, 1, 'SELECT * FROM usuario', '2021-05-10 11:50:59'),
	(44, 1, 'renovou senha do usuario #2', '2021-05-10 11:51:53'),
	(45, 1, 'SELECT * FROM usuario', '2021-05-10 11:51:53'),
	(46, 1, 'renovou senha do usuario #2', '2021-05-10 11:52:03'),
	(47, 1, 'SELECT * FROM usuario', '2021-05-10 11:52:03'),
	(48, 1, 'renovou senha do usuario #1', '2021-05-10 11:52:05'),
	(49, 1, 'SELECT * FROM usuario', '2021-05-10 11:52:05'),
	(50, 1, 'entrou', '2021-05-10 11:52:14'),
	(51, 1, 'entrou', '2021-05-10 11:54:57'),
	(52, 1, 'entrou', '2021-05-10 12:00:11'),
	(53, 1, 'entrou', '2021-05-10 12:01:18'),
	(54, 1, 'mudou sua senha', '2021-05-10 12:06:13'),
	(55, 1, 'SELECT * FROM usuario', '2021-05-10 12:06:15'),
	(56, 1, 'entrou', '2021-05-10 12:06:22'),
	(57, 1, 'SELECT * FROM usuario', '2021-05-10 12:06:34'),
	(58, 1, 'alterou usuario #1', '2021-05-10 12:06:38'),
	(59, 1, 'SELECT * FROM usuario', '2021-05-10 12:06:38'),
	(60, 1, 'entrou', '2021-05-10 12:06:44'),
	(61, 1, 'SELECT * FROM usuario', '2021-05-10 12:07:54'),
	(62, 1, 'SELECT * FROM usuario', '2021-05-10 12:38:20'),
	(63, 1, 'SELECT * FROM usuario', '2021-05-10 12:38:33'),
	(64, 1, 'mudou sua senha', '2021-05-10 12:38:44'),
	(65, 1, 'SELECT * FROM usuario', '2021-05-10 12:38:47'),
	(66, 1, 'SELECT * FROM usuario', '2021-05-10 12:38:52'),
	(67, 1, 'alterou usuario #1', '2021-05-10 12:39:08'),
	(68, 1, 'SELECT * FROM usuario', '2021-05-10 12:39:08'),
	(69, 1, 'entrou', '2021-05-10 12:39:14'),
	(70, 1, 'SELECT * FROM modalidade', '2021-05-10 12:52:28'),
	(71, 1, 'SELECT * FROM modalidade', '2021-05-10 12:53:02'),
	(72, 1, 'SELECT * FROM modalidade', '2021-05-10 12:58:59'),
	(73, 1, 'SELECT * FROM modalidade', '2021-05-10 12:59:16'),
	(74, 1, 'SELECT * FROM usuario', '2021-05-10 13:02:58'),
	(75, 1, 'SELECT * FROM modalidade', '2021-05-10 13:03:01'),
	(76, 1, 'SELECT * FROM modalidade', '2021-05-10 13:17:27'),
	(77, 1, 'SELECT * FROM modalidade', '2021-05-10 13:18:34'),
	(78, 1, 'SELECT * FROM modalidade', '2021-05-10 13:18:41'),
	(79, 1, 'SELECT * FROM usuario', '2021-05-10 13:20:59'),
	(80, 1, 'inseriu usuario #3', '2021-05-10 13:21:26'),
	(81, 1, 'SELECT * FROM usuario', '2021-05-10 13:21:31'),
	(82, 1, 'SELECT * FROM usuario', '2021-05-10 13:21:59'),
	(83, 1, 'alterou usuario #2', '2021-05-10 13:22:02'),
	(84, 1, 'SELECT * FROM usuario', '2021-05-10 13:22:02'),
	(85, 1, 'inseriu usuario #4', '2021-05-10 13:22:19'),
	(86, 1, 'SELECT * FROM usuario', '2021-05-10 13:22:30'),
	(87, 1, 'inseriu usuario #5', '2021-05-10 13:23:02'),
	(88, 1, 'SELECT * FROM usuario', '2021-05-10 13:23:02'),
	(89, 1, 'SELECT * FROM modalidade', '2021-05-10 13:26:21'),
	(90, 1, 'SELECT * FROM usuario', '2021-05-10 13:26:26'),
	(91, 1, 'SELECT * FROM usuario', '2021-05-10 13:28:20'),
	(92, 1, 'alterou usuario #5', '2021-05-10 13:28:24'),
	(93, 1, 'SELECT * FROM usuario', '2021-05-10 13:28:24'),
	(94, 1, 'deletou usuario #', '2021-05-10 13:28:28'),
	(95, 1, 'SELECT * FROM usuario', '2021-05-10 13:28:58'),
	(96, 1, 'deletou usuario #', '2021-05-10 13:29:02'),
	(97, 1, 'renovou senha do usuario #5', '2021-05-10 13:33:13'),
	(98, 1, 'SELECT * FROM usuario', '2021-05-10 13:33:13'),
	(99, 1, 'SELECT * FROM usuario', '2021-05-10 13:37:15'),
	(100, 1, 'SELECT * FROM modalidade', '2021-05-10 13:37:17'),
	(101, 1, 'SELECT * FROM usuario', '2021-05-10 13:37:20'),
	(102, 1, 'SELECT * FROM modalidade', '2021-05-10 13:40:11'),
	(103, 1, 'SELECT * FROM modalidade', '2021-05-10 13:43:41'),
	(104, 1, 'SELECT * FROM modalidade', '2021-05-10 13:44:52'),
	(105, 1, 'SELECT * FROM modalidade', '2021-05-10 13:45:13'),
	(106, 1, 'SELECT * FROM modalidade', '2021-05-10 13:46:01'),
	(107, 1, 'inseriu modalidade #1', '2021-05-10 13:46:54'),
	(108, 1, 'SELECT * FROM modalidade', '2021-05-10 13:46:54'),
	(109, 1, 'inseriu modalidade #2', '2021-05-10 13:48:21'),
	(110, 1, 'SELECT * FROM modalidade', '2021-05-10 13:48:21'),
	(111, 1, 'alterou modalidade #2', '2021-05-10 13:48:29'),
	(112, 1, 'SELECT * FROM modalidade', '2021-05-10 13:48:29'),
	(113, 1, 'alterou modalidade #2', '2021-05-10 13:48:39'),
	(114, 1, 'SELECT * FROM modalidade', '2021-05-10 13:48:39'),
	(115, 1, 'alterou modalidade #2', '2021-05-10 13:48:47'),
	(116, 1, 'SELECT * FROM modalidade', '2021-05-10 13:48:47'),
	(117, 1, 'entrou', '2021-05-10 13:49:29'),
	(118, 1, 'mudou sua senha', '2021-05-10 13:49:48'),
	(119, 1, 'SELECT * FROM modalidade', '2021-05-10 13:49:50'),
	(120, 1, 'alterou modalidade #1', '2021-05-10 13:50:01'),
	(121, 1, 'SELECT * FROM modalidade', '2021-05-10 13:50:01'),
	(122, 1, 'inseriu modalidade #3', '2021-05-10 13:50:16'),
	(123, 1, 'SELECT * FROM modalidade', '2021-05-10 13:50:16'),
	(124, 1, 'alterou modalidade #3', '2021-05-10 13:50:59'),
	(125, 1, 'SELECT * FROM modalidade', '2021-05-10 13:50:59'),
	(126, 1, 'SELECT * FROM modalidade', '2021-05-10 13:54:52'),
	(127, 1, 'alterou modalidade #3', '2021-05-10 14:01:36'),
	(128, 1, 'SELECT * FROM modalidade', '2021-05-10 14:01:36'),
	(129, 1, 'SELECT * FROM modalidade', '2021-05-10 14:01:52'),
	(130, 1, 'entrou', '2021-05-10 15:27:37'),
	(131, 1, 'SELECT * FROM modalidade', '2021-05-10 15:27:41'),
	(132, 1, 'SELECT * FROM usuario', '2021-05-10 15:27:43'),
	(133, 1, 'SELECT * FROM modalidade', '2021-05-10 15:31:30'),
	(134, 1, 'entrou', '2021-05-12 16:38:19'),
	(135, 1, 'entrou', '2021-05-12 16:38:34'),
	(136, 1, 'SELECT * FROM historico', '2021-05-12 16:44:19'),
	(137, 1, 'SELECT * FROM historico', '2021-05-12 16:44:32'),
	(138, 1, 'entrou', '2021-05-12 16:46:03'),
	(139, 1, 'SELECT * FROM historico', '2021-05-12 16:46:28'),
	(140, 1, 'inseriu historico #1', '2021-05-12 16:50:41'),
	(141, 1, 'SELECT * FROM historico', '2021-05-12 16:50:59'),
	(142, 1, 'entrou', '2021-05-14 15:32:04'),
	(143, 1, 'SELECT * FROM modalidade', '2021-05-14 15:32:09'),
	(144, 1, 'SELECT * FROM usuario', '2021-05-14 15:32:11'),
	(145, 1, 'entrou', '2021-05-14 16:55:51');
/*!40000 ALTER TABLE `transacao` ENABLE KEYS */;

-- Copiando estrutura para tabela habitacao.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `orgao` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `permissao` text NOT NULL,
  `ativado` char(1) NOT NULL DEFAULT 'S',
  `dt_update` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idusuario`) USING BTREE,
  UNIQUE KEY `email_UNIQUE` (`email`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela habitacao.usuario: 5 rows
DELETE FROM `usuario`;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`idusuario`, `nome`, `email`, `orgao`, `senha`, `permissao`, `ativado`, `dt_update`) VALUES
	(1, 'Administrador', 'admin@admin.com', 'SEGUP', '21232f297a57a5a743894a0e4a801fc3', 'modalidade,usuario', 'S', '2021-05-10 12:39:08'),
	(2, 'Manoel Carlos Eduardo Antonio Carvalho', 'mmanoelcarloseduardoantoniocarvalho@cenavip.com.br', 'CEII', 'bfaefa19e1e49280e44e2ae0f4bb83a0', 'dashboard,validar-cadastro,modalidade,relatorio,gerar-relatorio,usuario', 'S', '2021-05-10 13:22:02'),
	(3, 'Lorenzo Pedro Henrique Nogueira', 'lorenzopedrohenriquenogueira-83@damha.com.br', 'SESPA', '1e33b97d992c4565ebafa47c11f1744b', 'usuario', 'S', '2021-05-10 13:21:26'),
	(4, 'Bruno Juan da Luz', 'brunojuandaluz-82@nonesiglio.com.br', 'SEGUP', '197f61e8598c084b6f6348e7188c4655', 'usuario', 'S', '2021-05-10 13:22:19'),
	(5, 'Thiago Julio Lucas Porto', 'thiagojuliolucasporto__thiagojuliolucasporto@huggoromano.com', 'SEGUP', '97c8381fb0b4ed307d0b6b9190c8a5d8', 'dashboard,validar-cadastro,modalidade,relatorio,gerar-relatorio,usuario', 'N', '2021-05-10 13:33:13');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

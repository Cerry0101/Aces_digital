-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.5.5-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para digital
CREATE DATABASE IF NOT EXISTS `digital` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `digital`;

-- Copiando estrutura para tabela digital.anexos
CREATE TABLE IF NOT EXISTS `anexos` (
  `idanexos` int(11) NOT NULL AUTO_INCREMENT,
  `base64_anexos` longtext NOT NULL,
  `dt_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idanexos`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela digital.anexos: 0 rows
/*!40000 ALTER TABLE `anexos` DISABLE KEYS */;
/*!40000 ALTER TABLE `anexos` ENABLE KEYS */;

-- Copiando estrutura para tabela digital.cadastro
CREATE TABLE IF NOT EXISTS `cadastro` (
  `idcadastro` int(11) NOT NULL AUTO_INCREMENT,
  `modalidade_id` int(11) NOT NULL,
  `dt_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `titular_id` int(11) NOT NULL,
  `pontuacao` int(11) DEFAULT NULL,
  `municipio_modalidade` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idcadastro`) USING BTREE,
  UNIQUE KEY `titular_modalidade_id` (`titular_id`,`modalidade_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=220 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela digital.cadastro: 0 rows
/*!40000 ALTER TABLE `cadastro` DISABLE KEYS */;
/*!40000 ALTER TABLE `cadastro` ENABLE KEYS */;

-- Copiando estrutura para tabela digital.modalidade
CREATE TABLE IF NOT EXISTS `modalidade` (
  `idmodalidade` int(11) NOT NULL AUTO_INCREMENT,
  `modalidade` varchar(100) NOT NULL,
  `edital` varchar(50) NOT NULL,
  `inicio` date NOT NULL,
  `termino` date NOT NULL,
  `vagas` int(11) NOT NULL,
  `dt_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `municipios` text DEFAULT NULL,
  PRIMARY KEY (`idmodalidade`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela digital.modalidade: 12 rows
/*!40000 ALTER TABLE `modalidade` DISABLE KEYS */;
INSERT IGNORE INTO `modalidade` (`idmodalidade`, `modalidade`, `edital`, `inicio`, `termino`, `vagas`, `dt_update`, `municipios`) VALUES
	(1, 'EMPREENDIMENTO BOULEVARD TAPAJÓS', '001/2021', '2021-07-07', '2021-09-30', 200, '2021-09-10 18:00:57', 'Santarém'),
	(2, 'CARTAS DE CRÉDITO PARA FINANCIAMENTO - REGIÃO ARAGUAIA', '002/2021', '2021-07-07', '2021-09-30', 40, '2021-09-10 18:01:03', 'Água Azul do Norte,Bannach,Conceição do Araguaia,Cumaru do Norte,Floresta do Araguaia,Ourilândia do Norte,Pau D’Arco,Redenção,Rio Maria,Santa Maria das Barreiras,Santana do Araguaia,São Félix do Xingu,Sapucaia,Tucumã,Xinguara'),
	(3, 'CARTAS DE CRÉDITO PARA FINANCIAMENTO - REGIÃO CARAJÁS', '002/2021', '2021-07-07', '2021-09-30', 40, '2021-09-10 18:01:09', 'Bom Jesus do Tocantins,Brejo Grande do Araguaia,Canaã dos Carajás,Curionópólis,Eldorado dos Carajás,Marabá,Palestina do Pará,Parauapebas,Piçarra,São Domingos do Araguaia,São Geraldo do Araguaia,São João do Araguaia'),
	(4, 'CARTAS DE CRÉDITO PARA FINANCIAMENTO - REGIÃO GUAJARA', '002/2021', '2021-07-07', '2021-09-30', 330, '2021-09-10 18:01:16', 'Ananindeua,Belém,Benevides,Marituba,Santa Bárbara do Pará'),
	(5, 'CARTAS DE CRÉDITO PARA FINANCIAMENTO - REGIÃO GUAMA', '002/2021', '2021-07-07', '2021-09-30', 40, '2021-09-10 18:01:21', 'Castanhal,Colares,Curuçá,Igarapé-Açu,Inhangapi,Magalhães Barata,Maracanã,Marapanim,Santa Izabel do Pará,Santa Maria do Pará,Santo Antônio do Tauá,São Caetano de Odivelas,São Domingos do Capim,São Francisco do Pará,São João da Ponta,São Miguel do Guamá,Terra Alta,Vigia'),
	(6, 'CARTAS DE CRÉDITO PARA FINANCIAMENTO - REGIÃO LAGO TUCURUI', '002/2021', '2021-07-07', '2021-09-30', 40, '2021-09-10 18:01:27', 'Breu Branco,Goianésia do Pará,Itupiranga,Jacundá,Nova Ipixuna,Novo Repartimento,Tucuruí'),
	(7, 'CARTAS DE CRÉDITO PARA FINANCIAMENTO - REGIÃO  MARAJO', '002/2021', '2021-07-07', '2021-09-30', 40, '2021-09-10 18:01:33', 'Afuá,Anajás,Bagre,Breves,Cachoeira do Arari, Chaves,Curralinho,Gurupá,Melgaço,Muaná,Ponta de Pedras,Portel,Salvaterra,Santa Cruz do Arari,São Sebastião da Boa Vista,Soure'),
	(8, 'CARTAS DE CRÉDITO PARA FINANCIAMENTO - REGIÃO  RIO CAETE', '002/2021', '2021-07-07', '2021-09-30', 40, '2021-09-10 18:01:40', 'Augusto Corrêa,Bonito,Bragança,Cachoeira do Piriá,Capanema,Nova Timboteua,Peixe-Boi,Primavera,Quatipuru,Salinópolis,Santa Luzia do Pará,Santarém Novo,São João de Pirabas,Tracuateua,Viseu'),
	(9, 'CARTAS DE CRÉDITO PARA FINANCIAMENTO - REGIÃO RIO CAPIM', '002/2021', '2021-07-07', '2021-09-30', 40, '2021-09-10 18:01:47', 'Abel Figueiredo,Aurora do Pará,Bujaru,Capitão Poço,Concórdia do Pará,Dom Eliseu,Garrafão do Norte,Ipixuna do Pará,Irituia,Mãe do Rio,Nova Esperança do Piriá,Ourém, Paragominas, Rondom do Pará,Tomé-Açu,Ulianópolis'),
	(10, 'CARTAS DE CRÉDITO PARA FINANCIAMENTO - REGIÃO TAPAJOS', '002/2021', '2021-07-07', '2021-09-30', 40, '2021-09-10 18:01:53', 'Aveiro,Itaituba,Jacareacanga,Novo Progresso,Rurópolis,Trairão'),
	(11, 'CARTAS DE CRÉDITO PARA FINANCIAMENTO - REGIÃO TOCANTINS', '002/2021', '2021-07-07', '2021-09-30', 40, '2021-09-10 18:01:57', 'Abaetetuba,Acará,Baião,Barcarena,Cametá,Igarapé-Miri,Limoeiro do Ajuru,Mocajuba,Moju,Oeiras do Pará,Tailândia'),
	(12, 'CARTAS DE CRÉDITO PARA FINANCIAMENTO - REGIÃO XINGU', '002/2021', '2021-07-07', '2021-09-30', 40, '2021-09-10 18:02:05', 'Altamira,Anapu,Brasil Novo,Medicilândia,Pacajá,Placas,Porto de Moz,Senador José Porfírio,Uruará,Vitória do Xingu');
/*!40000 ALTER TABLE `modalidade` ENABLE KEYS */;

-- Copiando estrutura para tabela digital.pcd
CREATE TABLE IF NOT EXISTS `pcd` (
  `idpcd` int(11) NOT NULL AUTO_INCREMENT,
  `laudo` longtext NOT NULL,
  `titular_id` int(11) NOT NULL,
  `dt_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idpcd`) USING BTREE,
  KEY `titular_id` (`titular_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela digital.pcd: 0 rows
/*!40000 ALTER TABLE `pcd` DISABLE KEYS */;
/*!40000 ALTER TABLE `pcd` ENABLE KEYS */;

-- Copiando estrutura para tabela digital.rg
CREATE TABLE IF NOT EXISTS `rg` (
  `idrg` int(11) NOT NULL AUTO_INCREMENT,
  `base64_rg` longtext NOT NULL,
  `titular_id` int(11) NOT NULL,
  `dt_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idrg`),
  KEY `titular_id` (`titular_id`)
) ENGINE=MyISAM AUTO_INCREMENT=298 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela digital.rg: 0 rows
/*!40000 ALTER TABLE `rg` DISABLE KEYS */;
/*!40000 ALTER TABLE `rg` ENABLE KEYS */;

-- Copiando estrutura para tabela digital.titular
CREATE TABLE IF NOT EXISTS `titular` (
  `idtitular` int(11) NOT NULL AUTO_INCREMENT,
  `cpf` varchar(15) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `dt_nascimento` date NOT NULL,
  `sexo` char(1) NOT NULL,
  `naturalidade` varchar(100) NOT NULL,
  `escolaridade` varchar(50) NOT NULL,
  `estado_civil` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contato` varchar(15) NOT NULL,
  `rg` varchar(15) NOT NULL,
  `orgao_expedidor` varchar(50) NOT NULL,
  `dt_expedicao` date NOT NULL,
  `pcd` char(1) DEFAULT NULL,
  `tipo_pcd` varchar(15) DEFAULT NULL,
  `cid` varchar(50) DEFAULT NULL,
  `idoso` char(1) DEFAULT NULL,
  `mulher` char(1) DEFAULT NULL,
  `dt_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idtitular`) USING BTREE,
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=MyISAM AUTO_INCREMENT=725 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela digital.titular: 0 rows
/*!40000 ALTER TABLE `titular` DISABLE KEYS */;
/*!40000 ALTER TABLE `titular` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

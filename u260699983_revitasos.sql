-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 18-Jan-2023 às 21:02
-- Versão do servidor: 10.5.12-MariaDB-cll-lve
-- versão do PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `u260699983_revitasos`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `composition`
--

CREATE TABLE `composition` (
  `id_composition` bigint(20) NOT NULL,
  `id_transient_configuration` bigint(20) NOT NULL,
  `id_requirement` bigint(20) NOT NULL,
  `flexibilized` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `composition`
--

INSERT INTO `composition` (`id_composition`, `id_transient_configuration`, `id_requirement`, `flexibilized`) VALUES
(83, 47, 58, 0),
(84, 47, 59, 0),
(85, 47, 60, 0),
(86, 47, 61, 0),
(91, 49, 48, 0),
(92, 49, 56, 0),
(93, 49, 57, 0),
(94, 49, 55, 0),
(95, 50, 58, 0),
(96, 50, 59, 0),
(97, 50, 60, 0),
(98, 50, 61, 0),
(135, 60, 48, 0),
(136, 60, 56, 0),
(137, 60, 57, 0),
(138, 60, 55, 0),
(139, 61, 48, 0),
(140, 61, 56, 0),
(141, 61, 57, 0),
(142, 61, 55, 0),
(151, 64, 48, 0),
(152, 64, 56, 0),
(153, 64, 57, 0),
(154, 64, 55, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `constituent`
--

CREATE TABLE `constituent` (
  `id_constituent` bigint(20) NOT NULL,
  `hash` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_sos` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `constituent`
--

INSERT INTO `constituent` (`id_constituent`, `hash`, `id_sos`, `name`, `description`, `ip_address`, `original`) VALUES
(103, 'l8div8i2', 3, 'Consti', '', '', 1),
(104, 'l8divf5m', 3, 'Constituent id: 7', '', '', 1),
(105, 'l8diy4b1', 3, 'Constituent id: 9', '', '', 1),
(106, 'l8dizmv4', 3, 'Constituent id: 12', '', '', 1),
(108, 'l8dj2i2b', 3, 'Constituent id: 15', '', '', 1),
(121, '', 3, 'CS novo', '', '', 0),
(136, 'l896vwv9', 1, 'GPS', '1.2.3.4', '1.2.3.4', 0),
(137, 'l8aop546', 1, 'TG', 'TG', '', 0),
(138, 'l8dj9w0y', 1, 'Telephony Gateway', '4.4.4.4', '4.4.4.4', 0),
(139, 'lb5qhmqt', 1, 'TTTTTT', '', '123.123.123', 0),
(140, 'lbqsxzh0', 1, 'UPSMS', 'undefined', 'undefined', 0),
(144, 'lbqx2cqm', 2, 'XXXXX', '', '1.1.1.1', 0),
(145, 'lbqx7fep', 2, 'Constituent id: 4', '', '2.2.2.21', 0),
(146, 'lbvkxo9z', 2, 'Constituent id: 7', '', '22222222222', 0),
(147, 'lbvnm6t1', 2, 'Constituent id: 11', '', '7777', 0),
(148, 'lbvowc3y', 4, 'Constituent id: 12', '', '1.1.1.1', 0),
(149, 'lbvowc41', 4, 'Const 1', '', '192.168.0.1', 0),
(150, 'lbvowc42', 4, 'Const 2', '', '200.192.0.1', 0),
(151, 'lbvowc40', 4, 'Constituent id: 13', '', '127.0.0.1', 0),
(152, 'lbvpijqh', 4, 'Constituent id: 1', '', 'undefined', 0),
(153, 'lbvpylmp', 5, 'Constituent id 2', '', '-54', 0),
(154, 'lbvpylmh', 5, 'Constituent id 1', '', '189', 0),
(155, 'lcmg5ebp', 17, 'Gateway telefonia', '', 'undefined', 0),
(156, 'lcmg5d99', 17, 'No-break', '', 'undefined', 0),
(157, 'lcmg6ad8', 17, 'Gerador', '', 'undefined', 0),
(158, 'lcsh5dhw', 10014, 'Constituent id: 1', 'undefined', '', 0),
(159, 'lcslutce', 10014, 'Constituent id: 1', 'Constituent id: 1 description', '', 0),
(160, 'lcsh0gre', 1, 'Constituent id: 2', 'undefined', '', 0),
(161, 'lcsh0g1y', 1, 'Constituent id: 1', 'undefined', '', 0),
(162, 'lcmg6ad8', 10049, 'Teste', 'undefined', '', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `log`
--

CREATE TABLE `log` (
  `id` bigint(20) NOT NULL,
  `msg` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `php` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `log`
--

INSERT INTO `log` (`id`, `msg`, `php`, `type`, `datetime`) VALUES
(1340116, 'DELETE FROM mission \n		WHERE id_sos=10049 and ( hash not in (\'lcmg7yp0\') )', '/revitasos/util.php', 'type', '2023-01-15 17:46:18'),
(1340117, 'DELETE FROM constituent \n		WHERE id_sos=10049 and (hash not in (\'lcmg6ad8\') )', '/revitasos/util.php', 'type', '2023-01-15 17:46:18');

-- --------------------------------------------------------

--
-- Estrutura da tabela `mission`
--

CREATE TABLE `mission` (
  `id_mission` bigint(20) NOT NULL,
  `hash` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_sos` bigint(20) NOT NULL,
  `id_constituent` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `mission`
--

INSERT INTO `mission` (`id_mission`, `hash`, `id_sos`, `id_constituent`, `name`, `description`) VALUES
(4, 'l8div8i2', 3, 0, 'Mission id 13', ''),
(5, 'l8divb8y', 3, 0, 'Mission id: 6', ''),
(6, 'l8diz82a', 3, 0, 'Mission id: 10', ''),
(7, 'l8dj26u9', 3, 0, 'Mission id: 13', ''),
(9, 'l8emhqot', 3, 0, 'Mission id: 16', ''),
(18, 'l896vxcx', 1, 136, 'Controlar', 'Mission tooltip - id: 5'),
(19, 'l8diqdt7', 1, 137, 'Comunicar 1', 'Mission tooltip - id: 7'),
(20, 'l8dja7b7', 1, 138, 'Analisar', 'Mission tooltip - id: 9'),
(21, 'lau6bzw5', 1, 137, 'Comunicar 2', 'Mission tooltip - id: 14'),
(22, 'lb5qhqic', 1, 139, 'Acompanhar', 'Mission tooltip - id: 16'),
(23, 'lbqsy018', 1, 140, 'Mission id: 33', 'Mission tooltip - id: 16'),
(27, 'lbqx2c4z', 2, 144, 'xxx', 'Mission tooltip - id: 1'),
(28, 'lbqx7jdm', 2, 145, 'Mission id: 5', 'Mission tooltip - id: 4'),
(29, 'lbvkzmok', 2, 146, 'Mission id: 8', 'Mission tooltip - id: 6'),
(30, 'lbvnppbs', 2, 147, 'Mission id: 12', 'Mission tooltip - id: 9'),
(31, 'lbvowc3q', 4, 148, 'Mission id: 2', 'Mission tooltip - id: 1'),
(32, 'lbvowc42', 4, 149, 'Mission1', 'Mission tooltip - id: 5'),
(33, 'lbvowc44', 4, 150, 'Mission2', 'Mission tooltip - id: 7'),
(34, 'lbvowc4b', 4, 151, 'Mission id: 31', 'Mission tooltip - id: 12'),
(35, 'lbvpik9t', 4, 152, 'Mission id: 2', 'Mission tooltip - id: 2'),
(36, 'lbvpylmq', 5, 153, 'Mission id 3', 'Mission tooltip - id: 3'),
(37, 'lbvpylms', 5, 154, 'Mission id: 5', 'Mission tooltip - id: 4'),
(38, 'lcmg6l7g', 17, 155, 'Realizar notificação', 'Mission tooltip - id: 4'),
(39, 'lcmg7ci4', 17, 156, 'Informar autonomia das baterias', 'Mission tooltip - id: 5'),
(40, 'lcmg7yp0', 17, 157, 'Informar nível de combustível', 'Mission tooltip - id: 6'),
(41, 'lcmgbgpf', 17, 157, 'Identificar interrupção de energia', 'Mission tooltip - id: 11'),
(42, 'lcsh64q6', 10014, 158, 'Mission id: 2', 'Mission id: 2'),
(43, 'lcslutxk', 10014, 159, 'Mission id: 2', 'Mission id: 2'),
(44, 'lcsnbdyk', 1, 160, 'Mission id: 3', 'Mission id: 3 description'),
(45, 'lcsnbq6t', 1, 161, 'Mission id: 5', 'Mission id: 5 description'),
(46, 'lcmg7yp0', 10049, 0, 'Informar nível de combustível', 'Informar nível de combustível');

-- --------------------------------------------------------

--
-- Estrutura da tabela `network`
--

CREATE TABLE `network` (
  `id_network` bigint(20) NOT NULL,
  `id_sos` bigint(20) NOT NULL,
  `soskey` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nodes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `edges` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `script` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `play` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stop` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `network`
--

INSERT INTO `network` (`id_network`, `id_sos`, `soskey`, `nodes`, `edges`, `script`, `play`, `stop`, `timestamp`) VALUES
(144, 3, '26n2l1l656k2', '[{\"id\":1,{\"hash\":\"\",\"label\":\"undefined\",\"type\":\"Refinement\",\"x\":\"246\",\"y\":\"-110\"},{\"id\":2,{\"hash\":\"l8div8i2\",\"label\":\"Consti\",\"type\":\"Constituent\",\"ipAddress\":\"\",\"responseTime\":\"\",\"availability\":\"\",\"x\":\"57\",\"y\":\"-92\"},{\"id\":3,{\"hash\":\"l8div8i2\",\"label\":\"Mission id 13\",\"type\":\"Mission\",\"x\":\"111\",\"y\":\"220\"},{\"id\":4,{\"hash\":\"l8divb8y\",\"label\":\"Mission id: 6\",\"type\":\"Mission\",\"x\":\"-319\",\"y\":\"33\"},{\"id\":5,{\"hash\":\"l8divf5m\",\"label\":\"Constituent id: 7\",\"type\":\"Constituent\",\"ipAddress\":\"\",\"responseTime\":\"\",\"availability\":\"\",\"x\":\"-281\",\"y\":\"195\"},{\"id\":6,{\"hash\":\"l8diy4b1\",\"label\":\"Constituent id: 9\",\"type\":\"Constituent\",\"ipAddress\":\"\",\"responseTime\":\"\",\"availability\":\"\",\"x\":\"-120\",\"y\":\"212\"},{\"id\":7,{\"hash\":\"l8diz82a\",\"label\":\"Mission id: 10\",\"type\":\"Mission\",\"x\":\"-137\",\"y\":\"35\"},{\"id\":8,{\"hash\":\"l8dizmv4\",\"label\":\"Constituent id: 12\",\"type\":\"Constituent\",\"ipAddress\":\"\",\"responseTime\":\"\",\"availability\":\"\",\"x\":\"-192\",\"y\":\"292\"},{\"id\":9,{\"hash\":\"l8dj26u9\",\"label\":\"Mission id: 13\",\"type\":\"Mission\",\"x\":\"-234\",\"y\":\"-72\"},{\"id\":10,{\"hash\":\"l8dj2i2b\",\"label\":\"Constituent id: 15\",\"type\":\"Constituent\",\"ipAddress\":\"\",\"responseTime\":\"\",\"availability\":\"\",\"x\":\"-386\",\"y\":\"300\"},{\"id\":11,{\"hash\":\"l8emhqot\",\"label\":\"Mission id: 16\",\"type\":\"Mission\",\"x\":\"-437\",\"y\":\"119\"}]', '[{\"id\":12,{\"hash\":\"\",\"label\":\"bbb\",\"priority\":\"bbb\",\"type\":\"linkIndividualMission\",\"from\":\"2\",\"to\":\"3\"},{\"id\":13,{\"hash\":\"\",\"label\":\" \",\"priority\":\" \",\"type\":\"linkRefinement\",\"from\":\"3\",\"to\":\"1\"},{\"id\":14,{\"hash\":\"\",\"label\":\"\",\"priority\":\"\",\"type\":\"linkIndividualMission\",\"from\":\"5\",\"to\":\"4\"},{\"id\":15,{\"hash\":\"\",\"label\":\"\",\"priority\":\"\",\"type\":\"linkIndividualMission\",\"from\":\"6\",\"to\":\"7\"},{\"id\":16,{\"hash\":\"\",\"label\":\"\",\"priority\":\"\",\"type\":\"linkIndividualMission\",\"from\":\"8\",\"to\":\"9\"},{\"id\":17,{\"hash\":\"\",\"label\":\"\",\"priority\":\"\",\"type\":\"linkIndividualMission\",\"from\":\"10\",\"to\":\"11\"}]', 'n1=addRefinement(\"undefined\",246,-110,\"\");n2=addConstituent(\"Consti\",57,-92,\"l8div8i2\");n3=addMission(\"Mission id 13\",111,220,\"l8div8i2\");n4=addMission(\"Mission id: 6\",-319,33,\"l8divb8y\");n5=addConstituent(\"Constituent id: 7\",-281,195,\"l8divf5m\");n6=addConstituent(\"Constituent id: 9\",-120,212,\"l8diy4b1\");n7=addMission(\"Mission id: 10\",-137,35,\"l8diz82a\");n8=addConstituent(\"Constituent id: 12\",-192,292,\"l8dizmv4\");n9=addMission(\"Mission id: 13\",-234,-72,\"l8dj26u9\");n10=addConstituent(\"Constituent id: 15\",-386,300,\"l8dj2i2b\");n11=addMission(\"Mission id: 16\",-437,119,\"l8emhqot\");e12=linkIndividualMission(n2,n3,\"bbb\",\"\");setLabel(e12,\"bbb\");e13=linkRefinement(n3,n1,\" \",\"\");setLabel(e13,\" \");e14=linkIndividualMission(n5,n4,\"\",\"\");e15=linkIndividualMission(n6,n7,\"\",\"\");e16=linkIndividualMission(n8,n9,\"\",\"\");e17=linkIndividualMission(n10,n11,\"\",\"\");', '', '', '2022-09-23 15:13:48'),
(145, 1, '2rsgl1l6p6t6', '[{\"id\":1,{\"hash\":\"lcsh0g1y\",\"label\":\"Constituent id: 1\",\"title\":\"undefined\",\"type\":\"Constituent\",\"ipAddress\":\"\",\"responseTime\":\"\",\"availability\":\"\",\"x\":\"133\",\"y\":\"-31\"},{\"id\":2,{\"hash\":\"lcsh0gre\",\"label\":\"Constituent id: 2\",\"title\":\"undefined\",\"type\":\"Constituent\",\"ipAddress\":\"\",\"responseTime\":\"\",\"availability\":\"\",\"x\":\"-37\",\"y\":\"-35\"},{\"id\":3,{\"hash\":\"lcsnbdyk\",\"label\":\"Mission id: 3\",\"title\":\"Mission id: 3 description\",\"type\":\"Mission\",\"x\":\"40\",\"y\":\"-170\"},{\"id\":5,{\"hash\":\"lcsnbq6t\",\"label\":\"Mission id: 5\",\"title\":\"Mission id: 5 description\",\"type\":\"Mission\",\"x\":\"201\",\"y\":\"-158\"}]', '[{\"id\":4,{\"hash\":\"\",\"label\":\"\",\"priority\":\"\",\"type\":\"linkIndividualMission\",\"from\":\"2\",\"to\":\"3\"},{\"id\":6,{\"hash\":\"\",\"label\":\"\",\"priority\":\"\",\"type\":\"linkIndividualMission\",\"from\":\"1\",\"to\":\"5\"}]', 'n1=addConstituent(\"Constituent id: 1\",\"undefined\",133,-31,\"lcsh0g1y\");n2=addConstituent(\"Constituent id: 2\",\"undefined\",-37,-35,\"lcsh0gre\");n3=addMission(\"Mission id: 3\",\"Mission id: 3 description\",40,-170,\"lcsnbdyk\");n5=addMission(\"Mission id: 5\",\"Mission id: 5 description\",201,-158,\"lcsnbq6t\");e4=linkIndividualMission(n2,n3,\"\",\"\");e6=linkIndividualMission(n1,n5,\"\",\"\");', '', '', '2023-01-12 05:24:45'),
(146, 5, '4978l1kw2688', '[{\"id\":1,{\"hash\":\"lbvpylmh\",\"label\":\"Constituent id 1\",\"title\":\"189\",\"type\":\"Constituent\",\"ipAddress\":\"\",\"responseTime\":\"\",\"availability\":\"\",\"x\":\"137\",\"y\":\"140\"},{\"id\":2,{\"hash\":\"lbvpylmp\",\"label\":\"Constituent id 2\",\"title\":\"-54\",\"type\":\"Constituent\",\"ipAddress\":\"\",\"responseTime\":\"\",\"availability\":\"\",\"x\":\"4\",\"y\":\"44\"},{\"id\":3,{\"hash\":\"lbvpylmq\",\"label\":\"Mission id 3\",\"title\":\"Mission tooltip - id: 3\",\"type\":\"Mission\",\"x\":\"-31\",\"y\":\"-59\"},{\"id\":4,{\"hash\":\"lbvpylms\",\"label\":\"Mission id: 5\",\"title\":\"Mission tooltip - id: 4\",\"type\":\"Mission\",\"x\":\"202\",\"y\":\"23\"}]', '[{\"id\":5,{\"hash\":\"\",\"label\":\"\",\"priority\":\"\",\"type\":\"linkIndividualMission\",\"from\":\"2\",\"to\":\"3\"},{\"id\":6,{\"hash\":\"\",\"label\":\"\",\"priority\":\"\",\"type\":\"linkIndividualMission\",\"from\":\"1\",\"to\":\"4\"}]', 'n1=addConstituent(\"Constituent id 1\",\"189\",137,140,\"lbvpylmh\");n2=addConstituent(\"Constituent id 2\",\"-54\",4,44,\"lbvpylmp\");n3=addMission(\"Mission id 3\",\"Mission tooltip - id: 3\",-31,-59,\"lbvpylmq\");n4=addMission(\"Mission id: 5\",\"Mission tooltip - id: 4\",202,23,\"lbvpylms\");e5=linkIndividualMission(n2,n3,\"\",\"\");e6=linkIndividualMission(n1,n4,\"\",\"\");', '', '', '2022-12-20 04:22:03'),
(212, 4, '6ba7l7858dgs', '[{\"id\":1,{\"hash\":\"lbvpijqh\",\"label\":\"Constituent id: 1\",\"title\":\"undefined\",\"type\":\"Constituent\",\"ipAddress\":\"\",\"responseTime\":\"\",\"availability\":\"\",\"x\":\"-76\",\"y\":\"27\"},{\"id\":2,{\"hash\":\"lbvpik9t\",\"label\":\"Mission id: 2\",\"title\":\"Mission tooltip - id: 2\",\"type\":\"Mission\",\"x\":\"-106\",\"y\":\"-74\"}]', '[{\"id\":3,{\"hash\":\"\",\"label\":\"\",\"priority\":\"\",\"type\":\"linkIndividualMission\",\"from\":\"1\",\"to\":\"2\"}]', 'n1=addConstituent(\"Constituent id: 1\",\"undefined\",-76,27,\"lbvpijqh\");n2=addMission(\"Mission id: 2\",\"Mission tooltip - id: 2\",-106,-74,\"lbvpik9t\");e3=linkIndividualMission(n1,n2,\"\",\"\");', '', '', '2022-12-20 04:09:33'),
(213, 2, 'dxc1l7ge2qtz', '[{\"id\":1,{\"hash\":\"lbqx2c4z\",\"label\":\"xxx\",\"title\":\"Mission tooltip - id: 1\",\"type\":\"Mission\",\"x\":\"52\",\"y\":\"172\"},{\"id\":2,{\"hash\":\"lbqx2cqm\",\"label\":\"XXXXX\",\"title\":\"1.1.1.1\",\"type\":\"Constituent\",\"ipAddress\":\"\",\"responseTime\":\"\",\"availability\":\"\",\"x\":\"58\",\"y\":\"5\"},{\"id\":3,{\"hash\":\"lbqx7fep\",\"label\":\"Constituent id: 4\",\"title\":\"2.2.2.21\",\"type\":\"Constituent\",\"ipAddress\":\"\",\"responseTime\":\"\",\"availability\":\"\",\"x\":\"205\",\"y\":\"-17\"},{\"id\":4,{\"hash\":\"lbqx7jdm\",\"label\":\"Mission id: 5\",\"title\":\"Mission tooltip - id: 4\",\"type\":\"Mission\",\"x\":\"282\",\"y\":\"122\"},{\"id\":5,{\"hash\":\"lbvkxo9z\",\"label\":\"Constituent id: 7\",\"title\":\"22222222222\",\"type\":\"Constituent\",\"ipAddress\":\"\",\"responseTime\":\"\",\"availability\":\"\",\"x\":\"-144\",\"y\":\"0\"},{\"id\":6,{\"hash\":\"lbvkzmok\",\"label\":\"Mission id: 8\",\"title\":\"Mission tooltip - id: 6\",\"type\":\"Mission\",\"x\":\"-188\",\"y\":\"127\"},{\"id\":7,{\"hash\":\"lbvlyl7f\",\"label\":\"Constituent id: 10\",\"title\":\"111\",\"type\":\"Constituent\",\"ipAddress\":\"\",\"responseTime\":\"\",\"availability\":\"\",\"x\":\"-219\",\"y\":\"-121\"},{\"id\":8,{\"hash\":\"lbvnm6t1\",\"label\":\"Constituent id: 11\",\"title\":\"7777\",\"type\":\"Constituent\",\"ipAddress\":\"\",\"responseTime\":\"\",\"availability\":\"\",\"x\":\"-379\",\"y\":\"-65\"},{\"id\":9,{\"hash\":\"lbvnppbs\",\"label\":\"Mission id: 12\",\"title\":\"Mission tooltip - id: 9\",\"type\":\"Mission\",\"x\":\"-433\",\"y\":\"105\"}]', '[{\"id\":10,{\"hash\":\"\",\"label\":\"\",\"priority\":\"\",\"type\":\"linkIndividualMission\",\"from\":\"2\",\"to\":\"1\"},{\"id\":11,{\"hash\":\"\",\"label\":\"\",\"priority\":\"\",\"type\":\"linkIndividualMission\",\"from\":\"3\",\"to\":\"4\"},{\"id\":12,{\"hash\":\"\",\"label\":\"\",\"priority\":\"\",\"type\":\"linkIndividualMission\",\"from\":\"5\",\"to\":\"6\"},{\"id\":13,{\"hash\":\"\",\"label\":\"\",\"priority\":\"\",\"type\":\"linkIndividualMission\",\"from\":\"8\",\"to\":\"9\"}]', 'n1=addMission(\"xxx\",\"Mission tooltip - id: 1\",52,172,\"lbqx2c4z\");n2=addConstituent(\"XXXXX\",\"1.1.1.1\",58,5,\"lbqx2cqm\");n3=addConstituent(\"Constituent id: 4\",\"2.2.2.21\",205,-17,\"lbqx7fep\");n4=addMission(\"Mission id: 5\",\"Mission tooltip - id: 4\",282,122,\"lbqx7jdm\");n5=addConstituent(\"Constituent id: 7\",\"22222222222\",-144,0,\"lbvkxo9z\");n6=addMission(\"Mission id: 8\",\"Mission tooltip - id: 6\",-188,127,\"lbvkzmok\");n7=addConstituent(\"Constituent id: 10\",\"111\",-219,-121,\"lbvlyl7f\");n8=addConstituent(\"Constituent id: 11\",\"7777\",-379,-65,\"lbvnm6t1\");n9=addMission(\"Mission id: 12\",\"Mission tooltip - id: 9\",-433,105,\"lbvnppbs\");e10=linkIndividualMission(n2,n1,\"\",\"\");e11=linkIndividualMission(n3,n4,\"\",\"\");e12=linkIndividualMission(n5,n6,\"\",\"\");e13=linkIndividualMission(n8,n9,\"\",\"\");', '', '', '2022-12-20 03:20:56'),
(219, 7, 'abcdef', '[{\"id\":1,\"label\":\"Constituent id: 1\",\"type\":\"Constituent\",\"ipAddress\":\"\",\"responseTime\":\"\",\"availability\":\"\",\"x\":\"-322\",\"y\":\"-144\"},{\"id\":2,\"label\":\"Mission id: 2\",\"type\":\"Mission\",\"x\":\"-253\",\"y\":\"-277\"}]', '{}', 'n1=addConstituent(\"Constituent id: 1\",-322,-144);n2=addMission(\"Mission id: 2\",-253,-277);', '', '', '2022-09-09 21:10:08'),
(232, 13, 'cb298e942a077e9f100d63019a77c971', '', '', '', '', '', '2022-12-13 22:40:30'),
(233, 14, '4e4e7b6932baf7ef4876b6c7ef3c8a53', '[{\"id\":1,{\"hash\":\"\",\"label\":\"undefined\",\"type\":\"Refinement\",\"x\":\"473\",\"y\":\"95\"},{\"id\":2,{\"hash\":\"l9stxqeh\",\"label\":\"Consti\",\"type\":\"Constituent\",\"ipAddress\":\"\",\"responseTime\":\"\",\"availability\":\"\",\"x\":\"-315\",\"y\":\"96\"},{\"id\":3,{\"hash\":\"l9stxqej\",\"label\":\"Mission id 13\",\"type\":\"Mission\",\"x\":\"111\",\"y\":\"220\"},{\"id\":6,{\"hash\":\"lbmv5yis\",\"label\":\"Constituent xxx\",\"type\":\"Constituent\",\"ipAddress\":\"\",\"responseTime\":\"\",\"availability\":\"\",\"x\":\"96\",\"y\":\"134\"}]', '[{\"id\":4,{\"hash\":\"\",\"label\":\"bbb\",\"priority\":\"bbb\",\"type\":\"linkIndividualMission\",\"from\":\"2\",\"to\":\"3\"},{\"id\":5,{\"hash\":\"\",\"label\":\"ttttttttttttttt\",\"priority\":\"ttttttttttttttt\",\"type\":\"linkRefinement\",\"from\":\"3\",\"to\":\"1\"}]', 'n1=addRefinement(\"undefined\",246,-110,\"\");n2=addConstituent(\"Consta\",57,-92,\"l9stxqeh\");n3=addMission(\"Mission id 13\",111,220,\"l9stxqej\");e4=linkIndividualMission(n2,n3,\"bbb\",\"\");setLabel(e4,\"bbb\");e5=linkRefinement(n3,n1,\"uuuuuuuuuu\",\"\");setLabel(e5,\"uuuuuuuuuu\");', '', '', '2022-12-14 00:00:10'),
(235, 6, '', '{}', '{}', '', '', '', '2022-12-20 03:55:39'),
(236, 16, '8c527692e560b071da274aea516e3e0f', '', '', '', '', '', '2022-12-20 04:10:05'),
(237, 11, 'asdfasdfasdfa', '', '', '', '', '', '2022-12-20 04:20:12'),
(238, 0, '791f34cf85cba97d94e4253f63235465', '', '', '', '', '', '2023-01-06 13:23:49'),
(239, 0, '1af75095425adcf202bc50703e17dbaf', '', '', '', '', '', '2023-01-06 13:34:03'),
(241, 11, '925f82235a67ada8082f9eb3c2c8b3bd', '', '', '', '', '', '2023-01-06 13:48:52'),
(242, 12, '801395f58826831efbb38b3791efc6ea', '', '', '', '', '', '2023-01-06 13:50:09'),
(243, 13, '1ade305695138f7084366aefe4151fd0', '', '', '', '', '', '2023-01-06 13:53:12'),
(244, 10014, '6831e155d4c23d112b868b888c7d93f0', '[{\"id\":1,{\"hash\":\"lcslutce\",\"label\":\"Constituent id: 1\",\"title\":\"Constituent id: 1 description\",\"type\":\"Constituent\",\"ipAddress\":\"\",\"responseTime\":\"\",\"availability\":\"\",\"x\":\"115\",\"y\":\"96\"},{\"id\":2,{\"hash\":\"lcslutxk\",\"label\":\"Mission id: 2\",\"title\":\"Mission id: 2\",\"type\":\"Mission\",\"x\":\"97\",\"y\":\"10\"},{\"id\":4,{\"hash\":\"\",\"label\":\"ATTENTION\",\"title\":\"Text tooltip - id 4\",\"type\":\"Text\",\"x\":\"45\",\"y\":\"163\"}]', '[{\"id\":3,{\"hash\":\"\",\"label\":\"\",\"priority\":\"\",\"type\":\"linkIndividualMission\",\"from\":\"1\",\"to\":\"2\"}]', 'n1=addConstituent(\"Constituent id: 1\",\"Constituent id: 1 description\",115,96,\"lcslutce\");n2=addMission(\"Mission id: 2\",\"Mission id: 2\",97,10,\"lcslutxk\");e3=linkIndividualMission(n1,n2,\"\",\"\");n4=addText(\"ATTENTION\\nNew line created\\n one more\",\"Text tooltip - id 4\",45,163,\"\");', '', '', '2023-01-12 04:49:31'),
(245, 17, 'c11a984de85404164a8cd4fa1532cfd9', '[{\"id\":1,{\"hash\":\"lcmg5d99\",\"label\":\"No-break\",\"title\":\"undefined\",\"type\":\"Constituent\",\"ipAddress\":\"\",\"responseTime\":\"\",\"availability\":\"\",\"x\":\"177\",\"y\":\"-70\"},{\"id\":2,{\"hash\":\"lcmg5ebp\",\"label\":\"Gateway telefonia\",\"title\":\"undefined\",\"type\":\"Constituent\",\"ipAddress\":\"\",\"responseTime\":\"\",\"availability\":\"\",\"x\":\"-42\",\"y\":\"-66\"},{\"id\":3,{\"hash\":\"lcmg6ad8\",\"label\":\"Gerador\",\"title\":\"undefined\",\"type\":\"Constituent\",\"ipAddress\":\"\",\"responseTime\":\"\",\"availability\":\"\",\"x\":\"531\",\"y\":\"-77\"},{\"id\":4,{\"hash\":\"lcmg6l7g\",\"label\":\"Realizar notificação\",\"title\":\"Mission tooltip - id: 4\",\"type\":\"Mission\",\"x\":\"-39\",\"y\":\"-240\"},{\"id\":5,{\"hash\":\"lcmg7ci4\",\"label\":\"Informar autonomia das baterias\",\"title\":\"Mission tooltip - id: 5\",\"type\":\"Mission\",\"x\":\"180\",\"y\":\"-152\"},{\"id\":6,{\"hash\":\"lcmg7yp0\",\"label\":\"Informar nível de combustível\",\"title\":\"Mission tooltip - id: 6\",\"type\":\"Mission\",\"x\":\"414\",\"y\":\"-150\"},{\"id\":7,{\"hash\":\"\",\"label\":\"undefined\",\"title\":\"undefined\",\"type\":\"Refinement\",\"x\":\"288\",\"y\":\"-200\"},{\"id\":8,{\"hash\":\"lcmg8shh\",\"label\":\"Calcular autonomia total\",\"title\":\"Mission tooltip - id: 8\",\"type\":\"Mission\",\"x\":\"286\",\"y\":\"-242\"},{\"id\":9,{\"hash\":\"\",\"label\":\"undefined\",\"title\":\"undefined\",\"type\":\"Refinement\",\"x\":\"286\",\"y\":\"-320\"},{\"id\":10,{\"hash\":\"lcmg9zvg\",\"label\":\"Notificar plantonistas sobre interrupção e tempo total de autonomia\",\"title\":\"Mission tooltip - id: 10\",\"type\":\"Mission\",\"x\":\"287\",\"y\":\"-388\"},{\"id\":11,{\"hash\":\"lcmgbgpf\",\"label\":\"Identificar interrupção de energia\",\"title\":\"Mission tooltip - id: 11\",\"type\":\"Mission\",\"x\":\"599\",\"y\":\"-241\"}]', '[{\"id\":12,{\"hash\":\"\",\"label\":\"\",\"priority\":\"\",\"type\":\"linkRefinement\",\"from\":\"5\",\"to\":\"7\"},{\"id\":13,{\"hash\":\"\",\"label\":\"\",\"priority\":\"\",\"type\":\"linkRefinement\",\"from\":\"6\",\"to\":\"7\"},{\"id\":14,{\"hash\":\"\",\"label\":\"\",\"priority\":\"\",\"type\":\"linkRefinement\",\"from\":\"7\",\"to\":\"8\"},{\"id\":15,{\"hash\":\"\",\"label\":\"\",\"priority\":\"\",\"type\":\"linkIndividualMission\",\"from\":\"2\",\"to\":\"4\"},{\"id\":16,{\"hash\":\"\",\"label\":\"\",\"priority\":\"\",\"type\":\"linkIndividualMission\",\"from\":\"1\",\"to\":\"5\"},{\"id\":17,{\"hash\":\"\",\"label\":\"\",\"priority\":\"\",\"type\":\"linkIndividualMission\",\"from\":\"3\",\"to\":\"6\"},{\"id\":18,{\"hash\":\"\",\"label\":\"\",\"priority\":\"\",\"type\":\"linkRefinement\",\"from\":\"4\",\"to\":\"9\"},{\"id\":19,{\"hash\":\"\",\"label\":\"\",\"priority\":\"\",\"type\":\"linkRefinement\",\"from\":\"8\",\"to\":\"9\"},{\"id\":20,{\"hash\":\"\",\"label\":\"\",\"priority\":\"\",\"type\":\"linkMission\",\"from\":\"9\",\"to\":\"10\"},{\"id\":21,{\"hash\":\"\",\"label\":\"\",\"priority\":\"\",\"type\":\"linkIndividualMission\",\"from\":\"3\",\"to\":\"11\"},{\"id\":22,{\"hash\":\"\",\"label\":\"\",\"priority\":\"\",\"type\":\"linkRefinement\",\"from\":\"11\",\"to\":\"9\"}]', 'n1=addConstituent(\"No-break\",\"undefined\",177,-70,\"lcmg5d99\");n2=addConstituent(\"Gateway telefonia\",\"undefined\",-42,-66,\"lcmg5ebp\");n3=addConstituent(\"Gerador\",\"undefined\",531,-77,\"lcmg6ad8\");n4=addMission(\"Realizar notificação\",\"Mission tooltip - id: 4\",-39,-240,\"lcmg6l7g\");n5=addMission(\"Informar autonomia das baterias\",\"Mission tooltip - id: 5\",180,-152,\"lcmg7ci4\");n6=addMission(\"Informar nível de combustível\",\"Mission tooltip - id: 6\",414,-150,\"lcmg7yp0\");n7=addRefinement(\"undefined\",\"undefined\",288,-200,\"\");n8=addMission(\"Calcular autonomia total\",\"Mission tooltip - id: 8\",286,-242,\"lcmg8shh\");n9=addRefinement(\"undefined\",\"undefined\",286,-320,\"\");n10=addMission(\"Notificar plantonistas sobre interrupção e tempo total de autonomia\",\"Mission tooltip - id: 10\",287,-388,\"lcmg9zvg\");n11=addMission(\"Identificar interrupção de energia\",\"Mission tooltip - id: 11\",599,-241,\"lcmgbgpf\");e12=linkRefinement(n5,n7,\"\",\"\");e13=linkRefinement(n6,n7,\"\",\"\");e14=linkRefinement(n7,n8,\"\",\"\");e15=linkIndividualMission(n2,n4,\"\",\"\");e16=linkIndividualMission(n1,n5,\"\",\"\");e17=linkIndividualMission(n3,n6,\"\",\"\");e18=linkRefinement(n4,n9,\"\",\"\");e19=linkRefinement(n8,n9,\"\",\"\");e20=linkMission(n9,n10,\"\",\"\");e21=linkIndividualMission(n3,n11,\"\",\"\");e22=linkRefinement(n11,n9,\"\",\"\");', '', '', '2023-01-07 21:25:45'),
(246, 15, 'ee3d5a2460169495c40dfc18d285fc7c', '', '', '', '', '', '2023-01-07 21:35:31'),
(247, 16, '5a81dccadc471381076ee375d2bfdf8c', '', '', '', '', '', '2023-01-07 21:48:53'),
(249, 10039, 'f67cdbfe83a23fb1cad75b6ab8704bbe', '', '', '', '', '', '2023-01-12 02:13:29'),
(250, 10040, '1329ae3d3d8305fd85ba790d7aa35138', '', '', '', '', '', '2023-01-12 04:19:11'),
(251, 10041, 'db302211976aaa2aa67e5d4dc3a03880', '', '', 'n100=addText(\"ATTENTION: ,,, need to be replaced\",\"\",100,100,\"xxx\");', '', '', '2023-01-12 05:02:01'),
(252, 10042, '13a9775e7319724b65e577faf05b6b53', '', '', 't1=addText(\"*** ATTENTION: Replace the following CS due state of interest violation: Telephony Gateway, TG, GPS\",\"\",100,100,\"xxx\");', '', '', '2023-01-12 05:16:28'),
(253, 10043, '20535242ba4fe26a9a8adfd26960839b', '', '', 'n1=addConstituent(\"Constituent id: 1\",\"undefined\",5,28,\"lcsh0g1y\");n2=addConstituent(\"Constituent id: 2\",\"undefined\",-131,-38,\"lcsh0gre\");t1=addText(\"*** ATTENTION: Replace the following CS due state of interest violation: Telephony Gateway, TG, GPS ***\",\"\",100,100,\"xxx\");', '', '', '2023-01-12 05:22:57'),
(254, 10044, 'a8b6a3a8e27fba5d46531623aa20d3bb', '', '', 'n1=addConstituent(\"Constituent id: 1\",\"undefined\",133,-31,\"lcsh0g1y\");n2=addConstituent(\"Constituent id: 2\",\"undefined\",-37,-35,\"lcsh0gre\");n3=addMission(\"Mission id: 3\",\"Mission id: 3 description\",40,-170,\"lcsnbdyk\");n5=addMission(\"Mission id: 5\",\"Mission id: 5 description\",201,-158,\"lcsnbq6t\");e4=linkIndividualMission(n2,n3,\"\",\"\");e6=linkIndividualMission(n1,n5,\"\",\"\");t1=addText(\"*** ATTENTION: Replace the following CS due state of interest violation: Telephony Gateway, TG, GPS ***\",\"\",100,100,\"xxx\");', '', '', '2023-01-12 05:25:33'),
(255, 10045, 'be0ffc4271b59f5af69937927fc2b546', '', '', 'n1=addConstituent(\"Constituent id: 1\",\"undefined\",133,-31,\"lcsh0g1y\");n2=addConstituent(\"Constituent id: 2\",\"undefined\",-37,-35,\"lcsh0gre\");n3=addMission(\"Mission id: 3\",\"Mission id: 3 description\",40,-170,\"lcsnbdyk\");n5=addMission(\"Mission id: 5\",\"Mission id: 5 description\",201,-158,\"lcsnbq6t\");e4=linkIndividualMission(n2,n3,\"\",\"\");e6=linkIndividualMission(n1,n5,\"\",\"\");t1=addText(\"*** ATTENTION: \n Replace the following CS due state of interest violation: Telephony Gateway, TG, GPS ***\",\"\",100,100,\"xxx\");', '', '', '2023-01-12 05:26:45'),
(256, 10046, '982df526818557358ae839c185db04ac', '', '', 'n1=addConstituent(\"Constituent id: 1\",\"undefined\",133,-31,\"lcsh0g1y\");n2=addConstituent(\"Constituent id: 2\",\"undefined\",-37,-35,\"lcsh0gre\");n3=addMission(\"Mission id: 3\",\"Mission id: 3 description\",40,-170,\"lcsnbdyk\");n5=addMission(\"Mission id: 5\",\"Mission id: 5 description\",201,-158,\"lcsnbq6t\");e4=linkIndividualMission(n2,n3,\"\",\"\");e6=linkIndividualMission(n1,n5,\"\",\"\");t1=addText(\"*** ATTENTION: \n Replace the following CS due state of interest violation: Telephony Gateway, TG, GPS ***\",\"\",100,100,\"xxx\");', '', '', '2023-01-12 05:28:56'),
(257, 10047, 'b1f830d9a7a5e09692ab99d492dbcde2', '', '', 'n1=addConstituent(\"Constituent id: 1\",\"undefined\",133,-31,\"lcsh0g1y\");n2=addConstituent(\"Constituent id: 2\",\"undefined\",-37,-35,\"lcsh0gre\");n3=addMission(\"Mission id: 3\",\"Mission id: 3 description\",40,-170,\"lcsnbdyk\");n5=addMission(\"Mission id: 5\",\"Mission id: 5 description\",201,-158,\"lcsnbq6t\");e4=linkIndividualMission(n2,n3,\"\",\"\");e6=linkIndividualMission(n1,n5,\"\",\"\");t1=addText(\"*** ATTENTION: Replace the following CS due state of interest violation: Telephony Gateway, TG, GPS ***\",\"\",100,100,\"xxx\");', '', '', '2023-01-12 05:32:25'),
(258, 10048, '759879c68f85080cfc196170de78d65d', '', '', 'n1=addConstituent(\"No-break\",\"undefined\",177,-70,\"lcmg5d99\");n2=addConstituent(\"Gateway telefonia\",\"undefined\",-42,-66,\"lcmg5ebp\");n3=addConstituent(\"Gerador\",\"undefined\",531,-77,\"lcmg6ad8\");n4=addMission(\"Realizar notificação\",\"Mission tooltip - id: 4\",-39,-240,\"lcmg6l7g\");n5=addMission(\"Informar autonomia das baterias\",\"Mission tooltip - id: 5\",180,-152,\"lcmg7ci4\");n6=addMission(\"Informar nível de combustível\",\"Mission tooltip - id: 6\",414,-150,\"lcmg7yp0\");n7=addRefinement(\"undefined\",\"undefined\",288,-200,\"\");n8=addMission(\"Calcular autonomia total\",\"Mission tooltip - id: 8\",286,-242,\"lcmg8shh\");n9=addRefinement(\"undefined\",\"undefined\",286,-320,\"\");n10=addMission(\"Notificar plantonistas sobre interrupção e tempo total de autonomia\",\"Mission tooltip - id: 10\",287,-388,\"lcmg9zvg\");n11=addMission(\"Identificar interrupção de energia\",\"Mission tooltip - id: 11\",599,-241,\"lcmgbgpf\");e12=linkRefinement(n5,n7,\"\",\"\");e13=linkRefinement(n6,n7,\"\",\"\");e14=linkRefinement(n7,n8,\"\",\"\");e15=linkIndividualMission(n2,n4,\"\",\"\");e16=linkIndividualMission(n1,n5,\"\",\"\");e17=linkIndividualMission(n3,n6,\"\",\"\");e18=linkRefinement(n4,n9,\"\",\"\");e19=linkRefinement(n8,n9,\"\",\"\");e20=linkMission(n9,n10,\"\",\"\");e21=linkIndividualMission(n3,n11,\"\",\"\");e22=linkRefinement(n11,n9,\"\",\"\");t1=addText(\"*** ATTENTION *** Replace the following CS due state of interest violation: , Gateway telefonia\", \"\", 100, 100, \"xxx\");', '', '', '2023-01-12 05:35:52'),
(259, 10049, 'f2f34d81641e2a4f60fc9d14efc5284c', '[{\"id\":3,{\"hash\":\"lcmg6ad8\",\"label\":\"Teste\",\"title\":\"undefined\",\"type\":\"Constituent\",\"ipAddress\":\"\",\"responseTime\":\"\",\"availability\":\"\",\"x\":\"412\",\"y\":\"-55\"},{\"id\":4,{\"hash\":\"lcmg6l7g\",\"label\":\"Realizar notificação\",\"title\":\"Realizar notificação\",\"type\":\"Mission\",\"x\":\"-39\",\"y\":\"-240\"},{\"id\":5,{\"hash\":\"lcmg7ci4\",\"label\":\"Informar autonomia das baterias\",\"title\":\"Informar autonomia das baterias\",\"type\":\"Mission\",\"x\":\"180\",\"y\":\"-152\"},{\"id\":6,{\"hash\":\"lcmg7yp0\",\"label\":\"Informar nível de combustível\",\"title\":\"Informar nível de combustível\",\"type\":\"Mission\",\"x\":\"414\",\"y\":\"-150\"},{\"id\":7,{\"hash\":\"\",\"label\":\"undefined\",\"title\":\"undefined\",\"type\":\"Refinement\",\"x\":\"288\",\"y\":\"-200\"},{\"id\":8,{\"hash\":\"lcmg8shh\",\"label\":\"Calcular autonomia total\",\"title\":\"Calcular autonomia total\",\"type\":\"Mission\",\"x\":\"286\",\"y\":\"-242\"},{\"id\":9,{\"hash\":\"\",\"label\":\"undefined\",\"title\":\"undefined\",\"type\":\"Refinement\",\"x\":\"286\",\"y\":\"-320\"},{\"id\":10,{\"hash\":\"lcmg9zvg\",\"label\":\"Notificar plantonistas sobre interrupção e tempo total de autonomia\",\"title\":\"Notificar plantonistas sobre interrupção e tempo total de autonomia\",\"type\":\"Mission\",\"x\":\"287\",\"y\":\"-388\"},{\"id\":11,{\"hash\":\"lcmgbgpf\",\"label\":\"Identificar interrupção de energia\",\"title\":\"Identificar interrupção de energia\",\"type\":\"Mission\",\"x\":\"599\",\"y\":\"-241\"},{\"id\":23,{\"hash\":\"\",\"label\":\"*** ATTENTION *** Affected CS due state of interest violations: Gateway telefonia, Gerador, No-break\",\"title\":\"Text tooltip - id 23\",\"type\":\"Text\",\"x\":\"100\",\"y\":\"100\"}]', '[{\"id\":12,{\"hash\":\"\",\"label\":\"\",\"priority\":\"\",\"type\":\"linkRefinement\",\"from\":\"5\",\"to\":\"7\"},{\"id\":13,{\"hash\":\"\",\"label\":\"\",\"priority\":\"\",\"type\":\"linkRefinement\",\"from\":\"6\",\"to\":\"7\"},{\"id\":14,{\"hash\":\"\",\"label\":\"\",\"priority\":\"\",\"type\":\"linkRefinement\",\"from\":\"7\",\"to\":\"8\"},{\"id\":17,{\"hash\":\"\",\"label\":\"\",\"priority\":\"\",\"type\":\"linkIndividualMission\",\"from\":\"3\",\"to\":\"6\"},{\"id\":18,{\"hash\":\"\",\"label\":\"\",\"priority\":\"\",\"type\":\"linkRefinement\",\"from\":\"4\",\"to\":\"9\"},{\"id\":19,{\"hash\":\"\",\"label\":\"\",\"priority\":\"\",\"type\":\"linkRefinement\",\"from\":\"8\",\"to\":\"9\"},{\"id\":20,{\"hash\":\"\",\"label\":\"\",\"priority\":\"\",\"type\":\"linkMission\",\"from\":\"9\",\"to\":\"10\"},{\"id\":22,{\"hash\":\"\",\"label\":\"\",\"priority\":\"\",\"type\":\"linkRefinement\",\"from\":\"11\",\"to\":\"9\"}]', 'n3=addConstituent(\"Teste\",\"undefined\",412,-55,\"lcmg6ad8\");n4=addMission(\"Realizar notificação\",\"Realizar notificação\",-39,-240,\"lcmg6l7g\");n5=addMission(\"Informar autonomia das baterias\",\"Informar autonomia das baterias\",180,-152,\"lcmg7ci4\");n6=addMission(\"Informar nível de combustível\",\"Informar nível de combustível\",414,-150,\"lcmg7yp0\");n7=addRefinement(\"undefined\",\"undefined\",288,-200,\"\");n8=addMission(\"Calcular autonomia total\",\"Calcular autonomia total\",286,-242,\"lcmg8shh\");n9=addRefinement(\"undefined\",\"undefined\",286,-320,\"\");n10=addMission(\"Notificar plantonistas sobre interrupção e tempo total de autonomia\",\"Notificar plantonistas sobre interrupção e tempo total de autonomia\",287,-388,\"lcmg9zvg\");n11=addMission(\"Identificar interrupção de energia\",\"Identificar interrupção de energia\",599,-241,\"lcmgbgpf\");n23=addText(\"*** ATTENTION *** Affected CS due state of interest violations: Gateway telefonia, Gerador, No-break\",\"Text tooltip - id 23\",100,100,\"\");e12=linkRefinement(n5,n7,\"\",\"\");e13=linkRefinement(n6,n7,\"\",\"\");e14=linkRefinement(n7,n8,\"\",\"\");e17=linkIndividualMission(n3,n6,\"\",\"\");e18=linkRefinement(n4,n9,\"\",\"\");e19=linkRefinement(n8,n9,\"\",\"\");e20=linkMission(n9,n10,\"\",\"\");e22=linkRefinement(n11,n9,\"\",\"\");', '', '', '2023-01-15 17:46:18'),
(260, 10050, '6c7355cf59e49b532231e1147a70695e', '', '', 'n1=addConstituent(\"Constituent id: 1\",\"undefined\",133,-31,\"lcsh0g1y\");n2=addConstituent(\"Constituent id: 2\",\"undefined\",-37,-35,\"lcsh0gre\");n3=addMission(\"Mission id: 3\",\"Mission id: 3 description\",40,-170,\"lcsnbdyk\");n5=addMission(\"Mission id: 5\",\"Mission id: 5 description\",201,-158,\"lcsnbq6t\");e4=linkIndividualMission(n2,n3,\"\",\"\");e6=linkIndividualMission(n1,n5,\"\",\"\");t1=addMessage(\"*** ATTENTION *** Cloned from original diagram. Affected CS due state of interest violations are: \", \"\", 100, 100, \"xxx\");', '', '', '2023-01-13 13:56:17'),
(261, 10051, '84c514c250f0e02db4f7344c9d65f0b8', '', '', 'n1=addConstituent(\"No-break\",\"undefined\",177,-70,\"lcmg5d99\")n2=addConstituent(\"Gateway telefonia\",\"undefined\",-42,-66,\"lcmg5ebp\")n3=addConstituent(\"Gerador\",\"undefined\",531,-77,\"lcmg6ad8\")e15=linkIndividualMission(n2,n4,\"\",\"\")e16=linkIndividualMission(n1,n5,\"\",\"\")e17=linkIndividualMission(n3,n6,\"\",\"\")e21=linkIndividualMission(n3,n11,\"\",\"\")t1=addMessage(\"*** ATTENTION *** Cloned from original diagram. Affected CS due state of interest violations are: Gateway telefonia, Gerador, No-break\", \"\", 100, 100, \"xxx\");', '', '', '2023-01-15 16:05:53'),
(262, 10052, '076f93d5e36d640a40908dea81908ac6', '', '', 'n4=addMission(\"Realizar notificação\",\"Mission tooltip - id: 4\",-39,-240,\"lcmg6l7g\")n5=addMission(\"Informar autonomia das baterias\",\"Mission tooltip - id: 5\",180,-152,\"lcmg7ci4\")n6=addMission(\"Informar nível de combustível\",\"Mission tooltip - id: 6\",414,-150,\"lcmg7yp0\")n7=addRefinement(\"undefined\",\"undefined\",288,-200,\"\")n8=addMission(\"Calcular autonomia total\",\"Mission tooltip - id: 8\",286,-242,\"lcmg8shh\")n9=addRefinement(\"undefined\",\"undefined\",286,-320,\"\")n10=addMission(\"Notificar plantonistas sobre interrupção e tempo total de autonomia\",\"Mission tooltip - id: 10\",287,-388,\"lcmg9zvg\")n11=addMission(\"Identificar interrupção de energia\",\"Mission tooltip - id: 11\",599,-241,\"lcmgbgpf\")e12=linkRefinement(n5,n7,\"\",\"\")e13=linkRefinement(n6,n7,\"\",\"\")e14=linkRefinement(n7,n8,\"\",\"\")e18=linkRefinement(n4,n9,\"\",\"\")e19=linkRefinement(n8,n9,\"\",\"\")e20=linkMission(n9,n10,\"\",\"\")e22=linkRefinement(n11,n9,\"\",\"\")t1=addMessage(\"*** ATTENTION *** Cloned from original diagram. Affected CS due state of interest violations are: Gateway telefonia, Gerador, No-break\", \"\", 100, 100, \"xxx\");', '', '', '2023-01-15 16:08:13'),
(263, 10053, '7c64498565be19af88cb4ff0072afbb4', '', '', 'n4=addMission(\"Realizar notificação\",\"Mission tooltip - id: 4\",-39,-240,\"lcmg6l7g\");n5=addMission(\"Informar autonomia das baterias\",\"Mission tooltip - id: 5\",180,-152,\"lcmg7ci4\");n6=addMission(\"Informar nível de combustível\",\"Mission tooltip - id: 6\",414,-150,\"lcmg7yp0\");n7=addRefinement(\"undefined\",\"undefined\",288,-200,\"\");n8=addMission(\"Calcular autonomia total\",\"Mission tooltip - id: 8\",286,-242,\"lcmg8shh\");n9=addRefinement(\"undefined\",\"undefined\",286,-320,\"\");n10=addMission(\"Notificar plantonistas sobre interrupção e tempo total de autonomia\",\"Mission tooltip - id: 10\",287,-388,\"lcmg9zvg\");n11=addMission(\"Identificar interrupção de energia\",\"Mission tooltip - id: 11\",599,-241,\"lcmgbgpf\");e12=linkRefinement(n5,n7,\"\",\"\");e13=linkRefinement(n6,n7,\"\",\"\");e14=linkRefinement(n7,n8,\"\",\"\");e18=linkRefinement(n4,n9,\"\",\"\");e19=linkRefinement(n8,n9,\"\",\"\");e20=linkMission(n9,n10,\"\",\"\");e22=linkRefinement(n11,n9,\"\",\"\");;t1=addMessage(\"*** ATTENTION *** Cloned from original diagram. Affected CS due state of interest violations are: \", \"\", 100, 100, \"xxx\");', '', '', '2023-01-15 16:21:15'),
(264, 10054, 'e8ea9f59b7c2e2aee27c845c743b3d6e', '', '', 'n4=addMission(\"Realizar notificação\",\"Mission tooltip - id: 4\",-39,-240,\"lcmg6l7g\");n5=addMission(\"Informar autonomia das baterias\",\"Mission tooltip - id: 5\",180,-152,\"lcmg7ci4\");n6=addMission(\"Informar nível de combustível\",\"Mission tooltip - id: 6\",414,-150,\"lcmg7yp0\");n7=addRefinement(\"undefined\",\"undefined\",288,-200,\"\");n8=addMission(\"Calcular autonomia total\",\"Mission tooltip - id: 8\",286,-242,\"lcmg8shh\");n9=addRefinement(\"undefined\",\"undefined\",286,-320,\"\");n10=addMission(\"Notificar plantonistas sobre interrupção e tempo total de autonomia\",\"Mission tooltip - id: 10\",287,-388,\"lcmg9zvg\");n11=addMission(\"Identificar interrupção de energia\",\"Mission tooltip - id: 11\",599,-241,\"lcmgbgpf\");e12=linkRefinement(n5,n7,\"\",\"\");e13=linkRefinement(n6,n7,\"\",\"\");e14=linkRefinement(n7,n8,\"\",\"\");e18=linkRefinement(n4,n9,\"\",\"\");e19=linkRefinement(n8,n9,\"\",\"\");e20=linkMission(n9,n10,\"\",\"\");e22=linkRefinement(n11,n9,\"\",\"\");;t1=addMessage(\"*** ATTENTION *** Cloned from original diagram. Affected CS due state of interest violations are: \", \"\", 0,0, \"xxx\");', '', '', '2023-01-15 16:37:31'),
(265, 10055, '80b79fa146404f114aca95248d48d4ed', '', '', 'n4=addMission(\"Realizar notificação\",\"Mission tooltip - id: 4\",-39,-240,\"lcmg6l7g\");n5=addMission(\"Informar autonomia das baterias\",\"Mission tooltip - id: 5\",180,-152,\"lcmg7ci4\");n6=addMission(\"Informar nível de combustível\",\"Mission tooltip - id: 6\",414,-150,\"lcmg7yp0\");n7=addRefinement(\"undefined\",\"undefined\",288,-200,\"\");n8=addMission(\"Calcular autonomia total\",\"Mission tooltip - id: 8\",286,-242,\"lcmg8shh\");n9=addRefinement(\"undefined\",\"undefined\",286,-320,\"\");n10=addMission(\"Notificar plantonistas sobre interrupção e tempo total de autonomia\",\"Mission tooltip - id: 10\",287,-388,\"lcmg9zvg\");n11=addMission(\"Identificar interrupção de energia\",\"Mission tooltip - id: 11\",599,-241,\"lcmgbgpf\");e12=linkRefinement(n5,n7,\"\",\"\");e13=linkRefinement(n6,n7,\"\",\"\");e14=linkRefinement(n7,n8,\"\",\"\");e18=linkRefinement(n4,n9,\"\",\"\");e19=linkRefinement(n8,n9,\"\",\"\");e20=linkMission(n9,n10,\"\",\"\");e22=linkRefinement(n11,n9,\"\",\"\");;t1=addMessage(\"*** ATTENTION *** Cloned from original diagram. Affected CS due state of interest violations are: \", \"\", 0,0, \"xxx\");', '', '', '2023-01-15 16:38:11'),
(266, 10056, 'bac8abdaa64c1a2070b89e888954afcf', '', '', 'n4=addMission(\"Realizar notificação\",\"Mission tooltip - id: 4\",-39,-240,\"lcmg6l7g\");n5=addMission(\"Informar autonomia das baterias\",\"Mission tooltip - id: 5\",180,-152,\"lcmg7ci4\");n6=addMission(\"Informar nível de combustível\",\"Mission tooltip - id: 6\",414,-150,\"lcmg7yp0\");n7=addRefinement(\"undefined\",\"undefined\",288,-200,\"\");n8=addMission(\"Calcular autonomia total\",\"Mission tooltip - id: 8\",286,-242,\"lcmg8shh\");n9=addRefinement(\"undefined\",\"undefined\",286,-320,\"\");n10=addMission(\"Notificar plantonistas sobre interrupção e tempo total de autonomia\",\"Mission tooltip - id: 10\",287,-388,\"lcmg9zvg\");n11=addMission(\"Identificar interrupção de energia\",\"Mission tooltip - id: 11\",599,-241,\"lcmgbgpf\");e12=linkRefinement(n5,n7,\"\",\"\");e13=linkRefinement(n6,n7,\"\",\"\");e14=linkRefinement(n7,n8,\"\",\"\");e18=linkRefinement(n4,n9,\"\",\"\");e19=linkRefinement(n8,n9,\"\",\"\");e20=linkMission(n9,n10,\"\",\"\");e22=linkRefinement(n11,n9,\"\",\"\");;t1=addMessage(\"*** ATTENTION *** Cloned from original diagram. Affected CS due state of interest violations are: \", \"\", 531,\"\"), \"xxx\");', '', '', '2023-01-15 16:39:16'),
(267, 10057, '404e3d012cfb5668a8a370315b9f784a', '', '', 'n4=addMission(\"Realizar notificação\",\"Mission tooltip - id: 4\",-39,-240,\"lcmg6l7g\");n5=addMission(\"Informar autonomia das baterias\",\"Mission tooltip - id: 5\",180,-152,\"lcmg7ci4\");n6=addMission(\"Informar nível de combustível\",\"Mission tooltip - id: 6\",414,-150,\"lcmg7yp0\");n7=addRefinement(\"undefined\",\"undefined\",288,-200,\"\");n8=addMission(\"Calcular autonomia total\",\"Mission tooltip - id: 8\",286,-242,\"lcmg8shh\");n9=addRefinement(\"undefined\",\"undefined\",286,-320,\"\");n10=addMission(\"Notificar plantonistas sobre interrupção e tempo total de autonomia\",\"Mission tooltip - id: 10\",287,-388,\"lcmg9zvg\");n11=addMission(\"Identificar interrupção de energia\",\"Mission tooltip - id: 11\",599,-241,\"lcmgbgpf\");e12=linkRefinement(n5,n7,\"\",\"\");e13=linkRefinement(n6,n7,\"\",\"\");e14=linkRefinement(n7,n8,\"\",\"\");e18=linkRefinement(n4,n9,\"\",\"\");e19=linkRefinement(n8,n9,\"\",\"\");e20=linkMission(n9,n10,\"\",\"\");e22=linkRefinement(n11,n9,\"\",\"\");;t1=addMessage(\"*** ATTENTION *** Cloned from original diagram. Affected CS due state of interest violations are: \", \"\", 100,100, \"xxx\");', '', '', '2023-01-15 16:41:28'),
(268, 10058, '432de7c27c63e79a65276bb13c8cb327', '', '', 'n4=addMission(\"Realizar notificação\",\"Mission tooltip - id: 4\",-39,-240,\"lcmg6l7g\");n5=addMission(\"Informar autonomia das baterias\",\"Mission tooltip - id: 5\",180,-152,\"lcmg7ci4\");n6=addMission(\"Informar nível de combustível\",\"Mission tooltip - id: 6\",414,-150,\"lcmg7yp0\");n7=addRefinement(\"undefined\",\"undefined\",288,-200,\"\");n8=addMission(\"Calcular autonomia total\",\"Mission tooltip - id: 8\",286,-242,\"lcmg8shh\");n9=addRefinement(\"undefined\",\"undefined\",286,-320,\"\");n10=addMission(\"Notificar plantonistas sobre interrupção e tempo total de autonomia\",\"Mission tooltip - id: 10\",287,-388,\"lcmg9zvg\");n11=addMission(\"Identificar interrupção de energia\",\"Mission tooltip - id: 11\",599,-241,\"lcmgbgpf\");e12=linkRefinement(n5,n7,\"\",\"\");e13=linkRefinement(n6,n7,\"\",\"\");e14=linkRefinement(n7,n8,\"\",\"\");e18=linkRefinement(n4,n9,\"\",\"\");e19=linkRefinement(n8,n9,\"\",\"\");e20=linkMission(n9,n10,\"\",\"\");e22=linkRefinement(n11,n9,\"\",\"\");;t1=addMessage(\"*** ATTENTION *** Cloned from original diagram. Affected CS due state of interest violations are: \", \"\", 100,100, \"xxx\");', '', '', '2023-01-15 16:43:45'),
(269, 10059, '92c54b89f85f2b73f4562a7c73fb82b6', '', '', 'n4=addMission(\"Realizar notificação\",\"Mission tooltip - id: 4\",-39,-240,\"lcmg6l7g\");n5=addMission(\"Informar autonomia das baterias\",\"Mission tooltip - id: 5\",180,-152,\"lcmg7ci4\");n6=addMission(\"Informar nível de combustível\",\"Mission tooltip - id: 6\",414,-150,\"lcmg7yp0\");n7=addRefinement(\"undefined\",\"undefined\",288,-200,\"\");n8=addMission(\"Calcular autonomia total\",\"Mission tooltip - id: 8\",286,-242,\"lcmg8shh\");n9=addRefinement(\"undefined\",\"undefined\",286,-320,\"\");n10=addMission(\"Notificar plantonistas sobre interrupção e tempo total de autonomia\",\"Mission tooltip - id: 10\",287,-388,\"lcmg9zvg\");n11=addMission(\"Identificar interrupção de energia\",\"Mission tooltip - id: 11\",599,-241,\"lcmgbgpf\");e12=linkRefinement(n5,n7,\"\",\"\");e13=linkRefinement(n6,n7,\"\",\"\");e14=linkRefinement(n7,n8,\"\",\"\");e18=linkRefinement(n4,n9,\"\",\"\");e19=linkRefinement(n8,n9,\"\",\"\");e20=linkMission(n9,n10,\"\",\"\");e22=linkRefinement(n11,n9,\"\",\"\");;t1=addMessage(\"*** ATTENTION *** Cloned from original diagram. Affected CS due state of interest violations are: Gateway telefonia, Gerador\", \"\", 100,100, \"xxx\");', '', '', '2023-01-15 17:46:39'),
(270, 10062, '461f5c133d5890baacdaf748b485c490', '', '', 'n4=addMission(\"Realizar notificação\",\"Mission tooltip - id: 4\",-39,-240,\"lcmg6l7g\");n5=addMission(\"Informar autonomia das baterias\",\"Mission tooltip - id: 5\",180,-152,\"lcmg7ci4\");n6=addMission(\"Informar nível de combustível\",\"Mission tooltip - id: 6\",414,-150,\"lcmg7yp0\");n7=addRefinement(\"undefined\",\"undefined\",288,-200,\"\");n8=addMission(\"Calcular autonomia total\",\"Mission tooltip - id: 8\",286,-242,\"lcmg8shh\");n9=addRefinement(\"undefined\",\"undefined\",286,-320,\"\");n10=addMission(\"Notificar plantonistas sobre interrupção e tempo total de autonomia\",\"Mission tooltip - id: 10\",287,-388,\"lcmg9zvg\");n11=addMission(\"Identificar interrupção de energia\",\"Mission tooltip - id: 11\",599,-241,\"lcmgbgpf\");e12=linkRefinement(n5,n7,\"\",\"\");e13=linkRefinement(n6,n7,\"\",\"\");e14=linkRefinement(n7,n8,\"\",\"\");e18=linkRefinement(n4,n9,\"\",\"\");e19=linkRefinement(n8,n9,\"\",\"\");e20=linkMission(n9,n10,\"\",\"\");e22=linkRefinement(n11,n9,\"\",\"\");;t1=addMessage(\"*** ATTENTION *** Cloned from original diagram. Affected CS due state of interest violations are: \", \"\", 531,0, \"xxx\");', '', '', '2023-01-15 23:19:53'),
(271, 10063, '15beacad3c50319f42e1784640115b61', '', '', 'n4=addMission(\"Realizar notificação\",\"Mission tooltip - id: 4\",-39,-240,\"lcmg6l7g\");n5=addMission(\"Informar autonomia das baterias\",\"Mission tooltip - id: 5\",180,-152,\"lcmg7ci4\");n6=addMission(\"Informar nível de combustível\",\"Mission tooltip - id: 6\",414,-150,\"lcmg7yp0\");n7=addRefinement(\"undefined\",\"undefined\",288,-200,\"\");n8=addMission(\"Calcular autonomia total\",\"Mission tooltip - id: 8\",286,-242,\"lcmg8shh\");n9=addRefinement(\"undefined\",\"undefined\",286,-320,\"\");n10=addMission(\"Notificar plantonistas sobre interrupção e tempo total de autonomia\",\"Mission tooltip - id: 10\",287,-388,\"lcmg9zvg\");n11=addMission(\"Identificar interrupção de energia\",\"Mission tooltip - id: 11\",599,-241,\"lcmgbgpf\");e12=linkRefinement(n5,n7,\"\",\"\");e13=linkRefinement(n6,n7,\"\",\"\");e14=linkRefinement(n7,n8,\"\",\"\");e18=linkRefinement(n4,n9,\"\",\"\");e19=linkRefinement(n8,n9,\"\",\"\");e20=linkMission(n9,n10,\"\",\"\");e22=linkRefinement(n11,n9,\"\",\"\");;t1=addMessage(\"*** ATTENTION *** Cloned from original diagram. \", \"\", 531,0, \"xxx\");', '', '', '2023-01-15 23:23:18'),
(272, 10064, '0394bfa33951f09aef1f36f3457b7293', '', '', 'n4=addMission(\"Realizar notificação\",\"Mission tooltip - id: 4\",-39,-240,\"lcmg6l7g\");n5=addMission(\"Informar autonomia das baterias\",\"Mission tooltip - id: 5\",180,-152,\"lcmg7ci4\");n6=addMission(\"Informar nível de combustível\",\"Mission tooltip - id: 6\",414,-150,\"lcmg7yp0\");n7=addRefinement(\"undefined\",\"undefined\",288,-200,\"\");n8=addMission(\"Calcular autonomia total\",\"Mission tooltip - id: 8\",286,-242,\"lcmg8shh\");n9=addRefinement(\"undefined\",\"undefined\",286,-320,\"\");n10=addMission(\"Notificar plantonistas sobre interrupção e tempo total de autonomia\",\"Mission tooltip - id: 10\",287,-388,\"lcmg9zvg\");n11=addMission(\"Identificar interrupção de energia\",\"Mission tooltip - id: 11\",599,-241,\"lcmgbgpf\");e12=linkRefinement(n5,n7,\"\",\"\");e13=linkRefinement(n6,n7,\"\",\"\");e14=linkRefinement(n7,n8,\"\",\"\");e18=linkRefinement(n4,n9,\"\",\"\");e19=linkRefinement(n8,n9,\"\",\"\");e20=linkMission(n9,n10,\"\",\"\");e22=linkRefinement(n11,n9,\"\",\"\");;t1=addMessage(\"*** ATTENTION *** Cloned from original diagram.  (you can delete this message)\", \"\", 531,0, \"xxx\");', '', '', '2023-01-15 23:25:04');

-- --------------------------------------------------------

--
-- Estrutura da tabela `network_cmd`
--

CREATE TABLE `network_cmd` (
  `id_cmd` bigint(20) NOT NULL,
  `id_sos` bigint(20) NOT NULL,
  `soskey` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cmd` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'queued',
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `network_cmd`
--

INSERT INTO `network_cmd` (`id_cmd`, `id_sos`, `soskey`, `cmd`, `status`, `timestamp`) VALUES
(36870, 10014, '4e4e7b6932baf7ef4876b6c7ef3c8a53', '', 'queued', '2023-01-12 02:30:31'),
(36872, 16, '8c527692e560b071da274aea516e3e0f', '', 'queued', '2022-12-20 04:10:05'),
(36873, 11, '925f82235a67ada8082f9eb3c2c8b3bd', '', 'queued', '2023-01-06 13:48:52'),
(36874, 12, '801395f58826831efbb38b3791efc6ea', '', 'queued', '2023-01-06 13:50:09'),
(36875, 13, '1ade305695138f7084366aefe4151fd0', '', 'queued', '2023-01-06 13:53:12'),
(36876, 10014, '6831e155d4c23d112b868b888c7d93f0', '', 'queued', '2023-01-12 02:30:52'),
(36877, 17, 'c11a984de85404164a8cd4fa1532cfd9', '', 'queued', '2023-01-07 21:16:48'),
(36878, 15, 'ee3d5a2460169495c40dfc18d285fc7c', '', 'queued', '2023-01-07 21:35:31'),
(36879, 16, '5a81dccadc471381076ee375d2bfdf8c', '', 'queued', '2023-01-07 21:48:53'),
(36881, 10039, 'f67cdbfe83a23fb1cad75b6ab8704bbe', '', 'queued', '2023-01-12 02:13:29'),
(36882, 10040, '1329ae3d3d8305fd85ba790d7aa35138', '', 'queued', '2023-01-12 04:19:11'),
(36883, 10041, 'db302211976aaa2aa67e5d4dc3a03880', '', 'queued', '2023-01-12 05:00:22'),
(36884, 10042, '13a9775e7319724b65e577faf05b6b53', '', 'queued', '2023-01-12 05:16:28'),
(36885, 10043, '20535242ba4fe26a9a8adfd26960839b', '', 'queued', '2023-01-12 05:22:57'),
(36886, 10044, 'a8b6a3a8e27fba5d46531623aa20d3bb', '', 'queued', '2023-01-12 05:25:33'),
(36887, 10045, 'be0ffc4271b59f5af69937927fc2b546', '', 'queued', '2023-01-12 05:26:45'),
(36888, 10046, '982df526818557358ae839c185db04ac', '', 'queued', '2023-01-12 05:28:56'),
(36889, 10047, 'b1f830d9a7a5e09692ab99d492dbcde2', '', 'queued', '2023-01-12 05:32:25'),
(36890, 10048, '759879c68f85080cfc196170de78d65d', '', 'queued', '2023-01-12 05:35:52'),
(36891, 10049, 'f2f34d81641e2a4f60fc9d14efc5284c', '', 'queued', '2023-01-12 05:55:10'),
(36892, 10050, '6c7355cf59e49b532231e1147a70695e', '', 'queued', '2023-01-13 13:56:17'),
(36893, 10051, '84c514c250f0e02db4f7344c9d65f0b8', '', 'queued', '2023-01-15 16:05:53'),
(36894, 10052, '076f93d5e36d640a40908dea81908ac6', '', 'queued', '2023-01-15 16:08:13'),
(36895, 10053, '7c64498565be19af88cb4ff0072afbb4', '', 'queued', '2023-01-15 16:21:15'),
(36896, 10054, 'e8ea9f59b7c2e2aee27c845c743b3d6e', '', 'queued', '2023-01-15 16:37:31'),
(36897, 10055, '80b79fa146404f114aca95248d48d4ed', '', 'queued', '2023-01-15 16:38:11'),
(36898, 10056, 'bac8abdaa64c1a2070b89e888954afcf', '', 'queued', '2023-01-15 16:39:16'),
(36899, 10057, '404e3d012cfb5668a8a370315b9f784a', '', 'queued', '2023-01-15 16:41:28'),
(36900, 10058, '432de7c27c63e79a65276bb13c8cb327', '', 'queued', '2023-01-15 16:43:45'),
(36901, 10059, '92c54b89f85f2b73f4562a7c73fb82b6', '', 'queued', '2023-01-15 17:46:39'),
(36902, 10062, '461f5c133d5890baacdaf748b485c490', '', 'queued', '2023-01-15 23:19:53'),
(36903, 10063, '15beacad3c50319f42e1784640115b61', '', 'queued', '2023-01-15 23:23:18'),
(36904, 10064, '0394bfa33951f09aef1f36f3457b7293', '', 'queued', '2023-01-15 23:25:04');

-- --------------------------------------------------------

--
-- Estrutura da tabela `observation_point`
--

CREATE TABLE `observation_point` (
  `id_obspoint` bigint(20) NOT NULL,
  `id_soi` bigint(20) NOT NULL,
  `id_sos` bigint(20) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `observation_point`
--

INSERT INTO `observation_point` (`id_obspoint`, `id_soi`, `id_sos`, `description`) VALUES
(11, 22, 1, 'ping{\r\nipaddress 20.3.6.1\r\nsuccessrate 100\r\n}'),
(12, 24, 1, 'ASDFAS'),
(13, 24, 1, 'XZXC'),
(14, 26, 1, 'SSSSS'),
(18, 44, 1, 'obs 1'),
(20, 45, 1, 'obs 2'),
(23, 50, 17, 'ping 10.4.0.1'),
(24, 51, 17, 'ping 10.4.0.2\r\n'),
(25, 52, 17, 'ping 10.4.2.1'),
(28, 56, 17, 'ICMP 10.4.0.21'),
(29, 54, 17, 'ICMP 10.4.0.21'),
(30, 55, 17, 'ICMP 10.4.0.22'),
(31, 53, 17, 'SNMP ICMP 10.4.0.25');

-- --------------------------------------------------------

--
-- Estrutura da tabela `requirement`
--

CREATE TABLE `requirement` (
  `id_requirement` bigint(20) NOT NULL,
  `id_mission` bigint(20) NOT NULL,
  `id_sos` bigint(20) NOT NULL,
  `description` text NOT NULL,
  `invariant` tinyint(1) DEFAULT NULL,
  `flexibilization` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `requirement`
--

INSERT INTO `requirement` (`id_requirement`, `id_mission`, `id_sos`, `description`, `invariant`, `flexibilization`) VALUES
(48, 38, 17, 'Notificação deve ser realizada em até 10 segundos', 1, ''),
(38, 27, 2, '{\r\n   sdf\r\n}', NULL, ''),
(58, 18, 1, 'return XY coordinates precision < 0.1m', 1, ''),
(56, 39, 17, 'Informação deve ser atualizada a cada 5 minutos', 1, ''),
(57, 41, 17, 'Informação deve ser atualizada a cada 1 minuto', 1, ''),
(55, 40, 17, 'Informação deve ser atualizada a cada 5 minutos', 1, ''),
(59, 20, 1, 'send messages with delay < 1s', 0, 'Send messages with delay < 1 min'),
(60, 21, 1, 'provide alternative power for 10h', 0, 'For 4h'),
(61, 19, 1, 'provide remaining oil level', 1, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sos`
--

CREATE TABLE `sos` (
  `id_sos` bigint(20) NOT NULL,
  `soskey` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `obs` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `sos`
--

INSERT INTO `sos` (`id_sos`, `soskey`, `name`, `description`, `obs`) VALUES
(1, '2rsgl1l6p6t6', 'SoS 1', 'Example SoS  #1', ''),
(2, 'dxc1l7ge2qtz', 'AAA1', 'asdfasdf asdfasdf asdfas111', ''),
(4, '6ba7l7858dgs', 'Nome teste', 'testestestes', ''),
(5, '4978l1kw2688', 'Controle de recursos', 'Teste controle de recursos', ''),
(11, '55bc7d4fdc39371e7331b64bdac53fb5', 'PiauiSos', 'Test 2022', ''),
(14, '4e4e7b6932baf7ef4876b6c7ef3c8a53', 'Teste1', 'Teste1', ''),
(16, '8c527692e560b071da274aea516e3e0f', 'Nova', 'nova fase', ''),
(17, 'c11a984de85404164a8cd4fa1532cfd9', 'Cenário', '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `state_of_interest`
--

CREATE TABLE `state_of_interest` (
  `id_soi` bigint(20) NOT NULL,
  `id_requirement` bigint(20) NOT NULL,
  `id_sos` bigint(20) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `state_of_interest`
--

INSERT INTO `state_of_interest` (`id_soi`, `id_requirement`, `id_sos`, `description`) VALUES
(53, 48, 17, 'Carga da CPU deve ser inferior a 90%'),
(54, 55, 17, 'Deve estar disponível'),
(55, 56, 17, 'Deve estar disponível'),
(56, 57, 17, 'Deve estar disponível'),
(57, 59, 1, 'soi 1'),
(58, 61, 1, 'soi 2'),
(59, 60, 1, 'soi 3'),
(60, 58, 1, 'soi 4');

-- --------------------------------------------------------

--
-- Estrutura da tabela `transient_configuration`
--

CREATE TABLE `transient_configuration` (
  `id_transient_configuration` bigint(20) NOT NULL,
  `id_sos` bigint(20) NOT NULL,
  `violation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `affected_cs` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `soskey` char(32) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `transient_configuration`
--

INSERT INTO `transient_configuration` (`id_transient_configuration`, `id_sos`, `violation`, `affected_cs`, `description`, `soskey`) VALUES
(47, 1, '57,58,59,60', 'Telephony Gateway, TG, GPS', '', 'b1f830d9a7a5e09692ab99d492dbcde2'),
(49, 17, '53,54,55,56', 'Gateway telefonia, Gerador, No-break', 'TAC 2', 'f2f34d81641e2a4f60fc9d14efc5284c'),
(50, 1, '', '', '', '6c7355cf59e49b532231e1147a70695e'),
(60, 17, '', '', '', 'e3901db4d31bc33849e77ed4dde546d7'),
(61, 17, '53,54', 'Gateway telefonia, Gerador', '', '6ad20eebd69dbd2ec1bd18382cf761cc'),
(64, 17, '', '', 'aaaaaaaaa', '0394bfa33951f09aef1f36f3457b7293');

-- --------------------------------------------------------

--
-- Estrutura da tabela `user`
--

CREATE TABLE `user` (
  `id_user` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `institution` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('user','admin') COLLATE utf8mb4_unicode_ci NOT NULL,
  `hash` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `user`
--

INSERT INTO `user` (`id_user`, `name`, `institution`, `email`, `password`, `role`, `hash`, `modified`, `active`) VALUES
(7, 'Aaaaaaa1', 'UNIRIO', 'marcio.imamura@edu.unirio.br', 'a6b63dde18f15a6c8349166ed4dd40c1', 'user', 'bad9bed21f5ffc09f892e2755029af35', '2022-05-03 18:59:54', 0),
(8, '', '', 'asdfas@asd.com', '0aabdd3e53e136e7f806e4521344bd87', 'user', 'cef09794287e285ead3c57ddca17f0c0', '2022-04-29 18:47:12', 0),
(10, 'francisco.henrique', 'UNIRIO', 'francisco.ferreira@uniriotec.br', '207251b1b522ebd6d9134bc17aa356c2', 'user', '3ff84c2d65d00c4d15bf1fd5ab450269', '2022-04-29 21:30:11', 0);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `composition`
--
ALTER TABLE `composition`
  ADD PRIMARY KEY (`id_composition`);

--
-- Índices para tabela `constituent`
--
ALTER TABLE `constituent`
  ADD PRIMARY KEY (`id_constituent`);

--
-- Índices para tabela `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `mission`
--
ALTER TABLE `mission`
  ADD PRIMARY KEY (`id_mission`),
  ADD KEY `id_sos` (`id_sos`);

--
-- Índices para tabela `network`
--
ALTER TABLE `network`
  ADD PRIMARY KEY (`id_network`),
  ADD UNIQUE KEY `soskey` (`soskey`);

--
-- Índices para tabela `network_cmd`
--
ALTER TABLE `network_cmd`
  ADD PRIMARY KEY (`id_cmd`);

--
-- Índices para tabela `observation_point`
--
ALTER TABLE `observation_point`
  ADD PRIMARY KEY (`id_obspoint`);

--
-- Índices para tabela `requirement`
--
ALTER TABLE `requirement`
  ADD PRIMARY KEY (`id_requirement`);

--
-- Índices para tabela `sos`
--
ALTER TABLE `sos`
  ADD PRIMARY KEY (`id_sos`);

--
-- Índices para tabela `state_of_interest`
--
ALTER TABLE `state_of_interest`
  ADD PRIMARY KEY (`id_soi`);

--
-- Índices para tabela `transient_configuration`
--
ALTER TABLE `transient_configuration`
  ADD PRIMARY KEY (`id_transient_configuration`);

--
-- Índices para tabela `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `composition`
--
ALTER TABLE `composition`
  MODIFY `id_composition` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT de tabela `constituent`
--
ALTER TABLE `constituent`
  MODIFY `id_constituent` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT de tabela `log`
--
ALTER TABLE `log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1340118;

--
-- AUTO_INCREMENT de tabela `mission`
--
ALTER TABLE `mission`
  MODIFY `id_mission` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de tabela `network`
--
ALTER TABLE `network`
  MODIFY `id_network` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=273;

--
-- AUTO_INCREMENT de tabela `network_cmd`
--
ALTER TABLE `network_cmd`
  MODIFY `id_cmd` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36905;

--
-- AUTO_INCREMENT de tabela `observation_point`
--
ALTER TABLE `observation_point`
  MODIFY `id_obspoint` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de tabela `requirement`
--
ALTER TABLE `requirement`
  MODIFY `id_requirement` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de tabela `sos`
--
ALTER TABLE `sos`
  MODIFY `id_sos` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `state_of_interest`
--
ALTER TABLE `state_of_interest`
  MODIFY `id_soi` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de tabela `transient_configuration`
--
ALTER TABLE `transient_configuration`
  MODIFY `id_transient_configuration` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT de tabela `user`
--
ALTER TABLE `user`
  MODIFY `id_user` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

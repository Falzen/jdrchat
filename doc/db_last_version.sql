-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 24 oct. 2019 à 23:28
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `jdr`
--

-- --------------------------------------------------------

--
-- Structure de la table `chat_messages`
--

DROP TABLE IF EXISTS `chat_messages`;
CREATE TABLE IF NOT EXISTS `chat_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `date_creation` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `msg_content` text COLLATE utf8_unicode_ci,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `pseudo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_creation_front` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`),
  KEY `jeu_id` (`game_id`)
) ENGINE=MyISAM AUTO_INCREMENT=220 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `chat_messages`
--

INSERT INTO `chat_messages` (`id`, `player_id`, `game_id`, `date_creation`, `msg_content`, `type`, `pseudo`, `date_creation_front`) VALUES
(1, 1, 1, '2019-10-20 06:37:20', 'je suis Falzen dans le jeu 1', '', '', ''),
(2, 2, 1, '2019-10-20 06:37:20', 'je suis Freyggen dans le jeu 1 ', '', '', ''),
(3, 3, 1, '2019-10-20 06:37:20', 'Aliquam scelerisque luctus tortor, ac faucibus tortor pulvinar euismod.', '', '', ''),
(4, 1, 1, '2019-10-20 06:37:20', 'Vivamus interdum orci et semper aliquet.', '', '', ''),
(5, 2, 1, '2019-10-20 06:37:20', 'Aliquam scelerisque luctus tortor, ac faucibus tortor pulvinar euismod.', '', '', ''),
(6, 2, 1, '2019-10-20 06:37:20', 'Vivamus interdum orci et semper aliquet.', '', '', ''),
(7, 3, 1, '2019-10-20 06:37:20', 'Aliquam scelerisque luctus tortor, ac faucibus tortor pulvinar euismod.', '', '', ''),
(8, 1, 2, '2019-10-20 06:37:20', 'Vivamus interdum orci et semper aliquet.', '', '', ''),
(9, 1, 2, '2019-10-20 06:37:20', 'Aliquam scelerisque luctus tortor, ac faucibus tortor pulvinar euismod.', '', '', ''),
(10, 3, 1, '2019-10-20 06:37:20', 'Vivamus interdum orci et semper aliquet.', '', '', ''),
(11, 2, 1, '2019-10-20 06:37:20', 'Aliquam scelerisque luctus tortor, ac faucibus tortor pulvinar euismod.', '', '', ''),
(12, 1, 1, '2019-10-20 06:37:20', 'Vivamus interdum orci et semper aliquet.', '', '', ''),
(13, 3, 1, '2019-10-20 06:37:20', 'Aliquam scelerisque luctus tortor, ac faucibus tortor pulvinar euismod.', '', '', ''),
(26, 1, 2, '2019-10-20 06:38:04', 'Vivamus interdum orci et semper aliquet.', '', '', ''),
(27, 2, 2, '2019-10-20 06:38:04', 'Aliquam scelerisque luctus tortor, ac faucibus tortor pulvinar euismod.', '', '', ''),
(28, 2, 2, '2019-10-20 06:38:04', 'Vivamus interdum orci et semper aliquet.', '', '', ''),
(29, 2, 2, '2019-10-20 06:38:04', 'Aliquam scelerisque luctus tortor, ac faucibus tortor pulvinar euismod.', '', '', ''),
(30, 4, 1, '2019-10-24 21:06:30', 'zzzzzzzzzzzz', 'chatmsg', 'test', '24/10/2019'),
(31, 1, 1, '2019-10-24 21:08:43', 'Heeeey !', 'chatmsg', 'Falzen', '24/10/2019'),
(32, 1, 1, '2019-10-24 21:27:21', 'fdsfsd', 'chatmsg', 'Falzen', '24/10/2019'),
(33, 4, 1, '2019-10-24 21:27:28', 'Hello', 'chatmsg', 'test', '24/10/2019'),
(34, 1, 1, '2019-10-24 21:27:57', 'dzzdqzdqzdzq', 'chatmsg', 'Falzen', '24/10/2019'),
(35, 1, 1, '2019-10-24 21:27:58', 'dzqdzdqz', 'chatmsg', 'Falzen', '24/10/2019'),
(36, 4, 1, '2019-10-24 21:28:05', 'z', 'chatmsg', 'test', '24/10/2019'),
(37, 1, 1, '2019-10-24 21:32:13', 'fesfesfezs', 'chatmsg', 'Falzen', '24/10/2019'),
(38, 4, 1, '2019-10-24 21:39:05', 'dzqdzqdzq', 'chatmsg', 'test', '24/10/2019'),
(39, 1, 1, '2019-10-24 21:39:22', 'zzzzzzzzz', 'chatmsg', 'Falzen', '24/10/2019'),
(40, 4, 1, '2019-10-24 21:39:34', 'ddddddddddddd', 'chatmsg', 'test', '24/10/2019'),
(41, 1, 1, '2019-10-24 21:40:01', 'zqsd ?', 'chatmsg', 'Falzen', '24/10/2019'),
(42, 4, 1, '2019-10-24 21:42:41', 'aloooors ?', 'chatmsg', 'test', '24/10/2019'),
(43, 4, 1, '2019-10-24 21:42:55', 'et là?', 'chatmsg', 'test', '24/10/2019'),
(44, 1, 1, '2019-10-24 21:43:08', 'oui !!', 'chatmsg', 'Falzen', '24/10/2019'),
(45, 4, 1, '2019-10-24 21:43:21', 'ah ?', 'chatmsg', 'test', '24/10/2019'),
(46, 4, 1, '2019-10-24 21:44:30', 'rrrrr', 'chatmsg', 'test', '24/10/2019'),
(47, 4, 1, '2019-10-24 21:44:46', 'qqq', 'chatmsg', 'test', '24/10/2019'),
(48, 1, 1, '2019-10-24 21:44:50', 'dzzqdzqdzq', 'chatmsg', 'Falzen', '24/10/2019'),
(49, 1, 1, '2019-10-24 21:44:52', 'd qzd zqd qz', 'chatmsg', 'Falzen', '24/10/2019'),
(50, 1, 1, '2019-10-24 21:45:38', 'dzqdzqdqzqz qz?', 'chatmsg', 'Falzen', '24/10/2019'),
(51, 4, 1, '2019-10-24 21:45:43', 'yes !', 'chatmsg', 'test', '24/10/2019'),
(52, 4, 1, '2019-10-24 21:47:28', 'zz', 'chatmsg', 'test', '24/10/2019'),
(53, 4, 1, '2019-10-24 21:47:41', 'qqqqqqqqq', 'chatmsg', 'test', '24/10/2019'),
(54, 4, 1, '2019-10-24 21:47:59', 'zzzzzzzz', 'chatmsg', 'test', '24/10/2019'),
(55, 4, 1, '2019-10-24 21:48:23', 'aaaaaaaaa', 'chatmsg', 'test', '24/10/2019'),
(56, 4, 1, '2019-10-24 21:48:45', 'mais alors quoi ?', 'chatmsg', 'test', '24/10/2019'),
(57, 1, 1, '2019-10-24 21:49:06', 'ben rien !', 'chatmsg', 'Falzen', '24/10/2019'),
(58, 4, 1, '2019-10-24 21:53:17', 'Je te parle', 'chatmsg', 'test', '24/10/2019'),
(59, 4, 1, '2019-10-24 21:53:19', 'encore', 'chatmsg', 'test', '24/10/2019'),
(60, 4, 1, '2019-10-24 21:53:37', 'et encore', 'chatmsg', 'test', '24/10/2019'),
(61, 1, 1, '2019-10-24 21:53:49', 'et je te réponds', 'chatmsg', 'Falzen', '24/10/2019'),
(62, 4, 1, '2019-10-24 21:54:16', 'mais !', 'chatmsg', 'test', '24/10/2019'),
(63, 4, 1, '2019-10-24 21:54:23', 'dqzzqqz', 'chatmsg', 'test', '24/10/2019'),
(64, 4, 1, '2019-10-24 21:54:41', 'aaa', 'chatmsg', 'test', '24/10/2019'),
(65, 4, 1, '2019-10-24 21:58:08', 'dzqdzq', 'chatmsg', 'test', '24/10/2019'),
(66, 4, 1, '2019-10-24 21:58:12', 'fddzq', 'chatmsg', 'test', '24/10/2019'),
(67, 4, 1, '2019-10-24 21:58:12', 'dzq', 'chatmsg', 'test', '24/10/2019'),
(68, 4, 1, '2019-10-24 21:58:12', 'dqz', 'chatmsg', 'test', '24/10/2019'),
(69, 4, 1, '2019-10-24 21:58:12', 'dz', 'chatmsg', 'test', '24/10/2019'),
(70, 4, 1, '2019-10-24 21:58:12', 'qzd', 'chatmsg', 'test', '24/10/2019'),
(71, 1, 1, '2019-10-24 21:58:24', 'wow ferme bien ta gueule', 'chatmsg', 'Falzen', '24/10/2019'),
(72, 1, 1, '2019-10-24 21:58:43', 'dzqzdqdqz', 'chatmsg', 'Falzen', '24/10/2019'),
(73, 1, 1, '2019-10-24 22:03:43', 'mais', 'chatmsg', 'Falzen', '25/10/2019'),
(74, 1, 1, '2019-10-24 22:03:45', 'maaaaais', 'chatmsg', 'Falzen', '25/10/2019'),
(75, 4, 1, '2019-10-24 22:03:51', 'dzqdzqdqzqzdzq', 'chatmsg', 'test', '25/10/2019'),
(76, 1, 1, '2019-10-24 22:03:57', 'dzqdzqqdz', 'chatmsg', 'Falzen', '25/10/2019'),
(77, 4, 1, '2019-10-24 22:04:01', 'zzzz', 'chatmsg', 'test', '25/10/2019'),
(78, 1, 1, '2019-10-24 22:08:03', 'dzqdzqzdzq', 'chatmsg', 'Falzen', '25/10/2019'),
(79, 4, 1, '2019-10-24 22:09:22', 'dzqdzqzzzzz', 'chatmsg', 'test', '25/10/2019'),
(80, 1, 1, '2019-10-24 22:09:26', 'qqqqq', 'chatmsg', 'Falzen', '25/10/2019'),
(81, 1, 1, '2019-10-24 22:09:44', 'sssssss', 'chatmsg', 'Falzen', '25/10/2019'),
(82, 4, 1, '2019-10-24 22:09:55', 'dzq', 'chatmsg', 'test', '25/10/2019'),
(83, 4, 1, '2019-10-24 22:11:05', 'qqqqqqq', 'chatmsg', 'test', '25/10/2019'),
(84, 4, 1, '2019-10-24 22:12:00', 'd20&nbsp;&nbsp; -->  &nbsp;&nbsp;\'7\'', 'diceroll', 'test', '25/10/2019'),
(85, 4, 1, '2019-10-24 22:12:01', 'd100&nbsp;&nbsp; -->  &nbsp;&nbsp;\'40\'', 'diceroll', 'test', '25/10/2019'),
(86, 4, 1, '2019-10-24 22:12:01', 'd100&nbsp;&nbsp; -->  &nbsp;&nbsp;\'49\'', 'diceroll', 'test', '25/10/2019'),
(87, 4, 1, '2019-10-24 22:12:01', 'd100&nbsp;&nbsp; -->  &nbsp;&nbsp;\'46\'', 'diceroll', 'test', '25/10/2019'),
(88, 4, 1, '2019-10-24 22:13:27', 'dzqdzqdzqdzq', 'chatmsg', 'test', '25/10/2019'),
(89, 4, 1, '2019-10-24 22:13:29', 'dqzdzqqz', 'chatmsg', 'test', '25/10/2019'),
(90, 1, 1, '2019-10-24 22:17:04', 'dzqdzqdzq', 'chatmsg', 'Falzen', '25/10/2019'),
(91, 1, 1, '2019-10-24 22:17:06', 'zzzzzzzzzzz', 'chatmsg', 'Falzen', '25/10/2019'),
(92, 4, 1, '2019-10-24 22:17:14', 'zzzzzzzzzzzzzzzz', 'chatmsg', 'test', '25/10/2019'),
(93, 1, 1, '2019-10-24 22:17:42', 'dqzdzqqzdzqdzq', 'chatmsg', 'Falzen', '25/10/2019'),
(94, 4, 1, '2019-10-24 22:17:54', 'dzqdzqdqz', 'chatmsg', 'test', '25/10/2019'),
(95, 1, 1, '2019-10-24 22:18:03', 'qqqqqqqqqqq', 'chatmsg', 'Falzen', '25/10/2019'),
(96, 4, 1, '2019-10-24 22:20:04', 'dzqzqdqz', 'chatmsg', 'test', '25/10/2019'),
(97, 4, 1, '2019-10-24 22:20:06', 'dzqdzqdqzdq', 'chatmsg', 'test', '25/10/2019'),
(98, 4, 1, '2019-10-24 22:20:06', 'zd', 'chatmsg', 'test', '25/10/2019'),
(99, 4, 1, '2019-10-24 22:20:06', 'qz', 'chatmsg', 'test', '25/10/2019'),
(100, 4, 1, '2019-10-24 22:20:06', 'd', 'chatmsg', 'test', '25/10/2019'),
(101, 4, 1, '2019-10-24 22:20:07', 'zqd', 'chatmsg', 'test', '25/10/2019'),
(102, 4, 1, '2019-10-24 22:20:07', 'zq', 'chatmsg', 'test', '25/10/2019'),
(103, 1, 1, '2019-10-24 22:21:15', 'dzqdzqdzqdqzdzqdzq', 'chatmsg', 'Falzen', '25/10/2019'),
(104, 4, 1, '2019-10-24 22:21:42', 'dqzdzqdqz', 'chatmsg', 'test', '25/10/2019'),
(105, 4, 1, '2019-10-24 22:21:43', 'zzzzzzzzz', 'chatmsg', 'test', '25/10/2019'),
(106, 4, 1, '2019-10-24 22:34:21', 'dzqzqdqzdzqzdq', 'chatmsg', 'test', '25/10/2019'),
(107, 1, 1, '2019-10-24 22:34:26', 'dzqdzqzqdzqqz', 'chatmsg', 'Falzen', '25/10/2019'),
(108, 4, 1, '2019-10-24 22:34:32', 'zzzzz', 'chatmsg', 'test', '25/10/2019'),
(109, 4, 1, '2019-10-24 22:34:40', 'qqqqq', 'chatmsg', 'test', '25/10/2019'),
(110, 1, 1, '2019-10-24 22:34:43', 'dzqdzqdzqdqzdqz', 'chatmsg', 'Falzen', '25/10/2019'),
(111, 1, 1, '2019-10-24 22:34:48', 'ffe', 'chatmsg', 'Falzen', '25/10/2019'),
(112, 4, 1, '2019-10-24 22:34:50', 'dzqdzqqzqz', 'chatmsg', 'test', '25/10/2019'),
(113, 4, 1, '2019-10-24 22:34:56', 'dzqdqzzq', 'chatmsg', 'test', '25/10/2019'),
(114, 4, 1, '2019-10-24 22:35:58', 'Et comment', 'chatmsg', 'test', '25/10/2019'),
(115, 4, 1, '2019-10-24 22:36:00', 'dzqzdqz', 'chatmsg', 'test', '25/10/2019'),
(116, 4, 1, '2019-10-24 22:36:01', 'dqzzq', 'chatmsg', 'test', '25/10/2019'),
(117, 4, 1, '2019-10-24 22:36:01', 'dqz', 'chatmsg', 'test', '25/10/2019'),
(118, 4, 1, '2019-10-24 22:36:01', 'dqz', 'chatmsg', 'test', '25/10/2019'),
(119, 4, 1, '2019-10-24 22:36:01', 'dqz', 'chatmsg', 'test', '25/10/2019'),
(120, 4, 1, '2019-10-24 22:36:02', 'zq', 'chatmsg', 'test', '25/10/2019'),
(121, 4, 1, '2019-10-24 22:36:03', 'qqqqq', 'chatmsg', 'test', '25/10/2019'),
(122, 4, 1, '2019-10-24 22:36:07', 'qqq', 'chatmsg', 'test', '25/10/2019'),
(123, 4, 1, '2019-10-24 22:38:17', 'qdzzdqzdzq', 'chatmsg', 'test', '25/10/2019'),
(124, 1, 1, '2019-10-24 22:38:25', 'dzqdzqdzq', 'chatmsg', 'Falzen', '25/10/2019'),
(125, 1, 1, '2019-10-24 22:39:35', 'dqzz dzqd zqdd', 'chatmsg', 'Falzen', '25/10/2019'),
(126, 1, 1, '2019-10-24 22:39:35', 'q z', 'chatmsg', 'Falzen', '25/10/2019'),
(127, 1, 1, '2019-10-24 22:39:35', 'dqz', 'chatmsg', 'Falzen', '25/10/2019'),
(128, 1, 1, '2019-10-24 22:39:35', 'dzq', 'chatmsg', 'Falzen', '25/10/2019'),
(129, 1, 1, '2019-10-24 22:39:35', 'dzq', 'chatmsg', 'Falzen', '25/10/2019'),
(130, 1, 1, '2019-10-24 22:39:36', 'dz', 'chatmsg', 'Falzen', '25/10/2019'),
(131, 1, 1, '2019-10-24 22:39:36', 'qd', 'chatmsg', 'Falzen', '25/10/2019'),
(132, 1, 1, '2019-10-24 22:39:36', 'qzd', 'chatmsg', 'Falzen', '25/10/2019'),
(133, 1, 1, '2019-10-24 22:39:36', 'zq', 'chatmsg', 'Falzen', '25/10/2019'),
(134, 1, 1, '2019-10-24 22:39:36', 'dzq', 'chatmsg', 'Falzen', '25/10/2019'),
(135, 4, 1, '2019-10-24 22:39:48', 'dzqdzqdzqqz', 'chatmsg', 'test', '25/10/2019'),
(136, 4, 1, '2019-10-24 22:39:48', 'dqz', 'chatmsg', 'test', '25/10/2019'),
(137, 4, 1, '2019-10-24 22:39:48', 'dqz', 'chatmsg', 'test', '25/10/2019'),
(138, 4, 1, '2019-10-24 22:39:48', 'dqz', 'chatmsg', 'test', '25/10/2019'),
(139, 4, 1, '2019-10-24 22:39:48', 'dqz', 'chatmsg', 'test', '25/10/2019'),
(140, 4, 1, '2019-10-24 22:39:49', 'dqz', 'chatmsg', 'test', '25/10/2019'),
(141, 4, 1, '2019-10-24 22:39:49', 'dqz', 'chatmsg', 'test', '25/10/2019'),
(142, 4, 1, '2019-10-24 22:39:49', 'dqz', 'chatmsg', 'test', '25/10/2019'),
(143, 1, 1, '2019-10-24 22:40:03', 'e', 'chatmsg', 'Falzen', '25/10/2019'),
(144, 1, 1, '2019-10-24 22:40:03', 'r', 'chatmsg', 'Falzen', '25/10/2019'),
(145, 1, 1, '2019-10-24 22:40:03', 't', 'chatmsg', 'Falzen', '25/10/2019'),
(146, 1, 1, '2019-10-24 22:40:04', 'y', 'chatmsg', 'Falzen', '25/10/2019'),
(147, 1, 1, '2019-10-24 22:40:04', 'u', 'chatmsg', 'Falzen', '25/10/2019'),
(148, 1, 1, '2019-10-24 22:40:04', 'i', 'chatmsg', 'Falzen', '25/10/2019'),
(149, 1, 1, '2019-10-24 22:40:05', 'o', 'chatmsg', 'Falzen', '25/10/2019'),
(150, 1, 1, '2019-10-24 22:40:05', 'p', 'chatmsg', 'Falzen', '25/10/2019'),
(151, 4, 1, '2019-10-24 22:40:12', 'dz', 'chatmsg', 'test', '25/10/2019'),
(152, 4, 1, '2019-10-24 22:40:12', 'z', 'chatmsg', 'test', '25/10/2019'),
(153, 4, 1, '2019-10-24 22:40:12', 'z', 'chatmsg', 'test', '25/10/2019'),
(154, 4, 1, '2019-10-24 22:40:12', 'z', 'chatmsg', 'test', '25/10/2019'),
(155, 4, 1, '2019-10-24 22:40:12', 'z', 'chatmsg', 'test', '25/10/2019'),
(156, 4, 1, '2019-10-24 22:40:13', 'z', 'chatmsg', 'test', '25/10/2019'),
(157, 1, 1, '2019-10-24 22:40:16', 'dzqq', 'chatmsg', 'Falzen', '25/10/2019'),
(158, 1, 1, '2019-10-24 22:40:43', 'aze', 'chatmsg', 'Falzen', '25/10/2019'),
(159, 1, 1, '2019-10-24 22:40:43', 'eza', 'chatmsg', 'Falzen', '25/10/2019'),
(160, 1, 1, '2019-10-24 22:40:43', 'eza', 'chatmsg', 'Falzen', '25/10/2019'),
(161, 4, 1, '2019-10-24 22:40:51', 'dqz', 'chatmsg', 'test', '25/10/2019'),
(162, 4, 1, '2019-10-24 22:40:51', 'qdz', 'chatmsg', 'test', '25/10/2019'),
(163, 4, 1, '2019-10-24 22:40:51', 'dqz', 'chatmsg', 'test', '25/10/2019'),
(164, 4, 1, '2019-10-24 22:40:51', 'qdzqz', 'chatmsg', 'test', '25/10/2019'),
(165, 1, 1, '2019-10-24 22:40:53', 'dqzdzq', 'chatmsg', 'Falzen', '25/10/2019'),
(166, 1, 1, '2019-10-24 22:40:53', 'dzq', 'chatmsg', 'Falzen', '25/10/2019'),
(167, 1, 1, '2019-10-24 22:40:53', 'dqz', 'chatmsg', 'Falzen', '25/10/2019'),
(168, 4, 1, '2019-10-24 22:41:11', 'iop', 'chatmsg', 'test', '25/10/2019'),
(169, 1, 1, '2019-10-24 22:41:12', 'iop', 'chatmsg', 'Falzen', '25/10/2019'),
(170, 4, 1, '2019-10-24 22:41:30', 'dzqdqzdzqqdz', 'chatmsg', 'test', '25/10/2019'),
(171, 1, 1, '2019-10-24 22:41:32', 'dqzdqzdzq', 'chatmsg', 'Falzen', '25/10/2019'),
(172, 1, 1, '2019-10-24 22:43:58', 'eeeeee', 'chatmsg', 'Falzen', '25/10/2019'),
(173, 4, 1, '2019-10-24 22:44:00', 'zz', 'chatmsg', 'test', '25/10/2019'),
(174, 4, 1, '2019-10-24 22:44:08', 'qqqqqqqqqqq', 'chatmsg', 'test', '25/10/2019'),
(175, 1, 1, '2019-10-24 22:44:10', 'fdfdfs', 'chatmsg', 'Falzen', '25/10/2019'),
(176, 1, 1, '2019-10-24 22:44:13', 'dzqzq', 'chatmsg', 'Falzen', '25/10/2019'),
(177, 4, 1, '2019-10-24 22:47:33', 'dzqdzq', 'chatmsg', 'test', '25/10/2019'),
(178, 4, 1, '2019-10-24 22:47:34', 'dzqdzq', 'chatmsg', 'test', '25/10/2019'),
(179, 4, 1, '2019-10-24 22:48:11', 'dzq', 'chatmsg', 'test', '25/10/2019'),
(180, 4, 1, '2019-10-24 22:48:16', 'dzqdzqdzqdzq', 'chatmsg', 'test', '25/10/2019'),
(181, 4, 1, '2019-10-24 22:48:45', 'zzzz', 'chatmsg', 'test', '25/10/2019'),
(182, 1, 1, '2019-10-24 22:48:54', 'dzqdzqdqz', 'chatmsg', 'Falzen', '25/10/2019'),
(183, 1, 1, '2019-10-24 22:49:01', 'qdzzqdqz', 'chatmsg', 'Falzen', '25/10/2019'),
(184, 1, 1, '2019-10-24 22:49:01', 'dqzd', 'chatmsg', 'Falzen', '25/10/2019'),
(185, 1, 1, '2019-10-24 22:49:01', 'zqd', 'chatmsg', 'Falzen', '25/10/2019'),
(186, 1, 1, '2019-10-24 22:49:02', 'zqd', 'chatmsg', 'Falzen', '25/10/2019'),
(187, 1, 1, '2019-10-24 22:49:02', 'qz', 'chatmsg', 'Falzen', '25/10/2019'),
(188, 1, 1, '2019-10-24 22:49:02', 'dzq', 'chatmsg', 'Falzen', '25/10/2019'),
(189, 4, 1, '2019-10-24 22:49:11', 'dzqdzqd', 'chatmsg', 'test', '25/10/2019'),
(190, 4, 1, '2019-10-24 22:49:14', 'dzqdzq', 'chatmsg', 'test', '25/10/2019'),
(191, 4, 1, '2019-10-24 22:49:19', 'zzzzzzzzzzzzzz', 'chatmsg', 'test', '25/10/2019'),
(192, 1, 1, '2019-10-24 22:49:22', 'qqqqqqqqq', 'chatmsg', 'Falzen', '25/10/2019'),
(193, 4, 1, '2019-10-24 22:50:27', 'zzzzzz', 'chatmsg', 'test', '25/10/2019'),
(194, 4, 1, '2019-10-24 22:50:34', 'qqqqqqqqq', 'chatmsg', 'test', '25/10/2019'),
(195, 4, 1, '2019-10-24 22:53:07', 'rrrrrr', 'chatmsg', 'test', '25/10/2019'),
(196, 4, 1, '2019-10-24 22:53:15', 'ygjjgyjyg', 'chatmsg', 'test', '25/10/2019'),
(197, 1, 1, '2019-10-24 22:53:26', 'qqqqqqqqqqqqqqqqqqq', 'chatmsg', 'Falzen', '25/10/2019'),
(198, 4, 1, '2019-10-24 22:53:33', 'zzzzzzzzz', 'chatmsg', 'test', '25/10/2019'),
(199, 1, 1, '2019-10-24 22:54:04', 'qqqqqqqqqqqq', 'chatmsg', 'Falzen', '25/10/2019'),
(200, 4, 1, '2019-10-24 22:54:13', 'zzzzzzzzzzzz', 'chatmsg', 'test', '25/10/2019'),
(201, 1, 1, '2019-10-24 22:54:16', 'ddddddddd', 'chatmsg', 'Falzen', '25/10/2019'),
(202, 1, 1, '2019-10-24 22:54:19', 'dqzdzqdzq', 'chatmsg', 'Falzen', '25/10/2019'),
(203, 1, 1, '2019-10-24 22:54:19', 'dzq', 'chatmsg', 'Falzen', '25/10/2019'),
(204, 1, 1, '2019-10-24 22:54:19', 'dzq', 'chatmsg', 'Falzen', '25/10/2019'),
(205, 1, 1, '2019-10-24 22:54:20', 'dzq', 'chatmsg', 'Falzen', '25/10/2019'),
(206, 1, 1, '2019-10-24 22:54:20', 'dqz', 'chatmsg', 'Falzen', '25/10/2019'),
(207, 1, 1, '2019-10-24 22:54:20', 'dqz', 'chatmsg', 'Falzen', '25/10/2019'),
(208, 1, 1, '2019-10-24 22:54:20', 'dqz', 'chatmsg', 'Falzen', '25/10/2019'),
(209, 1, 1, '2019-10-24 22:54:20', 'dqz', 'chatmsg', 'Falzen', '25/10/2019'),
(210, 1, 1, '2019-10-24 22:54:20', 'qz', 'chatmsg', 'Falzen', '25/10/2019'),
(211, 1, 1, '2019-10-24 22:54:21', 'qz', 'chatmsg', 'Falzen', '25/10/2019'),
(212, 4, 1, '2019-10-24 22:54:25', 'ww', 'chatmsg', 'test', '25/10/2019'),
(213, 1, 1, '2019-10-24 22:56:47', 'dqzdqzdzq', 'chatmsg', 'Falzen', '25/10/2019'),
(214, 1, 1, '2019-10-24 22:56:48', 'dzqdzqzq', 'chatmsg', 'Falzen', '25/10/2019'),
(215, 4, 1, '2019-10-24 22:56:51', 'z', 'chatmsg', 'test', '25/10/2019'),
(216, 4, 1, '2019-10-24 22:57:16', 'dqz', 'chatmsg', 'test', '25/10/2019'),
(217, 4, 1, '2019-10-24 23:22:05', 'Heeeey', 'chatmsg', 'test', '25/10/2019'),
(218, 1, 1, '2019-10-24 23:22:15', 'Hey', 'chatmsg', 'Falzen', '25/10/2019'),
(219, 1, 1, '2019-10-24 23:22:31', 'Ciao', 'chatmsg', 'Falzen', '25/10/2019');

-- --------------------------------------------------------

--
-- Structure de la table `jeu`
--

DROP TABLE IF EXISTS `jeu`;
CREATE TABLE IF NOT EXISTS `jeu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `regles` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `jeu`
--

INSERT INTO `jeu` (`id`, `nom`, `description`, `regles`) VALUES
(1, 'Jeu test 01', 'Description du Jeu test 01', 'Les règles du Jeu test 01'),
(2, 'Jeu test 02', 'Description du Jeu test 02', 'Les règles du Jeu test 02');

-- --------------------------------------------------------

--
-- Structure de la table `jeuxplayersxref`
--

DROP TABLE IF EXISTS `jeuxplayersxref`;
CREATE TABLE IF NOT EXISTS `jeuxplayersxref` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `is_mj` tinyint(1) NOT NULL DEFAULT '0',
  `game_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`),
  KEY `jeu_id` (`game_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `jeuxplayersxref`
--

INSERT INTO `jeuxplayersxref` (`id`, `player_id`, `is_mj`, `game_id`) VALUES
(1, 1, 0, 1),
(2, 2, 0, 1),
(3, 3, 0, 1),
(4, 1, 1, 2),
(5, 2, 0, 2),
(6, 4, 1, 1),
(7, 4, 0, 2);

-- --------------------------------------------------------

--
-- Structure de la table `players`
--

DROP TABLE IF EXISTS `players`;
CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `level` int(11) NOT NULL DEFAULT '1',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `username` text COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL,
  `is_online` tinyint(1) NOT NULL DEFAULT '0',
  `date_derniere_connexion` datetime DEFAULT NULL,
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `players`
--

INSERT INTO `players` (`id`, `pseudo`, `level`, `description`, `username`, `password`, `is_online`, `date_derniere_connexion`, `date_creation`) VALUES
(1, 'Falzen', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla leo turpis, pulvinar et pulvinar eu, elementum quis erat. Donec faucibus elit vel porta tincidunt.', 'Falzen', 'f01870f0701268dbb0d1ea7538ec26e3', 1, '2019-10-24 23:08:37', '2019-10-20 06:20:00'),
(2, 'Freyggen', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla leo turpis, pulvinar et pulvinar eu, elementum quis erat. Donec faucibus elit vel porta tincidunt. Mauris vulputate ornare purus, id aliquet odio malesuada eu.', 'Freyggen', 'Freyggen', 0, NULL, '2019-10-20 06:20:00'),
(3, 'Démonique', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla leo turpis, pulvinar et pulvinar eu, elementum quis erat. Donec faucibus elit vel porta tincidunt. Mauris vulputate ornare purus, id aliquet odio malesuada eu. Aliquam tempor, mauris nec venenatis tincidunt, libero lacus feugiat elit, sit amet dictum erat dui id enim. Integer tempor velit vitae tortor fermentum dictum. Morbi condimentum euismod nibh sed pulvinar.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla leo turpis, pulvinar et pulvinar eu, elementum quis erat. Donec faucibus elit vel porta tincidunt. Mauris vulputate ornare purus, id aliquet odio malesuada eu. Aliquam tempor, mauris nec venenatis tincidunt, libero lacus feugiat elit, sit amet dictum erat dui id enim. Integer tempor velit vitae tortor fermentum dictum. Morbi condimentum euismod nibh sed pulvinar.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla leo turpis, pulvinar et pulvinar eu, elementum quis erat. Donec faucibus elit vel porta tincidunt. Mauris vulputate ornare purus, id aliquet odio malesuada eu. Aliquam tempor, mauris nec venenatis tincidunt, libero lacus feugiat elit, sit amet dictum erat dui id enim. Integer tempor velit vitae tortor fermentum dictum. Morbi condimentum euismod nibh sed pulvinar.', 'Démonique', 'Démonique', 0, NULL, '2019-10-20 06:20:00'),
(4, 'test', 1, 'TODO', 'test', '098f6bcd4621d373cade4e832627b4f6', 1, '2019-10-25 01:22:00', '2019-10-24 19:04:24');

-- --------------------------------------------------------

--
-- Structure de la table `player_notes`
--

DROP TABLE IF EXISTS `player_notes`;
CREATE TABLE IF NOT EXISTS `player_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `html_content` text COLLATE utf8_unicode_ci NOT NULL,
  `player_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `last_update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `player_notes`
--

INSERT INTO `player_notes` (`id`, `html_content`, `player_id`, `game_id`, `last_update_date`) VALUES
(1, 'Vos notes<div><br></div><div><br></div><div>- ptetre forcer la porte en bas dès qu\'on a un outil (pelle, tuyau...)</div><div><br></div><div>- le mec à l\'air malade (que moi qui ai remarqué)</div><div><br></div><div>- etc...</div>', 1, 1, '2019-10-22 21:43:23'),
(2, 'hein ?<div><br></div>', 9, 1, '2019-10-24 19:21:55'),
(3, 'dzqdzq zq d qzdqzdqzdzq', 4, 1, '2019-10-24 23:21:56');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

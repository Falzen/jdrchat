-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 23 oct. 2019 à 06:35
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
  `jeu_id` int(11) NOT NULL,
  `date_creation` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `msg_content` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`),
  KEY `jeu_id` (`jeu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `chat_messages`
--

INSERT INTO `chat_messages` (`id`, `player_id`, `jeu_id`, `date_creation`, `msg_content`) VALUES
(1, 1, 1, '2019-10-20 06:37:20', 'je suis Falzen dans le jeu 1'),
(2, 2, 1, '2019-10-20 06:37:20', 'je suis Freyggen dans le jeu 1 '),
(3, 3, 1, '2019-10-20 06:37:20', 'Aliquam scelerisque luctus tortor, ac faucibus tortor pulvinar euismod.'),
(4, 1, 1, '2019-10-20 06:37:20', 'Vivamus interdum orci et semper aliquet.'),
(5, 2, 1, '2019-10-20 06:37:20', 'Aliquam scelerisque luctus tortor, ac faucibus tortor pulvinar euismod.'),
(6, 2, 1, '2019-10-20 06:37:20', 'Vivamus interdum orci et semper aliquet.'),
(7, 3, 1, '2019-10-20 06:37:20', 'Aliquam scelerisque luctus tortor, ac faucibus tortor pulvinar euismod.'),
(8, 1, 2, '2019-10-20 06:37:20', 'Vivamus interdum orci et semper aliquet.'),
(9, 1, 2, '2019-10-20 06:37:20', 'Aliquam scelerisque luctus tortor, ac faucibus tortor pulvinar euismod.'),
(10, 3, 1, '2019-10-20 06:37:20', 'Vivamus interdum orci et semper aliquet.'),
(11, 2, 1, '2019-10-20 06:37:20', 'Aliquam scelerisque luctus tortor, ac faucibus tortor pulvinar euismod.'),
(12, 1, 1, '2019-10-20 06:37:20', 'Vivamus interdum orci et semper aliquet.'),
(13, 3, 1, '2019-10-20 06:37:20', 'Aliquam scelerisque luctus tortor, ac faucibus tortor pulvinar euismod.'),
(14, 3, 1, '2019-10-20 06:37:20', 'Vivamus interdum orci et semper aliquet.'),
(15, 2, 1, '2019-10-20 06:37:20', 'Aliquam scelerisque luctus tortor, ac faucibus tortor pulvinar euismod.'),
(16, 2, 1, '2019-10-20 06:37:20', 'Vivamus interdum orci et semper aliquet.'),
(17, 2, 1, '2019-10-20 06:37:20', 'Aliquam scelerisque luctus tortor, ac faucibus tortor pulvinar euismod.'),
(18, 1, 1, '2019-10-20 06:38:04', 'Mauris dictum interdum odio, ac facilisis nunc dictum ut.'),
(19, 2, 2, '2019-10-20 06:38:04', 'je suis Freyggen dans le jeu 2'),
(20, 1, 2, '2019-10-20 06:38:04', 'je suis Falzen dans le jeu 2'),
(21, 2, 2, '2019-10-20 06:38:04', 'Aliquam scelerisque luctus tortor, ac faucibus tortor pulvinar euismod.'),
(22, 2, 2, '2019-10-20 06:38:04', 'Vivamus interdum orci et semper aliquet.'),
(23, 1, 2, '2019-10-20 06:38:04', 'Vivamus interdum orci et semper aliquet.'),
(24, 1, 2, '2019-10-20 06:38:04', 'Aliquam scelerisque luctus tortor, ac faucibus tortor pulvinar euismod.'),
(25, 2, 2, '2019-10-20 06:38:04', 'Aliquam scelerisque luctus tortor, ac faucibus tortor pulvinar euismod.'),
(26, 1, 2, '2019-10-20 06:38:04', 'Vivamus interdum orci et semper aliquet.'),
(27, 2, 2, '2019-10-20 06:38:04', 'Aliquam scelerisque luctus tortor, ac faucibus tortor pulvinar euismod.'),
(28, 2, 2, '2019-10-20 06:38:04', 'Vivamus interdum orci et semper aliquet.'),
(29, 2, 2, '2019-10-20 06:38:04', 'Aliquam scelerisque luctus tortor, ac faucibus tortor pulvinar euismod.');

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
  `jeu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`),
  KEY `jeu_id` (`jeu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `jeuxplayersxref`
--

INSERT INTO `jeuxplayersxref` (`id`, `player_id`, `jeu_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 1, 2),
(5, 2, 2);

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `players`
--

INSERT INTO `players` (`id`, `pseudo`, `level`, `description`, `username`, `password`, `is_online`, `date_derniere_connexion`, `date_creation`) VALUES
(1, 'Falzen', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla leo turpis, pulvinar et pulvinar eu, elementum quis erat. Donec faucibus elit vel porta tincidunt.', 'Falzen', 'f01870f0701268dbb0d1ea7538ec26e3', 1, '2019-10-23 01:25:19', '2019-10-20 06:20:00'),
(2, 'Freyggen', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla leo turpis, pulvinar et pulvinar eu, elementum quis erat. Donec faucibus elit vel porta tincidunt. Mauris vulputate ornare purus, id aliquet odio malesuada eu.', 'Freyggen', 'Freyggen', 0, NULL, '2019-10-20 06:20:00'),
(3, 'Démonique', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla leo turpis, pulvinar et pulvinar eu, elementum quis erat. Donec faucibus elit vel porta tincidunt. Mauris vulputate ornare purus, id aliquet odio malesuada eu. Aliquam tempor, mauris nec venenatis tincidunt, libero lacus feugiat elit, sit amet dictum erat dui id enim. Integer tempor velit vitae tortor fermentum dictum. Morbi condimentum euismod nibh sed pulvinar.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla leo turpis, pulvinar et pulvinar eu, elementum quis erat. Donec faucibus elit vel porta tincidunt. Mauris vulputate ornare purus, id aliquet odio malesuada eu. Aliquam tempor, mauris nec venenatis tincidunt, libero lacus feugiat elit, sit amet dictum erat dui id enim. Integer tempor velit vitae tortor fermentum dictum. Morbi condimentum euismod nibh sed pulvinar.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla leo turpis, pulvinar et pulvinar eu, elementum quis erat. Donec faucibus elit vel porta tincidunt. Mauris vulputate ornare purus, id aliquet odio malesuada eu. Aliquam tempor, mauris nec venenatis tincidunt, libero lacus feugiat elit, sit amet dictum erat dui id enim. Integer tempor velit vitae tortor fermentum dictum. Morbi condimentum euismod nibh sed pulvinar.', 'Démonique', 'Démonique', 1, NULL, '2019-10-20 06:20:00');

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `player_notes`
--

INSERT INTO `player_notes` (`id`, `html_content`, `player_id`, `game_id`, `last_update_date`) VALUES
(1, 'Vos notes<div><br></div><div><br></div><div>- ptetre forcer la porte en bas dès qu\'on a un outil (pelle, tuyau...)</div><div><br></div><div>- le mec à l\'air malade (que moi qui ai remarqué)</div><div><br></div><div>- etc...</div>', 1, 1, '2019-10-22 21:43:23');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

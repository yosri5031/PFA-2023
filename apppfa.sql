-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 17 mai 2023 à 09:39
-- Version du serveur : 10.4.21-MariaDB
-- Version de PHP : 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `apppfa`
--

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

CREATE TABLE `classe` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `classe`
--

INSERT INTO `classe` (`id`, `name`, `department_id`) VALUES
(1, 'INFO 1', 101),
(2, 'INFO 2', 101),
(3, 'INFO  3', 101),
(4, 'PREP 1', 102),
(5, 'PREP2', 102),
(6, 'MIQ1', 104),
(7, 'MIQ2', 104),
(8, 'MIQ3', 104),
(9, 'EET 1', 103),
(10, 'EET 2', 103),
(11, 'EET3', 103),
(12, 'SAMI1', 105),
(13, 'SAMI2', 105),
(14, 'SAMI3', 105);

-- --------------------------------------------------------

--
-- Structure de la table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `department`
--

INSERT INTO `department` (`id`, `name`) VALUES
(101, 'Génie informatique'),
(102, 'préparatoire'),
(103, 'Génie Electronique'),
(104, 'Génie Mécatronique'),
(105, 'Génie Systèmes Automatisés');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210530143246', '2021-05-30 17:00:48', 387),
('DoctrineMigrations\\Version20210601152328', '2021-06-01 17:39:22', 627),
('DoctrineMigrations\\Version20210606122716', '2021-06-06 14:29:32', 2959),
('DoctrineMigrations\\Version20210606192538', '2021-06-06 21:27:19', 2575),
('DoctrineMigrations\\Version20210606193145', '2021-06-06 21:32:36', 1726),
('DoctrineMigrations\\Version20210607104525', '2021-06-07 12:46:44', 1535),
('DoctrineMigrations\\Version20210610095322', '2021-06-10 11:54:40', 1445),
('DoctrineMigrations\\Version20210610095618', '2021-06-10 11:56:33', 674),
('DoctrineMigrations\\Version20210610122104', '2021-06-10 14:22:18', 2049),
('DoctrineMigrations\\Version20210610122323', '2021-06-10 14:23:34', 323),
('DoctrineMigrations\\Version20210611091635', '2021-06-11 11:17:28', 2152),
('DoctrineMigrations\\Version20210611092425', '2021-06-11 11:24:42', 2095),
('DoctrineMigrations\\Version20210616180344', '2021-06-16 20:04:09', 1841);

-- --------------------------------------------------------

--
-- Structure de la table `enseignant_matiere`
--

CREATE TABLE `enseignant_matiere` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `matiere_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

CREATE TABLE `matiere` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `classe_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `semestre_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `matiere`
--

INSERT INTO `matiere` (`id`, `name`, `classe_id`, `user_id`, `semestre_id`) VALUES
(1, 'Statistique & Probabilités', 1, 1, 1),
(2, 'Principes de geston', 1, 2, 5),
(3, 'Comptabilité Générale', 1, 2, 5),
(4, 'Business Communication', 2, 3, 5),
(5, 'Organisation de entreprise', 3, 1, 5),
(6, 'Développement IHM', 2, 3, 2),
(7, 'Systèmes d\'exploitation', 1, 1, 5),
(8, 'Algo Struct de Données', 1, 1, 6),
(9, 'Système Logique &Architecture', 7, 2, 6),
(10, 'Compétances Numérique', 7, 3, 6),
(11, 'Analyse', 7, 1, 6),
(12, 'Economie générale', 3, 2, 6),
(13, 'mathémathique', 5, 1, 6),
(14, 'physique', 1, 2, 6),
(15, 'Statistique & Probabilités', 1, 2, 6),
(16, 'Statistique & Probabilités', 4, 1, 1),
(17, 'NoSQL', 2, 1, 2),
(18, 'Comptabilité Générale', 4, 2, 3),
(19, 'Business Communication', 2, 3, 3),
(20, 'Organisation de entreprise', 3, 1, 3),
(21, 'Développement IHM', 8, 3, 3),
(22, 'Systèmes d\'exploitation', 1, 1, 3),
(23, 'Algo Struct de Données', 3, 1, 4),
(24, 'Système Logique &Architecture', 7, 2, 4),
(25, 'Compétances Numérique', 12, 3, 4),
(26, 'Analyse', 7, 1, 4),
(27, 'Economie générale', 3, 2, 4),
(28, 'mathémathique', 5, 1, 4),
(29, 'physique', 1, 2, 4),
(30, 'Statistique & Probabilités', 1, 2, 4),
(31, 'Complexité algorithmique\r\n', 10, 3, 5),
(32, 'Atelier de programmation', 4, 2, 5),
(33, 'Algèbre I', 4, 3, 5),
(34, 'Atelier de programmation', 4, 2, 3),
(35, 'Algèbre I', 4, 3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `periodes`
--

CREATE TABLE `periodes` (
  `id` int(11) NOT NULL,
  `annee` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `semestre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `courante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `periodes`
--

INSERT INTO `periodes` (`id`, `annee`, `semestre`, `courante`) VALUES
(1, '2022-2023', 'S1-2022/2023', 0),
(2, '2022-2023', 'S2-2022/2023', 1),
(3, '2020-2019', 'S1-2019/2020', 0),
(4, '2020-2019', 'S2-2019/2020', 0),
(5, '2021-2020', 'S1-2020/2021', 0),
(6, '2021-2020', 'S2-2020/2021', 0);

-- --------------------------------------------------------

--
-- Structure de la table `questionnaire`
--

CREATE TABLE `questionnaire` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sujet` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `questionnaire`
--

INSERT INTO `questionnaire` (`id`, `titre`, `sujet`) VALUES
(1, '1.Avant le début de la session, mon niveau de motivation pour le contenu de ce cours ', 'Questions d’ordre général'),
(2, '2.le moyen d\'assistance dans ce cours ', 'Questions d’ordre général'),
(3, '3.Dans ce cours, j’ai investi un niveau d’effort ', 'Questions d’ordre général'),
(4, '4.Le professeur nous demande une charge de travail insufficent(1*) \n    ou plus grande(5*) que ce qui est prévu pour ce cours', 'Planification'),
(5, '5.Le professeur répartit bien le contenu du cours sur l’ensemble de la session (ou sur le nombre de\r\n     semaines prévu pour ce cours)', 'Planification'),
(6, '6.Le professeur répartit bien les activités d’évaluation sommative dans la session', 'Planification'),
(7, '7.Le professeur a présenté clairement le plan de cours au début de la session', 'Environnement pédagogique'),
(8, '8.Le professeur contribue à créer un climat qui favorise l’apprentissage en classe', 'Environnement pédagogique'),
(9, '9.Le professeur donne ses cours de façon structurée', 'Environnement pédagogique'),
(10, '10.Le professeur garde bien le contrôle de son groupe', 'Environnement pédagogique'),
(11, '11.Le professeur maîtrise bien le contenu de son cours', 'Maîtrise du contenu et clarté'),
(12, '12.Le professeur utilise des exemples pertinents qui facilitent les apprentissages visés', 'Maîtrise du contenu et clarté'),
(13, '13.Le professeur sait rendre compréhensibles des notions techniques, complexes ou abstraites', 'Maîtrise du contenu et clarté'),
(14, '14.Le professeur répond de manière claire et satisfaisante aux questions des étudiants', 'Maîtrise du contenu et clarté'),
(15, '15.Le professeur fait ressortir les points importants du cours lors de son enseignement', 'Stratégies pédagogiques'),
(16, '16.Le professeur utilise des méthodes pédagogiques qui favorisent mes apprentissages', 'Stratégies pédagogiques'),
(17, '17.Le professeur utilise des méthodes pédagogiques qui soutiennent mon intérêt', 'Stratégies pédagogiques'),
(18, '18.Le professeur respecte les délais prévus  pour la remise aux étudiants des résultats des travaux ou des examens', 'Évaluation des apprentissages'),
(19, '19.Le professeur nous fait régulièrement des commentaires sur nos forces et nos points à améliorer', 'Évaluation des apprentissages'),
(20, '20.Le professeur prévoit des activités d’évaluation sommative (examens, projets, travaux, etc.) qui correspondent aux compétences visées par ce cours', 'Évaluation des apprentissages'),
(21, '21.Le professeur formule sur  les travaux corrigés des commentaires qui m’aident à progresser', 'Évaluation des apprentissages'),
(22, '22.Le professeur est ouvert aux suggestions des étudiants sur son cours', 'Relation pédagogique, encadrement et disponibilité'),
(23, '23.Le professeur fait preuve de respect et de considération pour ses étudiants', 'Relation pédagogique, encadrement et disponibilité'),
(24, '24.Le professeur offre une disponibilité adéquate pour répondre aux besoins d’aide et d’encadrement de ses étudiants', 'Relation pédagogique, encadrement et disponibilité');

-- --------------------------------------------------------

--
-- Structure de la table `studentqcm`
--

CREATE TABLE `studentqcm` (
  `id` int(11) NOT NULL,
  `matiere_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `studentqcm`
--

INSERT INTO `studentqcm` (`id`, `matiere_id`, `user_id`, `question_id`, `note`) VALUES
(1, 1, 116, 1, '3'),
(2, 1, 116, 2, '4'),
(3, 1, 116, 3, '3'),
(4, 1, 116, 4, '3'),
(5, 1, 116, 5, '5'),
(6, 1, 116, 6, '5'),
(7, 1, 116, 7, '5'),
(8, 1, 116, 8, '5'),
(9, 1, 116, 9, '4'),
(10, 1, 116, 10, '4'),
(11, 1, 116, 11, '4'),
(12, 1, 116, 12, '4'),
(13, 1, 116, 13, '4'),
(14, 1, 116, 14, '4'),
(15, 1, 116, 15, '4'),
(16, 1, 116, 16, '4'),
(17, 1, 116, 17, '4'),
(18, 1, 116, 18, '4'),
(19, 1, 116, 19, '4'),
(20, 1, 116, 20, '4'),
(21, 1, 116, 21, '4'),
(22, 1, 116, 22, '5'),
(23, 1, 116, 23, '5'),
(24, 1, 116, 24, '4'),
(73, 32, 138, 1, '2'),
(74, 32, 138, 2, '2'),
(75, 32, 138, 3, '2'),
(76, 32, 138, 4, '4'),
(77, 32, 138, 5, '4'),
(78, 32, 138, 6, '4'),
(79, 32, 138, 7, '3'),
(80, 32, 138, 8, '3'),
(81, 32, 138, 9, '3'),
(82, 32, 138, 10, '3'),
(83, 32, 138, 11, '4'),
(84, 32, 138, 12, '4'),
(85, 32, 138, 13, '4'),
(86, 32, 138, 14, '4'),
(87, 32, 138, 15, '2'),
(88, 32, 138, 16, '4'),
(89, 32, 138, 17, '4'),
(90, 32, 138, 18, '1'),
(91, 32, 138, 19, '5'),
(92, 32, 138, 20, '5'),
(93, 32, 138, 21, '1'),
(94, 32, 138, 22, '4'),
(95, 32, 138, 23, '3'),
(96, 32, 138, 24, '5'),
(97, 32, 137, 1, '1'),
(98, 32, 137, 2, '2'),
(99, 32, 137, 3, '4'),
(100, 32, 137, 4, '3'),
(101, 32, 137, 5, '5'),
(102, 32, 137, 6, '5'),
(103, 32, 137, 7, '5'),
(104, 32, 137, 8, '5'),
(105, 32, 137, 9, '5'),
(106, 32, 137, 10, '4'),
(107, 32, 137, 11, '5'),
(108, 32, 137, 12, '4'),
(109, 32, 137, 13, '5'),
(110, 32, 137, 14, '4'),
(111, 32, 137, 15, '5'),
(112, 32, 137, 16, '5'),
(113, 32, 137, 17, '5'),
(114, 32, 137, 18, '2'),
(115, 32, 137, 19, '4'),
(116, 32, 137, 20, '3'),
(117, 32, 137, 21, '2'),
(118, 32, 137, 22, '5'),
(119, 32, 137, 23, '4'),
(120, 32, 137, 24, '5'),
(121, 34, 137, 1, '3'),
(122, 34, 137, 2, '3'),
(123, 34, 137, 3, '3'),
(124, 34, 137, 4, '3'),
(125, 34, 137, 5, '2'),
(126, 34, 137, 6, '1'),
(127, 34, 137, 7, '1'),
(128, 34, 137, 8, '5'),
(129, 34, 137, 9, '5'),
(130, 34, 137, 10, '2'),
(131, 34, 137, 11, '2'),
(132, 34, 137, 12, '1'),
(133, 34, 137, 13, '4'),
(134, 34, 137, 14, '5'),
(135, 34, 137, 15, '5'),
(136, 34, 137, 16, '4'),
(137, 34, 137, 17, '5'),
(138, 34, 137, 18, '5'),
(139, 34, 137, 19, '4'),
(140, 34, 137, 20, '5'),
(141, 34, 137, 21, '5'),
(142, 34, 137, 22, '4'),
(143, 34, 137, 23, '4'),
(144, 34, 137, 24, '3'),
(145, 35, 137, 1, '3'),
(146, 35, 137, 2, '2'),
(147, 35, 137, 3, '2'),
(148, 35, 137, 4, '5'),
(149, 35, 137, 5, '3'),
(150, 35, 137, 6, '4'),
(151, 35, 137, 7, '3'),
(152, 35, 137, 8, '1'),
(153, 35, 137, 9, '2'),
(154, 35, 137, 10, '1'),
(155, 35, 137, 11, '3'),
(156, 35, 137, 12, '3'),
(157, 35, 137, 13, '4'),
(158, 35, 137, 14, '4'),
(159, 35, 137, 15, '4'),
(160, 35, 137, 16, '3'),
(161, 35, 137, 17, '5'),
(162, 35, 137, 18, '5'),
(163, 35, 137, 19, '5'),
(164, 35, 137, 20, '5'),
(165, 35, 137, 21, '5'),
(166, 35, 137, 22, '3'),
(167, 35, 137, 23, '5'),
(168, 35, 137, 24, '1'),
(169, 34, 138, 1, '3'),
(170, 34, 138, 2, '3'),
(171, 34, 138, 3, '5'),
(172, 34, 138, 4, '3'),
(173, 34, 138, 5, '5'),
(174, 34, 138, 6, '5'),
(175, 34, 138, 7, '5'),
(176, 34, 138, 8, ''),
(177, 34, 138, 9, '2'),
(178, 34, 138, 10, '5'),
(179, 34, 138, 11, '4'),
(180, 34, 138, 12, '5'),
(181, 34, 138, 13, '5'),
(182, 34, 138, 14, '5'),
(183, 34, 138, 15, '2'),
(184, 34, 138, 16, '4'),
(185, 34, 138, 17, '4'),
(186, 34, 138, 18, '5'),
(187, 34, 138, 19, '4'),
(188, 34, 138, 20, '2'),
(189, 34, 138, 21, '4'),
(190, 34, 138, 22, '4'),
(191, 34, 138, 23, '3'),
(192, 34, 138, 24, '5'),
(193, 35, 138, 1, '2'),
(194, 35, 138, 2, '1'),
(195, 35, 138, 3, '4'),
(196, 35, 138, 4, '2'),
(197, 35, 138, 5, '3'),
(198, 35, 138, 6, '1'),
(199, 35, 138, 7, '2'),
(200, 35, 138, 8, '5'),
(201, 35, 138, 9, '3'),
(202, 35, 138, 10, '5'),
(203, 35, 138, 11, '4'),
(204, 35, 138, 12, '5'),
(205, 35, 138, 13, '5'),
(206, 35, 138, 14, '4'),
(207, 35, 138, 15, '5'),
(208, 35, 138, 16, '4'),
(209, 35, 138, 17, '5'),
(210, 35, 138, 18, '3'),
(211, 35, 138, 19, '4'),
(212, 35, 138, 20, '2'),
(213, 35, 138, 21, '1'),
(214, 35, 138, 22, '5'),
(215, 35, 138, 23, '4'),
(216, 35, 138, 24, '5'),
(217, 16, 116, 1, '2'),
(218, 16, 116, 2, '3'),
(219, 16, 116, 3, '3'),
(220, 16, 116, 4, '2'),
(221, 16, 116, 5, '4'),
(222, 16, 116, 6, '3'),
(223, 16, 116, 7, '4'),
(224, 16, 116, 8, '3'),
(225, 16, 116, 9, '5'),
(226, 16, 116, 10, '3'),
(227, 16, 116, 11, '4'),
(228, 16, 116, 12, '3'),
(229, 16, 116, 13, '5'),
(230, 16, 116, 14, '4'),
(231, 16, 116, 15, '1'),
(232, 16, 116, 16, '3'),
(233, 16, 116, 17, '2'),
(234, 16, 116, 18, '4'),
(235, 16, 116, 19, '5'),
(236, 16, 116, 20, '5'),
(237, 16, 116, 21, '4'),
(238, 16, 116, 22, '2'),
(239, 16, 116, 23, '1'),
(240, 16, 116, 24, '4'),
(241, 16, 117, 1, '4'),
(242, 16, 117, 2, '3'),
(243, 16, 117, 3, '4'),
(244, 16, 117, 4, '5'),
(245, 16, 117, 5, '4'),
(246, 16, 117, 6, '5'),
(247, 16, 117, 7, '4'),
(248, 16, 117, 8, '5'),
(249, 16, 117, 9, '4'),
(250, 16, 117, 10, '5'),
(251, 16, 117, 11, '4'),
(252, 16, 117, 12, '5'),
(253, 16, 117, 13, '5'),
(254, 16, 117, 14, '3'),
(255, 16, 117, 15, '5'),
(256, 16, 117, 16, '5'),
(257, 16, 117, 17, '4'),
(258, 16, 117, 18, '5'),
(259, 16, 117, 19, '2'),
(260, 16, 117, 20, '5'),
(261, 16, 117, 21, '4'),
(262, 16, 117, 22, '1'),
(263, 16, 117, 23, '4'),
(264, 16, 117, 24, '5'),
(265, 16, 135, 1, '3'),
(266, 16, 135, 2, '2'),
(267, 16, 135, 3, '4'),
(268, 16, 135, 4, '5'),
(269, 16, 135, 5, '5'),
(270, 16, 135, 6, '5'),
(271, 16, 135, 7, '5'),
(272, 16, 135, 8, '4'),
(273, 16, 135, 9, '5'),
(274, 16, 135, 10, '5'),
(275, 16, 135, 11, '4'),
(276, 16, 135, 12, '4'),
(277, 16, 135, 13, '3'),
(278, 16, 135, 14, '3'),
(279, 16, 135, 15, '5'),
(280, 16, 135, 16, '5'),
(281, 16, 135, 17, '5'),
(282, 16, 135, 18, '2'),
(283, 16, 135, 19, '3'),
(284, 16, 135, 20, '4'),
(285, 16, 135, 21, '4'),
(286, 16, 135, 22, '3'),
(287, 16, 135, 23, '2'),
(288, 16, 135, 24, '2'),
(289, 16, 136, 1, '4'),
(290, 16, 136, 2, '4'),
(291, 16, 136, 3, '5'),
(292, 16, 136, 4, '5'),
(293, 16, 136, 5, '5'),
(294, 16, 136, 6, '4'),
(295, 16, 136, 7, '5'),
(296, 16, 136, 8, '4'),
(297, 16, 136, 9, '5'),
(298, 16, 136, 10, '5'),
(299, 16, 136, 11, '1'),
(300, 16, 136, 12, '2'),
(301, 16, 136, 13, '2'),
(302, 16, 136, 14, '2'),
(303, 16, 136, 15, '4'),
(304, 16, 136, 16, '4'),
(305, 16, 136, 17, '4'),
(306, 16, 136, 18, '5'),
(307, 16, 136, 19, '4'),
(308, 16, 136, 20, '5'),
(309, 16, 136, 21, '1'),
(310, 16, 136, 22, '3'),
(311, 16, 136, 23, '2'),
(312, 16, 136, 24, '3'),
(313, 3, 136, 1, '1'),
(314, 3, 136, 2, '3'),
(315, 3, 136, 3, '1'),
(316, 3, 136, 4, '1'),
(317, 3, 136, 5, '1'),
(318, 3, 136, 6, '1'),
(319, 3, 136, 7, '1'),
(320, 3, 136, 8, '1'),
(321, 3, 136, 9, '1'),
(322, 3, 136, 10, '1'),
(323, 3, 136, 11, '1'),
(324, 3, 136, 12, '1'),
(325, 3, 136, 13, '1'),
(326, 3, 136, 14, '1'),
(327, 3, 136, 15, '1'),
(328, 3, 136, 16, '1'),
(329, 3, 136, 17, '1'),
(330, 3, 136, 18, '1'),
(331, 3, 136, 19, '1'),
(332, 3, 136, 20, '1'),
(333, 3, 136, 21, '1'),
(334, 3, 136, 22, '1'),
(335, 3, 136, 23, '1'),
(336, 3, 136, 24, '1'),
(385, 1, 140, 1, '4'),
(386, 1, 140, 2, '3'),
(387, 1, 140, 3, '4'),
(388, 1, 140, 4, '4'),
(389, 1, 140, 5, '3'),
(390, 1, 140, 6, '1'),
(391, 1, 140, 7, '1'),
(392, 1, 140, 8, '1'),
(393, 1, 140, 9, '1'),
(394, 1, 140, 10, '1'),
(395, 1, 140, 11, '1'),
(396, 1, 140, 12, '1'),
(397, 1, 140, 13, '1'),
(398, 1, 140, 14, '1'),
(399, 1, 140, 15, '1'),
(400, 1, 140, 16, '1'),
(401, 1, 140, 17, '1'),
(402, 1, 140, 18, '1'),
(403, 1, 140, 19, '1'),
(404, 1, 140, 20, '1'),
(405, 1, 140, 21, '1'),
(406, 1, 140, 22, '1'),
(407, 1, 140, 23, '1'),
(408, 1, 140, 24, '1'),
(409, 1, 139, 1, '1'),
(410, 1, 139, 3, '1'),
(411, 1, 139, 4, '1'),
(412, 1, 139, 5, '1'),
(413, 1, 139, 6, '1'),
(414, 1, 139, 7, '1'),
(415, 1, 139, 8, '1'),
(416, 1, 139, 9, '1'),
(417, 1, 139, 10, '1'),
(418, 1, 139, 11, '1'),
(419, 1, 139, 12, '1'),
(420, 1, 139, 13, '1'),
(421, 1, 139, 14, '1'),
(422, 1, 139, 15, '1'),
(423, 1, 139, 16, '1'),
(424, 1, 139, 17, '1'),
(425, 1, 139, 18, '1'),
(426, 1, 139, 19, '1'),
(427, 1, 139, 20, '1'),
(428, 1, 139, 21, '1'),
(429, 1, 139, 22, '1'),
(430, 1, 139, 23, '1'),
(431, 1, 139, 24, '1'),
(432, 1, 139, 2, '1'),
(433, 6, 141, 1, '5'),
(434, 6, 141, 2, '4'),
(435, 6, 141, 3, '3'),
(436, 6, 141, 4, '2'),
(437, 6, 141, 5, '1'),
(438, 6, 141, 6, '1'),
(439, 6, 141, 7, '1'),
(440, 6, 141, 8, '1'),
(441, 6, 141, 9, '1'),
(442, 6, 141, 10, '1'),
(443, 6, 141, 11, '1'),
(444, 6, 141, 12, '1'),
(445, 6, 141, 13, '1'),
(446, 6, 141, 14, '1'),
(447, 6, 141, 15, '1'),
(448, 6, 141, 16, '1'),
(449, 6, 141, 17, '1'),
(450, 6, 141, 18, '1'),
(451, 6, 141, 19, '1'),
(452, 6, 141, 20, '1'),
(453, 6, 141, 21, '1'),
(454, 6, 141, 22, '1'),
(455, 6, 141, 23, '1'),
(456, 6, 141, 24, '1'),
(457, 6, 142, 1, '1'),
(458, 6, 142, 2, '2'),
(459, 6, 142, 3, '3'),
(460, 6, 142, 4, '4'),
(461, 6, 142, 5, '5'),
(462, 6, 142, 6, '5'),
(463, 6, 142, 7, '1'),
(464, 6, 142, 8, '1'),
(465, 6, 142, 9, '1'),
(466, 6, 142, 10, '1'),
(467, 6, 142, 11, '1'),
(468, 6, 142, 12, '1'),
(469, 6, 142, 13, '1'),
(470, 6, 142, 14, '1'),
(471, 6, 142, 15, '1'),
(472, 6, 142, 16, '1'),
(473, 6, 142, 17, '1'),
(474, 6, 142, 18, '1'),
(475, 6, 142, 19, '1'),
(476, 6, 142, 20, '1'),
(477, 6, 142, 21, '1'),
(478, 6, 142, 22, '1'),
(479, 6, 142, 23, '1'),
(480, 6, 142, 24, '1'),
(481, 4, 143, 1, '1'),
(482, 4, 143, 2, '1'),
(483, 4, 143, 3, '1'),
(484, 4, 143, 4, '1'),
(485, 4, 143, 5, '1'),
(486, 4, 143, 6, '1'),
(487, 4, 143, 7, '1'),
(488, 4, 143, 8, '1'),
(489, 4, 143, 9, '1'),
(490, 4, 143, 10, '1'),
(491, 4, 143, 11, '1'),
(492, 4, 143, 12, '1'),
(493, 4, 143, 13, '1'),
(494, 4, 143, 14, '1'),
(495, 4, 143, 15, '1'),
(496, 4, 143, 16, '1'),
(497, 4, 143, 17, '1'),
(498, 4, 143, 18, '1'),
(499, 4, 143, 19, '1'),
(500, 4, 143, 20, '1'),
(501, 4, 143, 21, '1'),
(502, 4, 143, 22, '1'),
(503, 4, 143, 23, '1'),
(504, 4, 143, 24, '1'),
(505, 17, 144, 1, '4'),
(506, 17, 144, 2, '2'),
(507, 17, 144, 3, '4'),
(508, 17, 144, 4, '5'),
(509, 17, 144, 5, '5'),
(510, 17, 144, 6, '4'),
(511, 17, 144, 7, '3'),
(512, 17, 144, 8, '1'),
(513, 17, 144, 9, '5'),
(514, 17, 144, 10, '5'),
(515, 17, 144, 11, '4'),
(516, 17, 144, 12, '5'),
(517, 17, 144, 13, '5'),
(518, 17, 144, 14, '4'),
(519, 17, 144, 15, '5'),
(520, 17, 144, 16, '5'),
(521, 17, 144, 17, '4'),
(522, 17, 144, 18, '3'),
(523, 17, 144, 19, '5'),
(524, 17, 144, 20, '1'),
(525, 17, 144, 21, '1'),
(526, 17, 144, 22, '1'),
(527, 17, 144, 23, '1'),
(528, 17, 144, 24, '1'),
(529, 6, 144, 1, '1'),
(530, 6, 144, 2, '1'),
(531, 6, 144, 3, '1'),
(532, 6, 144, 4, '1'),
(533, 6, 144, 5, '1'),
(534, 6, 144, 6, '1'),
(535, 6, 144, 7, '1'),
(536, 6, 144, 8, '1'),
(537, 6, 144, 9, '1'),
(538, 6, 144, 10, '1'),
(539, 6, 144, 11, '1'),
(540, 6, 144, 12, '1'),
(541, 6, 144, 13, '1'),
(542, 6, 144, 14, '1'),
(543, 6, 144, 15, '1'),
(544, 6, 144, 16, '1'),
(545, 6, 144, 17, '1'),
(546, 6, 144, 18, '1'),
(547, 6, 144, 19, '1'),
(548, 6, 144, 20, '1'),
(549, 6, 144, 21, '1'),
(550, 6, 144, 22, '1'),
(551, 6, 144, 23, '1'),
(552, 6, 144, 24, '1');

-- --------------------------------------------------------

--
-- Structure de la table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `classe_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `students`
--

INSERT INTO `students` (`id`, `name`, `classe_id`) VALUES
(100, 'INFO 1-student', 1),
(101, 'INFO 2-student', 2),
(102, 'INFO 3-student', 3),
(103, 'PREP 1-student', 4),
(104, 'PREP 2-student', 5),
(105, 'MIQ1-student', 6),
(106, 'MIQ2-student', 7),
(107, 'MIQ3-student', 8),
(108, 'SAMI1-student', 12),
(109, 'SAMI2-student', 13),
(110, 'SAMI3-student', 14),
(111, 'EET1-student', 9),
(112, 'EET2-student', 10),
(113, 'EET3-student', 11);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `classe_id` int(11) DEFAULT NULL,
  `cin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `roles`, `classe_id`, `cin`) VALUES
(1, 'fehima achour', '$argon2id$v=19$m=65536,t=4,p=1$VFQ2Ui9OaktOSkxFa1lvaA$9r+pYFLceJ9KhohQ+U8jjBbp5PqARi8WtWHaPP1T6gs', '[\"ROLE_ADMIN\"]', NULL, '15223696'),
(2, 'abdelkrim', '$argon2id$v=19$m=65536,t=4,p=1$bXJIUkhScFJmVzhTcDVIag$GuZiE3645Zf44FLzeFpKYLUawDqByi7V1FmKgWPTc/Q', '[\"ROLE_ADMIN\"]', NULL, '45878896'),
(3, 'ikbel', '$argon2id$v=19$m=65536,t=4,p=1$R1cwd2QvMHRpLmRkUzM5ag$G8yPyuAs+VMUnuICbOUTdAAZWHrHxoPvSmR7sScZ/TI', '[\"ROLE_ADMIN\"]', NULL, '45879966'),
(101, 'chef informatique', '$argon2id$v=19$m=65536,t=4,p=1$M1RqcHNScmxDWWtEYlg3WA$AYhOuc6kM6rRZ83mAF0kWmJ03z2FX1tqKJFr6NQgFrw', '[\"ROLE_ADMIN\"]', NULL, '45889666'),
(102, 'chef prep', '$argon2id$v=19$m=65536,t=4,p=1$TXV0MTgxWUIvVHlxTnF4Vw$8iWnbxC9dUvc2JcxigTrrXDimO1owyKfL93vUty3Ffg', '[\"ROLE_ADMIN\"]', NULL, '99658752'),
(103, 'chef electronique', '$argon2id$v=19$m=65536,t=4,p=1$aUZJUk5KMWVSQ0FLL0dCSw$2n8rNtmr0wuwlWMpkyvVDedVsh0X8uPuFpdkvjJNnfE', '[\"ROLE_ADMIN\"]', NULL, '14523666'),
(116, 'lbc1-1', '$argon2id$v=19$m=65536,t=4,p=1$RlRWb2RFVExqbGw1NU1Yeg$/y5Rsinjt6R++Ngm0V3i164WDGCrXKmueilyUlgVM00', '[\"ROLE_USER\"]', 1, '14001500'),
(117, 'lbc1-2', '$argon2id$v=19$m=65536,t=4,p=1$eHU2NnR4ZVZpYTV1R011QQ$ZpDcEpysN6p+KeJQUO6QJ7lk2RpLlNThauNlPFgNNiE', '[\"ROLE_USER\"]', 1, '14001550'),
(135, 'lbc1-3', '$argon2id$v=19$m=65536,t=4,p=1$VGd5RGE3Mzg1WmhlcTFaaQ$ry49mdhFo8U8uHvWLh0kZj5GKOLdONRu4mMyN0DsoBA', '[\"ROLE_USER\"]', 1, '12001220'),
(136, 'lbc1-4', '$argon2id$v=19$m=65536,t=4,p=1$bnY0c3JEUVo5NEc5clp2Zg$G71mCChtbGunlzrO2N8vsLysmmOyNB7nQg3P+ld1fPs', '[\"ROLE_USER\"]', 1, '55889666'),
(137, 'lcs1-1', '$argon2id$v=19$m=65536,t=4,p=1$V1M2Wm5nUFNZVXRwLzhXVg$k4Ei5mkgc5ZXLLE6PTmUVJEkm5At7JTXQ3S5tqlXlI4', '[\"ROLE_USER\"]', 4, '11001100'),
(138, 'lcs1-2', '$argon2id$v=19$m=65536,t=4,p=1$MlNmeUZVcENrb3VuNHN0WQ$mfniPVgaGaG4qgFQen3HI0rUnoXQ5sRcFnSmlF7NmD8', '[\"ROLE_USER\"]', 4, '12331233'),
(139, 'yosri', '$argon2id$v=19$m=65536,t=4,p=1$Q2dYaVk2UE00Qy96dGZuQQ$mYRFuh7RD41Qa56fKbCZJrEdMvShxeniwi1Lmi5r22g', '[\"ROLE_USER\"]', 1, '45886999'),
(140, 'uio', '$argon2id$v=19$m=65536,t=4,p=1$OTllYUV5VkZuRjNFb1c1Sw$qAAG2cQpZjfNA92PQZM34mluU3ChZBfuQLzc1rx0FAM', '[\"ROLE_USER\"]', 1, '78954475'),
(141, 'lce2-1', '$argon2id$v=19$m=65536,t=4,p=1$VXdhekhEbkU3cnM1Zy42SA$sl24P9UoAq4ai/Jjmuzp5W7I9KznKS5NzzHaTswtzQ8', '[\"ROLE_USER\"]', 8, '88889965'),
(142, 'lce2-2', '$argon2id$v=19$m=65536,t=4,p=1$VEY1RVViek9BYWJnamcxVQ$DOMUrAGsTICi02YYIFMaXYVF0aOAg8bmvzdFLX9smb4', '[\"ROLE_USER\"]', 8, '58745896'),
(143, 'yosri2023', '$argon2id$v=19$m=65536,t=4,p=1$SllQN1VnVVFud3cvcy5aTg$H73sd0KN9cer3jy9LHCM2FxF/98iBaTu0FirB90hYm4', '[\"ROLE_USER\"]', 2, '14552236'),
(144, 'yosri20233', '$argon2id$v=19$m=65536,t=4,p=1$OS50eDl1aEFjT0FEZjkzYQ$4BmkOxpyBJeOvbOCEaJ/qL/CxmDBrx4wL0oHnWYP/8k', '[\"ROLE_USER\"]', 2, '25002569');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8F87BF96AE80F5DF` (`department_id`);

--
-- Index pour la table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `enseignant_matiere`
--
ALTER TABLE `enseignant_matiere`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_33D1A024A76ED395` (`user_id`),
  ADD KEY `IDX_33D1A024F46CD258` (`matiere_id`);

--
-- Index pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9014574A8F5EA509` (`classe_id`),
  ADD KEY `IDX_9014574AA76ED395` (`user_id`),
  ADD KEY `IDX_9014574A5577AFDB` (`semestre_id`);

--
-- Index pour la table `periodes`
--
ALTER TABLE `periodes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `questionnaire`
--
ALTER TABLE `questionnaire`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `studentqcm`
--
ALTER TABLE `studentqcm`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7A7474DEF46CD258` (`matiere_id`),
  ADD KEY `IDX_7A7474DEA76ED395` (`user_id`),
  ADD KEY `IDX_7A7474DE1E27F6BF` (`question_id`);

--
-- Index pour la table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_A4698DB28F5EA509` (`classe_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649ABE530DA` (`cin`),
  ADD KEY `IDX_8D93D6498F5EA509` (`classe_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `classe`
--
ALTER TABLE `classe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT pour la table `enseignant_matiere`
--
ALTER TABLE `enseignant_matiere`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `matiere`
--
ALTER TABLE `matiere`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT pour la table `periodes`
--
ALTER TABLE `periodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `questionnaire`
--
ALTER TABLE `questionnaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `studentqcm`
--
ALTER TABLE `studentqcm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=553;

--
-- AUTO_INCREMENT pour la table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99414;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `classe`
--
ALTER TABLE `classe`
  ADD CONSTRAINT `FK_8F87BF96AE80F5DF` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`);

--
-- Contraintes pour la table `enseignant_matiere`
--
ALTER TABLE `enseignant_matiere`
  ADD CONSTRAINT `FK_33D1A024A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_33D1A024F46CD258` FOREIGN KEY (`matiere_id`) REFERENCES `matiere` (`id`);

--
-- Contraintes pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD CONSTRAINT `FK_9014574A5577AFDB` FOREIGN KEY (`semestre_id`) REFERENCES `periodes` (`id`),
  ADD CONSTRAINT `FK_9014574A8F5EA509` FOREIGN KEY (`classe_id`) REFERENCES `classe` (`id`),
  ADD CONSTRAINT `FK_9014574AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `studentqcm`
--
ALTER TABLE `studentqcm`
  ADD CONSTRAINT `FK_7A7474DE1E27F6BF` FOREIGN KEY (`question_id`) REFERENCES `questionnaire` (`id`),
  ADD CONSTRAINT `FK_7A7474DEA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_7A7474DEF46CD258` FOREIGN KEY (`matiere_id`) REFERENCES `matiere` (`id`);

--
-- Contraintes pour la table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `FK_A4698DB28F5EA509` FOREIGN KEY (`classe_id`) REFERENCES `classe` (`id`);

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_8D93D6498F5EA509` FOREIGN KEY (`classe_id`) REFERENCES `classe` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

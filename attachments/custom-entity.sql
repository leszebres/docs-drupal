-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Hôte : database
-- Généré le :  ven. 22 mars 2019 à 15:47
-- Version du serveur :  10.1.38-MariaDB
-- Version de PHP :  7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `drupal8`
--

-- --------------------------------------------------------

--
-- Structure de la table `custom_entity`
--

CREATE TABLE `custom_entity` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` varchar(128) CHARACTER SET ascii NOT NULL,
  `langcode` varchar(12) CHARACTER SET ascii NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The base table for custom_entity entities.';

-- --------------------------------------------------------

--
-- Structure de la table `custom_entity_field_data`
--

CREATE TABLE `custom_entity_field_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `langcode` varchar(12) CHARACTER SET ascii NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL COMMENT 'The ID of the target entity.',
  `name` varchar(50) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `created` int(11) DEFAULT NULL,
  `changed` int(11) DEFAULT NULL,
  `default_langcode` tinyint(4) NOT NULL,
  `content_translation_source` varchar(12) CHARACTER SET ascii DEFAULT NULL,
  `content_translation_outdated` tinyint(4) DEFAULT NULL,
  `content_translation_uid` int(10) UNSIGNED DEFAULT NULL COMMENT 'The ID of the target entity.',
  `content_translation_status` tinyint(4) DEFAULT NULL,
  `content_translation_created` int(11) DEFAULT NULL,
  `content_translation_changed` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The data table for custom_entity entities.';

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `custom_entity`
--
ALTER TABLE `custom_entity`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `custom_entity_field_data`
--
ALTER TABLE `custom_entity_field_data`
  ADD PRIMARY KEY (`id`,`langcode`),
  ADD KEY `custom_entity_field__user_id__target_id` (`user_id`),
  ADD KEY `custom_entity__id__default_langcode__langcode` (`id`,`default_langcode`,`langcode`) USING BTREE;

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `custom_entity`
--
ALTER TABLE `custom_entity`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2900;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

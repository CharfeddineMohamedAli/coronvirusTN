-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Sam 21 Mars 2020 à 22:07
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `stage`
--

-- --------------------------------------------------------

--
-- Structure de la table `current`
--

CREATE TABLE `current` (
  `id` int(11) NOT NULL,
  `source` text,
  `link` text,
  `domId` text,
  `confirmed` int(11) DEFAULT NULL,
  `death` int(11) DEFAULT NULL,
  `cured` int(11) DEFAULT NULL,
  `serious` int(11) DEFAULT NULL,
  `negative` int(11) DEFAULT NULL,
  `suspected` int(11) DEFAULT NULL,
  `tunisia` int(11) DEFAULT NULL,
  `area` text,
  `ts` bigint(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `current_shadow`
--

CREATE TABLE `current_shadow` (
  `id` int(11) NOT NULL,
  `source` text,
  `link` text,
  `domId` text,
  `confirmed` int(11) DEFAULT NULL,
  `death` int(11) DEFAULT NULL,
  `cured` int(11) DEFAULT NULL,
  `serious` int(11) DEFAULT NULL,
  `negative` int(11) DEFAULT NULL,
  `suspected` int(11) DEFAULT NULL,
  `tunisia` int(11) DEFAULT NULL,
  `area` text,
  `ts` bigint(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `err`
--

CREATE TABLE `err` (
  `id` int(11) NOT NULL,
  `source` text NOT NULL,
  `reason` text NOT NULL,
  `detail` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `geo`
--

CREATE TABLE `geo` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `lo` varchar(128) NOT NULL,
  `la` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `history`
--

CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `date` bigint(128) NOT NULL,
  `confirmed` int(11) NOT NULL,
  `death` int(11) NOT NULL,
  `cured` int(11) NOT NULL,
  `serious` int(11) NOT NULL,
  `negative` int(11) NOT NULL,
  `suspected` int(11) NOT NULL,
  `tunisia` int(11) DEFAULT NULL,
  `area` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `psw` varchar(512) DEFAULT NULL,
  `token` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `current`
--
ALTER TABLE `current`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `current_shadow`
--
ALTER TABLE `current_shadow`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `err`
--
ALTER TABLE `err`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `geo`
--
ALTER TABLE `geo`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `current`
--
ALTER TABLE `current`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `current_shadow`
--
ALTER TABLE `current_shadow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `err`
--
ALTER TABLE `err`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `geo`
--
ALTER TABLE `geo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

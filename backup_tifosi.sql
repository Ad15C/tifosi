-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 22 jan. 2025 à 19:35
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `tifosi_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `boisson`
--

DROP TABLE IF EXISTS `boisson`;
CREATE TABLE `boisson` (
  `id_boisson` int(11) NOT NULL,
  `nom_boisson` varchar(45) NOT NULL,
  `id_marque` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `boisson`
--

INSERT INTO `boisson` (`id_boisson`, `nom_boisson`, `id_marque`) VALUES
(1, 'Coca cola zero', 1),
(2, 'Coca cola original', 1),
(3, 'Fanta citron', 1),
(4, 'Fanta orange', 1),
(5, 'Capri sun', 1),
(6, 'Pepsi', 4),
(7, 'Pepsi max zero', 4),
(8, 'Lipton max zero', 4),
(9, 'Lipton peach', 4),
(10, 'Monster energy ultra gold', 3),
(11, 'Monster energy ultra blue', 3),
(12, 'Eau de source', 2);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `nom_client` varchar(45) NOT NULL,
  `age` int(11) NOT NULL,
  `cp_client` int(11) NOT NULL,
  `jour` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `client_achete`
--

DROP TABLE IF EXISTS `client_achete`;
CREATE TABLE `client_achete` (
  `id_achat` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_focaccia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `client_paie`
--

DROP TABLE IF EXISTS `client_paie`;
CREATE TABLE `client_paie` (
  `id_paiement` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `jour` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `focaccia`
--

DROP TABLE IF EXISTS `focaccia`;
CREATE TABLE `focaccia` (
  `id_focaccia` int(11) NOT NULL,
  `nom_focaccia` varchar(45) NOT NULL,
  `prix_focaccia` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `focaccia`
--

INSERT INTO `focaccia` (`id_focaccia`, `nom_focaccia`, `prix_focaccia`) VALUES
(1, 'Mozaccia', 9.8),
(2, 'Gorgonzollaccia', 10.8),
(3, 'Raclaccia', 8.9),
(4, 'Emmentalaccia', 9.8),
(5, 'Tradizione', 8.9),
(6, 'Hawaienne', 11.2),
(7, 'Americaine', 10.8),
(8, 'Paysanne', 12.8);

-- --------------------------------------------------------

--
-- Structure de la table `focaccia_comprend`
--

DROP TABLE IF EXISTS `focaccia_comprend`;
CREATE TABLE `focaccia_comprend` (
  `id_focaccia` int(11) NOT NULL,
  `id_ingredient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
CREATE TABLE `ingredient` (
  `id_ingredient` int(11) NOT NULL,
  `nom_ingredient` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `ingredient`
--

INSERT INTO `ingredient` (`id_ingredient`, `nom_ingredient`) VALUES
(1, 'Ail'),
(2, 'Ananas'),
(3, 'Artichaut'),
(4, 'Bacon'),
(5, 'Base tomate'),
(6, 'Base creme'),
(7, 'Champignon'),
(8, 'Chevre'),
(9, 'Cresson'),
(10, 'Emmental'),
(11, 'Gorgonzola'),
(12, 'Jambon cuit'),
(13, 'Jambon fume'),
(14, 'Oeuf'),
(15, 'Oignon'),
(16, 'Olive noire'),
(17, 'Olive verte'),
(18, 'Parmesan'),
(19, 'Piment'),
(20, 'Poivre'),
(21, 'Pomme de terre'),
(22, 'Raclette'),
(23, 'Salami'),
(24, 'Tomate cerise');

-- --------------------------------------------------------

--
-- Structure de la table `marque`
--

DROP TABLE IF EXISTS `marque`;
CREATE TABLE `marque` (
  `id_marque` int(11) NOT NULL,
  `nom_marque` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `marque`
--

INSERT INTO `marque` (`id_marque`, `nom_marque`) VALUES
(1, 'Coca Cola'),
(2, 'Cristalline'),
(3, 'Monster'),
(4, 'Pepsico');

-- --------------------------------------------------------

--
-- Structure de la table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `nom_menu` varchar(45) NOT NULL,
  `prix_menu` float NOT NULL,
  `id_boisson` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `menu_comprend`
--

DROP TABLE IF EXISTS `menu_comprend`;
CREATE TABLE `menu_comprend` (
  `id_menu` int(11) NOT NULL,
  `id_focaccia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `boisson`
--
ALTER TABLE `boisson`
  ADD PRIMARY KEY (`id_boisson`),
  ADD KEY `marque_id` (`id_marque`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Index pour la table `client_achete`
--
ALTER TABLE `client_achete`
  ADD PRIMARY KEY (`id_achat`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `focaccia_id` (`id_focaccia`);

--
-- Index pour la table `client_paie`
--
ALTER TABLE `client_paie`
  ADD PRIMARY KEY (`id_paiement`),
  ADD KEY `menu` (`id_menu`),
  ADD KEY `client` (`id_client`);

--
-- Index pour la table `focaccia`
--
ALTER TABLE `focaccia`
  ADD PRIMARY KEY (`id_focaccia`);

--
-- Index pour la table `focaccia_comprend`
--
ALTER TABLE `focaccia_comprend`
  ADD KEY `id_focaccia` (`id_focaccia`),
  ADD KEY `id_ingredient` (`id_ingredient`);

--
-- Index pour la table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id_ingredient`);

--
-- Index pour la table `marque`
--
ALTER TABLE `marque`
  ADD PRIMARY KEY (`id_marque`);

--
-- Index pour la table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`),
  ADD KEY `boisson` (`id_boisson`);

--
-- Index pour la table `menu_comprend`
--
ALTER TABLE `menu_comprend`
  ADD KEY `focaccia` (`id_focaccia`),
  ADD KEY `menu_id` (`id_menu`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `client_achete`
--
ALTER TABLE `client_achete`
  MODIFY `id_achat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `client_paie`
--
ALTER TABLE `client_paie`
  MODIFY `id_paiement` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `focaccia`
--
ALTER TABLE `focaccia`
  MODIFY `id_focaccia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `id_ingredient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `marque`
--
ALTER TABLE `marque`
  MODIFY `id_marque` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `boisson`
--
ALTER TABLE `boisson`
  ADD CONSTRAINT `marque_id` FOREIGN KEY (`id_marque`) REFERENCES `marque` (`id_marque`);

--
-- Contraintes pour la table `client_achete`
--
ALTER TABLE `client_achete`
  ADD CONSTRAINT `focaccia_id` FOREIGN KEY (`id_focaccia`) REFERENCES `focaccia` (`id_focaccia`),
  ADD CONSTRAINT `id_client` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);

--
-- Contraintes pour la table `client_paie`
--
ALTER TABLE `client_paie`
  ADD CONSTRAINT `client` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`),
  ADD CONSTRAINT `menu` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`);

--
-- Contraintes pour la table `focaccia_comprend`
--
ALTER TABLE `focaccia_comprend`
  ADD CONSTRAINT `id_focaccia` FOREIGN KEY (`id_focaccia`) REFERENCES `focaccia` (`id_focaccia`),
  ADD CONSTRAINT `id_ingredient` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`);

--
-- Contraintes pour la table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `boisson` FOREIGN KEY (`id_boisson`) REFERENCES `boisson` (`id_boisson`);

--
-- Contraintes pour la table `menu_comprend`
--
ALTER TABLE `menu_comprend`
  ADD CONSTRAINT `focaccia` FOREIGN KEY (`id_focaccia`) REFERENCES `focaccia` (`id_focaccia`),
  ADD CONSTRAINT `menu_id` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

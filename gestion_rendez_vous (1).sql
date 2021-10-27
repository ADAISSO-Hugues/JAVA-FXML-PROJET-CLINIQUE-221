-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 27 oct. 2021 à 22:25
-- Version du serveur : 10.4.21-MariaDB
-- Version de PHP : 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion_rendez_vous`
--

-- --------------------------------------------------------

--
-- Structure de la table `antecedent`
--

CREATE TABLE `antecedent` (
  `id` int(11) NOT NULL,
  `libelleA` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `antecedent`
--

INSERT INTO `antecedent` (`id`, `libelleA`) VALUES
(1, 'Hypertension'),
(2, 'Hepatite'),
(3, 'Diabète'),
(4, 'paludisme');

-- --------------------------------------------------------

--
-- Structure de la table `con&cons`
--

CREATE TABLE `con&cons` (
  `id_consultation` int(11) NOT NULL,
  `id_constante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `constante`
--

CREATE TABLE `constante` (
  `id` int(11) NOT NULL,
  `libellec` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `constante`
--

INSERT INTO `constante` (`id`, `libellec`) VALUES
(1, 'température '),
(2, 'tension');

-- --------------------------------------------------------

--
-- Structure de la table `historique`
--

CREATE TABLE `historique` (
  `id_patient` int(11) NOT NULL,
  `id_antecedent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `medicament`
--

CREATE TABLE `medicament` (
  `id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `ordonnance`
--

CREATE TABLE `ordonnance` (
  `id` int(11) NOT NULL,
  `posologie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `ordonnance`
--

INSERT INTO `ordonnance` (`id`, `posologie`) VALUES
(1, 2),
(2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `prescription`
--

CREATE TABLE `prescription` (
  `id_medicament` int(11) NOT NULL,
  `id_ordonnance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `rdv`
--

CREATE TABLE `rdv` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `id_patient` int(11) NOT NULL,
  `id_medecin` int(11) DEFAULT NULL,
  `libellep` varchar(255) DEFAULT NULL,
  `id_ordonnance` int(11) DEFAULT NULL,
  `id_consultation` int(11) DEFAULT NULL,
  `unarchived` tinyint(4) NOT NULL,
  `id_responsable` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `rdv`
--

INSERT INTO `rdv` (`id`, `type`, `date`, `id_patient`, `id_medecin`, `libellep`, `id_ordonnance`, `id_consultation`, `unarchived`, `id_responsable`) VALUES
(1, 'TYPE_CONSULTATION', '2021-10-25', 6, 2, NULL, 1, NULL, 1, 4),
(2, 'TYPE_PRESTATION', '2021-10-05', 6, 0, 'NFS', 1, 1, 1, 4);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nom_complet` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `statut` varchar(255) DEFAULT NULL,
  `disponible` tinyint(1) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `id_antecedent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `nom_complet`, `login`, `password`, `role`, `statut`, `disponible`, `code`, `id_antecedent`) VALUES
(1, 'Hugues ADAISSO', 'login', '1234', 'ROLE_SECRETAIRE', NULL, NULL, '0', NULL),
(2, 'divine', 'divine', 'olafa', 'ROLE_MEDECIN', 'GENERALISTE', 1, 'AZE3456Y', NULL),
(3, 'ivan', 'maximilien', 'ivan', 'ROLE_PATIENT', NULL, NULL, '0', NULL),
(4, 'Jean', 'paul', 'jean', 'ROLE_RESPONSABLE', NULL, NULL, NULL, NULL),
(5, 'bezzber', 'reberzb', 'rezbrebezr', 'ROLE_PATIENT', NULL, NULL, 'zerrbrezrb', 1),
(6, 'Cindy ADOU', 'cindy', 'adou', 'ROLE_PATIENT', NULL, NULL, 'AZEAE2332', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `antecedent`
--
ALTER TABLE `antecedent`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `constante`
--
ALTER TABLE `constante`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `medicament`
--
ALTER TABLE `medicament`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ordonnance`
--
ALTER TABLE `ordonnance`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `rdv`
--
ALTER TABLE `rdv`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `antecedent`
--
ALTER TABLE `antecedent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `constante`
--
ALTER TABLE `constante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `medicament`
--
ALTER TABLE `medicament`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ordonnance`
--
ALTER TABLE `ordonnance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `rdv`
--
ALTER TABLE `rdv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.7.6
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  Dim 16 août 2020 à 11:56
-- Version du serveur :  8.0.20
-- Version de PHP :  7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `xkeyscore`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `name`, `tag`, `content`, `link`, `created_at`) VALUES
(5, 'creer un projet symfony 5 full', 'symfony 5', 'symfony new NameOfProject --full', NULL, '2020-08-16 07:57:36'),
(6, 'ajouter un projet local sur git', 'symfony, git, initialisation', '- Creer le repository sur github et copier l\'adresse <br>\r\n\r\n- git init<br>\r\n\r\n- git add .<br>\r\n\r\n- git commit -m \"add all\"<br>\r\n\r\n- git remote add origin ---url du repository---<br>\r\n\r\n- git push origin master -f<br>', NULL, '2020-08-16 08:36:59'),
(7, 'creer un user', 'commande, user, utilisateur', 'symfony console make:user', NULL, '2020-08-16 08:42:39'),
(8, 'creer une authentification, formulaire de connexion', 'commande, login, connexion', 'symfony console make:auth', NULL, '2020-08-16 08:44:21'),
(9, 'creer un controller', 'commande, controller, creation', 'symfony console make:controller', NULL, '2020-08-16 08:45:01'),
(10, 'creer une entite', 'commande, entity, creation', 'symfony console make:entity', NULL, '2020-08-16 08:45:36'),
(11, 'creer un formulaire', 'commande, formulaire', 'symfony console make:form', NULL, '2020-08-16 08:46:21'),
(12, 'voir toutes les routes du projet', 'commande, routes', 'symfony console debug:router', NULL, '2020-08-16 09:07:32'),
(13, 'voir toutes les commandes de la console symfony', 'commandes, terminal, CLI', 'symfony console', NULL, '2020-08-16 09:12:17'),
(14, 'ajouter bootstrap 4 au projet', 'bootstrap, cdn', '<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\">\r\n<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js\"></script>\r\n<script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js\"/script>\r\n<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js\"></script>\r\n   ', 'https://www.w3schools.com/bootstrap4/tryit.asp?filename=trybs_default&stacked=h', '2020-08-16 09:19:57'),
(15, 'ajouter formulaire bootstrap 4', 'bootstrap, formulaire', 'Dans config/twig.yml ajouter cette ligne<br>\r\n\r\n\r\n    form_themes: [\'bootstrap_4_layout.html.twig\']<br>', 'https://symfony.com/doc/current/form/bootstrap4.html', '2020-08-16 09:43:37'),
(16, 'afficher du contenu securise (embed...)', 'securise', '{% autoescape %}\r\n    {{ article.0.content | raw }}\r\n    {% endautoescape %}', NULL, '2020-08-16 09:50:49');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20200815191042', '2020-08-15 19:10:50', 71),
('DoctrineMigrations\\Version20200815210856', '2020-08-15 21:09:06', 100);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `roles`, `password`) VALUES
(1, 'daniel', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$uLvbmZo8SJ9uRLeFK+JXxg$ARLMZ7C+h9pteequX1VnsDPX8Yi8WLtA7BVBpU/MLZk');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

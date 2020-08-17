-- phpMyAdmin SQL Dump
-- version 4.7.6
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  lun. 17 août 2020 à 13:59
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
(16, 'afficher du contenu securise (embed...)', 'securise', '{% autoescape %}\r\n    {{ article.0.content | raw }}\r\n    {% endautoescape %}', NULL, '2020-08-16 09:50:49'),
(17, 'cloner un depot git', 'cloner, git', 'git clone https://github.com/grondindaniel/todolist.git<br>\r\ncd todolist<br>\r\ncomposer install<br>\r\nin .env file configure your own database db_name, db_user and db_password with yours credentials : <br>\r\n\r\nDATABASE_URL=mysql://db_user:db_password@127.0.0.1:3306/db_name?serverVersion=5.7<br>\r\n\r\nphp bin/console doctrine:database:create<br>\r\n\r\nphp bin/console doctrine:schema:create<br>\r\n\r\nsymfony server:start -d<br>', NULL, '2020-08-16 14:58:42'),
(18, 'changer de version php sur macos server', 'php version, mac', 'brew unlink php@7.2 && brew link --force --overwrite php@7.4<br>\r\n\r\nAttention à modifier les versions souhaitées et rien d\'autre. Il ne faut pas faire des copier coller après comme il est suggérer par le terminal', NULL, '2020-08-16 15:05:40'),
(19, 'probleme de memoire en installation un package composer', 'composer, memoire, probleme', 'php -d memory_limit=-1 /usr/local/bin/composer .....................;', NULL, '2020-08-16 15:06:50'),
(20, 'controller partie 1', 'controller, description', 'namespace App\\Controller; <br>\r\n\r\nuse App\\Repository\\ArticleRepository;<br>\r\nuse Symfony\\Bundle\\FrameworkBundle\\Controller\\AbstractController;<br>\r\nuse Symfony\\Component\\Routing\\Annotation\\Route;<br>\r\n\r\nclass HomeController extends AbstractController<br>\r\n{\r\n    /**<br>\r\n     * @Route(\"/home\", name=\"home\")<br>\r\n     */<br>\r\n    public function index(ArticleRepository $articleRepository)<br>\r\n    {<br>\r\n        $articles = $articleRepository->findAll();<br>\r\n        return $this->render(\'home/index.html.twig\', [\'articles\'=>$articles]);<br>\r\n    }<br>\r\n}<br>\r\n\r\nPour comprendre : <br>\r\nD\'abord la class doit heriter de AbstractController.<br>\r\nOn travaille avec les annotations. Pour cela il faut imperativement deux etoiles en haut de la methode.<br>\r\nPuis il faut @Route avec des parenthèses, des DOUBLE quotes et un nom qui servira surtout pour les redirections ou pour les liens.<br>\r\nOu peut affirmer que le premier parametre de la route est le controller et qui va executer une methode.<br>\r\nIci on a fait de l\'injection de dependance avec ArticleRepository pour pouvoir recuperer les articles de la bdd.<br>\r\nOn a appele la methode findAll qui est deja predefinie dans le repository.<br>\r\nOn retourne la variable avec Twig avec la methode render en indiquant le path de la vue et on envoie un array avec la variable.', NULL, '2020-08-16 15:23:06'),
(22, 'controller partie 2 : avec formulaire', 'controller, formulaire', 'namespace App\\Controller;<br><br>\r\n\r\nuse App\\Form\\ArticleType;<br>\r\nuse Doctrine\\ORM\\EntityManagerInterface;<br>\r\nuse Symfony\\Bundle\\FrameworkBundle\\Controller\\AbstractController;<br>\r\nuse Symfony\\Component\\HttpFoundation\\Request;<br>\r\nuse Symfony\\Component\\Routing\\Annotation\\Route;<br><br>\r\n\r\nclass ArticleController extends AbstractController<br>\r\n{<br>\r\n    /**<br>\r\n     * @Route(\"/article\", name=\"article\")<br>\r\n     */<br>\r\n    public function index(Request $request, EntityManagerInterface $manager)<br>\r\n    {<br>\r\n        $form = $this->createForm(ArticleType::class);<br>\r\n        $form->handleRequest($request);<br>\r\n        if ($form->isSubmitted() && $form->isValid())<br>\r\n        {<br>\r\n            $article = $form->getData();<br>\r\n            try {<br>\r\n                $manager->persist($article);<br>\r\n                $manager->flush();<br>\r\n                $this->addFlash(\'good\',\'article saved\');<br>\r\n                return $this->redirectToRoute(\'article\');<br>\r\n            }catch (\\Exception $e)<br>\r\n            {<br>\r\n                $this->addFlash(\'warning\', \'nope, a problem occured...sorry\');<br>\r\n                return $this->redirectToRoute(\'article\');<br>\r\n            }<br>\r\n        }<br>\r\n        return $this->render(\'article/index.html.twig\', [\'form\'=>$form->createView()]);<br>\r\n    }<br>\r\n\r\n}<br><br>\r\n\r\nPour la description de base, conf partie 1.<br>\r\nIci injection de dependance avec autowiring de Request et EntityManagerInterface.<br>\r\nOn cree le formulaire avec la methode createForm et on passe la formulaire adequate ArticleType dans notre cas avec ArticleType::class.<br>\r\nEnsuite on gere la requete envoyee avec la methode handleRequest.<br>\r\nSi le formulaire est envoye est valide on cree une variable qui va recuperer les donnees.<br>\r\nLe manager cree via EntityManagerInterface va persister la variable puis on flush (tirer la chasse d\'eau).<br>\r\nOn ajoute un addFlash pour indiquer que c\'est ok. (Il faut penser à ajouter le code dans la vue bien evidemment).<br>\r\nSi rien n\'est passe on envoie à la vue le formulaire et il faut bien penser à ajouter la methode CreateView.', NULL, '2020-08-16 15:39:01'),
(23, 'creer un formulaire la logique partie 1', 'formulaire, explication, fonctionnement', 'Suite à la commande de creation nous obtenons ceci :<br>\r\n\r\n//Form/ArticleType.php<br>\r\n\r\nnamespace App\\Form;<br>\r\n\r\nuse App\\Entity\\Article;<br>\r\nuse Symfony\\Component\\Form\\AbstractType;<br>\r\nuse Symfony\\Component\\Form\\FormBuilderInterface;<br>\r\nuse Symfony\\Component\\OptionsResolver\\OptionsResolver;<br>\r\n\r\nclass ArticleType extends AbstractType<br>\r\n{<br>\r\n    public function buildForm(FormBuilderInterface $builder, array $options)<br>\r\n    {<br>\r\n        $builder<br>\r\n            ->add(\'name\')<br>\r\n            ->add(\'tag\')<br>\r\n            ->add(\'content\')<br>\r\n            ->add(\'link\')<br>\r\n        ;<br>\r\n    }<br>\r\n\r\n    public function configureOptions(OptionsResolver $resolver)<br>\r\n    {<br>\r\n        $resolver->setDefaults([<br>\r\n            \'data_class\' => Article::class,<br>\r\n        ]);<br>\r\n    }<br>\r\n}<br><br>\r\n\r\nQue faut-il comprendre ? Quand on cree le formulaire via la commande on nous demande à quelle entite doit-il etre relie. Ainsi Symfony va automatiquement importer les champs dans le fomulaire. Cool !<br>\r\nIci nous avons un formulaire ultra basic.<br>\r\nIl est vivement mais vivement conseillé d\'indiquer de quel type de champs il s\'agit en ajoutant des méthodes du type TextType::class, TextareaType::class, ChoiceType::class, FileType::class, CollectionType::class etc...<br>\r\nC\'est aussi ici que l\'on peut ajouter des labels en ajoutant un array : <br>\r\narray(\'label\'=>\'Titre\')<br>\r\nex: <br>\r\n->add(\'name\',TextType::class, array(\'label\'=>\'Titre\'))<br>\r\nMaintenant on doit l\'intégrer dans le controller puis dans la vue nous devons avoir qqch comme cela : <br>\r\n    {{ form_start(form) }}<br>\r\n        {{ form_label(form.name) }}<br>\r\n        {{ form_widget(form.name) }}<br>\r\n\r\n        {{ form_label(form.tag) }}<br>\r\n        {{ form_widget(form.tag) }}<br>\r\n        {{ form_label(form.content) }}<br>\r\n        {{ form_widget(form.content) }}<br>\r\n        {{ form_label(form.link) }}<br>\r\n        {{ form_widget(form.link) }}<br>\r\n        <br>\r\n        <button type=\"submit\" class=\"btn btn-primary\">Ajouter</button><br>\r\n    {{ form_end(form) }}', NULL, '2020-08-17 11:57:34');

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

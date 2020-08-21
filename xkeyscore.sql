-- phpMyAdmin SQL Dump
-- version 4.7.6
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  ven. 21 août 2020 à 18:38
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
(23, 'creer un formulaire la logique partie 1', 'formulaire, explication, fonctionnement', 'Suite à la commande de creation nous obtenons ceci :<br>\r\n\r\n//Form/ArticleType.php<br>\r\n\r\nnamespace App\\Form;<br>\r\n\r\nuse App\\Entity\\Article;<br>\r\nuse Symfony\\Component\\Form\\AbstractType;<br>\r\nuse Symfony\\Component\\Form\\FormBuilderInterface;<br>\r\nuse Symfony\\Component\\OptionsResolver\\OptionsResolver;<br>\r\n\r\nclass ArticleType extends AbstractType<br>\r\n{<br>\r\n    public function buildForm(FormBuilderInterface $builder, array $options)<br>\r\n    {<br>\r\n        $builder<br>\r\n            ->add(\'name\')<br>\r\n            ->add(\'tag\')<br>\r\n            ->add(\'content\')<br>\r\n            ->add(\'link\')<br>\r\n        ;<br>\r\n    }<br>\r\n\r\n    public function configureOptions(OptionsResolver $resolver)<br>\r\n    {<br>\r\n        $resolver->setDefaults([<br>\r\n            \'data_class\' => Article::class,<br>\r\n        ]);<br>\r\n    }<br>\r\n}<br><br>\r\n\r\nQue faut-il comprendre ? Quand on cree le formulaire via la commande on nous demande à quelle entite doit-il etre relie. Ainsi Symfony va automatiquement importer les champs dans le fomulaire. Cool !<br>\r\nIci nous avons un formulaire ultra basic.<br>\r\nIl est vivement mais vivement conseillé d\'indiquer de quel type de champs il s\'agit en ajoutant des méthodes du type TextType::class, TextareaType::class, ChoiceType::class, FileType::class, CollectionType::class etc...<br>\r\nC\'est aussi ici que l\'on peut ajouter des labels en ajoutant un array : <br>\r\narray(\'label\'=>\'Titre\')<br>\r\nex: <br>\r\n->add(\'name\',TextType::class, array(\'label\'=>\'Titre\'))<br>\r\nMaintenant on doit l\'intégrer dans le controller puis dans la vue nous devons avoir qqch comme cela : <br>\r\n    {{ form_start(form) }}<br>\r\n        {{ form_label(form.name) }}<br>\r\n        {{ form_widget(form.name) }}<br>\r\n\r\n        {{ form_label(form.tag) }}<br>\r\n        {{ form_widget(form.tag) }}<br>\r\n        {{ form_label(form.content) }}<br>\r\n        {{ form_widget(form.content) }}<br>\r\n        {{ form_label(form.link) }}<br>\r\n        {{ form_widget(form.link) }}<br>\r\n        <br>\r\n        <button type=\"submit\" class=\"btn btn-primary\">Ajouter</button><br>\r\n    {{ form_end(form) }}', NULL, '2020-08-17 11:57:34'),
(24, 'creer un formulaire la logique partie 2', 'champs imbriqué,formulaire, explication, fonctionnement', 'Quid du mindset : <br>\r\nL\'idee est la suivante par rapport au formulaire vu en partie 1.<br>\r\nIl faut mapper les entites l\'une avec l\'autre, nous aurons tres souvent une relation OneToMany.<br>\r\nComment faire ?<br>\r\nQuand les deux entites sont construites on va relancer la commande symfony console make:form<br>\r\nOn va indiquer un nom de formulaire existant deja et en rapport aux entites voulues bien evidemment.<br>\r\nJe conseille de choisir l\'entite de type one.<br>\r\nSymfony va voir que le formulaire existe deja et va nous proposer d\'ajouter un nouveau champs. <br>\r\nOn donne un nom, puis par defaut il nous demande si c\'est du text, on va indiquer <strong>Relation</strong>, il va nous demander quel type, il faut alors choisir le type qui convient souvent du OneToMany puis à quelle entite on doit le relier.<br>\r\nSymfony va alors creer les champs dans les entites ( du genre @ORM\\OneToMany(targetEntity=Image::class, mappedBy=\"trick\", cascade={\"persist\", \"remove\"})).<br>\r\nDans le formulaire ou l\'on souhaite ajouter la propriété many on va donc ajouter ceci par exemple (pris dans le projet snowtricks) :<br>\r\n->add(\'images\',FileType::class, array(<br>\r\n                \'mapped\'=>false,<br>\r\n                \'required\' => false,<br>\r\n                \'attr\' => array(\'multiple\'=>true),<br>\r\n                \'multiple\'=>true,<br>\r\n                \'data_class\'=>null))<br>\r\nIl faut evidemment ajouter ce champs dans la vue du formulaire.', NULL, '2020-08-17 12:48:45'),
(25, 'lancer le server', 'cli, server, symfony', 'dans le terminal se placer dans le dossier du projet puis <br>\r\nsymfony server:start -d<br>\r\ncopier l\'url générée et coller dans un navigateur', NULL, '2020-08-20 11:49:17'),
(26, 'ajouter des images', 'symfony, images, explications', 'D\'abord il faut gérer les entités : <br>\r\nNous partons ici du principe que l\'on peut uploader plusieurs images en même temps.<br>\r\nNous avons une entité one et une entité image (id, name\r\nDans l\'entité one, nous ajoutons alors la propriété (en utilisant la console pour mettre à jour l\'entité) : images. Dans l\'annotation bien penser à ajouter : <br>\r\ncascade={\"persist\", \"remove\"}<br>\r\non fait ensuite :<br>\r\nsymfony console make:migration<br>\r\nphp bin/console doctrine:migrations:migrate<br>\r\nles champs sont rajoutes.<br>\r\ndans le formulaire d\'ajout du one,  on rajoute ceci : <br>\r\n->add(\'images\',FileType::class, array(<br>\r\n                \'mapped\'=>false,<br>\r\n                \'required\' => false,<br>\r\n                \'attr\' => array(\'multiple\'=>true),<br>\r\n                \'multiple\'=>true,<br>\r\n                \'data_class\'=>null))<br>\r\nil faut bien comprendre qu\'ici la propriété images qui est après add correspond à la propriété créée dans l\'entity one.<br>\r\nBien évidemment on ajoute à la vue le champs nécessaire.<br>\r\n<br>\r\n...............c\'est pas fini.................\r\ndans le controller on ajoute à present ceci :<br>\r\n<br><br>\r\n/**<br>\r\n     * @Route(\"/trick\", name=\"add/trick\")<br>\r\n     */<br>\r\n    public function index(TrickType $trickType, Request $request, EntityManagerInterface $manager)<br>\r\n    {<br>\r\n\r\n        $form = $this->createForm(TrickType::class);<br>\r\n        $form->handleRequest($request);<br>\r\n\r\n        if($form->isSubmitted() && $form->isValid())<br>\r\n        {<br>\r\n            $images = $form->get(\'images\')->getData();<br>\r\n            $trick = $form->getData();<br>\r\n            foreach($images as $image)<br>\r\n            {<br>\r\n                $fichier = md5(uniqid()).\'.\'.$image->guessExtension();<br>\r\n                $image->move($this->getParameter(\'images_directory\'), $fichier<br>\r\n                );<br>\r\n                $img = new Image();<br>\r\n                $img->setName($fichier);<br>\r\n                $trick->addImage($img);<br>\r\n            }<br>\r\n            $user = $this->getUser();<br>\r\n            $creator = $user->getUsername();<br>\r\n            $trick->setCreator($creator);<br>\r\n            try{<br>\r\n                $manager -> persist ( $trick );<br>\r\n                $manager -> flush ();<br>\r\n                $this->addFlash(\'success\', \'Cool ! your trick is created. Thank\\\'s from the community\');<br>\r\n            } catch (\\Exception $e) {<br>\r\n                $this->addFlash(\'warning\', \'nope, this name already exists...try with an other one.\');<br>\r\n                return $this->redirectToRoute(\'home\');<br>\r\n            }<br>\r\n\r\n\r\n            return $this->redirectToRoute(\'home\');<br>\r\n\r\n        }<br>\r\n        return $this->render(\'trick/add.html.twig\', array(\'form\'=>$form->createView()));<br>\r\n    }<br><br>\r\nici on déplace les images non pas en base de données mais dans un dossier du projet qui dans public/uploads. Le chemin est donne via la commande move($this->getParameter(\'images_directory\'), qui est lui meme paramétrer dans services.yaml comme ceci <br><br>\r\nparameters:<br>\r\n    images_directory: \'%kernel.project_dir%/public/uploads\'<br><br>\r\nUn nom unique va être donne et sera reproduit dans la bdd dans la classe image. ici comme cle etrangere j\'ai utilise l\'auteur mais on peut faire comme on veut.<br>\r\npour afficher l\'image dans la vue on aura ceci: <br>\r\n  {% for ima in images %}<br>\r\n         img src=\"{{ asset(\'uploads/\'~ ima.name) }}\" class=\"img-thumbnail\"><br>\r\n  {% endfor %}<br>', NULL, '2020-08-20 14:26:37'),
(27, 'terminal', 'terminal, astuces', 'cd<br>\r\nls<br>\r\nmkdir nomDuDossier<br>\r\ntouch nomDuFichierAvecExtension<br>\r\n--help<br>\r\n-v<br>\r\n<br>\r\npour mettre directement un dossier dans le terminal, on fait cd puis on déplace le dossier dans le terminal puis on valide<br>\r\ncat<br>', NULL, '2020-08-20 14:49:29'),
(28, 'ajouter un lien css ou js', 'lien, css, js', 'Il est impératif que les dossiers ou fichiers css et js soient placés dans le dossier public du projet ! <br>\r\nPar exemple, si le fichier style.css se trouve à la racine de public, on aura dans le head de base.html.twig ceci :<br>\r\n<link href=\"{{ asset(\'styles.css\') }}\" rel=\"stylesheet\" />\r\n<br>\r\nla methode asset va donc faire le lien pour nous.\r\n<br>\r\nSi le fichier loads.js se trouve dans public/js on aura alors ceci dans le head de base.html.twig :<br>\r\n<script src=\"{{ asset(\'js/load.js\') }}\"></script>', NULL, '2020-08-20 14:58:06'),
(29, 'ajouter un lien vers un article precis, ici pour edition', 'lien, article, id', 'Dans la vue donc on ajoute un lien de ce type :<br>\r\na href=\"{{ path(\'edit\',{id: trick.id, slug: trick.name | replace({\' \': \'-\'})}) }}\">lien</a><br><br>\r\ndécomposons le path : <br>\r\nIl faut impérativement le mettre en rapport avec le controller edit bien évidemment.<br>\r\ndonc ici on appelle la route edit, qui demande un id puis un slug comme le montre le controller :<br>\r\n    /**<br>\r\n     * @Route(\"edit/{id}/{slug}\", name=\"edit\", requirements={\"slug\"=\".+\"})<br>\r\n     */<br>\r\n    public function edit(EntityManagerInterface $manager, Request $request,TrickRepository $trickRepository ,Trick $trick, ImageRepository $imageRepository, $id, VideoRepository $videoRepository)<br>\r\n    {<br>\r\n        $form = $this->createForm(TrickType::class, $trick);<br>\r\n        $images = $imageRepository->findBy(array(\'trick\'=>$id));<br>\r\n        $video = $videoRepository->findBy(array(\'trick\'=>$id));<br>\r\n        $name = $trickRepository->findBy(array(\'id\'=>$id));<br>\r\n        $form->handleRequest($request);<br>\r\n        $images2 = $form->get(\'images\')->getData();<br>\r\n        if ($form->isSubmitted() && $form->isValid())<br>\r\n        {<br>\r\n\r\n            foreach($images2 as $image)<br>\r\n            {<br>\r\n                $fichier = md5(uniqid()).\'.\'.$image->guessExtension();<br>\r\n                $image->move(<br>\r\n                    $this->getParameter(\'images_directory\'),<br>\r\n                    $fichier<br>\r\n                );<br>\r\n                $img = new Image();<br>\r\n                $img->setName($fichier);<br>\r\n                $trick->addImage($img);<br>\r\n            }<br>\r\n            try{<br>\r\n                $manager -> persist ( $trick );<br>\r\n                $manager -> flush ();<br>\r\n                $this->addFlash(\'updateok\', \'Your trick is now updated ! Thank\\\'s\');<br>\r\n            } catch (\\Exception $e) {<br>\r\n                $this->addFlash(\'updatebad\', \'Oups...something goes wrong, please try again\');<br>\r\n                return $this->redirectToRoute(\'home\');<br>\r\n            }<br>\r\n            return $this->redirectToRoute(\'home\');<br>\r\n        }<br>\r\n        $featuredImage = $trickRepository->showFeaturedImage($id);<br>\r\n        return $this->render(\"trick/edit.html.twig\", <br>array(\'featuredImage\'=>$featuredImage,\'images\'=>$images,\'name\'=>$name,\'videos\'=>$video,\'id\'=>$id,\'form\'=>$form->createView()));<br>\r\n    }<br>\r\nici le slug correspond alors au nom de l\'article auquel on a remplace un espace vide par un tiret.', NULL, '2020-08-20 15:48:01'),
(30, 'modifier mot de passe', 'mot de passe oublie, méthodologie', 'php composer require symfonycasts/reset-password-bundle<br>\r\nthen<br>\r\nphp bin/console make:reset-password', 'https://symfony.com/doc/current/security/reset_password.html#how-to-add-a-reset-password-feature', '2020-08-21 15:59:43'),
(31, 'twig for', 'for, explication', 'quand on fait une boucle avec twig on peut retrouver deux cas de figures:<br>\r\nle cas basique:<br><br>\r\n{% for user in users %}<br>\r\n{{ user.name }}<br>\r\n{{ user.age }}<br>\r\n{% endfor %}<br>\r\n<br><br>\r\nle cas moins basique : <br>\r\n{% for user in users %}<br>\r\n{{ user.0.name }}<br>\r\n{{ user.0.age }}<br>\r\n{% endfor %}', NULL, '2020-08-21 16:10:32'),
(32, 'recuperer les données d\'un repository partie 1', 'repository, injection de dependance', 'le principe est simple<br><br>\r\nclass HomeController extends AbstractController<br>\r\n{<br>\r\n    /**<br>\r\n     * @Route(\"/\", name=\"home\")<br>\r\n     */<br>\r\n    public function index(TrickRepository $trickRepository)<br>\r\n    {<br>\r\n        $tricks = $trickRepository->findAll();<br>\r\n        return $this->render(\'home/index.html.twig\', array(\'tricks\'=>$tricks));<br>\r\n    }<br>\r\n}<br><br>\r\nici on injecte donc le repository dans la fonction et on utilise alors la methode findAll() qui est creee des que l\'on cree l\'entity.<br>\r\nil existe par defaut : <br>\r\nfind($id, $lockMode = null, $lockVersion = null)<br>\r\nfindOneBy(array $criteria, array $orderBy = null)<br>\r\nfindAll()<br>\r\nfindBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)<br>', NULL, '2020-08-21 16:25:54'),
(33, 'recuperer les données d\'un repository partie 2', 'créer ses propres fonctions dans le Repository', 'dans la partie 1 on a vu que l\'on pouvait utiliser 4 méthodes par defaut qui sont tout à fait satisfaisantes dans la plus part des cas. <br>\r\nmais il peut arriver que l\'on aie besoin de créer ses propres méthodes. Comment faire ? <br>\r\nOn cree une fonction en dql comme ceci par exemple :<br>\r\n   public function trickHome()<br>\r\n    {<br>\r\n        return $this->createQueryBuilder(\'p\')<br>\r\n            ->orderBy(\'p.id\', \'DESC\')<br>\r\n            ->getQuery()<br>\r\n            ->getResult()<br>\r\n            ;<br>\r\n    }<br>\r\n\r\nensuite on peut injecter cette function dans le controller.<br><br>\r\n\r\nOn peut aussi choisir d\'utiliser du sql comme ceci : <br>\r\n\r\n    public function commentAndProfil($id)<br>\r\n    {<br>\r\n $q = \"select comment.content, comment.author,comment.trick, comment.created_at, user.username, image_profil.name, trick.id from trick<br>\r\nINNER JOIN comment ON<br>\r\ntrick.id = comment.trick<br>\r\ninner join user on<br>\r\ncomment.author = user.username<br>\r\nleft join image_profil on<br>\r\nimage_profil.id = user.image_profil_id<br>\r\norder by comment.created_at DESC<br>\r\n\";<br>\r\n        $stmt = $this->getEntityManager()->getConnection()->prepare($q);<br>\r\n        $stmt->execute([]);<br>\r\n        return $stmt->fetchAll();<br>\r\n    }<br>\r\nOn peut alors injecter dans le controller', NULL, '2020-08-21 16:38:11');

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

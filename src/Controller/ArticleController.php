<?php

namespace App\Controller;


use App\Entity\Article;
use App\Entity\Image;
use App\Form\ArticleType;
use App\Repository\ArticleRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

class ArticleController extends AbstractController
{
    /**
     * @Route("/article", name="article")
     */
    public function index(Request $request, EntityManagerInterface $manager)
    {
        $form = $this->createForm(ArticleType::class);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid())
        {
            $images = $form->get('images')->getData();
            $article = $form->getData();
            foreach ($images as $image)
            {
                $fichier = md5(uniqid()).'.'.$image->guessExtension();
                $image->move($this->getParameter('images_directory'), $fichier);
                $img = new Image();
                $img->setName($fichier);
                $article->addImage($img);
            }
            try {
                $manager->persist($article);
                $manager->flush();
                $this->addFlash('good','article saved');
                return $this->redirectToRoute('article');
            }catch (\Exception $e)
            {
                $this->addFlash('warning', 'nope, a problem occured...sorry');
                return $this->redirectToRoute('article');
            }
        }
        return $this->render('article/index.html.twig', ['form'=>$form->createView()]);
    }

    /**
     * @Route("article/edit/{id}", name="articleEdit")
     */
    public function articleEdit($id, Article $article, Request $request)
    {
       $form = $this->createForm(ArticleType::class, $article);
       $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('home');
        }
        return $this->render('article/edit.html.twig', [
            'article' => $article,
            'form' => $form->createView(),
        ]);

    }

}

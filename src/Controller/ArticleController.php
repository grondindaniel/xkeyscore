<?php

namespace App\Controller;


use App\Form\ArticleType;
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
            $article = $form->getData();
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

}

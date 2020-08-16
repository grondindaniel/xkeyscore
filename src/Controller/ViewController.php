<?php

namespace App\Controller;

use App\Repository\ArticleRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class ViewController extends AbstractController
{
    /**
     * @Route("/article/{id}", name="view")
     */
    public function index($id, ArticleRepository $articleRepository)
    {
        $article = $articleRepository->findBy(array('id'=>$id));
        return $this->render('view/index.html.twig', ['article'=>$article]);
    }
}

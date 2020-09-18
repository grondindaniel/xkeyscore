<?php

namespace App\Controller;

use App\Repository\ArticleRepository;
use App\Repository\ImageRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class ViewController extends AbstractController
{
    /**
     * @Route("/article/{id}", name="view")
     */
    public function index($id, ArticleRepository $articleRepository, ImageRepository $imageRepository)
    {
        $article = $articleRepository->findBy(array('id'=>$id));
        $images = $imageRepository->findBy(array('article'=>$id));
        return $this->render('view/index.html.twig', ['article'=>$article, 'images'=>$images]);
    }
}

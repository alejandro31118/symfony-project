<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Twig\Environment;
use App\Repository\PlatformRepository;

class PlatformController extends AbstractController
{
    #[Route('/platform', name: 'platform')]
    public function index(Environment $twig, PlatformRepository $platformRepository): Response
    {
        return new Response($twig->render('platform/index.html.twig', [
            'platforms' => $platformRepository->findAll(),
        ]));
    }
}

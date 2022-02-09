<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Twig\Environment;
use App\Repository\GameRepository;

class GameController extends AbstractController
{
    #[Route('/game', name: 'game')]
    public function index(Environment $twig, GameRepository $gameRepository): Response
    {
        return new Response($twig->render('game/index.html.twig', [
            'games' => $gameRepository->findAll(),
        ]));
    }
}
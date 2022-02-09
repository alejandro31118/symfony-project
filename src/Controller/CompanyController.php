<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Twig\Environment;
use App\Repository\CompanyRepository;

class CompanyController extends AbstractController
{
    #[Route('/company', name: 'company')]
    public function index(Environment $twig, CompanyRepository $companyRepository): Response
    {
        return new Response($twig->render('company/index.html.twig', [
            'companies' => $companyRepository->findAll(),
        ]));
    }
}

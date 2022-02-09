<?php

namespace App\Controller\Admin;

use App\Controller\Admin\GameCrudController;
use App\Entity\Company;
use App\Entity\Game;
use App\Entity\Platform;
use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;
use EasyCorp\Bundle\EasyAdminBundle\Router\AdminUrlGenerator;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class DashboardController extends AbstractDashboardController
{
    #[Route('/admin', name: 'admin')]
    public function index(): Response
    {
        $adminUrlGenerator = $this->container->get(AdminUrlGenerator::class);

        return $this->redirect($adminUrlGenerator->setController(GameCrudController::class)->generateUrl());
    }

    public function configureMenuItems(): iterable
    {
        yield MenuItem::linkToCrud('Games', 'fas fa-list', Game::class);
        yield MenuItem::linkToCrud('Platforms', 'fas fa-list', Platform::class);
        yield MenuItem::linkToCrud('Companies', 'fas fa-list', Company::class);
    }
}

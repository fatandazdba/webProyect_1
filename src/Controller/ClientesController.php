<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

use App\Entity\Clientes;

class ClientesController extends AbstractController
{
    /**
     * @Route("/clientes", name="clientes")
     */
    public function index(): Response
    {
        $cliente = $this->getDoctrine()->getManager('tienda')
            ->getRepository(Clientes::class)
            ->findAll();
        echo print_r($cliente, true) . PHP_EOL;

        return $this->render('clientes/index.html.twig', [
            'controller_name' => 'ClientesController',
        ]);
    }
}

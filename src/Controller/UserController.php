<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\DBAL\Driver\Connection;

use App\Entity\User;

class UserController extends AbstractController
{
    /**
     * @Route("/user", name="user")
     */
    public function index(Connection $connection): Response
    {
        $user = new User();
        $entityManager = $this->getDoctrine()->getManager();
        $user->setName('freddy');
        $user->setLastName('tandazo');

        $entityManager->persist($user);
        $entityManager->flush();

        $usersDB = $connection->fetchAll('SELECT * FROM user');

        echo  print_r($usersDB, true);
        //echo  print_r(phpinfo(), true);

        return $this->render('user/index.html.twig', [
            'controller_name' => 'UserController',
        ]);
    }
}

<?php

namespace App\Controller;

use App\Form\UserType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\DBAL\Driver\Connection;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use Lexik\Bundle\JWTAuthenticationBundle\Services\JWTTokenManagerInterface;

use App\Entity\User;

class UserController extends AbstractController
{
    private $userPasswordEncoderInterface;

    public function __construct(UserPasswordEncoderInterface $userPasswordEncoderInterface)
    {
        $this->userPasswordEncoderInterface=$userPasswordEncoderInterface;
    }

    /**
     * @Route("/user", name="user")
     */
    public function index(Connection $connection): Response
    {
        $user = new User();
        $entityManager = $this->getDoctrine()->getManager();
        $user->setEmail('freddy.tandazo@fgupm.upm.es_'.date('dd:mm:yy hh:mm:ss'));
        $user->setRoles(['ROLE_USER']);
        $user->setPassword($this->userPasswordEncoderInterface->encodePassword(
                         $user,
                         'the_new_password'
                     ));
        $user->setName('Freddy Alex');
        $user->setLastName('Tandazo Yanez');
        $entityManager->persist($user);
        $entityManager->flush();

        //OTRA MANERA DE OBTENER LOS DATOS DESDE DB
        $usersDB = $connection->fetchAll('SELECT * FROM user');
        echo  print_r($usersDB, true);
        //echo  print_r(phpinfo(), true);

        return $this->render('user/index.html.twig', [
            'controller_name' => 'UserController',
        ]);
    }

    /**
     * @Route("/userDB", name="userDB")
     */
    public function userDB(Connection $connection): Response
    {
        //DB
        $usersDB = $connection->fetchAll('SELECT * FROM user');
        //echo "connection: \n <pre> " . var_dump($connection) ."</pre>". PHP_EOL;
        echo  "UsersDB: ".PHP_EOL.print_r($usersDB, true).PHP_EOL;
        //echo  print_r(phpinfo(), true);

        return $this->render('user/index.html.twig', [
            'controller_name' => 'UserController',
        ]);
    }

    /**
     * @Route("/userDBAL", name="userDBAL")
     */
    public function userDBAL(Connection $connection): Response
    {
        //DBAL
        $connectionParams = array('url' => $_ENV["DATABASE_URL"]);
        $connectionDBAL = \Doctrine\DBAL\DriverManager::getConnection($connectionParams);
        echo "connectionDBAL: \n <pre> " . print_r($connectionDBAL, true) ."</pre>". PHP_EOL;

        $usersDBAL = $connectionDBAL->fetchAll('select * from user');
        echo  "UsersDBAL: ".PHP_EOL.print_r($usersDBAL, true).PHP_EOL;
        //echo  print_r(phpinfo(), true);

        return $this->render('user/index.html.twig', [
            'controller_name' => 'UserController',
        ]);
    }


    /**
     * @Route("/registroUsuario", name="registroUsuario")
     */
    public function registroUsuario(Request $request, JWTTokenManagerInterface $JWTManager)
    {
        $user = new User();
        $form = $this->createForm(UserType::class, $user);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            //dd($request->request->get($form->getName()));
            $email = $request->request->get($form->getName())["email"];
            $password = $request->request->get($form->getName())["password"];
            $name = $request->request->get($form->getName())["name"];
            $lastName = $request->request->get($form->getName())["lastName"];
            //$registro = $request->request->get($form->getName())["registro"];
            //$token = $request->request->get($form->getName())["token"];

            $entityManager = $this->getDoctrine()->getManager();
            $user->setEmail($email . date('dd:mm:yy hh:mm:ss'));
            $user->setRoles(explode(",", $request->get('roles')));
            $user->setPassword($this->userPasswordEncoderInterface->encodePassword($user, $password));
            $user->setRoles(['ROLE_USER']);
            $user->setName($name);
            $user->setLastName($lastName);
            $token = $this->getTokenUser($user, $JWTManager);
            $user->setToken($token);

            $entityManager->persist($user);
            $entityManager->flush();
            //return $this->redirectToRoute('perfil');
            return $this->render('user/perfil.html.twig', ['controller_name' => 'Perfil del nuevo usuario', "name" => $email]);
        }
        return $this->render('user/registro.html.twig', ['controller_name' => 'Ingresar nuevo usuario', 'formulario' => $form->createView()]);
    }

    /**
     * @param UserInterface $user
     * @param JWTTokenManagerInterface $JWTManager
     * @return JsonResponse
     */
    public function getTokenUser(User $user, JWTTokenManagerInterface $JWTManager)
    {
        //$JWTManager->
        return $JWTManager->create($user);
    }

    /**
     * @Route("/perfil", name="perfil")
     */
    public function perfil()
    {
        return $this->render('user/perfil.html.twig', ['controller_name' => 'Perfil del nuevo usuario']);
    }

}

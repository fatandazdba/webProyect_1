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
use Symfony\Component\Form\FormTypeInterface;
use Symfony\Component\Form\Extension\Core\Type\TextType;

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
    public function index(Connection $connection)
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
    public function userDB(Connection $connection)
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
    public function userDBAL(Connection $connection)
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
     * @Route("register", name="register")
     */
    public function register(Request $request, JWTTokenManagerInterface $JWTManager)
    {
        $user = new User();
        $form = $this->createForm(UserType::class, $user);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            dump($user);
            die();

            if (empty($request->get('name')) || empty($request->get('password')) || empty($request->get('email'))) {
                //return new JsonResponse(['status: ' => 'Invalid Username or Password or Emai']);
                $this->addFlash('Error', 'Complete todos los campos');
            }

            $entityManager = $this->getDoctrine()->getManager();
            $user->setEmail($user->getEmail() . date('dd:mm:yy hh:mm:ss'));
            //$user->setRoles(explode(",", $user->getRoles()));
            //$user->setRoles("['ROLES_APIUPM']");
            /*$user->setPassword($this->userPasswordEncoderInterface->encodePassword(
                $user,
                $user->getPassword()
            ));*/
            echo ("<script>console.warn('" . "MESSAJE: ". "');</script>");

            $user->setPassword('1234');
            //$token = $this->getTokenUser($user, $JWTManager);
            $user->setToken("asasasasasass");

            $entityManager->persist($user);
            $entityManager->flush();
            //$this->addFlash('exito', 'los datos han sido agregados de manera correcta');
            //return $this->redirectToRoute('register');
            return $this->redirectToRoute('/login');
        }
        return $this->render('user/register.html.twig', [
            'Register' => $form->createView()
        ]);

    }

    /**
     * @param UserInterface $user
     * @param JWTTokenManagerInterface $JWTManager
     * @return JsonResponse
     */
    public function getTokenUser(User $user, JWTTokenManagerInterface $JWTManager)
    {
        return $JWTManager->create($user);
    }

}

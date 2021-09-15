<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\DBAL\Driver\Connection;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use Symfony\Component\HttpClient\HttpClient;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Contracts\HttpClient\HttpClientInterface;

use App\Entity\User;

class UserController extends AbstractController
{
    private $userPasswordEncoderInterface;
    private $httpClient;

    public function __construct(UserPasswordEncoderInterface $userPasswordEncoderInterface,HttpClientInterface $httpClient)
    {
        $this->userPasswordEncoderInterface=$userPasswordEncoderInterface;
        $this->httpClient = $httpClient;
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
     * @Route("/createAuthenticatedClient", name="createAuthenticatedClient")
     */
    public function createAuthenticatedClient()
    {
        //first example
        dump($this->getLogin()); die();

        ///second example
        $httpClient = HttpClient::create(['headers' => [
            'headers' => [ 'Content-Type' => 'application/json','Accept' => 'application/json']
        ]]);

        //$httpClient = HttpClient::create();
        $response = $httpClient->request('POST',
            'http://localhost:8000/api/login_check'
            ,[
            //'headers' => [ 'Content-Type' => 'application/json','Accept' => 'application/json'],
            'json' => ['username' => 'user@fgupm.upm.es', 'password'=>'user'],
            ]
        );

        dump($response->toArray());
        die();
        $statusCode = $response->getStatusCode();
        echo print_r($statusCode) . "\n";

        $contentType = $response->getHeaders()['content-type'][0];
        echo print_r($contentType) . "\n";

        $content = $response->getContent();
        echo print_r($content) . "\n";


          //third example
  /*      $request = Request::create(
            '/api/login_check',
            'POST',
            array(
                'username' => 'user@fgupm.upm.es',
                'password' => 'user',
            )
            //,array(),
            //array(),
            ,array('CONTENT_TYPE' => 'application/json')
        );*/

       /* $request = Request::create(
            '/clientes',
            'GET'
        );
        //$request->overrideGlobals();
        dump($request->getPathInfo());
        dump($request->server->get('HTTP_HOST'));
        dump($request->files->get('attachment'));
        dump($request->cookies->get('PHPSESSID'));
        dump($request->headers->get('host'));
        dump($request->headers->get('content-type'));
        dump($request->getMethod());
        dump($request->getLanguages());

        dump($request->getPathInfo());
        $content = $request->getContent();

        $data = $request->toArray();
        //return $client;*/
        /*dump($data);
        die();

        return $this->render('user/index.html.twig', [
            'controller_name' => 'UserController',
        ]);*/
    }


    public function getLogin(): Array
    {
        /*$response = $this->httpClient->request('POST',
            'http://localhost:8000/api/login_check',[
                'headers' => [ 'Content-Type' => 'application/json','Accept' => 'application/json'],
                'json' => ['username' => 'user@fgupm.upm.es', 'password'=>'user'],
            ]);*/

        $response = $this->httpClient->request('GET',
            'https://jsonplaceholder.typicode.com/users');

        $data = $response->getContent();

        $decoded = json_decode($data);

        return $decoded;
    }

}

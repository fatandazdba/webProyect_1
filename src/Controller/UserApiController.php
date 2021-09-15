<?php
/**
 * Created by PhpStorm.
 * User: fatan
 * Date: 03/09/2021
 * Time: 16:42
 */

namespace App\Controller;

use Exception;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\User;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use Lexik\Bundle\JWTAuthenticationBundle\Services\JWTTokenManagerInterface;

/**
 * Class UserApiController
 * @package App\Controller\API
 * @Route("/create",name="api_user_")
 */
class UserApiController extends AbstractController
{
    private $userPasswordEncoderInterface;

    public function __construct(UserPasswordEncoderInterface $userPasswordEncoderInterface)
    {
        $this->userPasswordEncoderInterface = $userPasswordEncoderInterface;
    }

    /**
     * @throws Exception
     * @example /create
     * @Route("/createUser", name="create_user")
     */
    public function createUser(RequestStack $request_stack, JWTTokenManagerInterface $JWTManager): Response
    {
        $request = $request_stack->getCurrentRequest();
        try {
            $user = new User();

            $name = $request->get('name');
            $password = $request->get('password');
            $email = $request->get('email');
            $last_name = $request->get('last_name');

            if (empty($name) || empty($password) || empty($email)) {
                return new JsonResponse(['status: ' => 'Invalid Username or Password or Emai']);

            }

            $entityManager = $this->getDoctrine()->getManager();
            $user->setEmail($email . date('dd:mm:yy hh:mm:ss'));
            $user->setRoles(explode(",", $request->get('roles')));
            $user->setPassword($this->userPasswordEncoderInterface->encodePassword(
                $user,
                $password
            ));
            $user->setName($name);
            $user->setLastName($last_name);
            $token = $this->getTokenUser($user, $JWTManager);
            $user->setToken($token);

            $entityManager->persist($user);
            $entityManager->flush();

            return new JsonResponse(['status: ' => 'ok', 'user' => ['email' => $user->getEmail(), "token:" => $user->getToken()]]);
        } catch (Exception $exc) {
            return new Response("<pre>" . "Exception: " . $exc->getMessage() . $exc->getTraceAsString() . "</pre>");
        }
    }

    /**
     * @param UserInterface $user
     * @param JWTTokenManagerInterface $JWTManager
     * @return JsonResponse
     */
    public function getTokenUser(User $user, JWTTokenManagerInterface $JWTManager)
    {
        $token=$JWTManager->create($user);
        $this->tokenDatos($token);
        return $token;

    }

    /**
     * @param $token
     * Extraer los datos del token
     */
    public function tokenDatos($token){
        $tokenParts = explode(".", $token);
        $tokenHeader = base64_decode($tokenParts[0]);
        $tokenPayload = base64_decode($tokenParts[1]);
        $jwtHeader = json_decode($tokenHeader);
        $jwtPayload = json_decode($tokenPayload);
        dump( $jwtPayload->username);
        dump( $jwtPayload);
    }

    /**
     * @param userId
     * @param JWTTokenManagerInterface $JWTManager
     * @Route("/updateTokenUser", name="update_token_user")
     * @return JsonResponse
     */
    public function updateTokenUser(RequestStack $request_stack, JWTTokenManagerInterface $JWTManager)
    {
        $request = $request_stack->getCurrentRequest();
        $email = $request->get('email');

        $em = $this->getDoctrine()->getManager();
        $user = $em->getRepository(User::class)->findOneBy(["email" => $email]);
        return new JsonResponse(['token' => $JWTManager->create($user)]);
    }
}
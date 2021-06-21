<?php

namespace App\Controller;

use App\Datos\UXXIAC;
use App\Utils\ApiResponse;
use App\Utils\Auth;
use App\Utils\Common;
use Exception;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\HttpKernel\Exception\AccessDeniedHttpException;
use Symfony\Component\Routing\Annotation\Route;

/**
 * Class ApiChatbotController
 * @package App\Controller\API
 * @Route("/api/chatbot",name="api_chatbot_")
 */
class ApiChatbotController extends AbstractController
{

    private const MODULO = "chatbot";
    private const EXCEPTION_USER = 99;

    /**
     * @throws Exception
     * @example /notasDeCorte?cursoAcademico=2020&codigoTitulacion=0308&cupo=G
     * @Route("/notasDeCorte", name="notascorte")
     */
    public function NotasDeCorte(RequestStack $request_stack, Auth $auth, ApiResponse $res, UXXIAC $uxxiac)
    {
        $request = $request_stack->getCurrentRequest();
        $apartado = $request->attributes->get("_route");
        $in = [];
        try {
            $apikey = trim(strip_tags($request->headers->get("api-key") ?? ""));
            //$validar=!$auth->ValidarSesion($apikey);
            //echo "apikey: " . $apikey." \nValidar: " . $validar . "\n";

            if (!$auth->ValidarSesion($apikey)) return $res->apiResponseChatbot(401, "Unauthorized invalid token header", [], null);
            $params = ["cursoAcademico", "codigoTitulacion", "cupo"];
            foreach ($params as $item) {
                $in[$item] = strip_tags($request->get($item) ?? "");
                if (empty($in[$item])){
                    //echo "\n400\n";
                    return $res->apiResponseChatbot(400, "La $in[$item] de preinscripción es un parámetro requerido", $in, null);
                }
            }
            $resultados = $uxxiac->getNotasCorte($in["cursoAcademico"], $in["codigoTitulacion"], $in["cupo"]);
            foreach ($resultados as $key => $value) {
                if (empty($value)) return $res->apiResponseChatbot(404, "No se han encontrado datos para esta petición", $in, null);
            }
            return $res->apiResponseChatbot(200, "Listado OK", $in, $resultados);
            //$this->Log($apartado,Common::RealIP()." - Acceso no autorizado","info");
        } catch (Exception $exc) {
            return $res->apiResponseChatbot(500, "Error en el servidor", $in, null);
        }
    }

    /**
     * @throws Exception
     * @example /ponderacionMateria?codigoTitulacion=003&codigoMateria=01&cursoAcademico=2018
     * @Route("/ponderacionMateria", name="ponderacionmateria")
     */
    public function PonderacionMateria(RequestStack $request_stack, Auth $auth, ApiResponse $res, UXXIAC $uxxiac)
    {
        $request = $request_stack->getCurrentRequest();
        $apartado = $request->attributes->get("_route");
        $in = [];
        try {
            $apikey = trim(strip_tags($request->headers->get("api-key") ?? ""));
            if (!$auth->ValidarSesion($apikey)) return $res->apiResponseChatbot(401, "Unauthorized invalid token header", [], null);

            $params = ["codigoTitulacion" => [], "codigoMateria" => ["opt" => true], "cursoAcademico" => []];
            foreach ($params as $item => $opts) {
                $in[$item] = strip_tags($request->get($item) ?? "");
                $optional = (isset($opts["opt"]) && $opts["opt"] === true);
                if (empty($in[$item]) && !$optional) return $res->apiResponseChatbot(400, "El $in[$item] es un parámetro requerido", $in, null);
            }
            $resultados = $uxxiac->getPonderacionMateria($in);
            if (count($resultados) == 1) return $res->apiResponseChatbot(404, "No se han encontrado datos para esa petición", $resultados, null);
            else return $res->apiResponseChatbot(200, "Listado OK", $in, $resultados);
        } catch (Exception $exc) {
            return $res->apiResponseChatbot(500, "Error en el servidor", $in, null);
        }
    }

    /**
     * @throws Exception
     * @example /grados?cursoAcademico=2018&codigoCentro=130A&codigoRama=001
     * @Route("/grados", name="grados")
     */
    public function Grados(RequestStack $request_stack, Auth $auth, ApiResponse $res, UXXIAC $uxxiac)
    {
        $request = $request_stack->getCurrentRequest();
        $apartado = $request->attributes->get("_route");
        $in = [];
        try {
            $apikey = trim(strip_tags($request->headers->get("api-key") ?? ""));
            if (!$auth->ValidarSesion($apikey)) return $res->apiResponseChatbot(401, "Unauthorized invalid token header", [], null);

            $params = ["cursoAcademico" => [], "codigoCentro" => ["opt" => true], "codigoRama" => ["opt" => true]];
            foreach ($params as $item => $opts) {
                $in[$item] = strip_tags($request->get($item) ?? "");
                $optional = (isset($opts["opt"]) && $opts["opt"] === true);
                if (empty($in[$item]) && !$optional) return $res->apiResponseChatbot(400, "El $in[$item] es un parámetro requerido", $in, null);
            }
            $resultados = $uxxiac->getGrados($in);
            if (count($resultados) == 1) return $res->apiResponseChatbot(404, "No se han encontrado datos para esa petición", $resultados, null);
            else return $res->apiResponseChatbot(200, "Listado OK", $in, $resultados);
        } catch (Exception $exc) {
            echo $exc->getMessage().PHP_EOL.$exc->getTraceAsString().PHP_EOL;
            return $res->apiResponseChatbot(500, "Error en el servidor", $in, null);
        }
    }

    /**
     * @throws Exception
     * @example /centros?codigoCentro=130A
     * @Route("/centros", name="centros")
     */
    public function Centros(RequestStack $request_stack, Auth $auth, ApiResponse $res, UXXIAC $uxxiac)
    {
        $request = $request_stack->getCurrentRequest();
        $apartado = $request->attributes->get("_route");
        $in = [];
        try {
            $apikey = trim(strip_tags($request->headers->get("api-key") ?? ""));
            if (!$auth->ValidarSesion($apikey)) return $res->apiResponseChatbot(401, "Unauthorized invalid token header", [], null);
            $params = ["codigoCentro"];
            foreach ($params as $item) {
                $in[$item] = strip_tags($request->get($item) ?? "");
                $tmp=empty($in[$item]);
                echo "\n empty(in[item]): ".$tmp . "\n";
                if ($in[$item]== null || $in[$item]== "") {
                    echo  "\n params: ". print_r($params, true)  . "\n";
                    return $res->apiResponseChatbot(400, "El $in[$item] es un parámetro requerido", $in, null);
                }
            }
            echo "\nLinea 140\n";
            $resultados = $uxxiac->getCentros($in);
            echo "\n resultados: ".print_r($resultados, true) . "\n";
            if (count($resultados) == 1) return $res->apiResponseChatbot(404, "No se han encontrado datos para esa petición", $resultados, null);
            return $res->apiResponseChatbot(200, "Listado OK", $in, $resultados);
        } catch (Exception $exc) {
            return $res->apiResponseChatbot(500, "Error en el servidor", $in, null);
        }
    }

    /**
     * @throws Exception
     * @example /citaLlamamientos?dni=00000000
     * @Route("/citaLlamamientos", name="citallamamientos")
     */
    public function CitaLlamamientos(RequestStack $request_stack, Auth $auth, ApiResponse $res, UXXIAC $uxxiac)
    {
        $request = $request_stack->getCurrentRequest();
        $apartado = $request->attributes->get("_route");
        $in = [];
        try {
            $apikey = trim(strip_tags($request->headers->get("api-key") ?? ""));
            if (!$auth->ValidarSesion($apikey)) return $res->apiResponseChatbot(401, "Unauthorized invalid token header", [], null);
            $params = ["dni"];
            foreach ($params as $item) {
                $in[$item] = strip_tags($request->get($item) ?? "");
                if (empty($in[$item]))
                    return $res->apiResponseChatbot(400, "El $in[$item] es un parámetro requerido", $in, null);
            }
            $resultados = $uxxiac->getNotasCorte($in);
            if (empty($resultados["dni"])) return $res->apiResponseChatbot(404, "No se han encontrado datos para esa petición", $resultados, null);
            else $res->apiResponseChatbot(200, "Listado OK", $in, $resultados);
        } catch (Exception $exc) {
            return $res->apiResponseChatbot(500, "Error en el servidor", $in, null);
        }
    }

}

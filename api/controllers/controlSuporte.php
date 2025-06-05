<?php
require_once __DIR__ . '/../services/jwtToken.php';
require_once __DIR__ . '/../services/response.php';
require_once __DIR__ . '/../../config/config.php';
require_once __DIR__ . '/../utils/sanitarizarDados.php';
require_once __DIR__ . '/../models/modelSuporte.php';


class controlSuporte
{
    public function logarSup()
    {
        $sanitSup = new sanitarizarDados();
        $dados = $sanitSup->sanitDados($_POST);

        $modelSuporte = new modelSuporte();
        $resp = $modelSuporte->verifLoginSup($dados);

        //Response::criarResponse(true,$resp);
        
        if(is_array($resp) && isset($resp) && $resp['status'] === false)
        {
            Response::criarResponse($resp['status'], $resp['mensagem']);
            return;
        }
        
        $respJWT = jwtToken::criarTokenWeb('token' ,$resp['id'], 'suporte', KEY_JWT);
        //Response::criarResponse(true, 'sla: '. $resp);

        Response::criarResponse($respJWT['status'], $respJWT['mensagem']);
        
    }
    

}


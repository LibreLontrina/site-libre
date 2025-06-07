<?php
require_once __DIR__ . '/../services/codigosVerif.php';
require_once __DIR__ . '/../services/jwtToken.php';
require_once __DIR__ . '/../services/response.php';
require_once __DIR__ . '/../services/phpMailer.php';
require_once __DIR__ . '/../../config/config.php';
require_once __DIR__ . '/../utils/validarDados.php';
require_once __DIR__ . '/../utils/sanitarizarDados.php';
require_once __DIR__ . '/../models/modelCodigosVerif.php';
require_once __DIR__ . '/../models/modelUsuario.php';


class controlComum
{
    public function verifToken()//preciso mudar esse nome
    {
        $headers = getallheaders();
        if(isset($headers['Dispositivo']))
        {
            $dispositivo = $headers['Dispositivo'];
        }
        
        $token = null;
        switch ($dispositivo) {
            case 'app':
                
            if(!isset($_POST['token']))
            {
               Response::criarResponse(false, "Esse token não existe");
            }
            
            $token = $_POST['token'];
            break;
            
            
            case 'web':
                
            if(!isset($_COOKIE['token']))
            {
                Response::criarResponse(false, "Esse cookie não existe");
            }
            
            $token = $_COOKIE['token'];
            break;
        }

        $payloadToken = jwtToken::verifToken(KEY_JWT, $token);

        if(isset($payloadToken['status']) && $payloadToken['status'] === false)
        {
            Response::criarResponse($payloadToken['status'], $payloadToken['mensagem']);
        }

        Response::criarResponse(true,"Logado");
    } 

    public function logoutWeb()
    {
        $erro = jwtToken::destruirTokenWeb('token');

        if(!empty($erro))
        {
            Response::criarResponse(false, $erro);
        }
    }

    public function verifAccess()
    {
        $headers = getallheaders();
        if(isset($headers['Dispositivo']))
        {
            $dispositivo = $headers['Dispositivo'];
        }
        
        $token = null;
        switch ($dispositivo) {
            case 'app':
                
            if(!isset($_POST['token']))
            {
               Response::criarResponse(false, "Esse token não existe");
            }
            
            $token = $_POST['token'];
            break;
            
            
            case 'web':
                
            if(!isset($_COOKIE['token']))
            {
                Response::criarResponse(false, "Esse cookie não existe");
            }
            
            $token = $_COOKIE['token'];
            break;
        }

        $accessRotes = [
            "homeAdm" => "admin"
        ];

        $base = "/TESTE5/app/";

        $fetch = json_decode(file_get_contents('php://input'), true);
        $url = $fetch['url'];

        if(strpos($url, $base) === 0)
        {
            $pag = substr($url,strlen($base));
            $pagRote = explode('.', $pag);
            $pagina = $pagRote[0];
        }

        $dados = jwtToken::verifToken(KEY_JWT, $token);
               
        if($accessRotes[$pagina])
        {
            if($dados['dados']['tipo'] === $accessRotes[$pagina])
            {
                Response::criarResponse(true);
            }
            else
            {
                Response::criarResponse(false);
            }
        }
        else
        {   
            Response::criarResponse(false);
        }
        
    }

    public function esqueciSenha()
    {
        $headers = getallheaders();
        if(isset($headers['Dispositivo']))
        {
            $dispositivo = $headers['Dispositivo'];
        }

        $sanitDados = new sanitarizarDados();
        $dados = $sanitDados->sanitDados($_POST);
        $emailUser = $dados['email'];


        $codigo = codigosVerif::criarCodVerif();

        $modelUsuario = new modelUsuario();
        $resp = $modelUsuario->buscarIdUsuario($emailUser);
        if($resp['status'] === false)
        {
            Response::criarResponse($resp['status'], $resp['mensagem']);
        }

        $modelCodVerifCad = new modelCodigosVerif();
        $codVerif = $modelCodVerifCad->gerarCodigo($codigo, $resp['id'], 'esqueci_senha');
        if($codVerif['status'] === false)
        {
            Response::criarResponse($codVerif['status'], $codVerif['mensagem']);
        }

        $Mailer = new phpMailerClass();
        $email = $Mailer->enviarEmail($emailUser,$codigo, 'esqueci_senha');
        if($email['status'] === false)
        {
            Response::criarResponse($email['status'], $email['mensagem']);
        }

        $token = null;
        switch ($dispositivo)
        {
            case 'app':
                $tokenApp = jwtToken::criarTokenApp($resp['id'], 'usuario', KEY_VERIFCOD);
                $token = $tokenApp['token'];
                if($tokenApp['status'] === false)
                {
                    Response::criarResponse($tokenApp['status'], $tokenApp['mensagem']);
                }
                //Response::criarResponse(true, "Até aqui vai: ", $tokenApp['token']);
                
            break;
            
            case 'web':       
                jwtToken::criarTokenWeb('CodEsqSen', $resp['id'], 'usuario', KEY_VERIFCOD, 1000);
                
            break;
        }
        Response::criarResponse(true, "Email enviado", $token ?? null);

    }

    public function verifEsqueciSenha()
    {
        $headers = getallheaders();
        if(isset($headers['Dispositivo']))
        {
            $dispositivo = $headers['Dispositivo'];
        }

        $tokenHeader = null;
        switch ($dispositivo) 
        {
            case 'app':
                if(!isset($_POST['tokenCodEsqSen']))
                {
                    Response::criarResponse(false, "Esse token não existe");
                }
                
                $tokenHeader = $_POST['tokenCodEsqSen'];
            break;
            
            case 'web':
                if(!isset($_COOKIE['CodEsqSen']))
                {
                    Response::criarResponse(false, "Esse cookie não existe");
                }

                $tokenHeader = $_COOKIE['CodEsqSen'];
            break;
        }

        $dadosJson = jwtToken::verifToken(KEY_VERIFCOD, $tokenHeader);
        if(isset($dadosJson['status']) && $dadosJson['status'] === false)
        {
            Response::criarResponse($dadosJson['status'], $dadosJson['mensagem']);
        }

        $idUsuario = $dadosJson['dados']['id'];

        //Sanitarizo o codigo escrito
        $codUser = codigosVerif::sanitCodVerif($_POST['codEsqSen']); //esse CodEsqSen é o name do input
        if($codUser['status'] === false)
        {
            Response::criarResponse($codUser['status'], $codUser['mensagem']);
        }
    
        //Pego o código do Banco de dados
        $modelCodigosVerif = new modelCodigosVerif();
        $codBD = $modelCodigosVerif->buscarCodigo($idUsuario, 'esqueci_senha');

        if ($codUser['codigo'] === $codBD['codigo']) //Comparo os dois código
        {
            $status = true;
            $mensagem = "codigo de esqueci senha verificado";
        }
        else
        {
            Response::criarResponse($codBD['status'], $codBD['mensagem']);
        }

        Response::criarResponse($status, $mensagem);
    }

    public function atualizarSenha()
    {
        $headers = getallheaders();
        if(isset($headers['Dispositivo']))
        {
            $dispositivo = $headers['Dispositivo'];
        }
        
        $tokenHeader = null;
        switch ($dispositivo) {
            case 'app':
                
            if(!isset($_POST['tokenCodEsqSen']))
            {
               Response::criarResponse(false, "Esse token não existe");
            }
            
            $tokenHeader = $_POST['tokenCodEsqSen'];
            break;
            
            case 'web':
                
            if(!isset($_COOKIE['CodEsqSen']))
            {
                Response::criarResponse(false, "Esse cookie não existe");
            }
            
            $tokenHeader = $_COOKIE['CodEsqSen'];
            break;
        }

        $sanitarizar = new sanitarizarDados();
        $sanitSenha = $sanitarizar->sanitDados($_POST);

        $validar = new validarDados();
        $validSenha = $validar->validSenha($sanitSenha['senha']);
        if(!empty($validar->error))
        {
            Response::criarResponse(false, 'erro de validação', $validar->error); //lembrar que é a dados['erro']['senha']
        }
        $senha = $sanitSenha['senha'];

        $payload = jwtToken::verifToken(KEY_VERIFCOD, $tokenHeader);
        if($payload['status'] === false)
        {
            Response::criarResponse($payload['status'], $payload['mensagem']);
        }
        $id = $payload['dados']['id'];

        $modelUsuario = new modelUsuario();
        $resp = $modelUsuario->atualizarNovaSenha($senha, $id);
        if($resp['status'] === false)
        {
            Response::criarResponse($resp['status'], $resp['mensagem']);
        }
        Response::criarResponse(true, "Atualização de senha feita");
    }

}
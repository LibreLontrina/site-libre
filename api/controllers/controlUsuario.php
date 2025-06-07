<?php

require_once __DIR__ . '/../utils/validarDados.php';
require_once __DIR__ . '/../utils/sanitarizarDados.php';
require_once __DIR__ . '/../entidades/entidUsuario.php';
require_once __DIR__ . '/../models/modelUsuario.php';
require_once __DIR__ . "/../models/modelCodigosVerif.php";
require_once __DIR__ . '/../services/response.php';
require_once __DIR__ . '/../services/jwtToken.php';
require_once __DIR__ . '/../services/phpMailer.php';
require_once __DIR__ . '/../services/codigosVerif.php';
require_once __DIR__ . '/../../config/config.php';

class controlUsuario
{
    public function cadastrar() //não me esquecer de verificar se já tem contas com o email
    {
        $headers = getallheaders();
        if(isset($headers['Dispositivo']))
        {
            $dispositivo = $headers['Dispositivo'];
        }

        //sanitizar os dados
        $sanitUsuario = new sanitarizarDados();
        $dados = $sanitUsuario->sanitDados($_POST);
        
        //validar os dados
        $validUsuario = new validarDados();
        $errosCad = $validUsuario->validCadastro($dados);

        //ver se os dados já existem
        $modelUsuario = new modelUsuario();
        $errosExist = $modelUsuario->validDadosUsuario($dados);

        if(!empty($errosCad) || $errosExist['status'] === false)
        {
            $erros = [
                'erros do cadastro'      => $errosCad ?? null,
                'informações duplicadas' => $errosExist['erros'] ?? null
            ];
            Response::criarResponse(false, "Erros no cadastro", $erros);
        }
        
        //guardar dados na entidade
        $Usuario = new entidUsuario();
        $Usuario->setDados($dados);
        
        //executar o modelo
        $resp = $modelUsuario->criarUsuario($Usuario);
        if($resp['status'] === false)
        {
            Response::criarResponse($resp['status'], $resp['mensagem']);
        }
        //Response::criarResponse(true, "id é:" . $resp['id']);
        
        //Criar código de verificação
        $codigoVerif =  codigosVerif::criarCodVerif();
        $modelCodVerifCad = new modelCodigosVerif();
        $codVerif = $modelCodVerifCad->gerarCodigo($codigoVerif, $resp['id'], 'verif_email');
        if($codVerif['status'] === false)
        {
            Response::criarResponse($codVerif['status'], $codVerif['mensagem']);
        }
        
        //Enviar o código de verificação
        $Mailer = new phpMailerClass();
        $email = $Mailer->enviarEmail($Usuario->getEmail(), $codigoVerif, 'verif_email');
        if(!isset($email['status']) || $email['status'] === false)
        {
            Response::criarResponse(false, "Erro ao enviar o email");
        }
        

        $token = null;
        switch ($dispositivo)
        {
            case 'app':
                $tokenApp = jwtToken::criarTokenApp($resp['id'], 'pendente', KEY_VERIFCOD);
                $token = $tokenApp['token'];

                if($tokenApp['status'] === false)
                {
                    Response::criarResponse($tokenApp['status'], $tokenApp['mensagem']);
                }
                //Response::criarResponse(true, "Até aqui vai: ", $tokenApp['token']);
                
            break;
            
            case 'web':       
                jwtToken::criarTokenWeb('CodVerifCad', $resp['id'], 'pendente', KEY_VERIFCOD, 1000);
                
                
            break;
        }
        Response::criarResponse(true, "Cadastro Concluido", $token ?? null);
    }

    public function logar()
    {         
        $headers = getallheaders();
        if(isset($headers['Dispositivo']))
        {
            $dispositivo = $headers['Dispositivo'];
        }

        $sanitLogin = new sanitarizarDados();
        $dadosUser = $sanitLogin->sanitDados($_POST);
        
        $modelUsuario = new modelUsuario();
        $resp = $modelUsuario->verifLoginUsuario($dadosUser);
        if($resp['status'] === false)
        {
            Response::criarResponse($resp['status'], $resp['mensagem']);
            return;
        }
        
        switch($dispositivo)
        {
            case 'app':
                $tokenlogin = jwtToken::criarTokenApp($resp['id'], 'usuario', KEY_JWT);

            break;
                        
            case 'web':
                $tokenlogin = jwtToken::criarTokenWeb('token', $resp['id'], 'usuario', KEY_JWT);

            break;
        }

        Response::criarResponse($tokenlogin['status'], $tokenlogin['mensagem'], $tokenlogin['token'] ?? null);
        
    }

    public function preVisuLogin()
    {
        $headers = getallheaders();
        if(isset($headers['Dispositivo']))
        {
            $dispositivo = $headers['Dispositivo'];
        }
        
        $tokenHeader = null;
        switch ($dispositivo) {
            case 'app':
                
            if(!isset($_POST['token']))
            {
               Response::criarResponse(false, "Esse token não existe");
            }
            
            $tokenHeader = $_POST['token'];
            break;
            
            
            case 'web':
                
            if(!isset($_COOKIE['token']))
            {
                Response::criarResponse(false, "Esse cookie não existe");
            }
            
            $tokenHeader = $_COOKIE['token'];
            break;
        }
        
        //Response::criarResponse(true, 'mimimi: ' . $token);
        
        $dadosJson = jwtToken::verifToken(KEY_JWT, $tokenHeader);
        if(isset($dadosJson['status']) && $dadosJson['status'] === false)
        {
            //Response::criarResponse(true, "sla: SS ". $dadosJson['status']);
            Response::criarResponse($dadosJson['status'], $dadosJson['mensagem']);
        }

        //Response::criarResponse(true, "SOCORRO ". $dadosJson['dados']['id']);
        
        $modelUsuario = new modelUsuario();
        $resp = $modelUsuario->BuscInfoUsuario($dadosJson['dados']['id']);

        //Response::criarResponse(true, "vsfd: " . $resp['data']['email'], "oie");
        Response::criarResponse($resp['status'], $resp['mensagem'], $resp['data'] ?? null);
    }

    public function codVerifCad()
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
                
            if(!isset($_POST['tokenCodVerifCad']))
            {
               Response::criarResponse(false, "Esse token não existe");
            }
            
            $tokenHeader = $_POST['tokenCodVerifCad'];
            break;
            
            
            case 'web':
                
            if (!isset($_COOKIE['CodVerifCad']))
            {
                Response::criarResponse(false, "Esse cookie não existe");
            }

            $tokenHeader = $_COOKIE['CodVerifCad'];
            break;
        }
        
        //Response::criarResponse(true, "token: " . $token ?? "");
        
        //Verifico o o token
        $dadosJson = jwtToken::verifToken(KEY_VERIFCOD, $tokenHeader);
        if(isset($dadosJson['status']) && $dadosJson['status'] === false)
        {
            Response::criarResponse($dadosJson['status'], $dadosJson['mensagem']);
        }

        $idUsuario = $dadosJson['dados']['id'];

        //Sanitarizo o codigo escrito
        $codUser = codigosVerif::sanitCodVerif($_POST['codVerifCad']);
        if($codUser['status'] === false)
        {
            Response::criarResponse($codUser['status'], $codUser['mensagem']);
        }
        
        //Pego o código do Banco de dados
        $modelCodVerifCad = new modelCodigosVerif();
        $codBD = $modelCodVerifCad->buscarCodigo($idUsuario, 'verif_email');

        if ($codUser['codigo'] === $codBD['codigo']) //Comparo os dois código
        {

            $modelUsuario = new modelUsuario();
            $resp = $modelUsuario->mudarStatusUsuario($idUsuario, 'ativo');
            if($resp['status'] === true)
            {
                $status = true;
                $mensagem = "Login Verificado com Sucesso";
                $token = "";

                switch($dispositivo)
                {
                    case 'app':
                        $tokenlogin = jwtToken::criarTokenApp($idUsuario, 'usuario', KEY_JWT);
                        $token = $tokenlogin['token'];

                    break;
                        
                    case 'web':
                        jwtToken::destruirTokenWeb('CodVerifCad');
                        jwtToken::criarTokenWeb( 'token', $idUsuario, 'usuario', KEY_JWT);

                    break;
                }
                
                //$tokenlogin = jwtToken::criarTokenApp('token', $idUsuario, 'usuario', KEY_JWT);
                //Response::criarResponse(true, "eee: " . $tokenlogin['token']);
            }
            else
            {
                Response::criarResponse($resp['status'], $resp['mensagem']);
            }
        }
        else
        {
            Response::criarResponse($codBD['status'], $codBD['mensagem']);
        }

        Response::criarResponse($status, $mensagem, $token ?? null);

        
    }
}
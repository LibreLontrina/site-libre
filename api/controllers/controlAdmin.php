<?php
require_once __DIR__ . '/../services/jwtToken.php';
require_once __DIR__ . '/../services/response.php';
require_once __DIR__ . '/../../config/config.php';
require_once __DIR__ . '/../utils/sanitarizarDados.php';

class controlUsuario
{
    public function cadastroAdm()
    {
        //sanitizar os dados
        $sanitAdm = new sanitarizarDados();
        $dados = $sanitAdm->sanitDados($_POST);
    
        //validar os dados
        $validAdm = new validarDados();
        $erros = $validAdm->validCadastro($dados);

        if(!empty($erros))
        {
            $mensagem = "Erros no cadastro";
            Response::criarResponse(false, $mensagem, $erros);
            return;
        }
    
        //guardar dados na entidade
        $Usuario = new entidUsuario();
        $Usuario->setDados($dados);
    
        //executar o modelo
        $modelUsuario = new modelUsuario();
        $resp = $modelUsuario->criarUsuario($Usuario);

        Response::criarResponse($resp['status'], $resp['mensagem']);
    }

    public function logarAdm()
    {
        $sanitLoginAdm = new sanitarizarDados();
        $dados = $sanitLoginAdm->sanitDados($_POST);

        $modelAdmin = new modelAdmin();
        $resp = $modelAdmin->verifLoginAdmin($dados);

        if($resp['status'] === false)
        {
            Response::criarResponse($resp['status'], $resp['mensagem']);
            return;
        }
        
        $respJWT = jwtToken::criarTokenWeb('token',$resp['id'], 'usuario', KEY_JWT);

        Response::criarResponse($respJWT['status'], $respJWT['mensagem']);

    }





}




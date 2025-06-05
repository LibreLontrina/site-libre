<?php
class Response
{
    public static function criarResponse($status, $mensagem = null, $dados = null)
    {
        $resposta = [
            'status' => $status
        ];

        if(!empty($mensagem))
        {
            $resposta['mensagem'] = $mensagem;
        }

        if(!empty($dados))
        {
            $resposta['dados'] = $dados;
        }

        //header('Content-Type: application/json');
        echo json_encode($resposta);
        exit;
    }

}
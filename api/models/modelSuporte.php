<?php
require_once __DIR__ . "/../../config/conexao.php";
require_once __DIR__ . "/../vendor/autoload.php";
require_once __DIR__ . "/../services/jwtToken.php";

class modelSuporte
{
    public function verifLoginSup($dadoslogin)
    {
        /*
        $logins = [
            'senha' => password_hash($dadoslogin['senha'],PASSWORD_DEFAULT)
        ];
        $conexao = new conexao();
        $dadosbd = $conexao->exe_query('UPDATE suporte SET senha_suporte = :senha WHERE id_suporte = 1', $logins);

        echo json_encode($dadosbd);
        exit;
        */

        
        $login = $dadoslogin['login'];
        $senha = $dadoslogin['senha'];

        $logins = [
            'login' => $login
        ];
        
        $conexao = new conexao();
        $dadosbd = $conexao->exe_query('SELECT id_suporte, senha_suporte FROM suporte WHERE login_suporte = :login', $logins);
        
        if(!empty($senha) && !empty($dadosbd))
        {
            if(password_verify($senha, $dadosbd[0]['senha_suporte']))
            {
                $id = $dadosbd[0]['id_suporte'];
                $mensagem = 'Login feito, Suporte';
                $status = true;
            }
            else
            {
                $mensagem = 'As senhas não batem';
                $status = false;
            }
        }
        else
        {  
            $mensagem = 'Nenhum usuario encontrado';
            $status = false;
        }

        return [
            'mensagem' => $mensagem,
            'status' => $status,
            'id' => $id
        ];

        

        //return $dadoslogin;
    }


}
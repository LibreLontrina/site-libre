<?php

class modelAdmin
{
    public function verifLoginAdmin($dadoslogin)
    {
        $login = $dadoslogin['loginAdm'];
        $senha = $dadoslogin['senhaAdm'];

        $logins = [
            'email' => $login,
            'usuario' => $login
        ];
        
        $conexao = new conexao();
        $dadosbd = $conexao->exe_query('SELECT id_usuario_adm, senha_usuario_adm FROM usuarios_adm WHERE email_usuario_adm = :email
        OR username_usuario_adm = :usuario', $logins);
        
        if(!empty($senha) && !empty($dadosbd))
        {
            if(password_verify($senha, $dadosbd[0]['senha_usuario']))
            {
                $id = $dadosbd[0]['id_usuario'];
                $mensagem = 'Sucesso, login bate';
                $status = true;
            }
            else
            {
                $mensagem = 'Senha ou login não bate';
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
            'id' => $id ?? null
        ];



    }



}
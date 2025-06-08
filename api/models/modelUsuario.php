<?php
    
    require_once __DIR__ . "/../../config/conexao.php";
    require_once __DIR__ . "/../vendor/autoload.php";
    require_once __DIR__ . "/../services/jwtToken.php";
    

class modelUsuario
{
    public function criarUsuario($usuario) 
    {
        try
        {
            //dados da entidade
            $nome     = $usuario->getNome();
            $username = $usuario->getUsername();
            $email    = $usuario->getEmail();
            $tel      = $usuario->getTel();
            $dtaNasc  = $usuario->getDtaNasc(); 
            $senha    = password_hash($usuario->getSenha(), PASSWORD_DEFAULT);


            //arrays com parametros
            $conta = [
                'nome'     =>   $nome,
                'username' =>   $username,
                'email'    =>   $email,  
                'tel'      =>   $tel,
                'dtaNasc'  =>   $dtaNasc,
                'senha'    =>   $senha
            ];
            $paramEmail = [
                'email' => $email

            ];

            //instancia de classe de conexão
            $conexao = new conexao();

            //query para colocar os dados
            $bd = $conexao->exe_query('INSERT INTO usuarios(email_usuario, senha_usuario,
            apelido_usuario, username_usuario, telefone_usuario, data_nasc_usuario)
            VALUES (:email , :senha , :nome , :username , :tel , :dtaNasc)', $conta);

            if(!empty($bd) && count($bd) > 0) //talvez dê problema???
            {
                //query para pegar o id
                $idUsuario = $conexao->exe_query('SELECT id_usuario 
                                                        FROM usuarios 
                                                        WHERE email_usuario = :email', 
                                                        $paramEmail);

                if (is_array($idUsuario) && isset($idUsuario[0]['id_usuario'])) 
                {
                    $status = true;
                    $mensagem = "Cadastro feito";
                    $id = $idUsuario[0]['id_usuario'];
                } 
                else 
                {
                    $mensagem = "Falha ao buscar ID: retorno inválido ou vazio";
                    $status = false;
                }
            }
            else
            {
                $mensagem = "Falha no cadastro";
                $status = false;
            }
        }
        catch(Exception $e)
        {
            $status = false;
            $mensagem = "Erro ao cadastrar: " . $e->getMessage();
        }

        return [
            'status' => $status,
            'mensagem' => $mensagem,
            'id' => $id ?? null
        ];
    }

    public function validDadosUsuario($dados)
    {
        try
        {
            $erros    = [];
            $username = $dados['username'];
            $email    = $dados['email'];
            $tel      = $dados['tel'];

            $conexao = new conexao();

            //EMAIL
            $verfEmail = $conexao->exe_query('SELECT id_usuario 
                                                    FROM usuarios 
                                                    WHERE email_usuario = (:email)',
                                            ['email' => $email]);

            if(isset($verfEmail[0]['id_usuario']))
            { $erros['email'] = "Esse email já está cadastrado: "; }
            
            //TELEFONE
            $verfTel = $conexao->exe_query('SELECT id_usuario 
                                                    FROM usuarios 
                                                    WHERE telefone_usuario = (:tel)',
                                            ['tel' => $tel]);

            if(isset($verfTel[0]['id_usuario']))
            { $erros['tel'] = "Esse telefone já está cadastrado"; }

            //USERNAME
            $verfUsername = $conexao->exe_query('SELECT id_usuario 
                                                        FROM usuarios 
                                                        WHERE username_usuario = (:username)',
                                                ['username' => $username]);

            if(isset($verfUsername[0]['id_usuario']))
            { $erros['username'] = "Esse username já está cadastrado"; }


            if(!empty($erros))
            {
                $status = false;
                $mensagem = "Um dado já está cadastrado";
                $errosExist = $erros;

                if(count($errosExist) > 1)
                {$mensagem = "Alguns dados já estão cadastrados";}
            }
            else
            {
                $status = true;
                $mensagem = "Esses dados não estão cadastrados";
            }
        }
        catch(Exception $e)
        {
            $status = false;
            $mensagem = "Erro ao verificar dados pré existentes: " . $e->getMessage();
        }

        return [
            'status' => $status,
            'mensagem' => $mensagem,
            'erros' => $errosExist ?? null
        ];
    }

    public function verifLoginUsuario($dadoslogin) 
    {
        try
        {
            $login = $dadoslogin['login'];
            $senha = $dadoslogin['senha'];

            $logins = [
                'email' => $login,
                'usuario' => $login
            ];
            
            $conexao = new conexao();
            $dadosbd = $conexao->exe_query('SELECT id_usuario, senha_usuario 
                                                    FROM usuarios 
                                                    WHERE email_usuario = :email
                                                    OR username_usuario = :usuario', 
                                                    $logins);
            
            if(!empty($senha) && !empty($dadosbd))
            {
                if(password_verify($senha, $dadosbd[0]['senha_usuario']))
                {
                    $id = $dadosbd[0]['id_usuario'];
                    $mensagem = 'Login bate';
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
        }
        catch (Exception $e)
        {
            $mensagem = 'Erro ao verificar login: ' . $e->getMessage();
            $status = false;
        }
        
        return [
            'mensagem' => $mensagem,
            'status' => $status,
            'id' => $id ?? null
        ];
    }
    
    public function mudarStatusUsuario($idUsuario, $statusUsuario)
    {
        try
        {
            $params = [
                'id' => $idUsuario,
                'status' => $statusUsuario
            ];

            $conexao = new conexao();
            $resp = $conexao->exe_query("UPDATE usuarios 
                                        SET status_usuario = :status 
                                        WHERE id_usuario = :id", 
                                        $params);

            if($resp > 0)
            {
                $status = true;
                $mensagem = "Sucesso ao mudar status";
            }
            else
            {
                $status = false;
                $mensagem = "Falha ao mudar status";
            }
        }
        catch (Exception $e)
        {
            $status = false;
            $message = "Erro ao mudar status: " . $e->getMessage();
        }

        return [
            'status' => $status,
            'mensagem' => $mensagem
        ];
    }

    public function BuscInfoUsuario($id)
    {
        try
        {
            $filtro = [
                'id' => $id
            ];
            
            $conexao = new conexao();
            $dadosbd = $conexao->exe_query('SELECT apelido_usuario, email_usuario 
                                                    FROM usuarios 
                                                    WHERE id_usuario = :id',
                                                    $filtro);

                                            
            $data = [
                'nome' => $dadosbd[0]['apelido_usuario'],
                'email' => $dadosbd[0]['email_usuario']
            ];
            $status = true;
            $mensagem = 'Informações buscadas com sucesso';
        }
        catch (Exception $e)
        {
            $status = false;
            $mensagem = "Erro: " . $e->getMessage();
            
        }
        return[
            'status' => $status,
            'mensagem' => $mensagem,
            'data' => $data ?? null
        ];



        
    }

    public function buscarPerfilUsuario()
    {
        //todos os dados necessários para o perfil
    }

    public function buscarIdUsuario($email)
    {
        try
        {
            $param = ['email' => $email];

            $conexao = new conexao();
            //query para colocar os dados
            $bd = $conexao->exe_query("SELECT id_usuario 
                                            FROM usuarios 
                                            WHERE email_usuario = :email",
                                            $param);
            if(isset($bd[0]['id_usuario']))
            {
                $status = true;
                $mensagem = "Sucesso ao buscar Id";
                $id = $bd[0]['id_usuario'];
            }
            else
            {
                $status = false;
                $mensagem = "Falha ao buscar Id";
            }
        }
        catch (Exception $e)
        {
            $status = false;
            $mensagem = "Erro ao buscar Id do usuario: " . $e->getMessage();
        }

        return [
            'status' => $status,
            'mensagem' => $mensagem,
            'id' => $id ?? null
        ];

    }

    public function atualizarNovaSenha($senha, $id) //NovaSenha, porque é do esqueci senha
    {
        try
        {
            $params = [
                'senha' => password_hash($senha, PASSWORD_DEFAULT),
                'id' => $id
            ];

            $conexao = new conexao();

            $bd = $conexao->exe_query("UPDATE usuarios 
                                        SET senha_usuario = :senha 
                                        WHERE id_usuario = :id",
                                        $params);
            if(!empty($bd) && count($bd) > 0) //talvez dê problema???
            {
                $status = true;
                $mensagem = "Sucesso ao atualizar senha";
            }
            else
            {
                $status = false;
                $mensagem = "Falha ao atualizar senha";
            }

        }
        catch (Exception $e)
        {
            $status = false;
            $mensagem = "Erro ao atualizar senha: " . $e->getMessage();
        }

        return [
            'status' => $status,
            'mensagem' => $mensagem
        ];
    }


}
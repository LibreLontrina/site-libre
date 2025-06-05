<?php
    use Firebase\JWT\JWT;
    use Firebase\JWT\Key;

class jwtToken
{
    static function criarTokenWeb($nomeToken ,$id, $tipo, $key, $valid = 3600)
    {
        try
        {
            $payload = [
                'id' =>   $id,
                'tipo' => $tipo
            ];

            $jwt = JWT::encode($payload, $key, 'HS256');
            //$jwtdecoded = JWT::decode($jwt, new Key($chave, 'HS256'));
            
            $token = $jwt;
            //$cookie = setcookie($nomeToken, $token, time() + $valid, '/', '.libreleia.com.br', true, true);
            $cookie = setcookie($nomeToken, $token, [
                'expires' => time() + $valid,
                'path' => '/',
                'domain' => HOST_TOKEN_LOCALHOST,         //HOST_TOKEN_--- : NGROK, LOCALHOST, HOSTINGER
                'secure' => true,      
                'httponly' => true,     // Proibe acesso via JS
                'samesite' => 'None'    // pode ser 'Lax', 'Strict' ou 'None'
            ]);
            
            if(!$cookie)
            {
                throw new Exception("O cookie não foi criado");
            }
            else
            {
                $status = true;
                $mensagem = "O Token criado com sucesso";
            }

            
        }
        catch (Exception $e)
        {
            $status = false;
            $mensagem = $e;

        }

        return [
            'status' => $status,
            'mensagem' => $mensagem
        ];
    }
    static function criarTokenApp($id, $tipo, $key)
    {
        try
        {
            $payload = [
                'id' =>   $id,
                'tipo' => $tipo
            ];
            
            $jwt = JWT::encode($payload, $key, 'HS256');

            $token = $jwt;
            $status = true;
            $mensagem = "O Token criado com sucesso";
        }
        catch (Exception $e)
        {
            $status = false;
            $mensagem = $e;
        }
        
        return [
            'status' => $status,
            'mensagem' => $mensagem,
            'token' => $token ?? null
        ];
        
    }
    static function verifToken($key, $token)
    {
        try
        {
            $jwtdecoded = JWT::decode($token, new Key($key, 'HS256'));
            $dadosJson = (array) $jwtdecoded;
        
            $status = true;
            $mensagem = "token verificado";
            $dados = $dadosJson;

        }
        catch (Exception $e)
        {
            $status = false;
            $mensagem = "Erro em verificar o token: " . $e->getMessage();
        }

        return [
            'status' => $status,
            'mensagem' => $mensagem,
            'dados' => $dados ?? null
        ];
    }
    static function destruirTokenWeb($nomeToken)
    {
        //Essa função é apenas do web, pois o app tem que fazer isso no front dele
        try
        {
            if (!isset($_COOKIE[$nomeToken]))
            {
                $status = false;
                $mensagem = "Esse token não existe";
            }

            setcookie($nomeToken, "", [
                'expires' => time() - 3600,
                'path' => '/',
                'domain' => HOST_TOKEN_LOCALHOST,         //HOST_TOKEN_--- : NGROK, LOCALHOST, HOSTINGER
                'secure' => true,      // só funciona em HTTPS
                'httponly' => true,    // evita acesso via JS
                'samesite' => 'None'    // pode ser 'Lax', 'Strict' ou 'None'
            ]);

            $status = true;
            $mensagem = "Token excluido";
        }
        catch (Exception $e)
        {
            $status = false;
            $mensagem = "Erro ao destruir token: " . $e->getMessage();
        }

        return [
                "mensagem" => $mensagem,
                "status" => $status
            ];


    }

}

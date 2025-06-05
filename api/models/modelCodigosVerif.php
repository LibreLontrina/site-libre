<?php
    require_once __DIR__ . "/../../config/conexao.php";
    require_once __DIR__ . "/../vendor/autoload.php";

class modelCodigosVerif
{
    public function gerarCodigo($codigoVerf, $idUsuario, $tipoCodigo)
    {
        try
        {
            $params = [
                'codigo' => $codigoVerf,
                'idUsuario' => $idUsuario,
                'tipoCodigo' => $tipoCodigo
            ];

            $conexao = new conexao();
            $resp = $conexao->exe_query("INSERT INTO codigos_verificacao(id_usuario, codigo, tipo_codigo, expires_at) 
                                                VALUES
                                                (:idUsuario, :codigo, :tipoCodigo, DATE_ADD(NOW(), INTERVAL 1000 SECOND))", 
                                                $params);

            if($resp > 0)
            {
                $status = true;
                $mensagem = 'Criar código completo';
            }
            else
            {
                $status = false;
                $mensagem = 'falha em criar o código';
            }
        }
        catch(Exception $e)
        {
            $status = false;
            $mensagem = 'Erro em criar o código: ' . $e->getMessage();
        }

        return [
            'status' => $status,
            'mensagem' => $mensagem
        ];

    }

    public function buscarCodigo($id, $tipoCodigo)
    {
        try
        {
            $param = [
                'idUsuario' => $id,
                'tipoCodigo' => $tipoCodigo
            ];

            $conexao = new conexao();
            $resp = $conexao->exe_query("SELECT codigo 
                                                FROM codigos_verificacao 
                                                WHERE id_usuario = :idUsuario AND
                                                tipo_codigo = :tipoCodigo",
                                        $param);
                                        
            if(!isset($resp[0]['codigo']))
            {
                $status = false;
                $mensagem = "O codigo não existe";
            }
            
            $status = true;
            $mensagem = "O codigo existe";
            $codigo = $resp[0]['codigo'];
        }
        catch(Exception $e)
        {
            $status = false;
            $mensagem = "Erro ao verificar o código: " . $e->getMessage();
        }

        return [
            'status' => $status,
            'mensagem' => $mensagem,
            'codigo' => $codigo ?? null
        ];
    }



}
<?php
//require_once __DIR__ . "/../../config/cacert.pem"; COLOCAR ISSO POR CAUSA DO CURL
class googleBooksApi
{
    public function buscarPorId($idBookGoogle)
    {
        try
        {
            $url = "https://www.googleapis.com/books/v1/volumes/$idBookGoogle";

            $curl = curl_init();
            curl_setopt($curl, CURLOPT_URL, $url); // ESSA LINHA É OBRIGATÓRIA
            curl_setopt($curl,CURLOPT_RETURNTRANSFER, true);
            curl_setopt($curl, CURLOPT_CAINFO, __DIR__ . "/../../config/cacert.pem");
            $dados = curl_exec($curl);

            if ($dados === false)
            {
                echo 'Erro no cURL: ' . curl_error($curl);
                curl_close($curl);
                exit;
            }

            $dadosApi = json_decode($dados, true);
            
            $status = true;
            $mensagem = "Busca com sucesso";

        }
        catch (Exception $e)
        {
            $status = false;
            $mensagem = "Erro na busca: $e";
        }
        return [
            'status' => $status,
            'mensagem' => $mensagem,
            'dados' => $$dadosApi ?? null
        ];


    }

    public function buscaCarroceu($input)
    {

        try
        {
            $url = "https://www.googleapis.com/books/v1/volumes?q=$input";
            var_dump($url);
            exit;

            $curl = curl_init();
            curl_setopt($curl, CURLOPT_URL, $url); // ESSA LINHA É OBRIGATÓRIA
            curl_setopt($curl,CURLOPT_RETURNTRANSFER, true);
            curl_setopt($curl, CURLOPT_CAINFO, __DIR__ . "/../../config/cacert.pem");
            $dados = curl_exec($curl);

            if ($dados === false)
            {
                echo 'Erro no cURL: ' . curl_error($curl);
                curl_close($curl);
                exit;
            }

            $dadosApi = json_decode($dados, true);
            
            $status = true;
            $mensagem = "Busca com sucesso";

        }
        catch (Exception $e)
        {
            $status = false;
            $mensagem = "Erro na busca: $e";
        }
        return [
            'status' => $status,
            'mensagem' => $mensagem,
            'dados' => $dadosApi ?? null
        ];
        //``

    }



}
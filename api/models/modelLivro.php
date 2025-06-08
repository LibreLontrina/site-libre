<?php
    require_once __DIR__ . "/../../config/conexao.php";
    require_once __DIR__ . "/../vendor/autoload.php";
    require_once __DIR__ . "/../services/jwtToken.php";
    
class modelLivro
{
    public function verifLivro($idLivroGoogle)
    {
        try
        {
            $param = [
                'idLivro' => $idLivroGoogle
            ];
            $conexao = new conexao();
            $bd = $conexao->exe_query("SELECT id_livro 
                                            FROM livros 
                                            WHERE id_google_book = :idLivro",
                                            $param);

            if(!empty($bd) && count($bd) > 0)
            {
                $status = true;
                $mensagem = "O livro existe no banco: $idLivroGoogle";
            }
            else
            {
                $status = false;
                $mensagem = "Esse livro não existe no banco: $idLivroGoogle";
            }

        }
        catch (Exception $e)
        {
            $status = false;
            $mensagem = "Erro ao verificar Livro";
        }
        return [
            'status' => $status,
            'mensagem' => $mensagem
        ];
    }

    public function inserirLivro()
    {

    }

    public function buscarDadosLivro()
    {

    }




}
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

    public function inserirLivro($entidLivro)
    {
        try
        {
            $params = [
                'IdGoogle' =>    $entidLivro->getIdGoogle(),
                'Titulo' =>      $entidLivro->getTitulo(),
                'Autor' =>       $entidLivro->getAutor(),
                'Editora' =>     $entidLivro->getEditora(),
                'DtaPublic' =>   $entidLivro->getDtaPublic(),
                'Descr' =>       $entidLivro->getDescr(),      
                'Isbn' =>        $entidLivro->getIsbn(),
                'CaminhoLivro' =>$entidLivro->getCaminLivro()
            ];

            // var_dump($params);
            // exit;

            $conexao = new conexao();
            $bd = $conexao->exe_query("INSERT INTO livros (nome_livro, autor_livro, data_livro, descricao_livro, caminho_livro, ISBN_livro, id_google_book, editora_livro) 
                                              VALUES (:Titulo, :Autor, :DtaPublic, :Descr, :CaminhoLivro, :Isbn, :IdGoogle, :Editora)",
                                              $params);

            if(is_int($bd) && $bd > 0)
            {
                $status = true;
                $mensagem = "livro inserido";

            }
            else
            {
                $status = false;
                $mensagem = "falha ao inserir livro";
            }

        }
        catch (Exception $e)
        {
            $status = false;
            $mensagem = "Erro ao inserir livro: $e";
        }

        return [
            'status' => $status,
            'mensagem' => $mensagem
        ];
    }

    public function buscarDadosLivro()
    {

    }




}
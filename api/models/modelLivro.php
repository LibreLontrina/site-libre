<?php
    require_once __DIR__ . "/../../config/conexao.php";
    require_once __DIR__ . "/../vendor/autoload.php";
    require_once __DIR__ . "/../services/jwtToken.php";
        require_once __DIR__ . "/../services/response.php";
    
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
            $mensagem = "Erro ao verificar Livro: $e";
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
                'CaminhoLivro' =>$entidLivro->getCaminLivro(),
                'Capa' =>        $entidLivro->getCapa()
            ];

            // var_dump($params);
            // exit;

            $conexao = new conexao();
            $bd = $conexao->exe_query("INSERT INTO livros (nome_livro, autor_livro, data_livro, descricao_livro, caminho_livro, ISBN_livro, id_google_book, editora_livro, capa_livro) 
                                              VALUES (:Titulo, :Autor, :DtaPublic, :Descr, :CaminhoLivro, :Isbn, :IdGoogle, :Editora, :Capa)",
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

    public function buscarDadosLivro($idLivroGoogle)
    {
        try
        {
            $param = [
                'IdLivroGoogle' => $idLivroGoogle
            ];

            $conexao = new conexao();
            $bd = $conexao->exe_query("SELECT id_livro, nome_livro, autor_livro, data_livro, descricao_livro, editora_livro, capa_livro 
                                              FROM livros 
                                              WHERE id_google_book = :IdLivroGoogle",
                                              $param);

            
            if(!empty($bd) && count($bd) > 0)
            {
                $status = true;
                $mensagem = "Dados do livro: $idLivroGoogle , pegos com sucesso";
                $dados = $bd[0];
            }
            else
            {
                $status = false;
                $mensagem = "Falha ao pegar dados do livro: $idLivroGoogle";
            }
        }
        catch(Exception $e)
        {
            $status = false;
            $mensagem = "Erro ao buscar dados do Livro: $e";
        }
        return [
            'status' => $status,
            'mensagem' => $mensagem,
            'dados' => $dados ?? null
        ];

    }

    public function BuscarIdLivro($idLivroGoogle)
    {
        try
        {
            $param = [
                'IdLivroGoogle' => $idLivroGoogle
            ];

            $conexao = new conexao();
            $bd = $conexao->exe_query("SELECT id_livro
                                              FROM livros 
                                              WHERE id_google_book = :IdLivroGoogle",
                                              $param);
            
            if(!empty($bd) && count($bd) > 0)
            {
                $status = true;
                $mensagem = "ID do livro: $idLivroGoogle, pego com sucesso";
                $dados = $bd[0];
            }
            else
            {
                $status = false;
                $mensagem = "O livro: $idLivroGoogle , não existe";
            }
        }
        catch(Exception $e)
        {
            $status = false;
            $mensagem = "Erro ao buscar ID do Livro: $e";
        }
        return [
            'status' => $status,
            'mensagem' => $mensagem,
            'dados' => $dados ?? null
        ];
    }

    public function inserirGeneroLivro($idBD, $generos)
    {
        try
        {
            $idGeneros = [];

            $conexao = new conexao();
            foreach($generos as $genero)
            {
                $param = [
                    'genero' => $genero
                ];
                $bd = $conexao->exe_query("SELECT id_genero
                                                  FROM generos
                                                  WHERE genero = :genero",
                                                  $param);

                if(!empty($bd) && count($bd) > 0)
                {
                    $idGeneros[] = $bd[0]['id_genero'];
                }
                else
                {
                    $bdGenero = $conexao->exe_query("INSERT INTO generos (genero)
                                                            VALUE (:genero)", 
                                                            $param);

                    if(!is_int($bdGenero) || $bdGenero <= 0)
                    {
                        throw new Exception("Não foi possível adicionar o gênero na tabela");
                    }
                }
            }

            foreach($idGeneros as $idGenero)
            {
                $params = [
                    'idLivro' => $idBD,
                    'idGenero' => $idGenero
                ];

                $bdLivroGen = $conexao->exe_query("INSERT INTO livro_generos(id_genero, id_livro)
                                                   VALUE (:idGenero, :idLivro)",
                                                   $params);

                if(!is_int($bdLivroGen) || $bdLivroGen <= 0)
                {
                    throw new Exception("falha ao inserir Livro_genero");
                }

            }

            $status = true;
            $mensagem = "inserção de generos completa";
            
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

    public function buscarGeneroLivro($idBD)
    {
        try
        {
            $param = [
                'idLivro' => $idBD
            ];

            $conexao = new conexao();
            $bd = $conexao->exe_query("SELECT id_genero
                                              FROM livro_generos
                                              WHERE id_livro = :idLivro",
                                              $param);
            if(!empty($bd) && count($bd) > 0)
            {
                $idGeneros = [];
                for($i = 0; isset($bd[$i]); $i++)
                {
                    $idGeneros[] = $bd[$i]['id_genero'];
                }
            }
            else
            {
                throw new Exception("sla man");
            }

            $nomeGeneros = [];
            foreach($idGeneros as $idGenero)
            {
                $param = [
                    'idGenero' => $idGenero
                ];

                $bdGenero = $conexao->exe_query("SELECT genero
                                                 FROM generos
                                                 WHERE id_genero = :idGenero",
                                                 $param);
                if(!empty($bd) && count($bd) > 0)
                {
                    $nomeGeneros[] = $bdGenero[0]['genero'];
                }
                else
                {
                    throw new Exception("sla man");
                }

                $status = true;
                $mensagem = "Deu certo ao buscar os generos";
            }
        }
        catch(Exception $e)
        {
            $status = false;
            $mensagem = "Erro ao buscar os generos: " . $e->getMessage();
        }
        finally
        {
            return [
                'status' => $status,
                'mensagem' => $mensagem,
                'dados' => $nomeGeneros ?? null
            ];
        }
    }

}
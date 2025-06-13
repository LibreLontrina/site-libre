<?php

require_once __DIR__ . '/../utils/validarDados.php';
require_once __DIR__ . '/../utils/sanitarizarDados.php';
require_once __DIR__ . '/../entidades/entidLivro.php';
require_once __DIR__ . '/../models/modelLivro.php';
require_once __DIR__ . "/../models/modelCodigosVerif.php";
require_once __DIR__ . '/../services/response.php';
require_once __DIR__ . '/../services/googleBooksApi.php';
require_once __DIR__ . '/../services/codigosVerif.php';
require_once __DIR__ . '/../../config/config.php';

class controlLivro
{   
    
    public function verLivro()
    {
        $parametros = $_GET['parametros'];
        $idLivroGoogle = $parametros['l'];

        $modelLivro = new modelLivro();
        $verifLivro = $modelLivro->verifLivro($idLivroGoogle);

        //Response::criarResponse($resp['status'], $resp['mensagem']);
        if($verifLivro['status'] === true)
        {
            $dadosBD = $modelLivro->buscarDadosLivro($idLivroGoogle);

            Response::criarResponse($dadosBD['status'], $dadosBD['mensagem'], $dadosBD['dados'] ?? null);
        }

        $apiGoogle = new googleBooksApi();
        $dadosGoogle = $apiGoogle->buscarPorId($idLivroGoogle);

        if($dadosGoogle['status'] === false)
        {
            Response($dadosGoogle['status'], $dadosGoogle['mensagem']);
        }

        //CRIA A ENTIDADE LIVRO
        $entidLivro = new entidLivro();
        $entidLivro->setDadosGoogle($dadosGoogle['dados']);
        




        //COLOCA O LIVRO NO BANCO
        $modelLivro = new modelLivro();
        
        $resp = $modelLivro->inserirLivro($entidLivro);
        if($resp['status'] === false)
        {
            Response::criarResponse($resp['status'], $resp['mensagem']);
        }

        $idBD = $modelLivro->BuscarIdLivro($idLivroGoogle);
        if($idBD['status'] === false)
        {
            Response::criarResponse($idBD['status'], $idBD['mensagem'], $idBD['dados'] ?? null);
        }

        $generoBD = $modelLivro->inserirGeneroLivro($idBD['dados']['id_livro'], $entidLivro->getGenero());
        if($generoBD['status'] === false)
        {
            Response::criarResponse($generoBD['status'], $generoBD['mensagem']);
        }


        //Response::criarResponse($generoTela['status'], $generoTela['mensagem'], $generoTela['dados']);
            
        //PEGA OS DADOS DO LIVRO
        $verifLivro = $modelLivro->verifLivro($idLivroGoogle);
        if($verifLivro['status'] === true)
        {
            $dadosBD = $modelLivro->buscarDadosLivro($idLivroGoogle);

            $generoBD = $modelLivro->buscarGeneroLivro($idBD['dados']['id_livro']);
            if($generoBD['status'] === true)
            {
                $dadosBD['dados']['generos_livro'] = $generoBD['dados'];    
            }

            Response::criarResponse($dadosBD['status'], $dadosBD['mensagem'], $dadosBD['dados'] ?? null);
        }

        
        //TESTES
        $sla = [
            'setIdGoogle' =>    $entidLivro->getIdGoogle(),
            'setTitulo' =>      $entidLivro->getTitulo(),
            'setAutor' =>       $entidLivro->getAutor(),//$autores,
            'setEditora' =>     $entidLivro->getEditora(),
            'setDtaPublic' =>   $entidLivro->getDtaPublic(),
            'setDescr' =>       $entidLivro->getDescr(),      
            'setIsbn' =>        $entidLivro->getIsbn(),
            'setCaminho' =>     $entidLivro->getCaminLivro(),
            'setCapa' =>        $entidLivro->getCapa()
        ];

        var_dump($sla);
        exit;
    }
    
    public function carroceuLivros()
    {
        $parametros = $_GET['parametros'];
        $procura = $parametros['p'];

        $googleApi = new googleBooksApi();
        $resp = $googleApi->buscaCarroceu($procura);
        var_dump($parametros);
        exit;






    }
    public function buscarLivro()
    {
        $parametros = $_GET['parametros'];
        $idLivroGoogle = $parametros['l'];

        $modelLivro = new modelLivro();
        $verifLivro = $modelLivro->verifLivro($idLivroGoogle);

        //Response::criarResponse($resp['status'], $resp['mensagem']);
        if($verifLivro['status'] === true)
        {
            $dadosBD = $modelLivro->buscarDadosLivro($idLivroGoogle);

            $idBD = $modelLivro->BuscarIdLivro($idLivroGoogle);
            if($idBD['status'] === false)
            {
                Response::criarResponse($idBD['status'], $idBD['mensagem'], $idBD['dados'] ?? null);
            }

            $generoBD = $modelLivro->buscarGeneroLivro($idBD['dados']['id_livro']);
            if($generoBD['status'] === true)
            {
                $dadosBD['dados']['generos_livro'] = $generoBD['dados'];    
            }

            Response::criarResponse($dadosBD['status'], $dadosBD['mensagem'], $dadosBD['dados'] ?? null);
        }
        else
        {
            $this->inserirLivro($idLivroGoogle);
        }


    }
    public function inserirLivro($idLivroGoogle)
    {
        //PUXO OS DADOS DA API
        $apiGoogle = new googleBooksApi();
        $dadosGoogle = $apiGoogle->buscarPorId($idLivroGoogle);
        if($dadosGoogle['status'] === false)
        {
            Response($dadosGoogle['status'], $dadosGoogle['mensagem']);
        }

        //CRIA A ENTIDADE LIVRO
        $entidLivro = new entidLivro();
        $entidLivro->setDadosGoogle($dadosGoogle['dados']);

        //COLOCA O LIVRO NO BANCO
        $modelLivro = new modelLivro();
        $resp = $modelLivro->inserirLivro($entidLivro);
        if($resp['status'] === false)
        {
            Response::criarResponse($resp['status'], $resp['mensagem']);
        }

        //BUSCO O ID PARA COLOCAR O GENERO
        $idBD = $modelLivro->BuscarIdLivro($idLivroGoogle);
        if($idBD['status'] === false)
        {
            Response::criarResponse($idBD['status'], $idBD['mensagem'], $idBD['dados'] ?? null);
        }

        //RELACIONO GENEROS COM ID
        $generoBD = $modelLivro->inserirGeneroLivro($idBD['dados']['id_livro'], $entidLivro->getGenero());
        if($generoBD['status'] === false)
        {
            Response::criarResponse($generoBD['status'], $generoBD['mensagem']);
        }

        $this->buscarLivro();  
    }






}
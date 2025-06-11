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

        $entidLivro = new entidLivro();
        $entidLivro->setDadosGoogle($dadosGoogle['dados']);

        $modelLivro = new modelLivro();
        $resp = $modelLivro->inserirLivro($entidLivro);
        if($resp['status'] === false)
        {
            Response::criarResponse($resp['status'], $resp['mensagem']);
        }

        $verifLivro = $modelLivro->verifLivro($idLivroGoogle);
        if($verifLivro['status'] === true)
        {
            $dadosBD = $modelLivro->buscarDadosLivro($idLivroGoogle);
            Response::criarResponse($dadosBD['status'], $dadosBD['mensagem'], $dadosBD['dados'] ?? null);
        }






        /*
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
*/

        //verificar se já existe no banco



    }




}
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
        $idLivro = $parametros['l'];

        $modelLivro = new modelLivro();
        $verifLivro = $modelLivro->verifLivro($idLivro);

        //Response::criarResponse($resp['status'], $resp['mensagem']);
        if($verifLivro['status'] === true)
        {
            $dadosBD = $modelLivro->buscarDadosLivro($idLivro);
            Response::criarResponse($dadosBD['status'], $dadosBD['mensagem'], $dadosBD['dados'] ?? null);
        }

        $apiGoogle = new googleBooksApi();
        $dadosGoogle = $apiGoogle->buscarPorId($idLivro);

        if($dadosGoogle['status'] === false)
        {
            Response($dadosGoogle['status'], $dadosGoogle['mensagem']);
        }

        $entidLivro = new entidLivro();
        $entidLivro->setDadosGoogle($dadosGoogle['dados']);

        //TESTE GRANDE
        $sla = [
            'setIdGoogle' =>    $entidLivro->getIdGoogle(),
            'setTitulo' =>      $entidLivro->getTitulo(),
            'setAutor' =>       $entidLivro->getAutor(),      //transformar array em String
            'setEditora' =>     $entidLivro->getEditora(),
            'setDtaPublic' =>   $entidLivro->getDtaPublic(),
            'setDescr' =>       $entidLivro->getDescr(),      //Preciso limitar a descrição aos 300 caracteres
            'setIsbn' =>        $entidLivro->getIsbn()
        ];

        var_dump($sla);
        exit;


        //verificar se já existe no banco






    }




}
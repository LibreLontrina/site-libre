<?php

class entidLivro
{
    private $idGoogle, $titulo, $autor, $editora, $dtaPublic, $descr, $isbn; 

    public function setDadosGoogle($dados)
    {
        $this->setIdGoogle     ($dados['id'] ?? null);
        $this->setTitulo       ($dados['volumeInfo']['title'] ?? null);
        $this->setAutor        ($dados['volumeInfo']['authors'] ?? null);
        $this->setEditora      ($dados['volumeInfo']['publisher'] ?? null);
        $this->setDtaPublic    ($dados['volumeInfo']['publishedDate'] ?? null);
        $this->setDescr        ($dados['volumeInfo']['description'] ?? null);
        $this->setIsbn         ($dados['volumeInfo']['industryIdentifiers']['1']['identifier'] ??
                                      ['volumeInfo']['industryIdentifiers']['0']['identifier'] ?? 
                                      null);
    }

    private function setIdGoogle($idGoogle)
    {
        if(empty($idGoogle))
        {
            return;
        }

        $this->idGoogle = $idGoogle;
    }
    public function getIdGoogle()
    {
        return $this->idGoogle;
    }

    private function setTitulo($titulo)
    {
        if(empty($titulo))
        {
            return;
        }

        $this->titulo = $titulo;
    }
    public function getTitulo()
    {
        return $this->titulo;
    }

    private function setAutor($autor)
    {
        if(empty($autor))
        {
            return;
        }

        $this->autor = $autor;
    }
    public function getAutor()
    {
        return $this->autor;
    }

    private function setEditora($editora)
    {
        if(empty($editora))
        {
            return;
        }

        $this->editora = $editora;
    }
    public function geteditora()
    {
        return $this->editora;
    }

    private function setDtaPublic($dtaPublic)
    {
        if(empty($dtaPublic))
        {
            return;
        }

        $this->dtaPublic = $dtaPublic;
    }
    public function getDtaPublic()
    {
        return $this->dtaPublic;
    }

    private function setDescr($descr)
    {
        if(empty($descr))
        {
            return;
        }

        $this->descr = $descr;
    }
    public function getDescr()
    {
        return $this->descr;
    }

        private function setIsbn($isbn)
    {
        if(empty($isbn))
        {
            return;
        }

        $this->isbn = $isbn;
    }
    public function getIsbn()
    {
        return $this->isbn;
    }
}
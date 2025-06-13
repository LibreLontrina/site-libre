<?php

class entidLivro
{
    private $idGoogle, $titulo, $autor, $editora, $dtaPublic, $descr, $isbn, $CaminLivro, $capa, $genero;
    private const traducao = [
        'History' => 'História',
        'Political Science' => 'Ciência Política',
        'Social Science' => 'Ciências Sociais',
        'Philosophy' => 'Filosofia',
        'Fiction' => 'Ficção',
        'Biography & Autobiography' => 'Biografia',
        'Education' => 'Educação',
        'Europe' => 'Europa',
        'General' => 'Geral',
        'Fantasy' => 'Fantasia'

    ];

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
        $this->setCaminLivro   (null);
        $this->setCapa         ($dados['volumeInfo']['imageLinks']['extraLarge'] ??
                                $dados['volumeInfo']['imageLinks']['large'] ??
                                $dados['volumeInfo']['imageLinks']['medium'] ??
                                $dados['volumeInfo']['imageLinks']['thumbnail'] ??
                                $dados['volumeInfo']['imageLinks']['smallThumbnail'] ??
                                null);
        $this->setGenero        ($dados['volumeInfo']['categories'] ?? null);
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
        if (empty($autor)) 
        {
            $this->autor = null;
            return;
        }

        // Se for string simples
        if (is_string($autor)) 
        {
            $this->autor = $autor;
            return;
        }

        // Se for array
        if (is_array($autor)) 
        {
            $this->autor = implode(', ', $autor);
            return;
        }

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

        $this->descr = strip_tags($descr);
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


    private function setCaminLivro($caminho)
    {
        if(empty($caminho))
        {
            return;
        }

        $this->CaminLivro = $caminho;
    }
    public function getCaminLivro()
    {
        return $this->CaminLivro;
    }

    private function setCapa($capa)
    {
        if(empty($capa))
        {
            return;
        }

        $this->capa = $capa;
    }
    public function getCapa()
    {
        return $this->capa;
    }

    private function setGenero($genero)
    {
        if(empty($genero))
        {
            return;
        }

        $categ = $this->CategPrincipais($genero);
        if(!is_array($categ))
        {
            return;
        }

        $this->genero = $categ;
    }
    public function getGenero()
    {
        return $this->genero;
    }

    private function CategPrincipais(array $categorias, $maxCategorias = 3): array 
    {
        $contagem = [];

        foreach ($categorias as $linha) 
        {
            $partes = explode(' / ', $linha);
            foreach (array_slice($partes, 0, 3) as $parte) 
            {
                $contagem[$parte] = ($contagem[$parte] ?? 0) + 1;
            }
        }

        // Ordena por frequência
        arsort($contagem);

        // Traduz e filtra duplicatas
        $resultado = [

        ];

        foreach (array_keys($contagem) as $categoriaEn) 
        {
            $traducao = self::traducao[$categoriaEn] ?? ucfirst(strtolower($categoriaEn));

            if (!in_array($traducao, $resultado)) 
            {
                $resultado[] = $traducao;
            }
            if (count($resultado) >= $maxCategorias) 
            {
                break;
            }
        }

         return $resultado;

    }

}
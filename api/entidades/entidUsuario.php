<?php
class entidUsuario {
    private $nome, $username, $email, $tel, $dtaNasc, $senha; 

    public function setDados($dados)
    {
        $this->setNome($dados['nome'] ?? null);
        $this->setUsername($dados['username'] ?? null);
        $this->setEmail($dados['email'] ?? null);
        $this->setTel($dados['tel'] ?? null);
        $this->setdtaNasc($dados['dtaNasc'] ?? null);
        $this->setSenha($dados['senha'] ?? null);
    }

    //---- NOME
    public function setNome($nome)
    {
        if(empty($nome))
        {
            return;
        }

        $this->nome = $nome;
    }
    public function getNome()
    {
        return $this->nome;
    }

    //---- USERNAME
    public function setUsername($username)
    {
        $this->username = $username;
    }
    public function getUsername()
    {
        return $this->username;
    }

    //---- EMAIL
    public function setEmail($email)
    {
        $this->email = $email;
    }
    public function getEmail()
    {
        return $this->email;
    }

    //---- TELEFONE
    public function setTel($tel)
    {
        $this->tel = $tel;
    }
    public function getTel()
    {
        return $this->tel;
    }

    //---- DATA DE NASCIMENTO
    public function setdtaNasc($dtaNasc)
    {
        $this->dtaNasc = $dtaNasc;
    }
    public function getdtaNasc()
    {
        return $this->dtaNasc;
    }

    //---- SENHA
    public function setSenha($senha)
    {
        if(empty($senha))
        { 
            return;
        }
        $this->senha = $senha;
    }
    public function getSenha()
    {
        return $this->senha;
    }

}

?>
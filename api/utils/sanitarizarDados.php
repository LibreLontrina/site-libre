<?php
class sanitarizarDados
{
    private $nome, $username, $email, $tel, $dtaNasc, $senha, $login;

    public function sanitDados($dados)
    {
        $this->nome     = $this->sanitNome($dados['nome'] ?? null);
        $this->username = $this->sanitUsername($dados['username'] ?? null);
        $this->email    = $this->sanitEmail($dados['email'] ?? null);
        $this->tel      = $this->sanitTel($dados['tel'] ?? null);
        $this->dtaNasc  = $this->sanitDtaNasc($dados['dtaNasc'] ?? null);
        $this->senha    = $this->sanitSenha($dados['senha'] ?? null);
        $this->login    = $this->sanitLogin($dados['login'] ?? null);

        return [
            'nome'     => $this->nome,
            'username' => $this->username,
            'email'    => $this->email,
            'tel'      => $this->tel,
            'dtaNasc'  => $this->dtaNasc,
            'senha'    => $this->senha,
            'login'    => $this->login
        ];
    }



    
    private function sanitNome($nome)
    {
        if (empty($nome))
        {
            return;
        }
        $nome = trim($nome);
        $nome = htmlspecialchars(strip_tags($nome), ENT_QUOTES, 'UTF-8');
        return $nome;
    }
    private function sanitUsername($username)
    {
        if (empty($username))
        {
            return;
        }
        $username = trim($username);
        $username = preg_replace('/[^a-zA-Z0-9_]/', '', $username);
        return $username;
    }
    private function sanitEmail($email)
    {
        if (empty($email))
        {
            return;
        }
        $email = trim($email);
        return filter_var($email, FILTER_SANITIZE_EMAIL);
    }
    private function sanitTel($tel)
    {
        if (empty($tel))
        {
            return;
        }
        $tel = preg_replace('/[^0-9]/', '', $tel);
        return $tel;
    }
    private function sanitDtaNasc($data)
    {
        if (empty($data))
        {
            return;
        }
        $data = trim($data);

        if (strpos($data, '/') !== false) 
        {
            $partes = explode('/', $data);
            if (count($partes) === 3) 
            {
                $data = "{$partes[2]}-{$partes[1]}-{$partes[0]}";
            }
        }
        return $data;
    }
    private function sanitSenha($senha)
    {
        if (empty($senha))
        {
            return;
        }
        $senha = trim($senha);
        return htmlspecialchars($senha, ENT_QUOTES, 'UTF-8');
    }
    private function sanitLogin($login)
    {
        if (empty($login))
        {
            return;
        }
        if (filter_var($login, FILTER_VALIDATE_EMAIL)) 
        {
            return filter_var($login, FILTER_SANITIZE_EMAIL);
        }
        else 
        {
            return preg_replace('/[^a-zA-Z0-9._-]/', '', $login);
        }
    }


}












?>
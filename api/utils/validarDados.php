<?php
require_once __DIR__ . "/../models/modelUsuario.php";
class validarDados
{
    public $error = [];

    public function validCadastro($dados)
    {
        $this->validNome    (       $dados['nome'] ?? null);
        $this->validUsername(   $dados['username'] ?? null);
        $this->validEmail   (      $dados['email'] ?? null);
        $this->validTel     (        $dados['tel'] ?? null);
        $this->validDtaNasc (    $dados['dtaNasc'] ?? null);
        $this->validSenha   (      $dados['senha'] ?? null);

        return $this->error;
    }

    private function validNome($nome)
    {
        if(empty($nome))
        {
            $this->error['nome'] = 'Esse campo é obrigatório';
            return;
        }
        else if (strlen($nome) < 1)
        {
            $this->error['nome'] = 'digite um nome';
        }

        
    }
    private function validUsername($username)
    {
        if(empty($username))
        {
            $this->error['usuario'] = 'Username: Esse campo é obrigatório';
            return;
        }
        else if (strlen($username) < 3 || strlen($username) > 20)
        {
            $this->error['usuario'] = "Username: O nome de usuario deve ter entre 3 e 20 caracteres.";
        }
        else if (!preg_match('/^[a-zA-Z][a-zA-Z0-9._]{2,19}$/', $username)) 
        {
            $this->error['usuario'] = 'Nome de usuário inválido';
        }

    }
    private function validEmail($email)
    {
        if(empty($email))
        {
            $this->error['email'] = 'Esse campo é obrigatório';
            return;
        }
        else if (!filter_var($email, FILTER_VALIDATE_EMAIL))
        {
            $this->error['email'] = 'Email inválido';
        }
    }
    private function validTel($tel)
    {
        if(empty($tel))
        {
            $this->error['tel'] = 'Esse campo é obrigatório';
            return;
        }   
        else if(!preg_match('/^[0-9]{10,11}$/', $tel))
        {
            $this->error['tel'] = 'Telefone inválido';
        }
    }
    private function validDtaNasc($dtaNasc)
    {
         // ou 'd/m/Y' dependendo do formato
        if (!is_string($dtaNasc) || trim($dtaNasc) === '') 
        {
            $this->error['dtaNasc'] = 'Esse campo é obrigatório';
            return;
        }

        $dataFormatada = DateTime::createFromFormat('Y-m-d', $dtaNasc);
        if(!$dataFormatada || $dataFormatada->format('Y-m-d') !== $dtaNasc) 
        {
            $this->error['dtaNasc'] = 'Data de nascimento inválida';
        }
        else
        {
            $hoje = new DateTime();
            $idade = $hoje->diff($dataFormatada)->y;

            if($idade < 13) 
            {
                $this->error['dtaNasc'] = 'É necessário ter ao menos 13 anos';
            }
        }
    }
    public function validSenha($senha)
    {
        if(empty($senha))
        {
            $this->error['senha'] = 'Esse campo é obrigatório';
            return;
        }
        else if (strlen($senha) < 6) 
        {
            $this->error['senha'] = "A senha deve ter pelo menos 6 caracteres.";
        }
        else if (!preg_match('/[A-Za-z]/', $senha) || !preg_match('/[0-9]/', $senha)) 
        {
            $this->error['senha'] = "A senha deve conter letras e números.";
        }


    }

}


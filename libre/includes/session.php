<?php
session_start();

if (!isset($_SESSION['usuario'])) {
    // Redireciona ou define usuário padrão se ainda não estiver logado
    $_SESSION['usuario'] = 'visitante';
}

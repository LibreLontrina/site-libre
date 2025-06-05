<?php
require_once __DIR__ . '/vendor/autoload.php';
require_once __DIR__ . '/../config/config.php';

header("Access-Control-Allow-Origin: " . HEADER_ALLOW_NGROK); //caso esteja no hostgator, troque para HEADER_ALLOW_HOSTINGER
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Type, Authorization, dispositivo");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200); // Envia status OK
    exit(); // Encerra o script antes de qualquer outra lógica
}

$uri = $_SERVER['REQUEST_URI'];
$uribase = '/TESTE5/api/';

if(strpos($uri, $uribase) === 0)
{
    $uri = substr($uri,strlen($uribase));
}

$endpoint = explode('/', trim($uri, '/'));

$entidade = $endpoint[0];
$acao = $endpoint[1] ?? null;

//echo json_encode( $uri . "    entidade:" . $entidade . "    Acao:" . $acao);

$rotas = [
    'usuario' => [
        'cadastrar' => ['controlUsuario', 'cadastrar'],     //falta confsenha
        'logar' => ['controlUsuario', 'logar'],             //falta esqueci senha
        'preVisuLogin' => ['controlUsuario','preVisuLogin'], 
        'codVerifCad' => ['controlUsuario','codVerifCad'],
        'deletar',
        'PerfilAddFoto' => ['controlUsuario','AddFoto']
    ],
    'admin' => [
        'logar' => ['controlAdmin','logarAdm'],
        'listarContato',
        'listarDenuncias',
        'silenciarUsuario',
        'banirUsuario'

    ],
    'suporte'=> [
        'logar'=> ['controlSuporte','logarSup'],
        'listarAdms'=> ['controlSuporte','listarAdms'],
        'cadastrarAdm'=> ['controlSuporte','cadatrarAdm'],
        'deletarAdm'=> ['controlSuporte','deletarAdm']
    ],
    'livro' => [
        'inserir',
        'pesquisar',
        'atualizar',
        'deletar'
    ],
    'comum' => [
        'logout' => ['controlComum','logoutWeb'],
        'verifToken' => ['controlComum','verifToken'],
        'verifAccess' => ['controlComum','verifAccess'],
        'esqueciSenha' => ['controlComum','esqueciSenha'],
        'verifEsqueciSenha' => ['controlComum','verifEsqueciSenha'],
        'novaSenha' => ['controlComum','atualizarSenha']
    ]
];

if(isset($rotas[$entidade][$acao]))
{
    
    [$controller , $metodo] = $rotas[$entidade][$acao];

    //echo json_encode([$controller , $metodo]);
    
    require_once __DIR__ . "/controllers/{$controller}.php";
    
    $objController = new $controller();
    $objController->$metodo();
    
}
else {
    http_response_code(404);
    echo json_encode(['erro' => 'Rota não encontrada']);
}


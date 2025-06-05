<?php
require_once __DIR__ . '/config.php';

class conexao 
{
    private static $host = DB_SERVER;
    private static $dbname = DB_NAME;
    private static $dbchar = DB_CHARSET;
    private static $usuario = DB_USER;
    private static $dbpass = DB_PASSWORD;

    public function exe_query($query, $params = null)
    {
        try
        {
            $dns = "mysql:host=".self::$host.
                        ";dbname=".self::$dbname.
                        ";charset=".self::$dbchar;

            $pdo = new PDO($dns, self::$usuario, self::$dbpass);
            $pdo-> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            if(strpos($query, 'SELECT') === 0)
            { // opção para select 
                try
                {
                    if(empty($params))
                    {
                        $gestor = $pdo->prepare($query);
                        $gestor->execute();
                        $resultados = $gestor->fetchAll(PDO::FETCH_ASSOC);
                    }
                    else
                    {
                        $gestor = $pdo->prepare($query);
                        $gestor->execute($params);
                        $resultados = $gestor->fetchAll(PDO::FETCH_ASSOC);
                    }

                    $pdo = null; //fecha o banco 
                    return $resultados;
                }
                catch(PDOException $e)
                {
                    die("Erro SQL: " . $e->getMessage());
                }
            }
            else
            { // opção para update, delete, insert 
                try
                {
                    $pdo-> beginTransaction();
                    if(empty($params))
                    {
                        $gestor = $pdo->prepare($query);
                        $gestor->execute();
                    }
                    else
                    {
                        $gestor = $pdo->prepare($query);
                        $gestor->execute($params);
                    }
                    $pdo-> commit();

                    $pdo = null; //fecha o banco
                    return $gestor->rowCount();
                }
                catch(PDOException $e)
                {
                    $pdo->rollback();
                    return $e->getMessage();
                }

            }


        }
        catch (PDOException $e)
        {
            $e = $e->getMessage();
            $pdo = null;
            die('Erro: ' . $e);
        } 
    }
}



















?>
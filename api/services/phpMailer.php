<?php
    require_once __DIR__ . "/../services/response.php";
    require_once __DIR__ . "/../../config/config.php";
    use PHPMailer\PHPMailer\PHPMailer;
    use PHPMailer\PHPMailer\SMTP;
    use PHPMailer\PHPMailer\Exception;

class phpMailerClass
{
    
    public function enviarEmail($emailUsuario, $codVerif, $tipoEmail)
    {
        try 
        {
            $mail = new PHPMailer(true);
            
            //Server settings
            $mail->SMTPDebug = SMTP::DEBUG_OFF; //Posso colocar outros tipos de dbug, DEBUG_OFF, DEBUG_CLIENT
            $mail->isSMTP();
            $mail->Host       = MAILER_HOST;
            $mail->SMTPAuth   = true;                                   
            $mail->Username   = MAILER_EMAIL; 
            $mail->Password   = MAILER_PASSWORD;
            $mail->SMTPSecure = 'tls';
            $mail->Port       = MAILER_PORT;

            //Recipients
            $mail->setFrom(MAILER_EMAIL, 'LIBRE');
            $mail->addAddress($emailUsuario);
            //$mail->addAddress('libre.noreply@gmail.com');

            switch($tipoEmail)
            {
                case 'verif_email':
                    //Content
                    $mail->isHTML(true);
                    $mail->Subject  = 'Código de Verificação';

                    $mail->Body     = '<br>Agora que o email está <b>CHEGANDO!</b>';
                    $mail->Body    .= '<br>É Preciso <b>Confirma-lo!</b>';
                    $mail->Body    .= '<br>Seu código de verificação é: <b>'. $codVerif .'</b>';
                    $mail->Body    .= '<br><h3>Seu código expira em 15 minutos</h3>';

                break;

                case 'esqueci_senha':
                    //Content
                    $mail->isHTML(true);
                    $mail->Subject  = 'Esqueci Senha';

                    $mail->Body     = '<br>Você disse que esqueceu sua <b>SENHA?</b>';
                    $mail->Body    .= '<br>Eu <b>TAMBÉM</b>';
                    $mail->Body    .= '<br>Para a troca de senha, é necessário colocar esse código';
                    $mail->Body    .= '<br>para termos certeza que você é <b>VOCÊ</b> mesmo!';
                    $mail->Body    .= '<br>Seu código de esqueci senha é: <b>'. $codVerif .'</b>';
                    $mail->Body    .= '<br><h3>Seu código expira em 15 minutos</h3>';

                break;

                default:
                    throw new Exception("Tipo de email inválido: $tipoEmail");
            }

            $mail->send();
            //Response::criarResponse(true,'email mandado!');
            $status = true;
            $mensagem = 'email enviado!';

        }
        catch (Exception $e)
        {
            $status = false;
            $mensagem = 'Erro em enviar o código de verificação de email: ' . $e->getMessage();

        }
        return [
            'status' => $status,
            'mensagem' => $mensagem
        ];


    }











}
<?php
class codigosVerif
{
    static function criarCodVerif()
    {
        $codigo = strtoupper(substr(bin2hex(random_bytes(4)), 0, 6));
        return $codigo;
    }
    static function sanitCodVerif($codigo)
    {
        // Remove tudo que não for letra ou número
        $codigoLimpo = preg_replace('/[^a-zA-Z0-9]/', '', $codigo);

        // Garante que tem exatamente 6 caracteres
        if (strlen($codigoLimpo) !== 6) 
        {
            $status = false;
            $mensagem = "O codigo não tem 6 caracteres";
        }

        $status = true;
        $mensagem = "Codigo Sanitarizado";
        $codigo = strtoupper($codigoLimpo);

        return [
            'status' => $status,
            'mensagem' => $mensagem,
            'codigo' => $codigo ?? null
        ];
    }
}
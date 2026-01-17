package com.clinica.agendamento.exception.back;

public class ErroProcessamentoException extends RuntimeException {

    public ErroProcessamentoException(String mensagem) {
        super(mensagem);
    }

    public static ErroProcessamentoException criarPadrao() {
        return new ErroProcessamentoException("Erro interno ao processar a requisição.");
    }
}

package com.clinica.agendamento.exception.front;

public class AcessoNegadoException extends RuntimeException {

    public AcessoNegadoException(String mensagem) {
        super(mensagem);
    }

    public static AcessoNegadoException criarPadrao() {
        return new AcessoNegadoException("Acesso negado.");
    }
}

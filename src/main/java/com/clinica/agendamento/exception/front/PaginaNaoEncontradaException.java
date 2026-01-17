package com.clinica.agendamento.exception.front;

public class PaginaNaoEncontradaException extends RuntimeException {

    public PaginaNaoEncontradaException(String mensagem) {
        super(mensagem);
    }

    public static PaginaNaoEncontradaException criarPadrao() {
        return new PaginaNaoEncontradaException("Página não encontrada.");
    }
}

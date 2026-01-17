package com.clinica.agendamento.exception.domain;

public class AgendamentoInvalidoException extends RuntimeException {

    public AgendamentoInvalidoException(String mensagem) {
        super(mensagem);
    }

    public static AgendamentoInvalidoException criarPadrao() {
        return new AgendamentoInvalidoException("Dados do agendamento inválidos.");
    }
}

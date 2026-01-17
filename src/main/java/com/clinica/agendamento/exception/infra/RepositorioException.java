package com.clinica.agendamento.exception.infra;

public class RepositorioException extends RuntimeException {

    public RepositorioException(String mensagem) {
        super(mensagem);
    }

    public static RepositorioException criarPadrao() {
        return new RepositorioException("Erro ao acessar o repositório de dados.");
    }
}

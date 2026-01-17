package com.clinica.agendamento.repository.impl;

import com.clinica.agendamento.dto.AgendamentoDTO;
import com.clinica.agendamento.exception.infra.RepositorioException;
import com.clinica.agendamento.repository.AgendamentoRepository;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Repository
public class AgendamentoRepositoryMemory implements AgendamentoRepository {

    private final List<AgendamentoDTO> bancoEmMemoria = new ArrayList<>();

    @Override
    public List<AgendamentoDTO> listarTodos() {
        try {
            return Collections.unmodifiableList(bancoEmMemoria);
        } catch (Exception e) {
            throw RepositorioException.criarPadrao();
        }
    }

    @Override
    public void salvar(AgendamentoDTO agendamento) {
        try {
            bancoEmMemoria.add(agendamento);
        } catch (Exception e) {
            throw RepositorioException.criarPadrao();
        }
    }
}

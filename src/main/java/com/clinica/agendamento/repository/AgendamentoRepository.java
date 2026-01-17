package com.clinica.agendamento.repository;

import com.clinica.agendamento.dto.AgendamentoDTO;

import java.util.List;

public interface AgendamentoRepository {

    List<AgendamentoDTO> listarTodos();

    void salvar(AgendamentoDTO agendamento);
}

package com.clinica.agendamento.usecase;

import com.clinica.agendamento.dto.AgendamentoDTO;
import com.clinica.agendamento.service.AgendamentoService;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ListarAgendamentosUseCase {

    private final AgendamentoService service;

    public ListarAgendamentosUseCase(AgendamentoService service) {
        this.service = service;
    }

    public List<AgendamentoDTO> executar() {
        return service.listarTodos();
    }
}

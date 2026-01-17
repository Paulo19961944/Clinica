package com.clinica.agendamento.usecase;

import com.clinica.agendamento.dto.AgendamentoDTO;
import com.clinica.agendamento.form.AgendamentoForm;
import com.clinica.agendamento.service.AgendamentoService;
import org.springframework.stereotype.Component;

@Component
public class CriarAgendamentoUseCase {

    private final AgendamentoService service;

    public CriarAgendamentoUseCase(AgendamentoService service) {
        this.service = service;
    }

    public AgendamentoDTO executar(AgendamentoForm form) {
        return service.criar(form);
    }
}

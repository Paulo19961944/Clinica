package com.clinica.agendamento.service;

import com.clinica.agendamento.dto.AgendamentoDTO;
import com.clinica.agendamento.exception.domain.AgendamentoInvalidoException;
import com.clinica.agendamento.factory.AgendamentoFactory;
import com.clinica.agendamento.form.AgendamentoForm;
import com.clinica.agendamento.repository.AgendamentoRepository;
import com.clinica.agendamento.validation.AgendamentoValidator;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AgendamentoService {

    private final AgendamentoRepository repository;
    private final AgendamentoValidator validator;

    public AgendamentoService(AgendamentoRepository repository,
                              AgendamentoValidator validator) {
        this.repository = repository;
        this.validator = validator;
    }

    public List<AgendamentoDTO> listarTodos() {
        return repository.listarTodos();
    }

    public AgendamentoDTO criar(AgendamentoForm form) {
        validator.validar(form);

        AgendamentoDTO dto = AgendamentoFactory.criarAPartirDoForm(form);
        repository.salvar(dto);

        return dto;
    }
}

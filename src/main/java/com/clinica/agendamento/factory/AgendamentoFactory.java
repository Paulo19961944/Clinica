package com.clinica.agendamento.factory;

import com.clinica.agendamento.dto.AgendamentoDTO;
import com.clinica.agendamento.form.AgendamentoForm;

import java.util.UUID;

public final class AgendamentoFactory {

    private AgendamentoFactory() {}

    public static AgendamentoDTO criarAPartirDoForm(AgendamentoForm form) {
        return AgendamentoDTO.builder()
                .id(UUID.randomUUID().toString())
                .nomePaciente(form.getNomePaciente())
                .nomeMedico(form.getNomeMedico())
                .data(form.getData())
                .horario(form.getHorario())
                .especialidade(form.getEspecialidade())
                .build();
    }
}

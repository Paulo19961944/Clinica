package com.clinica.agendamento.validation;

import com.clinica.agendamento.exception.domain.AgendamentoInvalidoException;
import com.clinica.agendamento.form.AgendamentoForm;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

@Component
public class AgendamentoValidator {

    public void validar(AgendamentoForm form) {

        if (form == null) {
            throw new AgendamentoInvalidoException("Formulário de agendamento não pode ser nulo.");
        }

        if (!StringUtils.hasText(form.getNomePaciente())) {
            throw new AgendamentoInvalidoException("Nome do paciente é obrigatório.");
        }

        if (!StringUtils.hasText(form.getNomeMedico())) {
            throw new AgendamentoInvalidoException("Nome do médico é obrigatório.");
        }

        if (!StringUtils.hasText(form.getData())) {
            throw new AgendamentoInvalidoException("Data do agendamento é obrigatória.");
        }

        if (!StringUtils.hasText(form.getHorario())) {
            throw new AgendamentoInvalidoException("Horário do agendamento é obrigatório.");
        }

        if (!StringUtils.hasText(form.getEspecialidade())) {
            throw new AgendamentoInvalidoException("Especialidade é obrigatória.");
        }
    }
}

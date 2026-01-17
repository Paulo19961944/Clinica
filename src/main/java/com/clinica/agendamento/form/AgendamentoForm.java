package com.clinica.agendamento.form;

import jakarta.validation.constraints.NotBlank;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class AgendamentoForm {

    @NotBlank(message = "Nome do paciente é obrigatório")
    private String nomePaciente;

    @NotBlank(message = "Nome do médico é obrigatório")
    private String nomeMedico;

    @NotBlank(message = "Data do agendamento é obrigatória")
    private String data;

    @NotBlank(message = "Horário do agendamento é obrigatório")
    private String horario;

    @NotBlank(message = "Especialidade é obrigatória")
    private String especialidade;

}

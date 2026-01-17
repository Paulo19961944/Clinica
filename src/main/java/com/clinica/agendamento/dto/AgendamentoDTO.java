package com.clinica.agendamento.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class AgendamentoDTO {

    private String id;
    private String nomePaciente;
    private String nomeMedico;
    private String data;
    private String horario;
    private String especialidade;

}

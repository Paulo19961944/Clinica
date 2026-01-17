package com.clinica.agendamento.controller;

import com.clinica.agendamento.form.AgendamentoForm;
import com.clinica.agendamento.usecase.ListarAgendamentosUseCase;
import com.clinica.agendamento.util.ViewConstants;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Collections;

@Controller
@RequestMapping("/agendamentos")
public class AgendamentoController {

    private final ListarAgendamentosUseCase listarAgendamentosUseCase;

    public AgendamentoController(ListarAgendamentosUseCase listarAgendamentosUseCase) {
        this.listarAgendamentosUseCase = listarAgendamentosUseCase;
    }

    @GetMapping
    public String listar(Model model) {
        model.addAttribute("agendamentos",
                listarAgendamentosUseCase.executar() != null
                        ? listarAgendamentosUseCase.executar()
                        : Collections.emptyList());

        return ViewConstants.AGENDAMENTO_LISTA;
    }

    @GetMapping("/novo")
    public String novo(Model model) {
        model.addAttribute("form", AgendamentoForm.builder()
                .nomePaciente("")
                .nomeMedico("")
                .data("")
                .horario("")
                .especialidade("")
                .build());

        return ViewConstants.AGENDAMENTO_FORM;
    }
}

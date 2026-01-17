package com.clinica.agendamento.config;

import com.clinica.agendamento.exception.back.ErroProcessamentoException;
import com.clinica.agendamento.exception.front.AcessoNegadoException;
import com.clinica.agendamento.exception.front.PaginaNaoEncontradaException;
import com.clinica.agendamento.exception.domain.AgendamentoInvalidoException;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class WebExceptionHandler {

    @ExceptionHandler(PaginaNaoEncontradaException.class)
    public String handle404(PaginaNaoEncontradaException ex, Model model) {
        model.addAttribute("mensagem", ex.getMessage());
        return "error/404";
    }

    @ExceptionHandler(AcessoNegadoException.class)
    public String handle403(AcessoNegadoException ex, Model model) {
        model.addAttribute("mensagem", ex.getMessage());
        return "error/403";
    }

    @ExceptionHandler(AgendamentoInvalidoException.class)
    public String handle400(AgendamentoInvalidoException ex, Model model) {
        model.addAttribute("mensagem", ex.getMessage());
        return "error/400";
    }

    @ExceptionHandler(ErroProcessamentoException.class)
    public String handle500(ErroProcessamentoException ex, Model model) {
        model.addAttribute("mensagem", ex.getMessage());
        return "error/500";
    }

    @ExceptionHandler(org.springframework.web.servlet.NoHandlerFoundException.class)
    public String handleSpring404(Model model) {
        model.addAttribute("mensagem", "Página não encontrada.");
        return "error/404";
    }


    @ExceptionHandler(Exception.class)
    public String handleGeneric(Exception ex, Model model) {
        model.addAttribute("mensagem", "Erro interno inesperado.");
        return "error/500";
    }
}

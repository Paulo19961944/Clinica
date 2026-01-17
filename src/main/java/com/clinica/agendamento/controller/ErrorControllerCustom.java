package com.clinica.agendamento.controller;

import com.clinica.agendamento.util.ViewConstants;
import org.springframework.boot.web.error.ErrorAttributeOptions;
import org.springframework.boot.web.servlet.error.ErrorAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.context.request.WebRequest;

import jakarta.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
public class ErrorControllerCustom implements org.springframework.boot.web.servlet.error.ErrorController {

    private final ErrorAttributes errorAttributes;

    public ErrorControllerCustom(ErrorAttributes errorAttributes) {
        this.errorAttributes = errorAttributes;
    }

    @RequestMapping("/error")
    public String handleError(HttpServletRequest request, Model model) {

        WebRequest webRequest = new ServletWebRequest(request);

        Map<String, Object> attributes = errorAttributes.getErrorAttributes(
                webRequest, ErrorAttributeOptions.defaults());

        int status = (int) attributes.getOrDefault("status", 500);

        return switch (status) {
            case 400 -> ViewConstants.ERROR_400;
            case 401 -> ViewConstants.ERROR_401;
            case 403 -> ViewConstants.ERROR_403;
            case 404 -> ViewConstants.ERROR_404;
            default -> ViewConstants.ERROR_500;
        };
    }
}

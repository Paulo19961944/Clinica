<#import "/layout/base.ftl" as layout>

<#assign title = "Lista de Agendamentos">
<#assign header = "Agendamentos">
<#assign footer = "© Clínica 2026">

<@layout.layout>
    <section>
        <h2>Agendamentos</h2>

        <#if agendamentos?has_content>
            <ul>
                <#list agendamentos as a>
                    <li>
                        Paciente: ${a.nomePaciente!""} |
                        Médico: ${a.nomeMedico!""} |
                        Data: ${a.data!""} |
                        Hora: ${a.horario!""} |
                        Especialidade: ${a.especialidade!""}
                    </li>
                </#list>
            </ul>
        <#else>
            <p>Nenhum agendamento encontrado.</p>
        </#if>

        <a href="/agendamentos/novo">Novo Agendamento</a>
    </section>
</@layout.layout>

<#include "/layout/base.ftl">

<#assign title = "Novo Agendamento">
<#assign header = "Cadastrar Agendamento">
<#assign footer = "© Clínica 2026">

<@layout>
    <section>
        <h2>Novo Agendamento</h2>

        <form method="get" action="/agendamentos">
            <label>Paciente:</label><br>
            <input type="text" name="nomePaciente" value="${form.nomePaciente!""}"><br><br>

            <label>Médico:</label><br>
            <input type="text" name="nomeMedico" value="${form.nomeMedico!""}"><br><br>

            <label>Data:</label><br>
            <input type="text" name="data" value="${form.data!""}"><br><br>

            <label>Horário:</label><br>
            <input type="text" name="horario" value="${form.horario!""}"><br><br>

            <label>Especialidade:</label><br>
            <input type="text" name="especialidade" value="${form.especialidade!""}"><br><br>

            <button type="submit">Salvar (GET por enquanto)</button>
        </form>

        <br>
        <a href="/agendamentos">Voltar</a>
    </section>
</@layout>

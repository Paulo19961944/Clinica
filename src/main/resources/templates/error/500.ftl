<#include "/layout/base.ftl">

<#assign title = "Erro 500">
<#assign header = "Erro interno do servidor">
<#assign footer = "© Clínica 2026">

<@layout>
    <section>
        <h2>Erro 500</h2>
        <p>${mensagem!"Ocorreu um erro interno no sistema."}</p>
        <a href="/">Voltar para Home</a>
    </section>
</@layout>

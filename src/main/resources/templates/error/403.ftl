<#include "/layout/base.ftl">

<#assign title = "Erro 403">
<#assign header = "Acesso negado">
<#assign footer = "© Clínica 2026">

<@layout>
    <section>
        <h2>Erro 403</h2>
        <p>${mensagem!"Você não tem permissão para acessar esta página."}</p>
        <a href="/">Voltar para Home</a>
    </section>
</@layout>

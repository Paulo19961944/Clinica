<#import "/layout/base.ftl" as layout>

<#assign title = "Erro 400">
<#assign header = "Requisição inválida">
<#assign footer = "© Clínica 2026">

<@layout>
    <section>
        <h2>Erro 400</h2>
        <p>${mensagem!"Dados enviados são inválidos."}</p>
        <a href="/">Voltar para Home</a>
    </section>
</@layout>

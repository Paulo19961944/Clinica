<#import "/layout/base.ftl" as layout>

<#assign title = "Erro 401">
<#assign header = "Não autorizado">
<#assign footer = "© Clínica 2026">

<@layout>
    <section>
        <h2>Erro 401</h2>
        <p>${mensagem!"Você não está autenticado para acessar este recurso."}</p>
        <a href="/">Voltar para Home</a>
    </section>
</@layout>

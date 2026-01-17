<#import "/layout/base.ftl" as layout>

<#assign title = "Erro 404">
<#assign header = "Página não encontrada">
<#assign footer = "© Clínica 2026">

<@layout>
    <section>
        <h2>Erro 404</h2>
        <p>${mensagem!"A página solicitada não foi encontrada."}</p>
        <a href="/">Voltar para Home</a>
    </section>
</@layout>

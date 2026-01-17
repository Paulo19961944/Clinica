<#import "/layout/base.ftl" as base>

<#assign title = "Erro 500">
<#assign header = "Erro interno">
<#assign footer = "Clínica">

<@base.layout>
    <p>${mensagem!"Erro interno."}</p>
</@base.layout>

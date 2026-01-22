<#import "/layout/base.ftl" as base>

<#assign title = "Clínica">
<#assign header = "Sistema de Agendamento">
<#assign footer = "© Clínica">

<@base.layout>
    <section class="cards">
        <section class="card-img">
                <img src="/img/medico-1.jpg" alt="Foto de nosso médico"/>
        </section>

        <section class="card-text">
            <h2>Seja bem vindo</h2>
            <p>Na Clinica Saúde Integral você conta com os melhores médicos para lhe atender com excelência</p>
            <p>Temos médicos especializados em: Ortopedia, Psicologia, Terapia Integrativa, Quiropraxia, Clinico Geral e várias outras especialidades que poderão melhor lhe atender.</p>
            <p>Trabalhamos com agendamentos e telemedicina, com equipamentos de ponta e profissionais qualificados, estamos a sua espera. Venha marcar uma consulta com a gente!</p>
            <a href="/agendamentos">
                <button class="call-to-action">Agendar Agora</button>
            </a>
        </section>
    </section>
</@base.layout>


# Sistema de Agendamento para Clínica

![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.5.4-brightgreen)
![Java](https://img.shields.io/badge/Java-22-blue)
![License](https://img.shields.io/badge/License-MIT-yellow)

Sistema web para gerenciamento de agendamentos de consultas médicas, desenvolvido com Spring Boot e Freemarker.

## 📋 Índice

- [Visão Geral](#visão geral)
- [Funcionalidades](#funcionalidades)
- [Tecnologias](#tecnologias)
- [Arquitetura](#arquitetura)
- [Estrutura de Diretórios](#estrutura de diretórios)
- [Pré-requisitos](#pré-requisitos)
- [Instalação](#instalação)
- [Uso](#uso)
- [API e Endpoints](#api-e-endpoints)
- [Validação](#validação)
- [Tratamento de Erros](#tratamento de erros)
- [Contribuição](#contribuição)
- [Licença](#licença)

## Visão Geral

Este é um sistema de agendamento para clínicas médicas que permite:
- Visualizar agendamentos existentes
- Criar novos agendamentos de consultas
- Validar dados de entrada
- Gerenciar erros de forma consistente

O sistema segue os princípios da Clean Architecture, com separação clara de responsabilidades entre camadas.

## Funcionalidades

### ✅ Implementadas
- Listagem de agendamentos
- Cadastro de novos agendamentos
- Validação de formulários
- Tratamento de erros customizado
- Interface web responsiva

### 🔄 Em Desenvolvimento
- Funcionalidade de edição de agendamentos
- Funcionalidade de exclusão de agendamentos
- Persistência em banco de dados

## Tecnologias

| Tecnologia | Versão | Propósito |
|------------|--------|-----------|
| Spring Boot | 3.5.4 | Framework principal |
| Java | 22 | Linguagem de programação |
| Freemarker | 2.3.32 | Template Engine |
| Lombok | 1.18.32 | Redução de boilerplate |
| Jackson | 2.17 | Processamento JSON |
| Maven | 3.9+ | Gerenciamento de build |

## Arquitetura

O projeto segue uma arquitetura em camadas bem definida:

```
src/main/java/com/clinica/agendamento/
├── controller/      # Controladores REST/Web
├── service/         # Regras de negócio
├── usecase/         # Casos de uso específicos
├── repository/      # Acesso a dados
├── dto/             # Data Transfer Objects
├── form/            # Formulários de entrada
├── validation/      # Validadores
├── factory/         # Fábricas de objetos
├── exception/       # Exceções customizadas
└── config/          # Configurações
```

### Camadas

1. **Controller**: Recebe requisições HTTP e retorna respostas
2. **Service**: Orquestra casos de uso e implementa regras de negócio
3. **UseCase**: Implementa lógicas específicas de negócio
4. **Repository**: Abstração de acesso a dados
5. **Validation**: Validação de entrada de dados

## Estrutura de Diretórios

```
clinica-agendamento/
├── src/
│   ├── main/
│   │   ├── java/com/clinica/agendamento/
│   │   │   ├── ClinicaApplication.java
│   │   │   ├── controller/
│   │   │   │   ├── AgendamentoController.java
│   │   │   │   ├── HomeController.java
│   │   │   │   └── ErrorControllerCustom.java
│   │   │   ├── service/
│   │   │   │   └── AgendamentoService.java
│   │   │   ├── usecase/
│   │   │   │   ├── CriarAgendamentoUseCase.java
│   │   │   │   └── ListarAgendamentosUseCase.java
│   │   │   ├── repository/
│   │   │   │   ├── AgendamentoRepository.java
│   │   │   │   └── impl/
│   │   │   │       └── AgendamentoRepositoryMemory.java
│   │   │   ├── dto/
│   │   │   │   └── AgendamentoDTO.java
│   │   │   ├── form/
│   │   │   │   └── AgendamentoForm.java
│   │   │   ├── validation/
│   │   │   │   └── AgendamentoValidator.java
│   │   │   ├── factory/
│   │   │   │   └── AgendamentoFactory.java
│   │   │   ├── exception/
│   │   │   │   ├── domain/
│   │   │   │   ├── back/
│   │   │   │   ├── front/
│   │   │   │   └── infra/
│   │   │   └── config/
│   │   │       ├── FreemarkerConfig.java
│   │   │       └── WebExceptionHandler.java
│   │   └── resources/
│   │       ├── application.yml
│   │       └── templates/
│   │           ├── layout/
│   │           ├── home/
│   │           ├── agendamentos/
│   │           └── error/
│   └── test/
├── pom.xml
└── README.md
```

## Pré-requisitos

- **Java Development Kit (JDK) 22** ou superior
- **Apache Maven 3.9** ou superior
- Navegador web moderno

## Instalação

1. **Clone o repositório**:
   ```bash
   git clone https://github.com/Paulo19961944/Clinica
   cd Clinica
   ```

2. **Compile o projeto**:
   ```bash
   mvn clean compile
   ```

3. **Execute a aplicação**:
   ```bash
   mvn spring-boot:run
   ```

4. **Acesse no navegador**:
   ```
   http://localhost:8080
   ```

## Uso

### Página Inicial
Acesse `http://localhost:8080` para ver a página inicial do sistema.

### Listar Agendamentos
Acesse `http://localhost:8080/agendamentos` para visualizar todos os agendamentos.

### Criar Agendamento
Acesse `http://localhost:8080/agendamentos/novo` para criar um novo agendamento.

## API e Endpoints

### Endpoints Web

| Método | Endpoint | Descrição |
|--------|----------|-----------|
| GET | `/` | Página inicial |
| GET | `/agendamentos` | Lista todos os agendamentos |
| GET | `/agendamentos/novo` | Formulário de novo agendamento |

## Validação

O sistema valida os seguintes campos ao criar um agendamento:

| Campo | Regra |
|-------|-------|
| nomePaciente | Obrigatório |
| nomeMedico | Obrigatório |
| data | Obrigatória |
| horario | Obrigatório |
| especialidade | Obrigatória |

### Exemplo de Erro de Validação

```
Nome do paciente é obrigatório.
Nome do médico é obrigatório.
Data do agendamento é obrigatória.
Horário do agendamento é obrigatório.
Especialidade é obrigatória.
```

## Tratamento de Erros

O sistema possui tratamento de erros customizado para as seguintes situações:

| Código | Descrição |
|--------|-----------|
| 400 | Requisição inválida |
| 401 | Não autorizado |
| 403 | Acesso negado |
| 404 | Página não encontrada |
| 500 | Erro interno do servidor |

### Estrutura de Exceções

```
exception/
├── domain/           # Exceções de domínio
│   └── AgendamentoInvalidoException.java
├── back/             # Exceções de processamento
│   └── ErroProcessamentoException.java
├── front/            # Exceções de interface
│   ├── AcessoNegadoException.java
│   └── PaginaNaoEncontradaException.java
└── infra/            # Exceções de infraestrutura
    └── RepositorioException.java
```

## Configuração

As configurações do sistema estão em `src/main/resources/application.yml`:

```yaml
server:
  port: 8080

spring:
  freemarker:
    template-loader-path: classpath:/templates
    suffix: .ftl
    charset: UTF-8

  mvc:
    static-path-pattern: /static/**
```

## Desenvolvimento

### Comandos Úteis

```bash
# Compilar o projeto
mvn clean compile

# Executar testes
mvn test

# Gerar JAR
mvn package

# Limpar build
mvn clean
```

### Estrutura do DTO

```java
AgendamentoDTO {
    id: String
    nomePaciente: String
    nomeMedico: String
    data: String
    horario: String
    especialidade: String
}
```

## Contribuição

1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

---

## Contato

Desenvolvido por - Paulo Henrique Azevedo do Nascimento

---

**Nota**: Este é um projeto base que pode ser expandido com funcionalidades adicionais como autenticação, persistência em banco de dados, agendamentos recorrentes, lembretes por email, entre outros.


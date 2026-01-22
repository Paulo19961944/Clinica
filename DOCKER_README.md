# Docker - Clínica de Agendamento

Este guia explica como buildar e executar a aplicação usando Docker.

## Pré-requisitos

- Docker instalado e em execução
-至少 2GB de RAM disponível para o container
- Porta 8081 livre no host

## Arquivos Criados

| Arquivo | Descrição |
|---------|-----------|
| `Dockerfile` | Imagem Docker multi-stage para a aplicação |
| `build.sh` / `build.bat` | Faz o build da imagem Docker |
| `run.sh` / `run.bat` | Executa a aplicação no Docker |
| `build-and-run.sh` / `build-and-run.bat` | Faz build e executa em um único comando |

## Como Usar

### Linux/macOS (Shell Scripts)

**Opção 1: Build e Run separados**
```bash
# Fazer o build da imagem
./build.sh

# Executar a aplicação
./run.sh
```

**Opção 2: Build e Run juntos**
```bash
./build-and-run.sh
```

### Windows (Batch Files)

**Opção 1: Build e Run separados**
```cmd
build.bat
run.bat
```

**Opção 2: Build e Run juntos**
```cmd
build-and-run.bat
```

## Acessando a Aplicação

A aplicação estará disponível em:

| Dispositivo | URL |
|-------------|-----|
| **Computador local** | http://localhost:8081 |
| **Celular/Tablet** | http://<IP-DO-COMPUTADOR>:8081 |

### Para descobrir o IP do seu computador:

**Linux:**
```bash
hostname -I
```

**macOS:**
```bash
ipconfig getifaddr en0
```

**Windows:**
```cmd
ipconfig
```

## Comandos Úteis

### Ver logs da aplicação
```bash
docker logs -f clinica-agendamento-container
```

### Parar a aplicação
```bash
docker stop clinica-agendamento-container
```

### Reiniciar a aplicação
```bash
docker restart clinica-agendamento-container
```

### Remover o container
```bash
docker rm -f clinica-agendamento-container
```

### Remover a imagem
```bash
docker rmi clinica-agendamento:latest
```

## Configurações do Container

| Configuração | Valor |
|--------------|-------|
| Porta exposta | 8081 |
| Porta interna | 8081 |
| Binding | 0.0.0.0:8081 (acessível de qualquer dispositivo) |
| Nome do container | clinica-agendamento-container |
| Timezone | America/Sao_Paulo |

## Solução de Problemas

### "Docker não está instalado"
1. Instale o Docker Desktop (Windows/macOS) ou Docker Engine (Linux)
2. Certifique-se de que o Docker está em execução

### "Porta 8081 já em uso"
1. Pare o serviço/processo que está usando a porta 8081
2. Ou altere a porta no comando de run:
```bash
docker run -d --name clinica-agendamento-container -p 8082:8081 clinica-agendamento:latest
```

### "Erro de memória insuficiente"
1. Aumente os recursos do Docker (Settings > Resources > Memory)
2. Mínimo recomendado: 2GB

### Aplicação não acessível de outros dispositivos
1. Verifique o firewall do host
2. Certifique-se de usar `0.0.0.0` no binding (já configurado)
3. Verifique se está usando o IP correto do host


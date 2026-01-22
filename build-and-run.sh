#!/bin/bash
set -e

# Script para build e execução da aplicação Docker
# Nome da imagem Docker
IMAGE_NAME="clinica-agendamento"
TAG="latest"
CONTAINER_NAME="clinica-agendamento-app"

echo "=========================================="
echo "  Build e Execução - Clínica de Agendamento"
echo "=========================================="
echo ""

# Verifica se o Maven está instalado
if ! command -v mvn &> /dev/null; then
    echo "❌ Maven não está instalado!"
    exit 1
fi

# Verifica se o Docker está instalado e em execução
if ! command -v docker &> /dev/null; then
    echo "❌ Docker não está instalado ou não está em execução!"
    echo "   Por favor, instale o Docker primeiro."
    exit 1
fi

# Verifica se o Dockerfile existe
if [ ! -f "Dockerfile" ]; then
    echo "❌ Dockerfile não encontrado!"
    exit 1
fi

echo "🔨 Fazendo build do projeto com Maven..."
mvn clean package -DskipTests

if [ ! -f "target/agendamento-0.0.1-SNAPSHOT.jar" ]; then
    echo "❌ JAR não foi gerado!"
    exit 1
fi

echo ""
echo "🔨 Iniciando build da imagem Docker..."
docker build -t $IMAGE_NAME:$TAG .

echo ""
echo "✅ Build concluído com sucesso!"
echo ""

# Para container existente (se houver)
if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo "🛑 Parando container existente..."
    docker stop $CONTAINER_NAME 2>/dev/null
    docker rm $CONTAINER_NAME 2>/dev/null
fi

echo "🚀 Iniciando container..."
echo "   Nome do container: $CONTAINER_NAME"
echo "   Porta exposta: 8081"
echo "   Acessível em: http://localhost:8081"
echo "   Para acessar de outros dispositivos: http://<IP-DO-HOST>:8081"
echo ""

# Executa o container com a porta 8081 exposta
docker run -d \
    --name $CONTAINER_NAME \
    -p 8081:8081 \
    -e TZ=America/Sao_Paulo \
    $IMAGE_NAME:$TAG

echo ""
echo "✅ Aplicação iniciada com sucesso!"
echo ""
echo "   Acesse no navegador:"
echo "   - Computador: http://localhost:8081"
echo "   - Celular/Tablet: http://<IP-DO-COMPUTADOR>:8081"
echo ""
echo "   Para ver os logs:"
echo "   docker logs -f $CONTAINER_NAME"
echo ""
echo "   Para parar a aplicação:"
echo "   docker stop $CONTAINER_NAME"


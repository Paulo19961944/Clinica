#!/bin/bash
set -e

# Script para build da aplicação Docker
# Nome da imagem Docker
IMAGE_NAME="clinica-agendamento"
TAG="latest"

echo "=========================================="
echo "  Build da Aplicação Clínica de Agendamento"
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
echo "   Imagem: $IMAGE_NAME:$TAG"
echo ""

# Faz o build da imagem Docker
docker build -t $IMAGE_NAME:$TAG .

echo ""
echo "✅ Build concluído com sucesso!"
echo "   Imagem: $IMAGE_NAME:$TAG"
echo ""
echo "   Para executar a aplicação, use:"
echo "   ./run.sh"
echo "   ou"
echo "   docker run -p 8081:8081 $IMAGE_NAME:$TAG"


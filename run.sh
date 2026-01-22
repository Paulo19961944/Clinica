#!/bin/bash
set -e

# Script para executar a aplicação Docker
# Nome da imagem Docker
IMAGE_NAME="clinica-agendamento"
TAG="latest"
CONTAINER_NAME="clinica-agendamento-app"

echo "=========================================="
echo "  Execução da Aplicação Clínica de Agendamento"
echo "=========================================="
echo ""

# Verifica se o Docker está instalado e em execução
if ! command -v docker &> /dev/null; then
    echo "❌ Docker não está instalado ou não está em execução!"
    echo "   Por favor, instale o Docker primeiro."
    exit 1
fi

# Verifica se a imagem existe
if ! docker image inspect $IMAGE_NAME:$TAG &> /dev/null; then
    echo "⚠️  Imagem '$IMAGE_NAME:$TAG' não encontrada!"
    echo "   Executando o build primeiro..."
    echo ""
    ./build.sh
    if [ $? -ne 0 ]; then
        echo "❌ Erro no build!"
        exit 1
    fi
fi

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

if [ $? -eq 0 ]; then
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
else
    echo ""
    echo "❌ Erro ao iniciar o container!"
    exit 1
fi


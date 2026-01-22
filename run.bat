@echo off
chcp 65001 >nul
cls

REM Script para executar a aplicação Docker (Windows)
set IMAGE_NAME=clinica-agendamento
set TAG=latest
set CONTAINER_NAME=clinica-agendamento-app

echo ==========================================
echo   Execução da Aplicação Clínica de Agendamento
echo ==========================================
echo.

REM Verifica se o Docker está instalado e em execução
where docker >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo ❌ Docker não está instalado ou não está em execução!
    echo    Por favor, instale o Docker primeiro.
    exit /b 1
)

REM Verifica se a imagem existe
docker image inspect %IMAGE_NAME%:%TAG% >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo ⚠️  Imagem '%IMAGE_NAME%:%TAG%' não encontrada!
    echo    Executando o build primeiro...
    echo.
    call build.bat
    if %ERRORLEVEL% neq 0 (
        echo ❌ Erro no build!
        exit /b 1
    )
)

REM Para container existente (se houver)
docker ps -aq -f name=%CONTAINER_NAME% >nul 2>&1
if %ERRORLEVEL% equ 0 (
    echo 🛑 Parando container existente...
    docker stop %CONTAINER_NAME% >nul 2>&1
    docker rm %CONTAINER_NAME% >nul 2>&1
)

echo 🚀 Iniciando container...
echo    Nome do container: %CONTAINER_NAME%
echo    Porta exposta: 8081
echo    Acessível em: http://localhost:8081
echo    Para acessar de outros dispositivos: http://^<IP-DO-HOST^>:8081
echo.

REM Executa o container com a porta 8081 exposta
docker run -d --name %CONTAINER_NAME% -p 8081:8081 -e TZ=America/Sao_Paulo %IMAGE_NAME%:%TAG%

if %ERRORLEVEL% equ 0 (
    echo.
    echo ✅ Aplicação iniciada com sucesso!
    echo.
    echo    Acesse no navegador:
    echo    - Computador: http://localhost:8081
    echo    - Celular/Tablet: http://^<IP-DO-COMPUTADOR^>:8081
    echo.
    echo    Para ver os logs:
    echo    docker logs -f %CONTAINER_NAME%
    echo.
    echo    Para parar a aplicação:
    echo    docker stop %CONTAINER_NAME%
) else (
    echo.
    echo ❌ Erro ao iniciar o container!
    exit /b 1
)


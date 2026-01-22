@echo off
chcp 65001 >nul
cls

REM Script para build da aplicação Docker (Windows)
set IMAGE_NAME=clinica-agendamento
set TAG=latest

echo ==========================================
echo   Build da Aplicação Clínica de Agendamento
echo ==========================================
echo.

REM Verifica se o Maven está instalado
where mvn >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo ❌ Maven não está instalado!
    exit /b 1
)

REM Verifica se o Docker está instalado e em execução
where docker >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo ❌ Docker não está instalado ou não está em execução!
    echo    Por favor, instale o Docker primeiro.
    exit /b 1
)

REM Verifica se o Dockerfile existe
if not exist Dockerfile (
    echo ❌ Dockerfile não encontrado!
    exit /b 1
)

echo 🔨 Fazendo build do projeto com Maven...
call mvn clean package -DskipTests

if not exist "target\agendamento-0.0.1-SNAPSHOT.jar" (
    echo ❌ JAR não foi gerado!
    exit /b 1
)

echo.
echo 🔨 Iniciando build da imagem Docker...
echo    Imagem: %IMAGE_NAME%:%TAG%
echo.

REM Faz o build da imagem Docker
docker build -t %IMAGE_NAME%:%TAG% .

if %ERRORLEVEL% equ 0 (
    echo.
    echo ✅ Build concluído com sucesso!
    echo    Imagem: %IMAGE_NAME%:%TAG%
    echo.
    echo    Para executar a aplicação, use:
    echo    run.bat
    echo    ou
    echo    docker run -p 8081:8081 %IMAGE_NAME%:%TAG%
) else (
    echo.
    echo ❌ Erro durante o build!
    exit /b 1
)


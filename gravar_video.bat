@echo off
REM Script para gravar vídeo automaticamente em MP4

setlocal enabledelayedexpansion

REM Detectar caminho atual
set PASTA=%cd%

REM Nome do arquivo de saída
set ARQUIVO=%PASTA%\video_calculos.mp4

echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║      GRAVANDO VÍDEO: Cálculos Quântico-Gravitacionais      ║
echo ╚════════════════════════════════════════════════════════════╝
echo.
echo Iniciando gravação em 3 segundos...
echo Arquivo: %ARQUIVO%
echo.

timeout /t 3

REM Iniciar FFmpeg em background
start /B ffmpeg -f gdigrab -framerate 30 -i desktop -c:v libx264 -pix_fmt yuv420p -t 450 "%ARQUIVO%" >nul 2>&1

timeout /t 2

REM Executar Julia
echo Executando script Julia...
julia video_na_pasta.jl

echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║              ✅ GRAVAÇÃO CONCLUÍDA!                        ║
echo ╚════════════════════════════════════════════════════════════╝
echo.
echo Arquivo: %ARQUIVO%
echo Tamanho: 
dir "%ARQUIVO%" | find ".mp4"
echo.
pause

#!/usr/bin/env powershell
# Script para gravar vídeo em MP4 usando FFmpeg

$PASTA = "C:\Users\Administrador\Desktop\teste de calculos"
$ARQUIVO = "$PASTA\video_calculos.mp4"
$JULIA_SCRIPT = "$PASTA\video_na_pasta.jl"

Write-Host "`n" -ForegroundColor Green
Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║      GRAVANDO VÍDEO: Cálculos Quântico-Gravitacionais      ║" -ForegroundColor Green
Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host "`n"

Write-Host "📁 Pasta: $PASTA" -ForegroundColor Yellow
Write-Host "📹 Arquivo: $ARQUIVO" -ForegroundColor Yellow
Write-Host "⏱️  Duração: ~7 minutos" -ForegroundColor Yellow
Write-Host "`n"

Write-Host "Iniciando gravação em 5 segundos..." -ForegroundColor Cyan
Start-Sleep -Seconds 5

# Iniciar FFmpeg em background para capturar tela
Write-Host "`n🎬 FFmpeg iniciado - capturando tela..." -ForegroundColor Green

$ffmpeg_process = Start-Process -FilePath "ffmpeg" `
    -ArgumentList "-f gdigrab -framerate 30 -i desktop -c:v libx264 -pix_fmt yuv420p -t 480 `"$ARQUIVO`"" `
    -NoNewWindow -PassThru

# Dar tempo para FFmpeg iniciar
Start-Sleep -Seconds 3

# Executar Julia
Write-Host "`n🔬 Executando script Julia..." -ForegroundColor Green
Write-Host "`n"

& julia $JULIA_SCRIPT

# Aguardar FFmpeg terminar
Start-Sleep -Seconds 5
Stop-Process -Id $ffmpeg_process.Id -Force -ErrorAction SilentlyContinue

# Verificar se arquivo foi criado
if (Test-Path $ARQUIVO) {
    $size = (Get-Item $ARQUIVO).Length / 1MB
    Write-Host "`n`n╔════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
    Write-Host "║              ✅ VÍDEO GRAVADO COM SUCESSO!                 ║" -ForegroundColor Green
    Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
    Write-Host "`n"
    Write-Host "📹 Arquivo: $ARQUIVO" -ForegroundColor Green
    Write-Host "💾 Tamanho: $([math]::Round($size, 2)) MB" -ForegroundColor Green
    Write-Host "`n✅ Pronto para assistir ou compartilhar!" -ForegroundColor Green
} else {
    Write-Host "`n❌ ERRO: Arquivo não foi criado!" -ForegroundColor Red
}

Write-Host "`n"

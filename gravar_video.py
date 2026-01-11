#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
Script para gravar vídeo MP4 do terminal Julia
Usa OpenCV para capturar a tela e gerar o vídeo
"""

import subprocess
import os
import time
from pathlib import Path

# Configurações
PASTA = Path("C:/Users/Administrador/Desktop/teste de calculos")
ARQUIVO_VIDEO = PASTA / "video_calculos.mp4"
JULIA_SCRIPT = PASTA / "video_na_pasta.jl"

print("\n" + "="*60)
print("GRAVANDO VÍDEO: Cálculos Quântico-Gravitacionais")
print("="*60)
print(f"\n📁 Pasta: {PASTA}")
print(f"📹 Arquivo: {ARQUIVO_VIDEO}")
print(f"⏱️  Aguardando início da gravação...\n")

# Aguardar um pouco
time.sleep(2)

try:
    # Iniciar FFmpeg para capturar a tela
    ffmpeg_cmd = [
        'ffmpeg',
        '-f', 'gdigrab',
        '-framerate', '30',
        '-i', 'desktop',
        '-c:v', 'libx264',
        '-pix_fmt', 'yuv420p',
        '-preset', 'fast',
        '-crf', '23',
        '-t', '480',  # 8 minutos
        str(ARQUIVO_VIDEO)
    ]
    
    print("🎬 Iniciando captura de tela com FFmpeg...\n")
    
    # Iniciar FFmpeg em background
    ffmpeg_process = subprocess.Popen(
        ffmpeg_cmd,
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL
    )
    
    # Aguardar FFmpeg inicializar
    time.sleep(3)
    
    # Executar script Julia
    print("🔬 Executando script Julia...\n")
    print("="*60 + "\n")
    
    julia_cmd = f'julia "{JULIA_SCRIPT}"'
    os.system(f'cd {PASTA} && {julia_cmd}')
    
    print("\n" + "="*60)
    
    # Aguardar FFmpeg terminar
    time.sleep(5)
    ffmpeg_process.terminate()
    ffmpeg_process.wait(timeout=10)
    
    # Verificar se arquivo foi criado
    if ARQUIVO_VIDEO.exists():
        size_mb = ARQUIVO_VIDEO.stat().st_size / (1024 * 1024)
        print(f"\n✅ VÍDEO GRAVADO COM SUCESSO!")
        print(f"📹 Arquivo: {ARQUIVO_VIDEO}")
        print(f"💾 Tamanho: {size_mb:.2f} MB")
        print(f"\n✅ Pronto para assistir ou compartilhar!\n")
    else:
        print(f"\n❌ ERRO: Arquivo não foi criado!")
        
except Exception as e:
    print(f"\n❌ ERRO: {e}")

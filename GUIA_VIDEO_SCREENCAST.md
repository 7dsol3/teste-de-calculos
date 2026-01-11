# 🎬 GUIA COMPLETO: CAPTURAR VÍDEO DO SCRIPT JULIA

## 📋 Sumário
Este guia mostra como criar um vídeo tutorial executando o script Julia com toda a visualização em tempo real.

---

## 1️⃣ OPÇÃO A: OBS Studio (Recomendado - Profissional)

### O que é?
OBS Studio é a ferramenta gratuita mais profissional para captura de tela e criação de vídeos.

### Instalação
```powershell
# Com Chocolatey (se tiver instalado)
choco install obs-studio

# OU Baixar direto
# https://obsproject.com/
```

### Passo-a-Passo para Capturar

**Passo 1: Abrir OBS Studio**
- Abra OBS Studio
- Clique em "+" na seção "Sources"
- Selecione "Window Capture" ou "Screen Capture"

**Passo 2: Configurar Captura**
```
- Display: Selecione seu monitor
- Resolution: 1920x1080 (Full HD) ou 1280x720 (HD)
- FPS: 30 fps (padrão) ou 60 fps (suave)
```

**Passo 3: Preparar Julia**
1. Abra PowerShell
2. Navegue até a pasta:
```powershell
cd 'c:\Users\Administrador\Desktop\teste de calculos'
```

3. Execute o script:
```powershell
julia Visualizacao_Completa.jl
```

**Passo 4: Gravar**
- No OBS: Clique em "Start Recording"
- Deixe o Julia executar completamente (~5-10 minutos com animações)
- Clique em "Stop Recording"
- Vídeo salvo em: `Videos/` da sua pasta de usuário

### Saída Esperada
```
████████████████████████████████████████████████████████████████████████████████
🔬 VISUALIZAÇÃO COMPLETA: CÁLCULOS QUÂNTICO-GRAVITACIONAIS EM JULIA
████████████████████████████████████████████████████████████████████████████████
Linguagem: Julia 1.10.0
Data: 2026-01-11T13:15:00

█████████████████████████████████████████████████████████████████████████████
🔬 1. CONSTANTES FUNDAMENTAIS VERIFICADAS
█████████████████████████████████████████████████████████████████████████████

📊 Constantes Quânticas Básicas:

  ✅ Constante de Planck reduzida (ħ): 1.054572e-34 J·s
  ✅ Velocidade da luz (c): 299792458 m/s (exato)
  ✅ Constante gravitacional (G): 6.674300e-11 m³/kg·s²

📈 Escalas de Planck Derivadas:

  ✅ Comprimento de Planck (l_P): 1.616255e-35 m
  ✅ Massa de Planck (m_P): 2.176434e-08 kg
  ✅ Tempo de Planck (t_P): 5.391247e-44 s
  ✅ Energia de Planck (E_P): 1.956091e+09 J
  ╔════════════════════════════════════════════════════════════════════╗
  ║ ✅ Todas as constantes: verificadas com precisão SI 2019         ║
  ╚════════════════════════════════════════════════════════════════════╝

... [mais 9 seções com cálculos animados] ...
```

---

## 2️⃣ OPÇÃO B: FFmpeg + Terminal (Linha de Comando Avançada)

### Instalação do FFmpeg
```powershell
# Com Chocolatey
choco install ffmpeg

# OU Com scoop
scoop install ffmpeg

# OU Baixar: https://ffmpeg.org/download.html
```

### Capturar Tela com FFmpeg
```powershell
# Abra PowerShell e execute:

cd 'c:\Users\Administrador\Desktop\teste de calculos'

# Iniciar gravação (em outro terminal)
ffmpeg -f gdigrab -framerate 30 -i desktop -c:v libx264 -pix_fmt yuv420p output.mp4

# DEPOIS execute Julia no terminal original:
julia Visualizacao_Completa.jl

# FINALIZE no FFmpeg: Pressione Ctrl+C quando Julia terminar
```

**Resultado:**
```
✅ Video: output.mp4 (pronto para compartilhar)
```

---

## 3️⃣ OPÇÃO C: Windows 10/11 Game Bar (Nativa)

### Muito Simples!

**Passo 1:**
- Abra o PowerShell com o script Julia pronto

**Passo 2:**
- Pressione: `Windows Key + G`
- Clique em "Yes, this is a game"

**Passo 3:**
- Clique em "Record" (ou `Windows Key + Alt + R`)

**Passo 4:**
- Execute:
```powershell
julia Visualizacao_Completa.jl
```

**Passo 5:**
- Quando terminar, pressione `Windows Key + Alt + R` para parar
- Vídeo salvo em: `Videos/Captures/`

---

## 4️⃣ OPÇÃO D: Flameshot + Video Montage (Muito Flexível)

### Pré-requisitos
```powershell
choco install flameshot
choco install ffmpeg
```

### Processo
```powershell
# 1. Tirar prints em intervalos
# 2. Converter para vídeo com FFmpeg

# Listar screenshots e criar vídeo
ffmpeg -framerate 2 -i screenshot_%04d.png -c:v libx264 -pix_fmt yuv420p video.mp4
```

---

## 🎯 RECOMENDAÇÃO FINAL

### Para Melhor Resultado:
✅ **OBS Studio** (Opção A)
- Mais controle
- Melhor qualidade
- Pode adicionar overlays
- Profissional

### Para Rápido:
✅ **Windows Game Bar** (Opção C)
- Nativo do Windows
- Sem instalação
- Funciona direto

### Para Linha de Comando:
✅ **FFmpeg** (Opção B)
- Mais controle
- Scripts automatizáveis
- Ideal para produção

---

## 📊 QUALIDADE RECOMENDADA DE VÍDEO

| Aspecto | Recomendação |
|---------|-------------|
| Resolução | 1920x1080 (Full HD) ou 1280x720 (HD) |
| Taxa de Quadros | 30 fps (suave) ou 60 fps (muito suave) |
| Codec | H.264 (libx264) |
| Taxa de Bits | 5000 kbps (HD) |
| Áudio | Opcional (capturar sons do sistema) |

---

## ⏱️ TEMPO DE EXECUÇÃO

O script `Visualizacao_Completa.jl` executa em aproximadamente:

```
┌─────────────────────────────────────────┐
│ ⏱️  Tempo Total de Execução              │
├─────────────────────────────────────────┤
│ Sem Sleep (velocidade máxima): ~30 seg  │
│ Com Sleep (visual lindo): ~3-5 min      │
│ Com pausas extras: ~8-10 min            │
└─────────────────────────────────────────┘
```

**Dica:** Para um vídeo de 5 minutos profissional, execute o script completo com as animações (padrão).

---

## 🎬 EXEMPLO FINAL: SCRIPT DE AUTOMAÇÃO

Se quiser automatizar tudo, crie um arquivo `.bat`:

**arquivo: `gravar_video.bat`**
```batch
@echo off
REM Abre OBS Studio e Julia
start "OBS" "C:\Program Files\obs-studio\bin\obs64.exe"
timeout /t 3

start "Julia" powershell -NoExit -Command "cd 'c:\Users\Administrador\Desktop\teste de calculos'; julia Visualizacao_Completa.jl"
```

Execute com duplo-clique!

---

## ✅ CHECKLIST FINAL

- [ ] OBS Studio (ou alternativa) instalado
- [ ] Julia funcionando corretamente
- [ ] Script `Visualizacao_Completa.jl` pronto
- [ ] Espaço em disco suficiente (>500 MB para vídeo HD)
- [ ] Microfone mudo (se não quiser áudio)
- [ ] Resolução de tela clara e legível
- [ ] Fonte do terminal em tamanho grande (16-18pt)
- [ ] Tema escuro no terminal (melhor para vídeo)

---

## 📞 DICAS DE OURO

1. **Antes de gravar:**
   - Execute o script uma vez para garantir que funciona
   - Limpe a tela e maximize o terminal
   - Ajuste o zoom da fonte para 150% (legível em vídeo)

2. **Durante a gravação:**
   - Não mexa no teclado fora do previsto
   - Deixe o script executar sem interrupções
   - Se errar, pare e comece novamente

3. **Depois da gravação:**
   - Edite o vídeo (remova longas esperas)
   - Adicione legenda com explicações
   - Exporte em formato MP4 ou WebM

---

## 🚀 PRÓXIMAS ETAPAS

**Após capturar o vídeo:**

1. ✅ Editar no **DaVinci Resolve** (gratuito)
   - Adicionar títulos
   - Adicionar legenda
   - Ajustar velocidade de reprodução

2. ✅ Compartilhar
   - YouTube
   - GitHub (GitHub README video)
   - Redes sociais
   - Documentação técnica

3. ✅ Documentação
   - Link do vídeo no README
   - Timestamp de cada seção
   - Explicação em português

---

## 📝 EXEMPLO DE VÍDEO PRONTO

**Título:** "Cálculos Quântico-Gravitacionais Verificados em Julia"

**Descrição:**
```
Neste vídeo, executamos uma suite completa de 9 seções de física 
quântica e relatividade em Julia 1.10.0, com visualizações em 
tempo real e animações:

00:00 - Constantes Fundamentais
01:30 - Incerteza de Heisenberg
03:00 - Equação de Schrödinger
04:30 - Oscilador Harmônico
06:00 - Métrica de Schwarzschild
07:30 - Radiação de Hawking
09:00 - Entropia Bekenstein-Hawking
10:30 - Relação Dirac
12:00 - Síntese Quântico-Gravitacional

Código disponível em: [link]
Documentação: [link]
```

---

## 💾 ARQUIVOS NECESSÁRIOS

Confirme que você tem esses arquivos no desktop:

```
c:\Users\Administrador\Desktop\teste de calculos\
├── Visualizacao_Completa.jl          ✅ Script principal
├── GUIA_VIDEO_SCREENCAST.md          ✅ Este arquivo
├── calculos_verdadeiros.py           ✅ Implementação Python
├── Calculos_Julia.jl                 ✅ Implementação Julia original
├── GUP_3D_Corrigido.py               ✅ GUP corrigido
└── CERTIFICADO_AUDITORIA.md          ✅ Certificação
```

---

**🎯 Pronto para começar seu vídeo! Boa sorte! 🚀**

# Script PowerShell para verificar instalação do Julia

Write-Host "=" -NoNewline
Write-Host ("=" * 60) -ForegroundColor Cyan
Write-Host "VERIFICAÇÃO DE INSTALAÇÃO DO JULIA" -ForegroundColor Cyan
Write-Host ("=" * 60) -ForegroundColor Cyan
Write-Host ""

# Verificar se Julia está no PATH
Write-Host "1. Verificando se Julia está no PATH..." -ForegroundColor Yellow
$juliaPath = Get-Command julia -ErrorAction SilentlyContinue
if ($juliaPath) {
    Write-Host "   ✓ Julia encontrado em: $($juliaPath.Source)" -ForegroundColor Green
    Write-Host "   Versão:" -NoNewline
    & julia --version
} else {
    Write-Host "   ✗ Julia não encontrado no PATH" -ForegroundColor Red
}

Write-Host ""

# Verificar locais comuns de instalação
Write-Host "2. Procurando Julia em locais comuns..." -ForegroundColor Yellow

$commonPaths = @(
    "$env:LOCALAPPDATA\Programs\Julia*",
    "$env:ProgramFiles\Julia*",
    "$env:ProgramFiles(x86)\Julia*",
    "C:\Julia*",
    "$env:USERPROFILE\Julia*"
)

$found = $false
foreach ($pathPattern in $commonPaths) {
    $paths = Get-ChildItem -Path $pathPattern -ErrorAction SilentlyContinue
    foreach ($path in $paths) {
        $juliaExe = Join-Path $path.FullName "bin\julia.exe"
        if (Test-Path $juliaExe) {
            Write-Host "   ✓ Julia encontrado em: $juliaExe" -ForegroundColor Green
            Write-Host "   Versão:" -NoNewline
            & $juliaExe --version
            $found = $true
        }
    }
}

if (-not $found) {
    Write-Host "   ✗ Julia não encontrado em locais comuns" -ForegroundColor Red
}

Write-Host ""

# Instruções
Write-Host "3. Instruções:" -ForegroundColor Yellow
Write-Host ""
Write-Host "   Se Julia NÃO foi encontrado:" -ForegroundColor Yellow
Write-Host "   1. Baixe em: https://julialang.org/downloads/" -ForegroundColor White
Write-Host "   2. Instale e marque 'Add Julia to PATH'" -ForegroundColor White
Write-Host "   3. Reinicie o PowerShell" -ForegroundColor White
Write-Host ""
Write-Host "   Se Julia FOI encontrado mas não está no PATH:" -ForegroundColor Yellow
Write-Host "   Use o caminho completo para executar:" -ForegroundColor White
Write-Host "   Exemplo: & 'C:\caminho\para\julia\bin\julia.exe' demo.jl" -ForegroundColor White
Write-Host ""

# Tentar executar teste rápido se Julia foi encontrado
if ($juliaPath -or $found) {
    Write-Host "4. Executando teste rápido..." -ForegroundColor Yellow
    Write-Host ""
    
    if ($juliaPath) {
        & julia teste_rapido.jl
    } else {
        # Usar o primeiro Julia encontrado
        $firstJulia = (Get-ChildItem -Path $commonPaths -ErrorAction SilentlyContinue | 
                      Where-Object { Test-Path (Join-Path $_.FullName "bin\julia.exe") } | 
                      Select-Object -First 1)
        if ($firstJulia) {
            $juliaExe = Join-Path $firstJulia.FullName "bin\julia.exe"
            & $juliaExe teste_rapido.jl
        }
    }
}

Write-Host ""
Write-Host ("=" * 60) -ForegroundColor Cyan


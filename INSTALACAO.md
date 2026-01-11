# Guia de Instalação e Execução

## Instalação do Julia

### Opção 1: Download Direto (Recomendado)

1. Acesse: https://julialang.org/downloads/
2. Baixe a versão **Julia 1.9 ou superior** para Windows (64-bit)
3. Execute o instalador
4. **IMPORTANTE**: Durante a instalação, marque a opção **"Add Julia to PATH"**

### Opção 2: Via Chocolatey (se você tem Chocolatey instalado)

```powershell
choco install julia
```

### Opção 3: Via Winget (Windows 10/11)

```powershell
winget install Julia.Julia
```

## Verificar Instalação

Após instalar, abra um novo PowerShell e execute:

```powershell
julia --version
```

Você deve ver algo como: `julia version 1.9.x`

## Executar o Projeto

### Método 1: Via Linha de Comando

```powershell
# Navegar até a pasta do projeto
cd "C:\Users\Administrador\Desktop\teste de calculos"

# Executar a demonstração completa
julia demo.jl

# Ou executar o exemplo simples
julia exemplo_simples.jl
```

### Método 2: Via REPL do Julia

1. Abra o Julia (procure "Julia" no menu Iniciar)
2. No REPL, execute:

```julia
# Navegar até a pasta
cd("C:\\Users\\Administrador\\Desktop\\teste de calculos")

# Executar o demo
include("demo.jl")
```

### Método 3: Via VS Code com Extensão Julia

1. Instale a extensão "Julia" no VS Code
2. Abra a pasta do projeto no VS Code
3. Abra o arquivo `demo.jl`
4. Pressione `F5` ou clique em "Run"

## Solução de Problemas

### Erro: "julia não é reconhecido como comando"

**Solução**: O Julia não está no PATH do sistema.

1. Encontre onde o Julia foi instalado (geralmente em `C:\Users\SeuUsuario\AppData\Local\Programs\Julia-1.x.x\bin`)
2. Adicione essa pasta ao PATH do Windows:
   - Pressione `Win + R`, digite `sysdm.cpl` e pressione Enter
   - Vá em "Avançado" → "Variáveis de Ambiente"
   - Em "Variáveis do sistema", encontre "Path" e clique em "Editar"
   - Clique em "Novo" e adicione o caminho do bin do Julia
   - Reinicie o PowerShell/Terminal

**Alternativa rápida**: Use o caminho completo:

```powershell
& "C:\Users\Administrador\AppData\Local\Programs\Julia-1.9.5\bin\julia.exe" demo.jl
```

(Substitua `1.9.5` pela versão que você instalou)

### Erro: "Package not found"

Os pacotes `LinearAlgebra`, `Statistics` e `Random` já vêm com o Julia, então não precisam ser instalados. Se houver erro, execute no REPL:

```julia
using Pkg
Pkg.add("LinearAlgebra")
Pkg.add("Statistics")
Pkg.add("Random")
```

## Teste Rápido

Para verificar se tudo está funcionando, crie um arquivo `teste.jl`:

```julia
println("Julia está funcionando!")
println("Versão: ", VERSION)
```

Execute: `julia teste.jl`

Se você ver a mensagem e a versão, está tudo certo!


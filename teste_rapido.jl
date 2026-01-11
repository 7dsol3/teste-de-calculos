"""
Teste Rápido - Verifica se o ambiente Julia está funcionando
"""

println("=" ^ 60)
println("TESTE RÁPIDO DO AMBIENTE JULIA")
println("=" ^ 60)
println()

# Teste 1: Versão do Julia
println("1. Versão do Julia:")
println("   ", VERSION)
println()

# Teste 2: Pacotes básicos
println("2. Testando pacotes básicos:")
try
    using LinearAlgebra
    println("   ✓ LinearAlgebra carregado")
catch e
    println("   ✗ Erro ao carregar LinearAlgebra: $e")
end

try
    using Statistics
    println("   ✓ Statistics carregado")
catch e
    println("   ✗ Erro ao carregar Statistics: $e")
end

try
    using Random
    println("   ✓ Random carregado")
catch e
    println("   ✗ Erro ao carregar Random: $e")
end
println()

# Teste 3: Operações básicas
println("3. Testando operações matemáticas:")
try
    a = [1.0 2.0; 3.0 4.0]
    b = inv(a)
    println("   ✓ Operações de matriz: OK")
    println("   Exemplo: inv([1 2; 3 4]) =")
    println("   ", b)
catch e
    println("   ✗ Erro: $e")
end
println()

# Teste 4: Constantes físicas (simulação)
println("4. Constantes físicas (valores de exemplo):")
const ħ = 1.054571817e-34
const c = 299792458.0
const G = 6.67430e-11
const l_P = sqrt(ħ * G / c^3)

println("   ħ (Planck reduzida): $(ħ) J⋅s")
println("   c (velocidade da luz): $(c) m/s")
println("   G (gravitacional): $(G) m³/kg/s²")
println("   l_P (Planck): $(l_P) m")
println()

# Teste 5: Verificar se o módulo pode ser carregado
println("5. Testando carregamento do módulo:")
try
    include("UnifiedQuantumGravity.jl")
    println("   ✓ UnifiedQuantumGravity.jl carregado com sucesso!")
    using .UnifiedQuantumGravity
    println("   ✓ Módulo importado com sucesso!")
catch e
    println("   ✗ Erro ao carregar módulo: $e")
    println("   (Isso é normal se você ainda não executou o código principal)")
end
println()

println("=" ^ 60)
println("TESTE CONCLUÍDO")
println("=" ^ 60)
println()
println("Se todos os testes passaram, você pode executar:")
println("  julia demo.jl")
println("ou")
println("  julia exemplo_simples.jl")


"""
Exemplo Simples: Uso Básico do Módulo UnifiedQuantumGravity

Este exemplo mostra como usar as funções principais do módulo
de forma direta e simples.
"""

include("UnifiedQuantumGravity.jl")
using .UnifiedQuantumGravity

# 1. Imprimir constantes fundamentais
println("=== Constantes Fundamentais ===")
print_constants()
println()

# 2. Criar uma métrica de Minkowski (espaço-tempo plano)
println("=== Criando Métrica Inicial ===")
metric = create_minkowski_metric((5, 5, 5), 5)
println("Métrica criada com dimensões: $(size(metric.g))")
println()

# 3. Inicializar estados quânticos
println("=== Inicializando Estados Quânticos ===")
quantum_field = initialize_quantum_states(10)
println("Estados quânticos criados: $(length(quantum_field.states))")
println()

# 4. Definir coeficientes de correção quântica
println("=== Coeficientes de Correção Quântica ===")
α_coeffs = [0.1, 0.01, 0.001]
for (i, α) in enumerate(α_coeffs)
    println("α_$i = $α")
end
println()

# 5. Calcular a equação unificada (sem resolver)
println("=== Calculando Equação Unificada ===")
try
    residual, einstein, T_quant, QG = unified_field_equation(
        metric, 
        quantum_field, 
        α_coeffs
    )
    println("✓ Equação calculada com sucesso")
    println("  Norma do resíduo: $(norm(residual))")
    println("  Norma do termo de Einstein: $(norm(einstein))")
    println("  Norma do tensor quântico: $(norm(T_quant))")
    println("  Norma das correções QG: $(norm(QG))")
catch e
    println("⚠ Erro: $e")
end
println()

# 6. Simulação rápida de flutuações (poucas amostras)
println("=== Simulação de Flutuações Quânticas ===")
try
    mean_curve, std_curve, _ = quantum_fluctuations_simulation(
        metric,
        quantum_field,
        α_coeffs;
        N_samples=50
    )
    println("✓ Simulação concluída")
    println("  Curvatura média: $mean_curve")
    println("  Desvio padrão: $std_curve")
catch e
    println("⚠ Erro: $e")
end

println("\n=== Exemplo Concluído ===")


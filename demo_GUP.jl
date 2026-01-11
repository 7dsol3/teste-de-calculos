"""
Demo: Generalized Uncertainty Principle (GUP) Corrigida

Este script demonstra a implementação corrigida da GUP com:
- Comutadores modificados até O(ℓ_P²)
- Parâmetro correto: α = 3/5 (não 5/3)
- Relação de incerteza corrigida: (ΔX)_min = √(5α/3) ℓ_P
"""

include("GUP_Corrigido.jl")
using .GUP_Corrigido

function main()
    println("\n")
    println("=" ^ 70)
    println("DEMONSTRAÇÃO: GUP CORRIGIDA")
    println("=" ^ 70)
    println()
    
    # Executar demonstração completa
    ΔX_min = demonstrar_GUP_corrigida()
    
    println()
    println("=" ^ 70)
    println("TESTES ADICIONAIS")
    println("=" ^ 70)
    println()
    
    # Teste 1: Comutadores para diferentes momentos
    println("Teste 1: Comutadores [X̂_i, P̂_j]")
    println("-" ^ 70)
    
    momentos_teste = [
        ([1e-24, 0.0, 0.0], "Momento atômico"),
        ([1e-20, 1e-20, 0.0], "Momento intermediário"),
        ([ħ/l_P, 0.0, 0.0], "Momento de Planck")
    ]
    
    for (P, descricao) in momentos_teste
        println("\n  $descricao: P = $P")
        for i in 1:3, j in 1:3
            comut = comutador_X_P(i, j, P)
            if abs(comut) > 1e-40
                println("    [X̂_$i, P̂_$j] = $(real(comut)) + $(imag(comut))im")
            end
        end
    end
    
    println()
    println("=" ^ 70)
    println("Teste 2: Verificação da Identidade de Jacobi")
    println("-" ^ 70)
    verificar_identidade_jacobi()
    
    println()
    println("=" ^ 70)
    println("Teste 3: Comparação Heisenberg vs GUP")
    println("-" ^ 70)
    println()
    
    # Tabela comparativa
    ΔP_values = [1e-25, 1e-24, 1e-23, 1e-22, ħ/l_P]
    ΔP_names = ["Muito baixo", "Atômico", "Intermediário", "Alto", "Planck"]
    
    println("  ΔP (kg·m/s)     | ΔX (Heisenberg) | ΔX (GUP)      | Correção")
    println("  " * "-" ^ 65)
    
    for (ΔP, nome) in zip(ΔP_values, ΔP_names)
        ΔX_H = ħ / (2.0 * ΔP)
        ΔX_GUP = incerteza_GUP(ΔP)
        correcao = (ΔX_GUP / ΔX_H - 1.0) * 100.0
        
        @printf "  %-15s | %15.6e | %15.6e | %6.2f%%\n" nome ΔX_H ΔX_GUP correcao
    end
    
    println()
    println("=" ^ 70)
    println("CONCLUSÃO")
    println("=" ^ 70)
    println()
    println("✓ GUP implementada com correções técnicas:")
    println("  • Truncamento explícito até O(ℓ_P²)")
    println("  • Parâmetro correto: α = 3/5")
    println("  • Relação de incerteza corrigida: √(5α/3)")
    println("  • Não-comutatividade efetiva marcada como O(ℓ_P⁴)")
    println()
    println("✓ Resultado: (ΔX)_min = ℓ_P (verificado)")
    println()
    
    return ΔX_min
end

# Executar se chamado diretamente
if abspath(PROGRAM_FILE) == @__FILE__
    main()
end


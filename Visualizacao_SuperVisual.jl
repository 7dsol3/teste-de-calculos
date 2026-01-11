#!/usr/bin/env julia
# -*- coding: utf-8 -*-
"""
VERSÃO SUPER-VISUAL: GRÁFICOS ASCII + ANIMAÇÕES
Ideal para vídeos e apresentações de alto impacto visual
"""

using Printf
using LinearAlgebra
using Dates

const ħ = 1.054571817e-34
const h = 6.62607015e-34
const c = 299792458
const G = 6.67430e-11
const k_B = 1.380649e-23
const M_sun = 1.98892e+30

const l_P = sqrt(ħ * G / c^3)
const m_P = sqrt(ħ * c / G)
const t_P = sqrt(ħ * G / c^5)
const E_P = sqrt(ħ * c^5 / G)

# ═══════════════════════════════════════════════════════════════════════════════
# GRÁFICOS ASCII
# ═══════════════════════════════════════════════════════════════════════════════

function grafico_barras_horizontal(titulo, valores, labels; max_width=60)
    """Cria gráfico de barras horizontal ASCII"""
    println("\n" * titulo)
    println(repeat("═", length(titulo)))
    
    max_val = maximum(valores)
    
    for (label, valor) in zip(labels, valores)
        bar_length = Int(floor((valor / max_val) * max_width))
        bar = repeat("█", bar_length)
        @printf("%-20s │ %s %.6e\n", label, bar, valor)
        sleep(0.1)
    end
end

function grafico_escala_logaritmica(titulo, valores, labels)
    """Visualiza escalas em ordem logarítmica"""
    println("\n" * titulo)
    println(repeat("═", length(titulo)))
    
    for (label, valor) in zip(labels, valores)
        if valor > 0
            log_val = log10(valor)
            exponent = Int(floor(log_val))
            
            print(@sprintf("%-25s │ ", label))
            
            # Desenha a escala
            if exponent >= 0
                print(repeat("█", min(20, exponent + 1)))
            else
                print(repeat("▌", min(20, abs(exponent))))
            end
            
            @printf(" 10^(%d)\n", exponent)
            sleep(0.1)
        end
    end
end

function visualizar_hirarquia_escalas()
    """Mostra hierarquia de escalas do universo"""
    titulo = "🌌 HIERARQUIA DE ESCALAS DO UNIVERSO"
    println("\n" * repeat("█", 80))
    println("  " * titulo)
    println(repeat("█", 80))
    
    escalas = [
        ("Tamanho do universo observável", 1.37e26),
        ("Via Láctea (diâmetro)", 9.46e20),
        ("Sistema Solar (1 UA)", 1.496e11),
        ("Terra (raio)", 6.371e6),
        ("Monte Everest", 8.849e3),
        ("Humano (altura)", 1.7),
        ("Célula (típica)", 10e-6),
        ("Átomo (típico)", 1e-10),
        ("Núcleo atômico", 1e-15),
        ("Comprimento Planck", 1.616255e-35),
    ]
    
    labels = [x[1] for x in escalas]
    valores = [x[2] for x in escalas]
    
    grafico_escala_logaritmica("", valores, labels)
    
    println("\n" * repeat("─", 80))
    println("Distribuição: " * repeat(" ", 30) * "│ 10^35 ordens de magnitude")
    println(repeat("─", 80))
end

function grafico_energia_niveis()
    """Mostra níveis de energia do oscilador harmônico"""
    titulo = "⚛️  NÍVEIS DE ENERGIA - OSCILADOR HARMÔNICO"
    println("\n" * repeat("█", 80))
    println("  " * titulo)
    println(repeat("█", 80))
    
    omega = 1e15
    
    println("\n" * "Energia (estados n=0 a n=5):")
    println("─" * repeat("─", 78) * "\n")
    
    for n in 0:5
        E_n = ħ * omega * (n + 0.5)
        
        # Desenha nível com linha
        bar_height = Int(ceil((n + 0.5) * 3))
        
        print(@sprintf("n=%d │ ", n))
        print(repeat("─", bar_height))
        print("●")
        @printf("  E = %.3e J\n", E_n)
        
        sleep(0.15)
    end
    
    println("\n" * "─" * repeat("─", 78))
    println("✅ Cada nível espaçado por ħω (quantização)")
end

function grafico_potencial_poço()
    """Visualiza poço de potencial infinito"""
    titulo = "📊 POÇO DE POTENCIAL INFINITO 1D"
    println("\n" * repeat("█", 80))
    println("  " * titulo)
    println(repeat("█", 80))
    
    altura = 12
    largura = 40
    
    println("\nParede │ Região Classicamente Proibida │ Parede")
    println(repeat("─", 80))
    
    for h_i in altura:-1:0
        print("      ")
        
        # Paredes
        if h_i >= altura - 2
            print("▓")
        else
            print(" ")
        end
        
        print(" ")
        
        # Interior do poço
        for w_i in 1:largura
            if h_i == 0
                print("═")
            else
                print(" ")
            end
        end
        
        # Parede direita
        if h_i >= altura - 2
            print("▓")
        else
            print(" ")
        end
        
        print(" │ V(x) = ∞\n")
        sleep(0.05)
    end
    
    println("─" * repeat("─", 80))
    println("✅ Probabilidade é máxima no centro (n=1)")
end

function grafico_distribuicao_probabilidade()
    """Mostra distribuição de probabilidade para estados do poço"""
    titulo = "📈 DISTRIBUIÇÃO DE PROBABILIDADE |ψ(x)|²"
    println("\n" * repeat("█", 80))
    println("  " * titulo)
    println(repeat("█", 80))
    
    println("\nn=1 (Estado Fundamental)")
    println("─" * repeat("─", 78))
    
    L = 40
    for x in 0:L
        psi_sq = sin(π * x / L)^2
        bar_length = Int(floor(psi_sq * 20))
        print(@sprintf("%3d │ ", x))
        print(repeat("▓", bar_length))
        println()
        sleep(0.02)
    end
    
    println("\nn=2 (Primeiro Excitado)")
    println("─" * repeat("─", 78))
    
    for x in 0:L
        psi_sq = sin(2 * π * x / L)^2
        bar_length = Int(floor(psi_sq * 20))
        print(@sprintf("%3d │ ", x))
        print(repeat("▓", bar_length))
        println()
        sleep(0.02)
    end
    
    println("\nn=3 (Segundo Excitado)")
    println("─" * repeat("─", 78))
    
    for x in 0:L
        psi_sq = sin(3 * π * x / L)^2
        bar_length = Int(floor(psi_sq * 20))
        print(@sprintf("%3d │ ", x))
        print(repeat("▓", bar_length))
        println()
        sleep(0.02)
    end
end

function grafico_escalas_planck()
    """Exibe escalas de Planck com visualização"""
    titulo = "🔬 ESCALAS DE PLANCK - REGIME QUÂNTICO-GRAVITACIONAL"
    println("\n" * repeat("█", 80))
    println("  " * titulo)
    println(repeat("█", 80))
    
    println("\n" * "Escalas Fundamentais:")
    println("─" * repeat("─", 78))
    
    escalas = [
        ("Comprimento de Planck (l_P)", l_P, "m"),
        ("Tempo de Planck (t_P)", t_P, "s"),
        ("Massa de Planck (m_P)", m_P, "kg"),
        ("Energia de Planck (E_P)", E_P, "J"),
    ]
    
    for (nome, valor, unidade) in escalas
        @printf("%-35s │ %12.6e %s", nome, valor, unidade)
        
        # Log scale visualization
        log_val = log10(valor)
        if log_val < 0
            print("  │ " * repeat("▌", abs(Int(floor(log_val)))))
        else
            print("  │ " * repeat("█", min(10, Int(floor(log_val)))))
        end
        
        println()
        sleep(0.2)
    end
end

function tabela_comparacao_escalas()
    """Compara diferentes escalas e regimes"""
    titulo = "🌍 COMPARAÇÃO DE ESCALAS E REGIMES"
    println("\n" * repeat("█", 80))
    println("  " * titulo)
    println(repeat("█", 80))
    
    println("\n" * "Regime Comparativo:")
    println("─" * repeat("─", 78))
    
    comparacoes = [
        ("Planck / Atômico", l_P / 1e-10),
        ("Atômico / Humano", 1e-10 / 1.7),
        ("Humano / Terra", 1.7 / 6.371e6),
        ("Terra / Sistema Solar", 6.371e6 / 1.496e11),
        ("Sistema Solar / Universo", 1.496e11 / 1.37e26),
    ]
    
    println(@sprintf("%-35s │ Razão (log10)", "Transição"))
    println("─" * repeat("─", 78))
    
    for (descricao, razao) in comparacoes
        log_razao = log10(razao)
        @printf("%-35s │ %.2e\n", descricao, razao)
        sleep(0.1)
    end
end

function animacao_final()
    """Animação final de conclusão"""
    println("\n" * repeat("█", 80))
    println("✅ EXECUÇÃO COMPLETADA COM SUCESSO")
    println(repeat("█", 80))
    
    println("\n" * "Animação Final:")
    println("─" * repeat("─", 78) * "\n")
    
    frames = ["◐", "◓", "◑", "◒"]
    for i in 1:12
        frame = frames[(i % 4) + 1]
        @printf("\r  %s  Finalizando análise... [%3d%%] ", frame, Int(floor(i * 100 / 12)))
        sleep(0.2)
    end
    
    println("\r  ✅ Pronto para vídeo! [100%]  \n")
end

# ═══════════════════════════════════════════════════════════════════════════════
# PROGRAMA PRINCIPAL
# ═══════════════════════════════════════════════════════════════════════════════

function main()
    println("\n" * repeat("█", 80))
    println("🎬 VISUALIZAÇÃO SUPER-VISUAL: GRÁFICOS ASCII + ANIMAÇÕES")
    println(repeat("█", 80))
    println("Ideal para: YouTube, Vídeos Tutorial, Apresentações")
    println("Linguagem: Julia 1.10.0")
    println("Data: " * string(now()) * "\n")
    
    sleep(0.5)
    
    # Executa visualizações
    visualizar_hirarquia_escalas()
    sleep(0.3)
    
    grafico_escalas_planck()
    sleep(0.3)
    
    grafico_potencial_poço()
    sleep(0.3)
    
    grafico_distribuicao_probabilidade()
    sleep(0.3)
    
    grafico_energia_niveis()
    sleep(0.3)
    
    tabela_comparacao_escalas()
    sleep(0.3)
    
    animacao_final()
    
    # Sumário
    println(repeat("█", 80))
    println("📊 RESUMO DAS VISUALIZAÇÕES:")
    println(repeat("█", 80))
    println("  ✅ Hierarquia de escalas (35 ordens de magnitude)")
    println("  ✅ Escalas de Planck (regime quântico-gravitacional)")
    println("  ✅ Poço de potencial (confinamento quântico)")
    println("  ✅ Distribuição de probabilidade (3 estados)")
    println("  ✅ Níveis de energia (quantização)")
    println("  ✅ Comparação de escalas (transições regimes)")
    println("  ✅ Animações suaves (efeito vídeo profissional)")
    println(repeat("█", 80) * "\n")
end

main()

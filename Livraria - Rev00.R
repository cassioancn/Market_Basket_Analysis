#-----------------------------------------------------
# Gestao da Informacao Empresarial
# Regras de associacao
# Problema: Livraria 
# Prof. Leandro Gauss
#-----------------------------------------------------
# Instalar e carregar pacotes
#------------------------------------------------------

# Instalar pacotes
#install.packages("readxl")                # le arquivos de excel
#install.packages("arules")                # cria regras de associacao usando algoritmo APRIORI
#install.packages("arulesViz")             # gera graficos de visualizacao das regras de associacao

# Carregar pacotes
library(readxl)                            # le arquivos de excel
library(arules)                            # cria regras de associacao usando algoritmo APRIORI
library(arulesViz)                         # gera graficos de visualizacao das regras de associacao

#------------------------------------------------------
# Carregar dataset
#------------------------------------------------------

# Ler arquivos .xls
dados = read_xlsx("livraria.xlsx")

#------------------------------------------------------
# Criar regras de associacao
#------------------------------------------------------

# Transformar dados em transacoes
trans = as(as.matrix(dados),"transactions")

# Criar as regras de associacao
rules = apriori(trans,                        # dados em formato de transcoes
                parameter=list(suppor = 0.1,  # suporte (0 ate 1)
                               conf = 0.1,    # confianca (0 ate 1)
                               minlen = 1))   # tamano minimo das transacoes

# Ordenar os dados com base em um criterio
rules = sort(rules, by = "support")           

# Apresentar as regras de associacao em forma de texto
inspect(rules)

# Apresentar as regras de associacao de forma grafica
plot(rules, method="graph",)

#------------------------------------------------------
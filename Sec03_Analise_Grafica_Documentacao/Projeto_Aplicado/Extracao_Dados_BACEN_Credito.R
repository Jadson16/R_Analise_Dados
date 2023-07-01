###########################################################
#
# EXTRAÇÃO DE DADOS DO BACEN
#
##########################################################

# Apagar todas as listas e objetos da memoria
rm(list = ls())


# Pacotes -----------------------------------------------------------------

#Pacotes e bibliotecas
#install.packages("rbcb") #or
#devtools::install_github('wilsonfreitas/rbcb')
library(rbcb)
library(dplyr)
library(ggplot2)


# Período de Análise ------------------------------------------------------

from <- as.Date("2007-03-01") # Inicio do periodo analisado

to <-  as.Date("2023-05-01")  # Fim do período analisado


# Baixando dados ----------------------------------------------------------
# Saldo Geral -----------------------------------------------------------------
saldo_total <- get_series(20539, 
                          start_date = from, 
                          end_date = to)    


saldo_total_pj <- get_series(20540, 
                             start_date = from, 
                             end_date = to) 


saldo_total_pf <- get_series(20541, 
                             start_date = from, 
                             end_date = to) 


# Saldo com Recursos Livres ---------------------------------------------------
saldo_total_livres <- get_series(20542, 
                                 start_date = from, 
                                 end_date = to)    


saldo_total_livres_pj <- get_series(20543, 
                                    start_date = from, 
                                    end_date = to)    


saldo_total_livres_pf <- get_series(20570, 
                                    start_date = from, 
                                    end_date = to)  


# Saldo com Recursos Direcionados ---------------------------------------------
saldo_total_direcionado <- get_series(20593, 
                                      start_date = from, 
                                      end_date = to)	


saldo_total_direcionado_pj <- get_series(20594, 
                                         start_date = from, 
                                         end_date = to)	


saldo_total_direcionado_pf <- get_series(20606, 
                                         start_date = from, 
                                         end_date = to)	


# Saldo com Recursos Direcionados - Pessoa Fisica ------------------------------
direcionado_pj_rural <- get_series(20597, 
                                   start_date = from, 
                                   end_date = to) 


direcionado_pj_imobiliario <- get_series(20600, 
                                         start_date = from, 
                                         end_date = to)


direcionado_pj_bndes <- get_series(20604, 
                                   start_date = from, 
                                   end_date = to) 


# Saldo com Recursos Direcionados - Pessoa Fisica ------------------------------
direcionado_pf_rural <- get_series(20609, 
                                   start_date = from, 
                                   end_date = to) 


direcionado_pf_imobiliario <- get_series(20612, 
                                         start_date = from, 
                                         end_date = to) 


direcionado_pf_microcredito <- get_series(20616, 
                                          start_date = from, 
                                          end_date = to) 


direcionado_pf_bndes <- get_series(20620, 
                                   start_date = from, 
                                   end_date = to) 

#####################################################################
# ATIVIDADE DE UM PROJETO APLICADO
#####################################################################
# 1. Baixar e juntar todos os arquivos em um único data.frame para ser analisado.
# 2. Renomear as colunas com os nomes das variáveis e não códigos
# 3. Criar variáveis de proporção entre Saldo livre, Saldo direcionado comparativamente ao saldo total
# 4. Filtrar o período de análise para até dezembro de 2019 (Excluir a pandemia)
# 5. Criar gráficos de linha para 
# 5a. Saldo total, total pj e total pf
# 5b. Saldo total, livre e direcionado
# 5c. Saldo total por Componentes do crédito direcionado (rural, imobiliario, bndes)
#######################################################
###    INSTALAÇÃO E CARREGAMENTO DE PACOTES NO R    ###
#######################################################

# O R possui pacotes básicos já baixados e carregados.
# Tem pacotes já baixados, mas que devem ser carregados (pacotes recomendados).
# Possui pacotes para serem baixados e carregados (CRAN).
# É preciso estar conectado à internet para instalar um pacote
# Nem sempre a instalação de um pacote funciona devido à versão do R. 
## Isso acontece porque novos pacotes são criados a todo o momento e somente em versões mais recentes do R que estes podem ser instalados

# http://cran.rstudio.com/

# BAIXAR PACOTES, CASO ELES AINDA NÃO ESTEJAM BAIXADOS
install.packages("wooldridge")
install.packages("ggplot2") # calcula area do polígono

# CARREGAR PACOTES
library(ggplot2)
#library(erer) #Empirical Research in Economics with R

?dplyr

# BAIXAR PACOTES, CASO ELES AINDA Nã O ESTEJAM BAIXADOS
if(!require(ggplot2)) install.packages("ggplot2") 

# CARREGAR PACOTES
require(ggplot2)

# REMOVER PACOTES
remove.packages("wooldridge")





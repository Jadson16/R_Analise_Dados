############################################
###    EXPLORAÇÃO E ANÁLISE DOS DADOS    ###
############################################

# CARREGAR PACOTES ----------------------------------------------------------
library(dplyr)
if(!require(rstatix)) install.packages("rstatix") 
library(rstatix)

# BUSCAR DIRETÓRIO (PASTA COM OS ARQUIVOS) 
setwd("C:/Users/Minhas_Pastas/dados") # colocar seu endereço

# BASE DE DADOS TRATADA -------------------------------------------------------
covid_sp_tratado <- read.csv2('dados/covid_sp_tratado.csv', sep = ";", encoding="UTF-8")
View(covid_sp_tratado)

covid_sp_tratado <- read.csv2('dados/covid_sp_tratado.csv', sep = ",")
View(covid_sp_tratado)

glimpse(covid_sp_tratado)

# outras opções
covid_sp_tratado <- read.csv('dados/covid_sp_tratado.csv', sep = ",")
View(covid_sp_tratado)

glimpse(covid_sp_tratado)


# Fazendo ajustes da base -----------------------------------------------------
covid_sp_tratado$data <- as.Date(covid_sp_tratado$data, format ='%Y-%m-%d')
glimpse(covid_sp_tratado)

covid_sp_tratado$idoso... <- as.numeric(covid_sp_tratado$idoso...)
glimpse(covid_sp_tratado)

# Renomeando a coluna idoso
covid_sp_tratado <- rename(covid_sp_tratado, porcentagem_idoso = idoso...)
glimpse(covid_sp_tratado)


# ----------------------------------------------------
# Análise de dados
# ----------------------------------------------------


####################################################################
# Filtro por linha (elementos de trabalho) -------------------------
####################################################################

# Campinas
covid_campinas <- covid_sp_tratado |> 
  filter(municipio=="Campinas")
View(covid_campinas)

## análises e erros de medida
covid_campinas["dens_demografica"] <- covid_campinas$pop/covid_campinas$area
View(covid_campinas)

covid_campinas["area"] <- covid_campinas$area/100

covid_campinas["dens_demografica"] <- covid_campinas$pop/covid_campinas$area
View(covid_campinas)

# Guarulhos (outra forma de filtrar)
covid_guarulhos <- covid_sp_tratado[which(covid_sp_tratado$municipio=="Guarulhos"), ]

covid_guarulhos["area"] <- covid_guarulhos$area/100

covid_guarulhos["dens_demografica"] <- covid_guarulhos$pop/covid_guarulhos$area
View(covid_guarulhos)







####################################################################
### ANáLISES ESTATíSTICAS
####################################################################

# Medidas de centralidade -----------------------------------

# Média
mean(covid_campinas$obitos_novos)
mean(covid_campinas$casos_novos)

## média para varias variáveis
summarise_at(covid_campinas, vars(obitos_novos, casos_novos), mean)

mean(covid_guarulhos$obitos_novos)
mean(covid_guarulhos$casos_novos)

# Plotando um gráfico simples - Média móvel -
plot(covid_campinas$data,covid_campinas$casos_mm7d, 
     title("MÉDIA MÓVEL"), 
     col = "red")

plot(covid_campinas$data,covid_campinas$obitos_mm7d, 
     title("MÉDIA MÓVEL"), col = "purple")


# Mediana
median(covid_campinas$obitos_novos)
median(covid_campinas$casos_novos)
summarise_at(covid_campinas, vars(obitos_novos, casos_novos), median)

median(covid_guarulhos$obitos_novos)
median(covid_guarulhos$casos_novos)


# Moda

# Criando uma função
moda <- function(m) {
  valor_unico <- unique(m) #Busca o valor único para a coluna.
  valor_unico[which.max(tabulate(match(m, valor_unico)))] #tabular (contabilizar quantas vezes o valor único aparece) e buscar o maior valor
}

# Obtenção da moda
moda(covid_campinas$obitos_novos)
moda(covid_campinas$casos_novos)

summarise_at(covid_campinas, vars(obitos_novos, casos_novos), moda)

moda(covid_guarulhos$obitos_novos)
moda(covid_guarulhos$casos_novos)


# Podemos atribuir um resultado em um objeto para ser 
# utilizado posteriormente





# Medidas de centralidade -------------------------------------------------
## Estudo para um mês

## Exemplo campinas
covid_julho_campinas <- covid_campinas %>% 
  filter(mes==7)

# Estudo da moda para o mês de julho
moda(covid_julho_campinas$obitos_novos)
moda(covid_julho_campinas$casos_novos)
summarise_at(covid_julho_campinas, 
             vars(obitos_novos, casos_novos), 
             moda)

mean(covid_julho_campinas$obitos_novos)
mean(covid_julho_campinas$casos_novos)

# Histograma - built-in (R Base)
# Cidade Campinas
hist(covid_julho_campinas$obitos_novos, col="blue")
hist(covid_julho_campinas$casos_novos, col="red")

# para toda a serie
hist(covid_campinas$obitos_novos, col="blue")
hist(covid_campinas$casos_novos, col="red")

hist(covid_guarulhos$obitos_novos, col="green")
hist(covid_guarulhos$casos_novos, col="yellow")





# Medidas de dispersão e posição -----------------------------------------
## A média pode não ser uma boa medida 
## Amplitude (Max. e Min.)
## Desvio Populacional (diferença entre o valor e a média)
## Variancia Populacional (desvio ao quadrado)
## Desvio padrão populacional (Raiz quadrada da variância)
## Mas não trabalhamos com a população. Ajuste (n-1)
## Quartis (divisão do conjunto de dados em partes iguais)
## Amplitude Interquantil (Q3 - Q1) - Box plot

# Mínimo
min(covid_campinas$obitos_novos)
min(covid_campinas$casos_novos)
summarise_at(covid_campinas, vars(obitos_novos, casos_novos), min)

min(covid_guarulhos$obitos_novos)
min(covid_guarulhos$casos_novos)


# Máximo
max(covid_campinas$obitos_novos)
max(covid_campinas$casos_novos)
summarise_at(covid_campinas, vars(obitos_novos, casos_novos), max)

max(covid_guarulhos$obitos_novos)
max(covid_guarulhos$casos_novos)

# Amplitude Total
# campinas
range(covid_campinas$obitos_novos)
range(covid_campinas$casos_novos)
summarise_at(covid_campinas, 
             vars(obitos_novos, casos_novos), 
             range)

# guarulos
range(covid_guarulhos$obitos_novos)
range(covid_guarulhos$casos_novos)

# Quartis
quantile(covid_campinas$obitos_novos)
quantile(covid_campinas$casos_novos)
summarise_at(covid_campinas, 
             vars(obitos_novos, casos_novos), 
             quantile)

quantile(covid_guarulhos$obitos_novos)
quantile(covid_guarulhos$casos_novos)

# Amplitude Interquartil
# Ex. 1, 1, 2, 2, 3, 3, 3, 7, 8, 8, 8, 10, 12, 15, 37
IQR(covid_campinas$obitos_novos)
IQR(covid_campinas$casos_novos)
summarise_at(covid_campinas, vars(obitos_novos, casos_novos), IQR)

IQR(covid_guarulhos$obitos_novos)
IQR(covid_guarulhos$casos_novos)


# Todos os Quantis sumarizado

summary(covid_campinas$obitos_novos)
summary(covid_campinas$casos_novos)

summary(covid_guarulhos$obitos_novos)
summary(covid_guarulhos$casos_novos)


# Box Plot
## Campinas - Julho
summary(covid_julho_campinas$obitos_novos)
boxplot(covid_julho_campinas$obitos_novos)

summary(covid_julho_campinas$casos_novos)
boxplot(covid_julho_campinas$casos_novos)

## campinas - geral
summary(covid_campinas$casos_novos)
boxplot(covid_campinas$casos_novos)

summary(covid_guarulhos$casos_novos)
boxplot(covid_guarulhos$casos_novos)

# Tratando os outliers -------------------------------------

# Identificando e excluindo todos os outliers

## Identificando a existência de outliers
covid_guarulhos %>% 
  identify_outliers(casos_novos)

## Exclur os outliers
outliers = c(boxplot.stats(covid_guarulhos$casos_novos)$out)

# Agora sem outliers
covid_guarulhos_sem_outliers <- covid_guarulhos[-c(which(covid_guarulhos$casos_novos %in% outliers)),  ] # excluir a linha
boxplot(covid_guarulhos_sem_outliers$casos_novos)


# Excluindo alguns outliers ------------------

## Identificando a existência de outliers
covid_campinas %>% identify_outliers(casos_novos)

## selecionando sem os outliers
covid_campinas_sem_outliers<-covid_campinas %>% 
  filter(data != "2020-06-19")

## blox plot sem outliers
boxplot(covid_campinas_sem_outliers$casos_novos)


# O summary resulta em resumo estatístico
# de todas as variáveis numéricas/inteiras
summary(covid_guarulhos)


# Medidas de Dispersão ----------------------------------------------------
# - Grau de dispersão em relação a média

# Variância (subtria da média e eleva ao quadrado)

## campinas
var(covid_campinas$obitos_novos)
var(covid_campinas$casos_novos)

# grarulhos
var(covid_guarulhos$obitos_novos)
var(covid_guarulhos$casos_novos)

# campinas - julho
var(covid_julho_campinas$obitos_novos)
var(covid_julho_campinas$casos_novos)


# Desvio padrão (raiz quadrada da variância)
sd(covid_campinas$obitos_novos)
sd(covid_campinas$casos_novos)

sd(covid_guarulhos$obitos_novos)
sd(covid_guarulhos$casos_novos)

sd(covid_julho_campinas$obitos_novos)
sd(covid_julho_campinas$casos_novos)








# TESTES DE NORMALIDADE ---------------------------------------------------

# Existem 4 testes de normalidade principais (numéricos) e dois testes gráficos:
# Shapiro-Wilk (limite de 5000 amostras)
# Anderson-Darling
# Kolmogorov_Smirnov
# Cramer-Von Mises
# Histograma
# QQplot

# N?vel de significância DE 0,05(5%) ou nível de confian?a de 95%(MAIS UTILIZADO):
# Quando o par?metro p > 0,05 (distribuição normal).


if(!require(nortest)) install.packages("nortest")
library(nortest)

#Histograma
hist(covid_campinas$casos_novos, probability=T, col="blue")
lines(density(covid_campinas$casos_novos) , col="red")

# QQPLOT (GR?FICO DE DISTRIBUI??O NORMAL)
qqnorm(covid_campinas$casos_novos)
qqline(covid_campinas$casos_novos)

# Shapiro-Wilk
shapiro.test(covid_campinas$casos_novos)

# Anderson-Darling
ad.test(covid_campinas$casos_novos)

# Kolmogorov_Smirnov
ks.test(covid_campinas$casos_novos, pnorm)
lillie.test(covid_campinas$casos_novos)

#Cramer-Von Mises
cvm.test(covid_campinas$casos_novos)













# CORRELAÇÃO LINEAR
# method: "pearson" para dados paramétricos(normalidade e homocedasticidade))
#         "spearman" (volume grande de dados não paramêtricos)
#         "kendall" (volume pequeno de dados n?o paramêtricos)

plot(covid_campinas$casos,covid_campinas$obitos)
cor(covid_campinas$casos,covid_campinas$obitos,method = "spearman")

regressao <- lm(formula= obitos ~ casos, data=covid_campinas) #modelo de regress?o
regressao$coefficients
summary(regressao)

### Equação: obitos=51.67+0,0337*casos

### Coeficiente de determinação (ajustado): 0,9832







### GRÁFICO DE LINHA COM AJUSTE DE RETA  COM GGPLOT2

if(!require(ggplot2)) install.packages("ggplot2") 
library(ggplot2)
if(!require(ggpubr)) install.packages("ggpubr") #equação da reta no gráfico
library(ggpubr)

ggplot(data = covid_campinas, mapping = aes(x = casos, y = obitos)) +
  geom_point() +
  geom_smooth(method = "lm", col = "red") +
  stat_regline_equation(aes(label = paste(..eq.label.., ..adj.rr.label..,
                            sep = "*plain(\" ,   \")~~")), label.x = 15000,
                            label.y = 1800) +
  theme_gray()


if(!require(corrplot)) install.packages("corrplot")                               
library(corrplot) # gráfico de correlação 

matriz_corr <- cor(covid_campinas[5:13], method = "spearman")
View(matriz_corr)

corrplot(matriz_corr, method = "color")
corrplot(matriz_corr, method="color", 
         type="full", order="original", 
         addCoef.col = "black", # adiciona o coeficiente a matriz
         tl.col="black", tl.srt=45, # cor e rotaçãpo do nome das variáveis
)



# GRÁFICOS LINEARES POR CIDADES

covid_cidades<-covid_sp_tratado %>% filter (municipio  %in% c("Campinas", "Guarulhos", "Sorocaba"))
View(covid_cidades)

ggplot(covid_cidades, aes(x = casos, y = obitos, color = municipio)) +
  geom_line() +
  labs(title = "Evolução dos óbitos em funçãoo dos casos de COVID",
       x = "Casos",
       y = "Óbitos") +
  theme_classic()





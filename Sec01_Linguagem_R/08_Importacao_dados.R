#######################################
###    IMPORTAÇÃO DE DATA FRAMES    ###
#######################################

# Se estiver trabalhando com um projeto. Especificar caminho
#getwd()
#setwd("C:/Users/Jadson/Desktop/Linguagem_R") #session>setwd>choose d.

# Arquivo txt

df1 <- read.table("dados/partks.txt")
df1
View(df1)

# Arquivo csv

df2 <- read.csv("dados/mola.csv")
df2

df3 <- read.csv("dados/questoes.csv")

df3 <- read.csv("dados/questoes.csv", encoding = "latin-1")

df3 <- read.csv("dados/questoes.csv", encoding = "iso-8859-1")

df3 <- read.csv("dados/questoes.csv", encoding = "UTF-8")


# Arquivo excel

install.packages("readxl")
library(readxl)

df4 <- read_xlsx("dados/registro.xlsx")














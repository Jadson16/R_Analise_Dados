#######################################################
###    ESTRUTURA DOS DADOS - DATA FRAME E LISTAS    ###
#######################################################

### DATA FRAME ###

# É uma tabela de dados onde cada coluna representa os atributos ou variáveis
# cada linha representa um registro desse atributo ou variável
# Pode ter números e caracteres juntos (essa é a principal diferença com relação a matriz).

mes_numero <- c(1,2,3,4,5,6,7,8,9,10,11,12)
mes_nome <- c("janeiro","fevereiro","mar?o","abril","maio","junho","julho",
            "agosto","setembro","outubro","novembro","dezembro")
ano <- c(2021,2021,2021,2021,2021,2021,2021,2021,2021,2021,2021,2021)
data.frame(mes_numero, mes_nome, ano)

#criando uma variavel
data_frame <- data.frame(mes_numero,mes_nome,ano)
View(data_frame)

# Data Frames pertencentes ao R
df <- mtcars
df
View(mtcars)

df2 <- airquality
df2
View(airquality)

?airquality
?datasets

library(help = "datasets")

df3 = iris
View(df3)

nrow(df3)
ncol(df3)
dim(df3)
summary(df3)


# Manipulando a matriz
df$cyl # $ nome da coluna

df$cyl[3] # $ nome da coluna e [] linha

df[df$gear>2,] # possível filtrar informações que se deseja

# ou
subset(df, gear > 2)

subset(df, gear > 2 & gear < 4)

df3 <- df[, -2] # exclui uma coluna inteira

df3 <- df[-1,] # exclui uma linha inteira 


### LISTAS ###

# Podem conter elementos de diferentes tipos (tipo especial de vetor)
# Uma lista tem a mesma finalidade de uma data.frame, porém aceita vetores de tamanhos diferentes.

nome <- c("Luciano", "Pedro", "Joyce", "Maria")
idade <- c(46, 38, 27, 29)
curso <- c("Estatística", "Economia", "Direito", "Medicina")
lista <- list(nome, idade, curso)
print(lista)

# objeto da lista, basta colocar entre colchetes.
lista[1]

# nomeando termos da lista
lista2 <- list(nome = c("Luciano","Pedro","Joyce", "Maria"),
               idade = c(46, 38, 27, 29),
               curso = c("Estatística", "Economia", "Direito", "Medicina"))
lista2

lista2[3]




           
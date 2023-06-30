###############################
###   OBJETOS (VARIAVEIS)   ###
###############################


# Atribuição de Variaveis -------------------------------------------------

# Pode-se atribuir valores à variáveis com o operador <- 

m <- 4 * 7
# ou
n = 4 * 7

a<-c<-5 # atribuição múltipla

z <- 1:8 # outras objetivos podem ser atribuídos

# Impressão de Variáveis --------------------------------------------------

print(m)

m

cat('O conteúdo de m é',m,'\n') # '\n' pula de linha


# NOTAS SOBRE ATRIBUIÇÃO DE VARIÁVEIS -------------------------------------

## Não usar palavras reservadas:
## break, else, for, function, IF, in, next, repeat, while, FALSE, Inf, 
## NA, NaN, NULL,TRUE ...
## Não colocar acentuações.
## O R é case sensitive, isto é, faz distinção entre letras maiúsculas e minúsculas


# exemplo de palavra reservada
in <- 3 + 4

p <- 15 / 3
p

# Operações com variáveis

diferenca <- m - p
diferenca

a <- 2
b <- 4
c <- a * b
c <- a**b

x <- z/2

# TIPO BÁSICO DO OBJETO (MODO) --------------------------------------------

# numeric: numérico
# integer: inteiro
# complex: número complexo
# character (string): caractere
# logical (boolean): lógicos (True e False)
# factor: categorias bem definidas. ex: gênero (masculino e feminino)
#                                       estado civil(casado, solteiro, viúvo...)
#                                       ano (2019, 2020, 2021...)

y = 2
class(y)

y <- as.integer(y)
y
class(y)

x = 7.5
class(x)
x <- as.integer(x)
class(x)
x

complexo <- 2i
complexo
class(complexo)

caracter <- "palavra" # tem que está entre aspas " ou '
class(caracter)

logica <- TRUE
class(logica)

logica <- "TRUE"
class(logica)


genero <- c("masculino","feminino", "masculino")
genero
class(genero)

genero <- as.factor(genero)
genero
class(genero)

### TIPO BÁSICO DO OBJETO (Comprimento)
 
length(genero)

p <- 43
length(p)

q <- "bom dia" 
length(q)

w <- c("bom dia","boa tarde", "boa noite")
length(w)









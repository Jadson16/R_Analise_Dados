#########################################
###   ESTRUTURA DOS DADOS - VETORES   ###
#########################################

# Sequência de valores numúricos ou caracteres
# podem ser criados de difernetes formas

vetor <- c(1,2,3,4,5,6,7)
class(vetor)

y<-seq(4,30,by=2) # começa em 4 e acaba em 30, com passo de 2
y

z<-seq(0,9,length.out=3) # começa em 0 e acaba em 9, com 3 elementos
z

z<-seq(0,9,len=3) # pode-se escrever somente as inicias do parâmetro se nenhum outro parâmetro da função tiver as mesmas iniciais

p<-rep(7,times=12) # valores repetidos
p

p<-rep(seq(-1,3),times=3) # função dentre de função
p

# como caracter
dias <- c("segunda", "terça", "quarta", "quinta", "sexta", "sábado", "domingo")
class(dias)

juntando <- c(vetor, dias)
juntando
class(juntando)

gastos_dia <- c(400, 300, 100, 500, 150, 430, 70)
gastos_dia
class(gastos_dia)
length(gastos_dia)

ordem_crescente <- sort(gastos_dia)
ordem_crescente

#  Funções para Vetores
total <- sum(gastos_dia) # soma dos valores do vetor
total

minimo <- min(gastos_dia)
min(gastos_dia)

max(gastos_dia)
maximo <- max(gastos_dia)

media <- mean(gastos_dia)
mean(gastos_dia)

limite <- (gastos_dia <= 300)
limite

## mais exemplos
y<-seq(4,30,by=2)
range(y) # valores mínimo e máximo do vetor, respectivamente

median(y) # mediana do vetor

var(y) # variância do vetor

sd(y) # desvio padrão do vetor: raiz quadrada da variância

rev(y) # inverte o vetor y

append(y,9999,5) # anexa ao vetor y o número 9999 após a 5ª posição

head(y) # mostra o começo do vetor

tail(y) # mostra o final do vetor

# Acessando Posições de um Vetor
posicao <- gastos_dia[5]
posicao
gastos_dia[4]

posicao_inexistente <- gastos_dia[8]
posicao_inexistente

posicao_excluida <- dias[-3]
posicao_excluida

posicao_excluida <- dias[-5]
posicao_excluida

# Comandos Especiais para Vetores

## unique(v) vetor sem repetições
v <- c(2,6,8,3,2,5,8,0)
unique(v)

##  table() retorna uma tabela com o número de ocorrências
table(v)
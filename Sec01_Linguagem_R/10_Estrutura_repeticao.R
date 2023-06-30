##########################################################
###    ESTRUTURA DE REPETIÇÃO : for, while e repeat    ###
##########################################################


# Laços -------------------------------------------------------------------

# Também chamados de ciclos ou loops, esta estrutura permite repetir um bloco de comandos um número específico
# de vezes ou até que uma certa condição se torne falsa.

# for(){...}

# Exemplo 1

for (i in 1:10) {
  print (i)
}


# Exemplo 2
lista <- c(1, 2, 3, 4, 10)
for (numero in lista){
  mult = numero * 2
  print(mult)
}

# while(condição){...}
# Enquanto condição é verdadeira, o bloco de comandos {...} é executado.

c <- 1
while (c <= 10 ) {
  print (c)
  c <- c+2
}


c <- 1
while (c <= 10) {
  s = c + 10
  print(s)
  c = c + 1
}

# repeat(condição){...}
# Estrutura de repetição

y <- 2
repeat {
  print (y)
  y <- y+1
  if (y >= 10) break()
}


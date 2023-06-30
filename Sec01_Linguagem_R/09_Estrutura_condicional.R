###############################################
###    ESTRUTURA CONDICIONAL - if e else    ###
###############################################

# São comandos que executam determinadas ações desde que alguma(s) condição(ões) seja(m) verdadeira(s).

# Condição if

if(condição){
  executa_algo}


# O bloco de comandos dentro do {...} só é executado se condição for TRUE, 
# caso contrário, nada é executado

# Exemplo if ---------------------------------

x <- 45

if(x>0){
  x<--x
  print(x)
}


# Condição if else ---------------------------- 

if(condição){
  executa_algo
}else{
    executa_algo
  }


# Exemplo 1

x <- 13
if (x < 10) {
  print("x é menor que 10!")
} else {
  print("x é maior ou igual a 10")
}


# Exemplo 2

x<-12
if(x%%2==0){
  print('é par')
} else {
  print('é ímpar')}


# Condição else if ---------------------------- 

# Exemplo 1

y <- 22
if (y < 20){
  print("y é menor que 20!")
} else if (y == 20){
  print("y é igual a 20")
} else {
  print("y é maior que 20")
}


# Exemplo 2

w <- 16
ifelse(w %% 2 == 0, "par", "impar")


# Exemplo 3

nota <- 8
if (nota >= 6){
  print('Aprovado')
} else if (nota >= 5 & nota< 6){
  print('Recuperação')
} else {
  print('Reprovado')
}


#######################
####    FUNÇÕES     ###
#######################


# Escrevendo Funções ------------------------------------------
nome_funcao<-function(parâmetros){...}

# Exemplo 1
nome <- "Jadson"
boas_vindas<-function(){
  cat('Boas vindas ao R', nome)
}

#Exemplo 2

maior = function (x,y) {
  if (x < y) {
    return (y)
  } else { 
    return (x)
  }
}

x <- 10
y <- 8
maior (x , y)

# OU

maior (12,25)
maior(23,23)
maior(-3, -8)

# Exemplo 2
pitagoras_hipotenusa <- function (cat1, cat2) {
  sqrt (cat1**2+cat2**2)
}

pitagoras_hipotenusa(4,3)

pitagoras_hipotenusa(8,6)


# Exemplo 3

pitagoras = function (cat1, cat2, hip) {
  if (hip == "?") {
    sqrt (cat1**2+cat2**2)
  } else if (cat1 == "?") {
    sqrt (hip**2-cat2**2)
  } else {
    sqrt (hip**2-cat1**2)
  }
}

pitagoras(6,8,"?")
pitagoras(6,"?",10)
pitagoras("?",8,10)

#Exemplo 4
calcular_media <- function(vetor) {
  if (length(vetor) == 0) {
    return(0) # Retorna 0 se o vetor estiver vazio
  } else {
    soma <- sum(vetor) # Calcula a soma dos elementos do vetor
    media <- soma / length(vetor) # Calcula a média dividindo a soma pelo número de elementos
    return(media) # Retorna a média
  }
}


meu_vetor <- c(1, 2, 3, 4, 5)
resultado <- calcular_media(meu_vetor)
print(resultado) # Imprime a média (3)



/*
Nós queremos ao criar ele apartir de meteoros grandes
Primeiro, vamos aleatorizar se ao destruir, qual direção ele vai, esquerda ou direita, cima ou baixo
*/

//Para ser -1 caso seja xero, multiplicamos o valor por 2 e depois retiramos 1, se for 1, fica 2 - 1, se for 0
//fica 0 - 1
direcaoVertical = irandom_range(0,1) * 2 -1
direcaoHorizontal = irandom_range(0,1) * 2 - 1

//A velocidade vai ser bem baixa
velocidade = random_range(0.01,1)

//Tem a metade da vida do meteoro grande
vida = 5

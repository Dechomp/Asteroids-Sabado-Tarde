/*
Criando os botões do jogo
Para isto usaremos as funções keyboard_check e ord()
Explicação no jogo Hello World Sabado Tarde Novo

A partir de hoje usaremos Regions(regiões)
Elas ajudam a deixar o código mais legivel e organizado
Pois podemos deixar alguns temas ou funções relacionados em um mesmo lugar
Para inicialas é só usar 
#region (adiciona nome da região)

#endregion
Para fechar
*/

#region Teclas do player
	//Adicionando as teclas
	
	//Setas
	//Como as setas são "universais", podemos usar o vk e o nome da tecla em inglês
	setaCima = keyboard_check(vk_up)
	setaEsquerda = keyboard_check(vk_left)
	setaDirieta = keyboard_check(vk_right)
	
	//Teclas de letras
	//Como as caracteres de letra mudam de país para país, temos que usar a função ord()
	//Para achar a posiçãom delas no teclado (Lembrando que sempre deve ser em letra maiuscula)
	teclaCima = keyboard_check(ord("W"))
	teclaEsquerda = keyboard_check(ord("A"))
	teclaDireita = keyboard_check(ord("D"))
	
	//Juntar as teclas e as setas com suas parceiras
	//Ou seja, quer eu aperte uma ou a outra, ira dar o mesmo resultado
	andar = setaCima or teclaCima
	
	//Quando apertar  para esquerda ele aumentará o angulo e para direita diminuirá
	girar = + (setaEsquerda or teclaEsquerda) - (setaDirieta or teclaDireita)

#endregion

#region Movimentação
	//Vamos começar pelo mais simples, vamos somar ao algulo o valor que há em girar
	//Ou seja, ele vai aumentar ou diminuir
	
	//Um erro que estava acontecendo é que caso apertemos para a direita com o angulo
	//sendo zero, ele negativava o angulo, fazendo com que a nossa conta não funcionasce
	//E a mmesa coisa acontecia caso apertasse para esquerda e o ângulo passasse de 360
	//Enão agora, caso passe de 360, volta para zero e caso dimuniua abaixo de 0
	//Vai para 355 (último grau antes do zero)
	if image_angle + girar * velocidadeGiro < 0{
		image_angle = 355
	}
	//Para resetar o angulo
	else if image_angle >= 360{
		image_angle = 0
	}
	
	image_angle += girar * velocidadeGiro
	
	
	
	//Nós vamos verificar se eu não estou em um ângulo que ande apenas para um lado
	//Como checaremos isto? Todos os angulos que vão apenas para uma direção
	//São divisiveis por 90, ou seja, divididos por 90 possuem o resultado 0
	
	//Primeiro, vamos verificar esta condição
	
	if image_angle % 90 == 0{
		#region Movimentos "absolutos"
			//Depois de checarmos se é uma direção total, alteramos os valores das variáveis
			//de direção
		
			//Primeiro, se está indo para a direita
			//direita, só pode ser o ângulo 0
			if image_angle == 0{
				//Para a direita, a direcaoHorizontal vai ser 1 positivo
				//E a direcaoVertical vai ser 0
				direcaoVertical = 0
				direcaoHorizontal = 1
			}
		
			//180 está indo para esquerda
			else if image_angle == 180{
				//Não desce e nem sobe, ou seja, direcasoVertical vai ser 0
				//E a direcaoHorizontal vai ser -1
				direcaoVertical = 0
				direcaoHorizontal = -1
			}
		
			//90 está indo para cima
			else if image_angle == 90{
				//Apenas sobe
				direcaoVertical = -1
				direcaoHorizontal = 0
			}
		
			//Só sobrou o 270, que é para baixo
			else{
				//Apenas desce
				direcaoHorizontal = 0
				direcaoVertical = 1	
			}
			angulo = 0
		#endregion
	}
	
	//Quando o angulo não for divisivel por 90
	else{
		#region Movimentos diagonais
			//Calculo para andar nas diagonais
		
		
			//Aqui nós queremos andar nas diagonais de cada angulo
			//Ou seja, se eu estiver entre dois angulos "absolutos" iremos checar qual é a direção a seguir
			//Calcular a direção
			//Primeiro, iremos pegar o resto da divisão do image_angle por 90, ou seja, ele pode ser
			//Entre 1 a 89 
			angulo = image_angle % 90
			
			//Depois iremos transformar isto em casas decimais
			angulo /= 100 
		
			//Agora, iremos calcular para qaul direção a nave vai
			//Caso o angulo seja menor 180, a nave está subindo
			if image_angle < 180{
				direcaoVertical = -1
			}
		
			//Caso não seja, só pode ser maior, ou seja, está descendo
		
			else{
				direcaoVertical = 1
			}
		
			//Agora as direções horizontais
			//Caso seja menor que 90 ou maior que 270, vai para direita
			if image_angle < 90 or image_angle > 270{
				direcaoHorizontal = 1
			}
		
			//Cso não seja, só pode ser maior que 90 ou menor que 270, ou seja, vai para esquerda
		
			else if image_angle > 90 or image_angle < 270{
				direcaoHorizontal = -1
			}
		#endregion
	}
	
	//Quando não for divisivel por 90
	
	//Caso precione os botões para cima
	
	//No final, iremos somar o angulo mais 1 e multiplicar pela direção
	if andar{
		x += (angulo + 1) * direcaoHorizontal
		y +=  direcaoVertical
	}

#endregion
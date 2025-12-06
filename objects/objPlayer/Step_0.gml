//Caso o jogo esteja pausado, ele vai ignorar as próximas linhas
if global.pause{
	alarm[0] = alarm[0] + 1
	image_speed = 0
	speed = 0
	exit
}

//image_speed = sprite_index.image_speed
image_speed = 15

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
	
	/*
	Para fazer o usuário toda hora apertar as teclas de ataque, usaremos a função keyboard_check_pressed()
	Que é verdadeiro toda vez que uma tecla é precionada, e diferente do check normal, é que ele só checa se 
	foi pressionada e não se está sendo pressionada
	
	Para checar o mouse, usaremos o mouse_chech_button_pressed() passando o mb_left como parâmetro, que é 
	o botão esquerdo
	*/
	
	//Teclas de ataque
	//Enter
	teclaEnter = keyboard_check_pressed(vk_enter)
	
	//Barra de espaço
	barraEspaco = keyboard_check_pressed(vk_space)
	
	//Letra Q
	teclaQ = keyboard_check_pressed(ord("Q"))
	
	//Botão esquerdo
	botaoEsquerdo = mouse_check_button_pressed(mb_left)
	
	//Variável que armazena todas as teclas
	teclaAtaque = teclaEnter or barraEspaco or teclaQ or botaoEsquerdo

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
	
	if girar != 0{
		image_angle += girar * velocidadeGiro
	}
	
	
	
	
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
				direcaoHorizontal = velocidade * 2
			}
		
			//180 está indo para esquerda
			else if image_angle == 180{
				//Não desce e nem sobe, ou seja, direcasoVertical vai ser 0
				//E a direcaoHorizontal vai ser -1
				direcaoVertical = 0
				direcaoHorizontal = -velocidade * 2
			}
		
			//90 está indo para cima
			else if image_angle == 90{
				//Apenas sobe
				direcaoVertical = -velocidade * 2
				direcaoHorizontal = 0
			}
		
			//Só sobrou o 270, que é para baixo
			else{
				//Apenas desce
				direcaoVertical = velocidade * 2
				direcaoHorizontal = 0
				
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
				direcaoVertical = -velocidade
			}
		
			//Caso não seja, só pode ser maior, ou seja, está descendo
		
			else{
				direcaoVertical = velocidade
			}
		
			//Agora as direções horizontais
			//Caso seja menor que 90 ou maior que 270, vai para direita
			if image_angle < 90 or image_angle > 270{
				direcaoHorizontal = velocidade
			}
		
			//Cso não seja, só pode ser maior que 90 ou menor que 270, ou seja, vai para esquerda
		
			else if image_angle > 90 or image_angle < 270{
				direcaoHorizontal = -velocidade
			}
		#endregion
	}
	
	//Quando não for divisivel por 90
	
	//Caso precione os botões para cima
	
	//No final, iremos somar o angulo mais 1 e multiplicar pela direção
	/*if andar{
		/*
		A cada vez que o player apertar para frente, iremos aumentar o valor da propulsão
		E poir exemplo, caso ele estaja indo parta frente e virar ao lado ao contrário, demorara
		Um certo tempo antes de ele volatr a avançar por causa do valor de propulsão
		E caso o player não aperte nehuma botão, iremos somar um ou menos umaao valor atual
		Para que ele desacerele sozinho
		*/
		//Vamos limitar a velocidade do player para o que há em velocidadeLimite
		//Ou seja, a propulsão vai de (atualmente) de 30 a -30
	/*	if propulsaoHorizontal + direcaoHorizontal <= velocidadeLimite and propulsaoHorizontal + direcaoHorizontal  >= - velocidadeLimite{
			propulsaoHorizontal += direcaoHorizontal
		}
		
		/*
		function motion_add(dir: Real, speed: Real) ->
		Undefined
		This function will modify the current direction and speed of the instance running the code, combining the values 
		given with the current values.
		dir		The added direction.
		speed The added speed.
		
		Tradução
		Função motion_add(dir: valor Real, speed: Real) -> retorno indefinido
		Esta função modificará a direção atual e a velocidade que da istancia , combinando os valor com os valores atuais
		dir Adiciona a direção
		speed Adiciona a velocidade
*/
		
		
	/*	if propulsaoVertical + direcaoVertical <= velocidadeLimite and propulsaoVertical  + direcaoVertical  >= - velocidadeLimite{
			propulsaoVertical += direcaoVertical
		}
		
		
		
	}
	else{
		/*
		Para desacelerar o valor que há em propulsão, iremos ultilazar a função sign()
		Descrição:
		function sign(n: Real) -> Real
		This function returns whether a number is positive, negative or neither and returns 
		1, -1, 0 respectively.
		n The number to get the sign of.
		
		Tradução
		Função sign (n: valor real) retorno de valor real
		Esta função retorna quando um número é positivo, negativo, ou nehuma dos dois(0) e retorna
		1, -1 e 0 respectivamente
		n O número que queira pegar o sinal
		
		Ou seja, vamos verificar se os valores são, postivos, negativos ou zerados
		Pois assim, quando o player soltar o botão, vamso pegar o sinal do múmero e multiplicar
		Por -1, desta forma, se o valor for positivo, ele vai somar -1, e quando for negativo
		Vai somar 1, fazendo ele desacelerar
		*/
	/*	propulsaoHorizontal += sign(propulsaoHorizontal) * -0.5
		propulsaoVertical += sign(propulsaoVertical) * -0.5
		
	}*/
	
	
	
	/*//Jeito antigo de se mover
	x +=  propulsaoHorizontal
	y +=  propulsaoVertical
	*/
	//Novo jeito usando a propulsão
	//Quando apertar para andar
	/*if andar{
		
		//Usa a função motion_add
		motion_add(image_angle, velocidade)
		
		//Limita a velocidade, ou seja, caso passe da melovidade maxima, diminui a velocidade
		if speed > velocidadeLimite{
			speed = velocidadeLimite
		}
		
	}
	//Se não apertar para ir para frente e está andando
	else if speed != 0{
		
		//Soma o valor ao contrário vezes 0.5, ou seja, soma ao contrário a metade do valor
		motion_add(image_angle, -velocidade * 0.5)
	}
	
	if !andar and speed > velocidadeLimite{
		speed = 0
	}*/
	
	//Se eu apertar para andar
	if andar{
		//Se a velocidade da propulsão está dentro do limite, eu continuo aumentando o valor
		if propulsao <= velocidadeLimite{
			propulsao += velocidade
		}
	}
	//Se eu soltar o andar e propulsão não é 0
	else if propulsao != 0{
		//Diminui a velocidade
		propulsao -= velocidade / 2
	}
	
	//Depois uso o motion_set que define a direção e o valor para onde vai o player
	motion_set(image_angle, propulsao)
	
	#region Teletransporte
		/*
		O teletransporte funcionará de uma maneira bem simples, toda vez que o player sair pelas bordas
		Do jogo, teletransportaremos ele para o outro canto
		Ou seja,
		Se ele sair por cima, ele moverá para baixo
		Se sair por baixo, vai para cima
		Se sair pela esquerda vai para direita
		E se sair pela direita, vai para esquerda
		Ok, mas como poderemos fazer isto
		
		Bem simples
		As coordenadas visiveis ficam entre 0 e o tamanho da sala,
		Ou seja, na direção horizontal, as coordendas viciveis fiacam entre 0 e a largura da sala
		E na vertical, ficam entre 0 e a altura da sala 
		
		Ou seja,
		Caso queiramos checar se o player saiu pela esquerda, qual valor nós checamos o x ou o y? X
		Certo, e como queremos checar se saiu pela esquerda, o x deve ser comparado a qual valor? 0
		Certo, e vamos verificar que ele é maior ou menor que 0? Menor
		
		Então, caso o x dele seja menor que 0, iremos mandar ele para o outor lado, ou seja, o valor que há
		na largura
		
		A mesma coisa (só que ao contrario) quando ele sair pela direita, no caso, o x vai ser maior que 
		a largura da tela e vai receber 0, indo para o lado esquerdo
		
		Como já verificamos o X, sabemos que só sobrou o Y, ou seja, quando ele sair para cima ou para baixo
		Caso o Y saia por cima, qual valor faremos a comparação, o 0 ou a altura da tela? com o zero, e se
		ele é menor que 0
		Se for, ele vai para o outro lado, ou seja, no valor que há na altura da sala
		
		
		*/
		
		//Saiu pela esquerda
		if x < 0{
			x = room_width
		}
		
		//Saiu pela direita
		else if x > room_width{
			x = 0
		}
		
		//Saiu por cima
		if y < 0{
			y = room_height
		}
		
		//Saiu por baixo
		else if y > room_height{
			y = 0
		}
			
	
	#endregion

#endregion

#region Tiros
	//Toda vez que apertarmos uma tecla de tiro, iremos criar 1
	if teclaAtaque{
		instance_create_layer(x,y, "Instances", objTiro)
	}
#endregion


if global.quantVida <= 0{
	global.pause = true
	
	layer_set_visible("InstanciasFim", true)
	layer_set_visible("PainelFim", true)
	layer_set_visible("MenuPauseInstancias", false)
	layer_set_visible("Instances", false)
	
}
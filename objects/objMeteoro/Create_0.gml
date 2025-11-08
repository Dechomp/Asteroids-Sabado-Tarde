/*
Vimos que ao executar, a certos pontos cegos pelo fato de não nascer meteoros das laterais, para evitarmos
isto, iremos sortear entre 0 1 a posição de onde eles vão aparecer, e usar a mesma lógica que usamos antes
alterando apenas o x para y e vice versa

Se lembram que true pode ser lido como 1 e flas como 0? Então, ao invés de armazenarmos um número
E depois decidir uma operação, iremos colcoar um irandom_range dentro do if entre 0 e 1
Caso seja 1, quer dizer que é verdadeiro, e caso seja 0, é falso
*/
if irandom_range(0,1){
	#region Vindo verticalmente
		/*
		Primeiro, vamos aletorizar de onde pode vir um meteoro

		Como queremos que eles aparecam do lado de fora da tela, então sabemos que o x e o 7 tem devem
		Ser menores que 0, ou maiores que as medidas da tela(altura e largura)

		Para calcularmos isto, usaremos a função irandom_range()
		Descrição:
		function irandom_range(n1: Real, n2: Real) Real
		This function is similar to random_range() only with integer values as the input.
		n1 The low end of the range from which the random number will be selected.
		n2 The high end of the range from which the random number will be selected.

		Tradução:
		Função irandom_range(n1: valor real, n2: valor real) retorno de valor real
		Esta função é similar ao random_range(), mas retorna apenas números do tipo inteiros
		n1 O menor valor possivel do intervalo que você quer que um número seja selecionado
		n2 O maior valor possivel do intervalo que você quer que um número seja selecionado

		Então, iremos usar esta função para aleatorizar a posição de onde vai surgir o meteoro

		Primeiro, aletorizaremos o valor do x, que vai ser de -64 até a largura da tela + 64
		Depois, iremos aletorizar o valor de y entre
		0 e 1 e depois multiplicarmos pela altura da tela + 128 e depois tiraremos 64
		Por que faremos isto?
		Ao multiplica 0 pela largura da sala, resultará em 0, já se for 1, será a altura da sela mais 128
		E ao tirarmos 64, se for zero, aparecerá na altura -64, se for 1, aparecerá na autura da tela + 64
		Assim vamos garantir que o meteóro nascera 64 pixels fora da tela
		*/

		//Aleatoriza o valor de x
		posicaoX = irandom_range(-64, room_width + 64)
		posicaoY = irandom_range(0,1) * (room_height + 128) - 64

		/*
		Agora que já calculas as poisções iniciais do meteori, vamos calulcar a direção de ond ele deve ir

		As direções que devem seguir, sempre devem ser na diração ao contrária de onde apareceram
		Ou seja, se apareceu na esquerda, deve ir a direita, se apareceu encima, deve aparecer embaixo e assim por diante
		Como já sabemos que a posição y do meteoro sempre vai ser positiva  ou negativa nunca 0, vamos usar uma função
		Para calcular a direção vertical, iremos usar a função sign
		Descrição:
		function sign(n: Real) -> Real
		This function returns whether a number is positive, negative or neither and returns 1, -1, 0 respectively.
		n The number to get the sign of.

		Tradução:
		Função sign(n: valor Real) retorno Real
		Esta função retorna quando um número é positivo, negativo ou neutro e retorna 1, -1 e 0, respectivamente
		n O valor para pegar o sinal

		Ou seja, se ele apareceu encima(-64) a função retorna -1, e se apareceu embaixo(altura da sala + 64) retorna 1
		Então, para ir na direção contrária, basta multiplcarmos o retorno da função por -1
		Assim, o meteoro irá na direção contrária
		*/

		direcaoVertical = sign(posicaoY) * -1

		/*
		Para a diração horizontal, vai ser um pocuo diferente, para calcularmos, iremos pegar a largura da sala + 64
		E dividir pela metade e depois retirar isto da posição X, assim, caso o meteoro tenha nascido depois da matade
		dovalor, quer dizer que ele virá da direita, e caso seja menor que a metade, virá da esquerda
		E caso seja exatamente, virá do meio
		Como sabemos disto, pois ao retirar metade do valor, saberemos que ou vai retirar mais que o nescessário, 
		ficando negativo, se retirar tudo, ficará 0, e se retirar mais sobrar algo, quer dizer que virá da direita
		Agora que sabemos de qual lado veio, multiplicamos por -1 para ir ao lado contrário
		*/

		direcaoHorizontal = sign(posicaoX - (room_width + 64)) * -1
	#endregion
}
else{
	#region Vindo horizontalmente
		//Aqui, como falei, vamos trocar as lógicas do x para y e vice versa
		//Mesma lógica da posição inicial no x
		posicaoX = irandom_range(0,1) * (room_width + 128) - 64
		
		//Mesma lógica da posição inicial no y
		posicaoY = irandom_range(-64, room_height + 64)
		
		//Mesma lógica da direção horizontal
		direcaoVertical = sign(posicaoY - (room_height + 64)) * -1
		
		//Mesma lógica da direção vertical
		direcaoHorizontal =  sign(posicaoX) * -1
		
	#endregion
}


/*
Por fim, vamos calcular a velocidade, para isto, usaremos a função random_range
A diferença é que está sortea qualquer número entre o primeiro e o último
Até mesmo os números decimais que os separam
Para manter uma boa velocidade, o valor minimo vai ser 2, e para não ficar muito rápido
O máximo vai ser 5
*/

velocidade = random_range(0.5,3)

//Por fim, recebemos as posições no lugar certo
x = posicaoX
y = posicaoY

//Vida dos asteoid
vida = 10
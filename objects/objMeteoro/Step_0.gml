/*
Aqui por enquanto é simples, basta apenas adicionarmos os valores da direção vezes a velocidade
*/

x += direcaoHorizontal * velocidade
y += direcaoVertical * velocidade

/*
Agora que já funcionou, vamos programar para quando elas forem destruidas (Seja porque saiu da tela ou por ter sido
acertada pelo player), vamos criar um outra

Para calcularmos se ela saiu da tela, é simples, pois é só pegarmos de onde ela veio e depois verificar
Se ela saiu pela direção oposta
Ou seja, se ela saiu da esquerda, o valor que há na direcaoHorizontal é 1 positivo, então, basta checarmos
Se o x é maior que a largura da sala, se só nos basearmos pelo tamanho da sala, antes de sair completamente
Ela vai sair quando tiver passado só a metade da imagem, por isto, sempre somaremos ou subtrairemos 64 tanto da 
altura, quanto da largura
Então, se direcaoHorizontal seja positiva e o x seja maior que o tamanho da sala + 64
Ou, se a direcaoHorizontal seja negativa e o x seja menor que - 64
Ou, se a direcaoVertical seja positiva e o y seja maior que a altura da sala + 64
Ou, se a direcaoVertical seja negativa e o y seja menor que -64
Destruiremos esta intancia
Assim como na matemática, as operações que estão dentro do parenteses, são realziadas antes do que das operações
Do lado de fora
Então nossa estrutura do if ficará assim
Condição == cd
if (cd1 and cd2) or (cd3 and cd4) or (cd5 and cd6) or (cd7 and cd8){
	instace_destroy()
}
Por que faremos isto ao invés de fazer tudo fora do parentes? Pois as condições internas usam and
Ou seja, as duas condições são verdadeiros, no nosso caso, por exemplo, a diração tem q ser positiva a a posição 
tem ser maior
E as condioções externas precisa de apenas uma ser vedadeira, ou saiu pela esquerda ou saiou pela direita
ou saiu por cima ou saiu por baixo
*/
if (direcaoHorizontal == 1 and x > room_width + 64 ) or (direcaoHorizontal == -1 and x < -64) or
	(direcaoVertical == 1 and y > room_height + 64 ) or (direcaoVertical == -1 and y < -64){
	instance_destroy()	
} 

//Gira o meteoro na direção vertical vezes a velocidade
image_angle += velocidade * direcaoVertical
	
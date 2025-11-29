//Caso a vida chegue a zero
if vida <= 0{
	//Cria dois meteoros menores
	instance_create_layer(x,y, "Instances", objMeteoroPequeno)
	
	//Recebe 20 pontos
	global.quantPontos += 20
}
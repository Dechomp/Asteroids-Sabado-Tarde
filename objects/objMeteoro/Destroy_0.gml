//Toda vez que uma pedra grande seja destroida, iremos recriá-la
instance_create_layer(x,y, "Instances", objMeteoro)

//Caso a vida chegue a zero
if vida <= 0{
	//Cria dois meteoros menores
	instance_create_layer(x,y, "Instances", objMeteoroMedio)
	instance_create_layer(x,y, "Instances", objMeteoroMedio)
	
	//Recebe 30 pontos
	global.quantPontos += 30
}
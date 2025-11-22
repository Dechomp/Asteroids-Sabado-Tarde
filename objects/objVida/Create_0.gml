//Criando um identificador para cada vida

//Se a variável global "idVida" existir
if variable_global_exists("idVida"){
	//Aumenta o valor interno em 1
	global.idVida ++
}
//E caso não exista
else{
	//Inicio o valor dela em 1
	global.idVida = 1
}

//Crio uma variável interna que armazena o valor que há na variável idVida quando a instancia for criada
identificador = global.idVida
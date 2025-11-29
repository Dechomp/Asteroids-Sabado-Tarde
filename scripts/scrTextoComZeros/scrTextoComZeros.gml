//Função para mostrar '0s" na frente do número caso o valor não atinja 100 mil
function mostrarZeros(numero){
	//Recebe o número convertido para texto
	textoAdaptado = string(numero)
	
	//Caso o tamanho do texto seja menor do que 2 (números menores que 10)
	if string_length(textoAdaptado) < 2{
		//Coloca 5 zeros na frente
		textoAdaptado = "00000" + string(numero)
	}
	
	//Caso o tamanho do texto seja menor do que 3 (números menores que 100)
	else if string_length(textoAdaptado) < 3 {
		//Coloca 4 zeros na frente
		textoAdaptado = "0000" + string(numero)
	}
	
	//Caso o tamanho do texto seja menor do que 4 (números menores que 1000)
	else if string_length(textoAdaptado) < 4 {
		//Coloca 3 zeros na frente
		textoAdaptado = "000" + string(numero)
	}
	
	//Caso o tamanho do texto seja menor do que 5 (números menores que 10000)
	else if string_length(textoAdaptado) < 5 {
		//Coloca 2 zeros na frente
		textoAdaptado = "00" + string(numero)
	}
	
	//Caso o tamanho do texto seja menor do que 6 (números menores que 100000)
	else if string_length(textoAdaptado) < 6 {
		//Coloca 1 zero na frente
		textoAdaptado = "0" + string(numero)
	}
	
	//Não preciso colocar mais um zero pois quando o valor é no minimo 100 mil, não preciso mostra-lo
	
	//No fim do código, eu retorno o texto corrigido
	return textoAdaptado	
}
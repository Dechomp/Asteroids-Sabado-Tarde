if global.quantPontos > global.maiorPontuacao{
	//Receber o maior valor
	global.maiorPontuacao = global.quantPontos
	
	//Salva a maior pontuação
	salvarJogo()
}

//Para alinjar, iremos usar a função draw_set_halign()
draw_set_halign(fa_left)

//Primeiro, mostra a pontuação atual
draw_text(x, y,		 "Pontuacao:       " + mostrarZeros(global.quantPontos))

//Embaixo, mostra a maior pontuação
draw_text(x, y + 15, "Maior Pontuacao: " + mostrarZeros(global.maiorPontuacao))
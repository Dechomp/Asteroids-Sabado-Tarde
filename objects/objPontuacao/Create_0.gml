//Vai carregar os dados salvos, consecutivamente carregando a maior pontuação
if ! variable_global_exists("maiorPontuacao"){
	global.maiorPontuacao = 0
}

//Carrega os dados salvos do jogo
carregarJogo()
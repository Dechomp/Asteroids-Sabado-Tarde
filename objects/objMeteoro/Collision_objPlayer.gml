//room_restart()

global.quantVida--

if global.quantVida == 0{
	//Mostra que o player perdeu e salva se ele tiver a maior quantidade de pontos
}

else if global.quantVida % 2 == 0{
	//Manda o player pro meio da sala
	
	other.x = room_width / 2
	other.y = room_height / 2
}
//Cria o tempo de invencibilidade
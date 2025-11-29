//Apago o meteoro que atingiu o player
instance_destroy()

//Enquanto o tempo de invencibilidade não acabou, ignoro os próximos passos
if other.alarm[0] > 0{
	exit
}
//room_restart()

//Diminui a quantidade vida atual
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
other.alarm[0] = 5 * 60

//Troco o sprite atual do player
other.sprite_index = spr_player_dano
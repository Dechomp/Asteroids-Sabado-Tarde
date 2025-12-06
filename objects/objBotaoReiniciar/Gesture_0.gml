//Quando estiver despausado, pula o evento
if ! global.pause{
	exit
}

room_restart()

//Reinicio o id da vida tbm
global.idVida = 0
//1º método para ir para fase inicial
//room = room_first

//Segundo método, para ir para primeira fase
//room_goto(0)

//Como estamos fazendo teste, pode ser que alternemos as posições da fases
//Então, para ter certeza, vamos receber a fase menu

//Quando estiver despausado, pula o evento
if ! global.pause{
	exit
}
room = rmMenu
global.idVida = 0

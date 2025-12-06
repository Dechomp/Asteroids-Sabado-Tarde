//Mostrar a layer de pausa
//Jeito "errado"
/*
if layer_get_visible("MenuPauseInstancias"){
	layer_set_visible("MenuPauseInstancias", false)
}
else{
	layer_set_visible("MenuPauseInstancias", true)
}*/
//Jeito "certo"
layer_set_visible("MenuPauseInstancias", ! layer_get_visible("MenuPauseInstancias"))

global.pause = ! global.pause
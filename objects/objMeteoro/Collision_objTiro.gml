//Toda vez que colidir com o tiro, diminui a vida em 1
vida--

//Caso a vida chegue a 0, destroi o meteoro
if vida == 0{
	instance_destroy()
}

//Mostra o tiro acertando
instance_create_layer(other.x,other.y, "Instances", objDano)

//Destroi o tiro
instance_destroy(other)
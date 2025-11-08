//Usa a função para se mover
motion_set(image_angle, velocidade)


#region Teletransporte
	//Saiu pela esquerda
		if x < 0{
			x = room_width
		}
		
		//Saiu pela direita
		else if x > room_width{
			x = 0
		}
		
		//Saiu por cima
		if y < 0{
			y = room_height
		}
		
		//Saiu por baixo
		else if y > room_height{
			y = 0
		}
#region
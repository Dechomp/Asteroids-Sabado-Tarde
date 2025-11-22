/*
Aqui iremos usar a função draw_sprite
Descrição:
function draw_sprite(sprite: Asset.GMSprite, subimg: Real, x: Real, y: Real) -> Undefined
This function draws the given sprite and sub-image at a position within the game room.
sprite The index of the sprite to draw.
subimg The sub-image (frame) of the sprite to draw (image_index or -1 correlate to the current frame of 
animation in the object).
X The x coordinate of where to draw the sprite.
Y The y coordinate of where to draw the sprite.

Tradução:
Função draw_sprite(sprite: sprite do sistema, subimg: valorReal, x: valor Real, y: valor Real) retorno
indefindo ou inválida
Esta função desenha o sprite entregue e a sub_imagem(o frame) na posção escolhida na sala.
sprite: O valor da sprite para desenhar
subimg A sub_imagem (o frame) do sprite para desenhar (index da imagem ou -1 para relaciobar o frame atual
da animação do objeto).
X A coordenada x aonde deseja desenhar
Y A coordenada y aonde deseja desenhar

Ele não diz aqui, mas caso coloque "all" na sub_image, ele passará por todos os sprites
*/

//Variável para realizar a conta para desenhar

idSprite = identificador * 2 - global.quantVida

if idSprite > 2{
	draw_sprite(sprVidaPlayer, 2, x, y)
}
else if idSprite <= 0{
	draw_sprite(sprVidaPlayer, 0, x, y)
}
else{
	draw_sprite(sprVidaPlayer, idSprite, x, y)
}





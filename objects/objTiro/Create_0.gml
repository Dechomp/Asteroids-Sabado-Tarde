/*
Assim que ele surgir, vamos ativar o alarm 

Alarm são eventos que, ao receber um valor, o decrementão (diminui em 1 o valor) a cada frame, e quando chegar no 0
Executarão o comando que há dentro dele

Ou seja, se um alarm receber 60 quer dizer que ele vai demorar 60 frames para executar o que está nele

Por padrão, o jogo deve rodar a 60 fps, ou seja, 60 frames por segundo
Para ver a quantidade de frames por segundo que há no jogo, basta ir em configurações 

Outra coisa também é que ele funciona como vetor, ou seja, temos que indicar que posição do alarm queremos
utilizar

No nosso caso, queremos que no alarm 0, 2 segundos após ser criado, o tiro deve desaparecer

Como montar este código?
*/

alarm[0] = 60 * 2


//Fica com a imagem no mesmo angulo do player
image_angle = objPlayer.image_angle

//Velocidade que vai viajar
velocidade = 10
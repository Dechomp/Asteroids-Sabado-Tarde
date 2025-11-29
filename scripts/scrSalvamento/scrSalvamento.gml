//Função para salvar o jogo
//Passar o nome do jogo é opcional
function salvarJogo(nomeArquivo = "saveJogo.ini"){
	//Abrir o carderno (no nosso caso, o arquivo)
	ini_open(nomeArquivo)
	
	//Escrevo a informação passando a seção, o nome do valor e o valor
	ini_write_real("Pontuacao", "Maior Pontuacao", global.maiorPontuacao)
	
	//Fecho o "caderno"
	ini_close()
}

//Função para carregar o jogo
//Passar o nome do jogo é opcional
function carregarJogo(nomeArquivo = "saveJogo.ini"){
	//Abrir o carderno (no nosso caso, o arquivo)
	ini_open(nomeArquivo)
	
	global.maiorPontuacao = ini_read_real("Pontuacao", "Maior Pontuacao", 100)
	
	//Fecho o "caderno"
	ini_close()
}
/*
Caso queiram achar o arquivo de save no computador, basta ir em:(lembrando que o que está
				em parenteses é para ser subistituido):
	Disco local -> Usuários -> (Seu Usuário) -> AppData -> Local -> (Nome do seu jogo)
	E abrir o arquivo com o nome do arquivo que você definiu
	
	Se não achar, basta abrir o cmd e digitar o seguinte comando
	cd C:\Users\(Seu Usuario)\AppData\Local\(NomeDoJogo) 
	E depois digitar
	(nome do arquivo) open
Agora, falta só colocar as funções no lugar certo
*/
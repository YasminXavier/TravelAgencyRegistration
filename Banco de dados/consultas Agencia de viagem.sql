Consultas Agência de Viagens - TIC 2020 3º Semestre
Alunos: 
	Pitter Meira - Ciência da Computação
	Yasmin Xavier - Sistema de Informação
	Leticiciao da quebrada

1) Consultar um cliente específico:

	π (cpf=/*cpf do cliente*/)(cliente)

2) Consultar uma viagem de um cliente específico
	
	R1 <- (cliente) ⋈ (viagem)
	R2 <- σ (cpf=/*cpf do cliente*/)(R1)
	R3 <- π nome, destino, partida (R2)

3) Consultar um feedback de um hotel em uma viagem
	
	R1 <- (viagem) ⋈ (hotel)
	R2 < (R1) ⋈ (cliente)
	R3 <- σ (nome_hotel=/*nome do hotel*/)(R1)
	R4 <- π nome, nome_hotel, partida, feedback (R3)

4) Consultar uma pré-notifcação

	R1 <- (viagem) ⋈ (calendário)
	R2 <- (R1) ⋈ (cliente)
	R3 <- σ (cpf=/*cpf do cliente*/)(R2)
	R4 <- π nome, partida, dt_inicio (R4)

5) Relatório de faturamento

	R1 <- (cliente) ⋈ (viagem)
	R2 <- σ (partida > /*data desejada*/ and partida < /*data final desejada*/) (R1)
	R3 <- (R2) ⋈ (Relatório)
	R4 <- π nome, partida, retorno, valor, dt_inicial, dt_final (R3)
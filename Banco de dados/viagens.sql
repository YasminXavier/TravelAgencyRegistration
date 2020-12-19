CREATE DATABASE "Agencia_Viagens"
	TEMPLATE = template0
	ENCODING UTF-8
	CONNECTION LIMIT -1


CREATE TABLE Operadora (
  nome_op INTEGER NOT NULL,
  site VARCHAR(60) NOT NULL,
  ddd_op NUMERIC(3) NOT NULL,
  telefone_op NUMERIC(8) NOT NULL,
  CEP_op NUMERIC(7) NULL,
  endereco_op VARCHAR(60) NULL,
  num_op NUMERIC(5) NULL,
  compl_op VARCHAR(20) NULL,
  bairro_op VARCHAR(30) NULL,
  cidade_op VARCHAR(30) NULL,
  UF_op CHAR(2) NULL,
  email_op VARCHAR(20) NOT NULL,
  PRIMARY KEY(nome_op)
);

CREATE TABLE Transporte (
  nome_transp VARCHAR(60) NOT NULL,
  tipo MULTILINESTRING NOT NULL,
  ddd_transp NUMERIC(3) NOT NULL,
  telefone_transp NUMERIC(8) NOT NULL,
  site_transp VARCHAR(60) NULL,
  email_transp VARCHAR(60) NOT NULL,
  CEP_transp NUMERIC(7) NULL,
  endereco_transp VARCHAR(60) NULL,
  numero_transp NUMERIC(5) NULL,
  compl_transp VARCHAR(20) NULL,
  bairro_transp VARCHAR(30) NULL,
  cidade_transp VARCHAR(30) NULL,
  UF_transp CHAR(2) NULL,
  PRIMARY KEY(nome_transp)
);

CREATE TABLE Usuario (
  CPF_usuario VARCHAR(11) NOT NULL,
  senha VARCHAR(10) NOT NULL,
  PRIMARY KEY(CPF_usuario)
);

CREATE TABLE Hotel (
  nome_ht VARCHAR(50) NOT NULL,
  ddd_ht NUMERIC(3) NOT NULL,
  tel_ht NUMERIC(8) NOT NULL,
  site_ht VARCHAR(30) NOT NULL,
  email_ht VARCHAR(30) NOT NULL,
  CEP_ht NUMERIC(7) NOT NULL,
  endereco_ht VARCHAR(50) NOT NULL,
  numero_ht NUMERIC(5) NOT NULL,
  compl_ht VARCHAR(20) NOT NULL,
  bairro_ht VARCHAR(30) NOT NULL,
  cidade_ht VARCHAR(50) NOT NULL,
  UF_ht CHAR(2) NOT NULL,
  PRIMARY KEY(nome_ht)
);

CREATE TABLE Calendário (
  evento VARCHAR(20) NOT NULL,
  Usuario_CPF_usuario VARCHAR(11) NOT NULL,
  local_evento VARCHAR(50) NULL,
  descricao TEXT NULL,
  dt_comeco DATETIME NOT NULL,
  dt_fim DATETIME NOT NULL,
  PRIMARY KEY(evento, Usuario_CPF_usuario),
  FOREIGN KEY(Usuario_CPF_usuario)
    REFERENCES Usuario(CPF_usuario)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

CREATE TABLE Cliente (
  CPF_cliente NUMERIC(11) NOT NULL,
  Usuario_CPF_usuario VARCHAR(11) NOT NULL,
  nome VARCHAR(60) NOT NULL,
  ddd_tel NUMERIC(3) NULL,
  tel_res NUMERIC(8) NULL,
  ddd_cel NUMERIC(3) NOT NULL,
  celular NUMERIC(9) NOT NULL,
  rg NUMERIC(9) NOT NULL,
  emissor VARCHAR(3) NULL,
  uf_emissor CHAR(2) NULL,
  dt_emissao DATE NULL,
  CEP NUMERIC(7) NOT NULL,
  endereco VARCHAR(80) NOT NULL,
  numero NUMERIC(5) NOT NULL,
  compl VARCHAR(30) NOT NULL,
  bairro VARCHAR(60) NOT NULL,
  cidade VARCHAR(60) NOT NULL,
  UF CHAR(2) NOT NULL,
  PRIMARY KEY(CPF_cliente, Usuario_CPF_usuario),
  FOREIGN KEY(Usuario_CPF_usuario)
    REFERENCES Usuario(CPF_usuario)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

CREATE TABLE Viagem (
  destino VARCHAR(100) NOT NULL,
  Transporte_nome_transp VARCHAR(60) NOT NULL,
  Hotel_nome_ht VARCHAR(50) NOT NULL,
  Calendário_Usuario_CPF_usuario VARCHAR(11) NOT NULL,
  Calendário_evento VARCHAR(20) NOT NULL,
  Operadora_nome_op INTEGER NOT NULL,
  partida DATE NOT NULL,
  retorno DATE NOT NULL,
  valor NUMERIC(6,2) NOT NULL,
  feedback TEXT NOT NULL,
  PRIMARY KEY(destino, Transporte_nome_transp, Hotel_nome_ht, Calendário_Usuario_CPF_usuario, Calendário_evento, Operadora_nome_op),
  FOREIGN KEY(Transporte_nome_transp)
    REFERENCES Transporte(nome_transp)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  FOREIGN KEY(Hotel_nome_ht)
    REFERENCES Hotel(nome_ht)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  FOREIGN KEY(Operadora_nome_op)
    REFERENCES Operadora(nome_op)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  FOREIGN KEY(Calendário_evento, Calendário_Usuario_CPF_usuario)
    REFERENCES Calendário(evento, Usuario_CPF_usuario)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

CREATE TABLE Relatorio (
  dt_rel DATETIME NOT NULL AUTO_INCREMENT,
  Viagem_Hotel_nome_ht VARCHAR(50) NOT NULL,
  Viagem_Transporte_nome_transp VARCHAR(60) NOT NULL,
  Viagem_destino VARCHAR(100) NOT NULL,
  Usuario_CPF_usuario VARCHAR(11) NOT NULL,
  Viagem_Calendário_evento VARCHAR(20) NOT NULL,
  Viagem_Calendário_Usuario_CPF_usuario VARCHAR(11) NOT NULL,
  Viagem_Operadora_nome_op INTEGER NOT NULL,
  dt_inicio DATETIME NOT NULL,
  dt_final DATETIME NOT NULL,
  PRIMARY KEY(dt_rel, Viagem_Hotel_nome_ht, Viagem_Transporte_nome_transp, Viagem_destino, Usuario_CPF_usuario, Viagem_Calendário_evento, Viagem_Calendário_Usuario_CPF_usuario, Viagem_Operadora_nome_op),
  FOREIGN KEY(Viagem_destino, Viagem_Transporte_nome_transp, Viagem_Hotel_nome_ht, Viagem_Calendário_Usuario_CPF_usuario, Viagem_Calendário_evento, Viagem_Operadora_nome_op)
    REFERENCES Viagem(destino, Transporte_nome_transp, Hotel_nome_ht, Calendário_Usuario_CPF_usuario, Calendário_evento, Operadora_nome_op)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  FOREIGN KEY(Usuario_CPF_usuario)
    REFERENCES Usuario(CPF_usuario)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

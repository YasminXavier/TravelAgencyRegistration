-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Operadora+Avião+Voo  (
Operadora Contratada  VARCHAR(10),
Id_operadora VARCHAR(10),
N° do Acento NUMERIC(3),
Id_aviao VARCHAR(10),
Data e Hora de Embarque VARCHAR(10),
Data e Hora de Retorno  VARCHAR(10),
Id_voo VARCHAR(10),
PRIMARY KEY(Id_operadora,Id_aviao,Id_voo)
)

CREATE TABLE Endereço+Cliente (
Complemento VARCHAR(10),
Bairro VARCHAR(10),
Rua VARCHAR(10),
CEP NUMERIC(10),
Nº da Casa VARCHAR(10),
Id_endereco VARCHAR(10),
RG NUMERIC(10),
Data de Nascimento SMALLDATETIME,
N° Telefone NUMERIC(10),
N° Celular NUMERIC(11),
Senha VARCHAR(10),
N° Passaporte NUMERIC(10),
Nome Completo VARCHAR(10),
id_usuario VARCHAR(10),
E-mail VARCHAR(10),
CPF NUMERIC(11),
PRIMARY KEY(Id_endereco,id_usuario)
)

CREATE TABLE Compra (
id_usuario VARCHAR(10),
Id_pacote VARCHAR(10),
FOREIGN KEY(/*erro: ??*/) REFERENCES Endereço+Cliente (Id_endereco,id_usuario)
)

CREATE TABLE Pacote (
Transporte VARCHAR(10),
Operadora VARCHAR(10),
Cadastro de Hoteis VARCHAR(10),
Id_pacote VARCHAR(10) PRIMARY KEY
)

CREATE TABLE Utiliza (
Volta DATETIME,
Ida DATETIME,
Id_pacote VARCHAR(10),
Id_operadora VARCHAR(10),
Id_aviao VARCHAR(10),
Id_voo VARCHAR(10),
FOREIGN KEY(Id_pacote) REFERENCES Pacote (Id_pacote),
FOREIGN KEY(Id_voo,,,) REFERENCES Operadora+Avião+Voo  (Id_operadora,Id_aviao,Id_voo)
)

CREATE TABLE Funcionario (
Email VARCHAR(10),
Senha VARCHAR(10),
Nome Completo VARCHAR(10),
Id_funcionario VARCHAR(10) PRIMARY KEY,
id_usuario VARCHAR(10),
FOREIGN KEY(/*erro: ??*/) REFERENCES Endereço+Cliente (Id_endereco,id_usuario)
)

ALTER TABLE Compra ADD FOREIGN KEY(Id_pacote) REFERENCES Pacote (Id_pacote)

/*Criação da tabela contatos*/
CREATE table IF NOT EXISTS contatos(
nro_contato int  PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome VARCHAR(20) NOT NULL,
sobrenome VARCHAR(30) NOT NULL,
ddd INT NOT NULL,
telefone VARCHAR(9) NOT NULL,
data_nasc DATE NULL,
email VARCHAR(30) NULL,
ativo smallint NULL
);
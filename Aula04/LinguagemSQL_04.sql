/* apagando a tabela demo */
Drop table demo;

/* criando a tabela financas */
CREATE table financas(
id bigint PRIMARY KEY NOT NULL AUTO_INCREMENT,
descricao VARCHAR(100) NOT NULL,
cadastro DATE NULL,
vencimento DATE NOT NULL,
valor real NULL,
quitado smallint NULL
);

/* alterando a tabela financas */
ALTER table financas
add tipoLancamento smallint NULL;

/* inserindo registros*/
INSERT INTO financas (descricao,cadastro,vencimento,valor,quitado,tipoLancamento)
VALUES 
('emasa',CURRENT_DATE,'20240316',155,0,-1),
('coelba',CURRENT_DATE,'20240310',83.72,0,-1),
('aluguel',CURRENT_DATE,'20240308',155,0,-1),
('salário',CURRENT_DATE,'20240301',1412,1,1),
('mercado',CURRENT_DATE,'20240315',355,0,-1),
('açougue',CURRENT_DATE,'20240315',95,0,-1),
('hortifruti',CURRENT_DATE,'20240315',70,0,-1);

/* alterando registro */
UPDATE financas
SET cadastro = '20240301'
WHERE id = 4;

/* deletando registro */
DELETE FROM financas
WHERE id = 7;
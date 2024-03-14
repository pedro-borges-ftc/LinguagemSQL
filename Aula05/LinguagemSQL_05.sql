/*Povoando o banco novamente */
INSERT INTO financas (descricao,cadastro,vencimento,valor,quitado,tipoLancamento)
VALUES 
('emasa',CURRENT_DATE,'20240416',155,0,-1),
('coelba',CURRENT_DATE,'20240410',83.72,0,-1),
('aluguel',CURRENT_DATE,'20240408',155,0,-1),
('salário',CURRENT_DATE,'20240401',1412,0,1),
('mercado',CURRENT_DATE,'20240415',355,0,-1),
('açougue',CURRENT_DATE,'20240420',95,0,-1),
('hortifruti',CURRENT_DATE,'20240423',70,0,-1),
('SALDO ANTERIOR',CURRENT_DATE,'20231231',250,0,1);

/*Questão 01*/
SELECT id, descricao, cadastro, vencimento, valor, quitado, tipoLancamento
FROM financas;

/*Questão 02*/
SELECT descricao, valor
FROM financas;

/*Questão 03*/
SELECT id, descricao, cadastro, vencimento, valor, quitado, tipoLancamento
FROM financas
WHERE quitado = 1;

/*Questão 04*/
SELECT id, descricao, cadastro, vencimento, valor, quitado, tipoLancamento
FROM financas
WHERE vencimento < '20230101';

/*Questão 05*/
SELECT id, descricao, cadastro, vencimento, valor, quitado, tipoLancamento
FROM financas
ORDER BY valor DESC;

/*Questão 06*/
SELECT id, descricao, cadastro, vencimento, valor, quitado, tipoLancamento
FROM financas
WHERE descricao like '%aluguel%';

/*Questão 07*/
SELECT MAX(valor)
FROM financas;

/*Questão 08*/
SELECT AVG(valor)
FROM financas
WHERE quitado = 1;

/*Questão 09*/
SELECT id, descricao, cadastro, vencimento, valor, quitado, tipoLancamento
FROM financas
WHERE tipolancamento = 2 and valor > 1000;

/*Questão 10*/
SELECT id, descricao, cadastro, vencimento, valor, quitado, tipoLancamento
FROM financas
WHERE cadastro BETWEEN '20230101' and '20231231';
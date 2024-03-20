/*Escreva uma consulta SQL para encontrar o valor médio das transações na tabela financas.*/
select avg(valor) from financas;
/*Escreva uma consulta SQL para calcular o total de valores quitados na tabela financas.*/
select sum(valor) from financas where quitado = 1;
/*Escreva uma consulta SQL para contar o número de transações não quitadas na tabela financas.*/
select count(valor) from financas where quitado = 0;
/*Escreva uma consulta SQL para encontrar a data de cadastro mais antiga na tabela financas.*/
select min(cadastro) from financas;
/*Escreva uma consulta SQL para encontrar a data de vencimento mais recente na tabela financas.*/
select max(vencimento) from financas;
/*Escreva uma consulta SQL para encontrar o valor máximo de uma transação na tabela financas.*/
select max(valor) from financas;
/*Escreva uma consulta SQL para calcular o total de transações agrupadas por tipo de lançamento (tipoLancamento) na tabela financas.*/
select tipolancamento, count(*) from financas GROUP by tipolancamento;
/*Escreva uma consulta SQL para calcular a soma dos valores das transações agrupadas por mês de cadastro na tabela financas.*/
select MONTHNAME(cadastro) mes, sum(valor) from financas GROUP by mes;
/*Escreva uma consulta SQL para calcular a média dos valores das transações agrupadas por ano de vencimento na tabela financas.*/
select year(vencimento) ano, avg(valor) from financas GROUP by ano;
/*Escreva uma consulta SQL para contar o número de transações agrupadas por dia da semana em que vencem, na tabela financas.*/
select weekday(vencimento) dia, count(*) from financas GROUP by dia;
/*Você pode usar a função weekday(data) pra saber o dia da semana e a solução vai ser semelhante ao que você fez para o mês .
Ela considera o dia da semana como um inteiro de 0 - 6 começando por segunda feira e indo até domingo.*/
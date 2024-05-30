/*
Você deve criar um procedimento armazenado em MySQL que permita inserir um novo registro na tabela financas.
O procedimento deve aceitar como parâmetros o código do cliente, a descrição, a data de cadastro, a data de vencimento, o valor, o status de quitação e o tipo de lançamento.
Após criar o procedimento, escreva a consulta SQL necessária para chamar este procedimento e inserir um registro na tabela financas. Use o seguinte comando para executar a Stored Procedure criada:
CALL InserirFinanca(
    1,
    'Conta de Luz',
    '2023-05-01',
    '2023-05-10',
    150.75,
    0,
    1
);
Após a execução da chamada da Stored Procedure criada, escreva uma consulta SQL que retorne o nome do cliente, a quantidade de finanças e o saldo final no mes de junho de 2024, para qualquer um dos clientes existentes no banco de dados.
Após executar a sentença, escolha a alternativa correta para o resultado obtido:
A- A quantidade de finanças é 16
B- O saldo geral da conta, no fim de junho é negativo
C- O saldo geral da conta, no fim de junho é maior que 2200
D- O saldo geral da conta, no fim de junho é maior que 2000       Resposta correta
E- O saldo geral da conta, no fim de junho é menor que 2200       Resposta correta
*/
select 
	c.nome as NomeCliente,
    Count(1) as QuantidadeFinanças,
    sum(valor * tipolancamento) as SaldoEmJunho
FROM financas f join cliente c on (f.codigo = c.codigo)
where c.nome = 'fulano' and vencimento < '20240701'
group by NomeCliente;
/*fulano
NomeCliente     QuantidadeFinanças    SaldoEmJunho
fulano          29                    2016,12
ciclano         30                    2189,87
beltrano        29                    2062,12
*/
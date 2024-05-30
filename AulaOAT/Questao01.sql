/*
Escolha qualquer um dos clientes existentes no banco de dados.
Escreva uma sentença SQL que liste a soma e a quantidade de registros quitados e não quitados.
Utilize uma subquery na cláusula WHERE para resolver essa questão, de forma que a consulta seja feita buscando pelo nome do cliente.
Após executar a sentença, escolha a alternativa correta para o resultado obtido:
A- O valor da soma das finanças não quitadas varia entre 2100 e 2200
B- O valor da soma das finanças não quitadas varia entre -2100 e -2200    Resposta correta
C- O valor da soma das finanças não quitadas varia entre -2200 e -2300    Resposta correta
D- O valor da soma das finanças quitadas varia entre 4100 e 4200
E- O valor da soma das finanças quitadas varia entre -4200 e -4300
*/
SELECT quitado, Sum(valor * tipolancamento),  count(1)
FROM financas 
WHERE codigo in (
  SELECT codigo
  FROM cliente
  where nome = 'fulano'
)
group by quitado;
/*fulano
Quitado     Sum         Count
0           -2219,88    26
1           4236        3
*/
/*ciclano
Quitado     Sum         Count
0           -2196,88    26
1           4236        3
*/
/*beltrano
Quitado     Sum         Count
0           -2173,88    26
1           4236        3
*/
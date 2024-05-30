/* criando a tabela cliente */
CREATE table cliente(
codigo bigint PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
nascimento DATE NULL,
email VARCHAR(100) NULL,
celular VARCHAR(100) NULL
);

/* criando a tabela financas */
CREATE table financas(
id bigint PRIMARY KEY NOT NULL AUTO_INCREMENT,
codigo bigint, 
descricao VARCHAR(100) NOT NULL,
cadastro DATE NULL,
vencimento DATE NOT NULL,
valor real NULL,
quitado smallint NULL,
tipoLancamento smallint NULL
);
ALTER TABLE financas ADD CONSTRAINT fk_cliente FOREIGN KEY (codigo) REFERENCES cliente (codigo) ;

/* povoando a tabela cliente */
INSERT INTO cliente (nome) VALUES 
('fulano'),
('ciclano'),
('beltrano')
;

/* SP Povoamento Banco */
CREATE PROCEDURE Inserir_Financas(IN cod INT)
BEGIN
	INSERT INTO financas (codigo,descricao,cadastro,vencimento,valor,quitado,tipoLancamento)
	VALUES 
	(cod,'emasa',CURRENT_DATE,'20240116',155,0,-1),
	(cod,'coelba',CURRENT_DATE,'20240110',83.72,0,-1),
	(cod,'aluguel',CURRENT_DATE,'20240108',155,0,-1),
	(cod,'salário',CURRENT_DATE,'20240101',1412,1,1),
	(cod,'mercado',CURRENT_DATE,'20240115',355,0,-1),
	(cod,'açougue',CURRENT_DATE,'20240115',95,0,-1),
	(cod,'hortifruti',CURRENT_DATE,'20240115',70,0,-1),
	(cod,'emasa',CURRENT_DATE,'20240216',155,0,-1),
	(cod,'coelba',CURRENT_DATE,'20240210',83.72,0,-1),
	(cod,'aluguel',CURRENT_DATE,'20240208',155,0,-1),
	(cod,'salário',CURRENT_DATE,'20240201',1412,1,1),
	(cod,'mercado',CURRENT_DATE,'20240215',355,0,-1),
	(cod,'açougue',CURRENT_DATE,'20240215',95,0,-1),
	(cod,'hortifruti',CURRENT_DATE,'20240215',70,0,-1),
	(cod,'emasa',CURRENT_DATE,'20240316',155,0,-1),
	(cod,'coelba',CURRENT_DATE,'20240310',83.72,0,-1),
	(cod,'aluguel',CURRENT_DATE,'20240308',155,0,-1),
	(cod,'salário',CURRENT_DATE,'20240301',1412,1,1),
	(cod,'mercado',CURRENT_DATE,'20240315',355,0,-1),
	(cod,'açougue',CURRENT_DATE,'20240315',95,0,-1),
	(cod,'hortifruti',CURRENT_DATE,'20240315',70,0,-1),
	(cod,'emasa',CURRENT_DATE,'20240416',155,0,-1),
	(cod,'coelba',CURRENT_DATE,'20240410',83.72,0,-1),
	(cod,'aluguel',CURRENT_DATE,'20240408',155,0,-1),
	(cod,'salário',CURRENT_DATE,'20240401',1412,0,1),
	(cod,'mercado',CURRENT_DATE,'20240415',355,0,-1),
	(cod,'açougue',CURRENT_DATE,'20240420',95,0,-1),
	(cod,'hortifruti',CURRENT_DATE,'20240423',70,0,-1),
	(cod,'SALDO ANTERIOR',CURRENT_DATE,'20231231',cod*23,0,1);
END;

CREATE PROCEDURE Povoar_Financas(IN cod INT)
BEGIN
DECLARE contador INT DEFAULT 0;
loop_teste: LOOP
    SET contador = contador + 1;
	CALL Inserir_Financas(contador);
    IF contador >= cod THEN    	
        LEAVE loop_teste;
    END IF;
END LOOP loop_teste;
END;

/* povoando a tabela finanças */
set @cont = 0;
select count(1) into @cont from cliente;
CALL Povoar_Financas(@cont);

/* conferindo o resultado*/
SELECT * FROM financas order by id desc;

/*SP InserirFinanca*/
CREATE PROCEDURE InserirFinanca (
    IN p_codigo BIGINT,
    IN p_descricao VARCHAR(100),
    IN p_cadastro DATE,
    IN p_vencimento DATE,
    IN p_valor REAL,
    IN p_quitado SMALLINT,
    IN p_tipoLancamento SMALLINT
)
BEGIN
    INSERT INTO financas (codigo, descricao, cadastro, vencimento, valor, quitado, tipoLancamento)
    VALUES (p_codigo, p_descricao, p_cadastro, p_vencimento, p_valor, p_quitado, p_tipoLancamento);
END;

CALL InserirFinanca(
    2,
    'Conta de Luz',
    '2023-05-01',
    '2023-05-10',
    150.75,
    0,
    1
);
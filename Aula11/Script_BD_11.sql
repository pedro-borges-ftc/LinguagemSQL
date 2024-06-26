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
('AEVERTON SANTOS DE OLIVEIRA'),
('ALEX JUNIO SANTOS PACHECO'),
('ALLAN BRITO BARRETO'),
('ANDRE LUIZ NASCIMENTO COUTINHO JUNIOR'),
('ANDRE VALTER MENEZES LEITE'),
('ARTHUR GALVAO LOUREIRO ARGOLO'),
('BRUNA ADRIELLY DA SILVA FLORO'),
('CAIO MEDEIROS FARIAS'),
('CAIO VICTOR LOPES SERRA'),
('CARLOS HENRIQUE SANTOS DE CARVALHO'),
('CLARA GABRYELLEN PAIXAO ADERNO'),
('DANIEL QUEIROGA SANTANA MARTINS'),
('DIOGENES SANTANA BISPO DOS SANTOS'),
('ELISSON BASTOS OLIVEIRA MENEZES JUNIOR'),
('FELIPE CRUZ SOARES'),
('FELIPE SOUZA TEIXEIRA DA SILVA'),
('FERNANDO GUSTAVO B. SANTOS'),
('FILLIPE CAIRES SILVA ALVES'),
('FREDSON PEREIRA DE OLIVEIRA'),
('GABRIEL BORGES LUZ GUEDES'),
('GABRIEL DE JESUS RIBEIRO'),
('GABRIEL DE SOUZA NASCIMENTO'),
('GUILHERME SANTOS DE SANTANA'),
('GUILHERME SOUZA SANTOS FERREIRA'),
('GUSTAVO MARINHO DE ANDRADE'),
('GUSTAVO MEIRA ALMEIDA'),
('IAN DA SILVA BORGES'),
('IGOR DOS SANTOS VIEIRA'),
('IGOR SENA HAGGE'),
('JHON LUIZ SOUSA SANTOS'),
('JOAO ANTONIO TRAGINO SANTANA'),
('JOAO FELIPE SANTOS COSTA'),
('JOAO GABRIEL ABOBOREIRA RODRIGUES'),
('JOAO PAULO ROSA BATISTA'),
('JOAO PEDRO SOUZA DE JESUS'),
('JOAO ROBERTO SANTOS CARDOSO'),
('JOAO VICTOR FORTUNO FIGUEIREDO'),
('JOAO VITOR EVANGELISTA SANTANA'),
('JONATAN DE SOUZA FERREIRA'),
('JONATAS ALVES OLIVEIRA NETO'),
('JONATAS DE JESUS SOUZA'),
('JOSE HENRIQUE'),
('KAUA SAMPAIO SILVA'),
('KAYKY OLIVEIRA NASCIMENTO'),
('KLEBER LUCAS SANTOS BOMFIM'),
('LAIO HENRIQUE PEREIRA DA SILVA'),
('LARISSA CARDOSO MENDES'),
('LARISSA CARVALHO ALMEIDA'),
('LEANDRO DA HORA SOUZA'),
('LUAN GABRIEL RIBEIRO LEITE SILVA'),
('LUCAS MANOEL GOMES MACIEL'),
('LUIDE MOURA SNTORNA'),
('MACIEL LOPES FRANCISCO'),
('MARCIO VINICIUS DA SILVA SANTOS'),
('NATAN CORREIA DA SILVA'),
('PEDRO BOMFIM GOMES ALMEIDA'),
('PEDRO FELIPE DOS ANJOS SANTOS'),
('PEDRO HENRIQUE FREITAS COUTO'),
('PEDRO HENRIQUE MOURA DOS SANTOS'),
('PEDRO KAUAN SACRAMENTO SOUZA LIMA'),
('PEDRO YAGO BORGES BARBOSA'),
('RAPHAEL BARRETO GOMES'),
('RAYAN SANTOS SILVA'),
('RONALD LUCAS PEREIRA SANTOS'),
('SAMUEL SANTOS CESAR'),
('SAULO VICTOR RIBEIRO PINTO'),
('TASSIO SANTOS DE ALBUQUERQUE DIAS'),
('THALLES GABRIEL FERREIRA SANTOS'),
('VICTOR TADEU ARAUJO AUGUSTO'),
('VITOR LUIS RAMOS SANTOS')
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
	(cod,'SALDO ANTERIOR',CURRENT_DATE,'20231231',cod,0,1);
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
CALL Povoar_Financas(70);
SELECT * FROM financas order by id desc;
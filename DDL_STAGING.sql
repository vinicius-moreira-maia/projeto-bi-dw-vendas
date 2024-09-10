/*ÁREA DE STAGING*/

-- o 'GO' é uma particularidade do SQL Server, não faz parte do padrão SQL
-- 'GO' é um comando que trata as instruções SQL como lotes, ou seja, ele interrompe a execução, envia para o servidor e vai para a próxima
-- ';' é apenas um separador de instruções do SQL, não interrompe o fluxo do lote

--CREATE DATABASE COMERCIO_STAGE
--GO

USE COMERCIO_STAGE
GO

-- não é necessário criar relacionamentos de integridade referencial na área de staging
-- é bom que a fato de staging seja praticamente a mesma da fato do DW (data mart)

CREATE TABLE ST_CLIENTE(
	IDCLIENTE INT DEFAULT NULL,
	NOME VARCHAR(100) DEFAULT NULL,
	SEXO VARCHAR(20) DEFAULT NULL,
	NASCIMENTO DATE DEFAULT NULL,
	CIDADE VARCHAR(100) DEFAULT NULL, -- de outra tabela
	ESTADO VARCHAR(10) DEFAULT NULL, -- de outra tabela
	REGIAO VARCHAR(20) DEFAULT NULL -- de outra tabela
)
GO

CREATE TABLE ST_VENDEDOR(
	IDVENDEDOR INT DEFAULT NULL,
	NOME VARCHAR(50) DEFAULT NULL,
	SEXO VARCHAR(20) DEFAULT NULL,
	IDGERENTE INT DEFAULT NULL -- autorrelacionamento
)
GO

CREATE TABLE ST_CATEGORIA(
	IDCATEGORIA INT DEFAULT NULL,
	NOME VARCHAR(50) DEFAULT NULL
)
GO

CREATE TABLE ST_FORNECEDOR(
	IDFORNECEDOR INT DEFAULT NULL,
	NOME VARCHAR(100) DEFAULT NULL
)
GO

CREATE TABLE ST_PRODUTO(
	IDPRODUTO INT DEFAULT NULL,
	NOME VARCHAR(50) DEFAULT NULL,
	VALOR_UNITARIO NUMERIC(10,2) DEFAULT NULL,
	CUSTO_MEDIO NUMERIC(10,2) DEFAULT NULL,
	ID_CATEGORIA INT DEFAULT NULL -- será normalizado com a tabela Categoria (para o uso de LOOKUP)
)
GO

CREATE TABLE ST_NOTA(
	IDNOTA INT DEFAULT NULL
)
GO

CREATE TABLE ST_FORMA(
	IDFORMA INT DEFAULT NULL,
	FORMA VARCHAR(30) DEFAULT NULL
)
GO

CREATE TABLE ST_FATO(
	IDCLIENTE INT DEFAULT NULL,
	IDVENDEDOR INT DEFAULT NULL,
	IDPRODUTO INT DEFAULT NULL,
	IDFORNECEDOR INT DEFAULT NULL,
	IDNOTA INT DEFAULT NULL,
	IDFORMA INT DEFAULT NULL,
	QUANTIDADE INT DEFAULT NULL, -- medida (somatório da quantidade de produtos vendidos)
	TOTAL_ITEM NUMERIC(10,2) DEFAULT NULL, -- medida (somatório do preço dos produtos vendidos)
	DATA DATE DEFAULT NULL, -- será a dimensão fato
	CUSTO_TOTAL NUMERIC(10,2) DEFAULT NULL, -- medida (somatório do preço de custo dos produtos vendidos)
	LUCRO_TOTAL NUMERIC(10,2) DEFAULT NULL -- medida (somatório do lucro das vendas, onde lucro = preco_venda - preco_custo)
)
GO

/*alterações*/
alter table [dbo].[ST_CLIENTE]
add EMAIL VARCHAR(100);


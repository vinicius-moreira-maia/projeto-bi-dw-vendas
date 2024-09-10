-- "Scalar-Valued Functions" são funções definidas pelo usuário, que retornam um único valor e podem ser usadas como parte de comandos SQL
-- função para ser usada em uma task de comando SQL do Integration Services
-- o intuito é transformar strings em CamelCase
-- a função (em T-SQL) recebe string como parâmetro e retorna string

CREATE FUNCTION CamelCase(@input NVARCHAR(MAX))
RETURNS NVARCHAR(MAX)
AS
BEGIN
    
    -- declaração de variáveis
    DECLARE @output NVARCHAR(MAX) = '' -- armazena a string retornada
    DECLARE @i INT = 1 -- contador para percorrer o loop
    DECLARE @len INT = LEN(@input) -- armazena o tamanho da string de entrada (define o limite do loop) 
    DECLARE @nextUpper BIT = 1 -- para checar se o próximo caractere é maiúsculo (1 para True, 0 para False)

	-- de 1 até o tamanho da string
    WHILE @i <= @len
    BEGIN
		-- variável que armazena o caractere atual (posição '@i')
        DECLARE @char CHAR(1) = SUBSTRING(@input, @i, 1)

        IF @char = ' ' -- se for espaço, '@nextUpper' é setado para True (1) e o espaço é adicionado à '@output'
        BEGIN 
            SET @nextUpper = 1
            SET @output = @output + @char
        END 
        ELSE IF @nextUpper = 1 -- se não for espaço e @nextUpper for True (1), o caractere é convertido para maiúsculo e @nextUpper é setado para False (0)
        BEGIN
            SET @output = @output + UPPER(@char)
            SET @nextUpper = 0
        END
        ELSE -- se não for espaço e @nextUpper for False (0), o caractere é convertido para minúsculo
        BEGIN
            SET @output = @output + LOWER(@char)
        END

        SET @i = @i + 1 -- incrementando o contador
    END

    RETURN @output
END

-- exemplo de uso
SELECT 
	IDPRODUTO,
    dbo.CamelCase(NOME) AS CamelCaseNome
FROM 
    ST_PRODUTO; 
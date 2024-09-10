CREATE VIEW VIEW_PARA_A_FATO AS
SELECT 
	-- o grão é o item da nota, não a nota
	CLI.IDCLIENTE AS IDCLIENTE,
	V.IDVENDEDOR AS IDVENDEDOR,
	P.IDPRODUTO AS IDPRODUTO,
	F.IDFORNECEDOR AS IDFORNECEDOR,
	NF.IDNOTA AS IDNOTA,
	FP.IDFORMA AS IDFORMA,
	I.QUANTIDADE AS QUANTIDADE,
	(I.QUANTIDADE * P.CUSTO_MEDIO) AS CUSTO_TOTAL, -- custo médio não é preço de venda
	(I.TOTAL - (I.QUANTIDADE * P.CUSTO_MEDIO)) AS LUCRO_TOTAL, -- TOTAL aqui é o total desse item de nota (quantidade * preço de venda)
	I.TOTAL AS TOTAL_ITEM,
	NF.DATA AS DATA
FROM 
	NOTA_FISCAL NF 
	JOIN ITEM_NOTA I ON NF.IDNOTA = I.ID_NOTA_FISCAL
	JOIN CLIENTE CLI ON CLI.IDCLIENTE = NF.ID_CLIENTE
	JOIN VENDEDOR V ON V.IDVENDEDOR = NF.ID_VENDEDOR
	JOIN PRODUTO P ON P.IDPRODUTO = I.ID_PRODUTO
	JOIN FORMA_PAGAMENTO FP ON FP.IDFORMA = NF.ID_FORMA
	JOIN FORNECEDOR F ON F.IDFORNECEDOR = P.ID_FORNECEDOR;
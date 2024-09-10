-- Consulta utilizada na carga da dimensão categoria
-- Já que esta dimensão é normalizada com outra dimensão, não há Slow Chaging Dimension aqui

SELECT 
	cat_stage.IDCATEGORIA AS IDCATEGORIA,
	cat_stage.NOME AS NOME
FROM COMERCIO_STAGE.DBO.ST_CATEGORIA cat_stage
     LEFT JOIN COMERCIO_DW.DBO.CATEGORIA cat_dw
	 ON cat_stage.IDCATEGORIA = cat_dw.IDCATEGORIA
WHERE cat_dw.IDCATEGORIA IS NULL;
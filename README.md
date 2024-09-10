# Projeto de BI realizado no curso completo de BI do Felipe Mafra

Este projeto trata-se da situação hipotética de uma empresa do ramo de Vendas, onde o escopo foi
a criação dos ambientes OLTP, OLAP e staging, além dos pacotes ETL do Integration Services.

Os arquivos deste repositório são:

1. Scripts DDL das áreas de staging e do dw.
2. Modelos lógicos (diagramas) das áreas de staging e do dw, com arquitetura Snowflake.
3. Script de consulta da tabela Categoria do OLTP, pois esta é normalizada com a dimensão Produto do dw.
4. Procedure que faz o tratamento dos dados de uma coluna de texto, convertendo os valores para CamelCase.
5. View do abiente OLTP que reflete a estrutura da tabela fato da área de staging.

**A pasta 'scripts_fornecidos' são de autoria do professor**. Os demais arquivos foram desenvolvidos por mim, durante o acompanhamento das atividades.

Fiz este curso com a intenção de experienciar o desenvolvimento de um projeto de BI
desde a análise dos requisitos até a modelagem e carga de um data mart (ambiente OLAP), passando também pela modelagem e carga do banco transacional (ambiente OLTP) e pela modelagem e carga de um banco de staging, para que os dados sejam persistidos em um ambiente que não o transacional, evitando assim a sobrecarga do banco de operação com as transformações necessárias. Para o fluxo de dados entre os bancos, foi utilizada a ferramenta de ETL Integration Services.

Este curso também abrange a utilização de ferramentas de cubos OLAP e de relatórios (que não o Power BI). No entanto, para otimizar o tempo dos meus estudos, optei por ir até a finalização da carga do data mart, pois hoje o que mais se vê no mercado é a utilização do Power BI direto com o data mart, sem a camada semântica fornecida pela ferramenta de cubos.  

## Área de staging
![Modelo de Staging](imagens_modelos/modelagem_STAGING.png)

## Data Mart (Arquitetura Snowflake)
![Modelo de Staging](imagens_modelos/modelagem_DW.png)
-- CREATE DATABASE petlove;

-- Escreva uma única consulta que apresente a quantidade total de SKUs distintos comprados em 2018 na família "Cachorros"
SELECT 
    DISTINCT fat.sku
FROM
    fat
INNER JOIN family on family.sku = fat.sku
WHERE
    dia_emissao_nota LIKE '2018%'
        AND familia = 'Cachorros'; -- yields 339.588 total, 266089 if distinct sku

-- e também o total de SKUs distintos comprados em cada mês em 2018 na família "Cachorros".
SELECT 
    COUNT(DISTINCT fat.sku), MONTH(dia_emissao_nota) as mes 
FROM
    fat
INNER JOIN family on family.sku = fat.sku
WHERE
    dia_emissao_nota LIKE '2018%'
        AND familia = 'Cachorros'
GROUP BY MONTH(dia_emissao_nota)
ORDER BY mes;

-- Escreva uma única consulta que aplique a regra de rateio do frete definida com a àrea de negócio e apresente o custo total de frete gasto no Setor "Alimentos".
-- ***Regra rateio = (Custo de frete / Peso total) *  Peso unitário

SELECT
	custo_frete, ((custo_frete / sum(peso_unitario))*peso_unitario) as rateio
FROM
	family
INNER JOIN fat on fat.sku = family.sku
INNER JOIN ship on ship.dia = fat.dia_emissao_nota
INNER JOIN weight on weight.sku = fat.sku
WHERE
	family.setor = "Alimentos";


-- Escreva uma única consulta que apresente o crescimento percentual de vendas  em relação  ao último mês para todos os meses a partir de 2018.
-- Apresente também a variação em relação ao mesmo mês do ano anterior para todos os meses.

asda

-- Escreva uma única consulta que apresente o percentual de vendas das famílias Cachorros, Gato e Peixes em relação ao total para todos os meses em 2018.



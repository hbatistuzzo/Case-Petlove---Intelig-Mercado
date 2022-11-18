-- CREATE DATABASE petlove;

-- Escreva uma única consulta que apresente a quantidade total de SKUs distintos comprados em 2018 na família "Cachorros"
-- e também o total de SKUs distintos comprados em cada mês em 2018 na família "Cachorros".
SELECT 
    COUNT(DISTINCT fat.sku),MONTH(dia_emissao_nota) as mes 
FROM
    fat
INNER JOIN family on family.sku = fat.sku
WHERE
    dia_emissao_nota LIKE '2018%'
        AND familia = 'Cachorros' -- yields 339.588 total, 266089 if distinct sku
GROUP BY MONTH(dia_emissao_nota) WITH ROLLUP
ORDER BY mes;


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

-- Anything below is taking so long that I am considering changing the data type of these attributes. Let's see...
Select DISTINCT(setor) from family;

ALTER TABLE family MODIFY sku MEDIUMINT;
ALTER TABLE family MODIFY familia VARCHAR(10);
ALTER TABLE family MODIFY setor VARCHAR(30);

SELECT * FROM fat;
SELECT MAX(id_nota) FROM fat;
ALTER TABLE fat MODIFY id_nota SMALLINT;
SELECT MAX(sku) FROM fat;
ALTER TABLE fat MODIFY sku MEDIUMINT;
ALTER TABLE fat MODIFY dia_emissao_nota date;
ALTER TABLE fat MODIFY uf_entrega CHAR(2);
SELECT MAX(quantidade) FROM fat;
ALTER TABLE fat MODIFY quantidade TINYINT;
SELECT MAX(receita) FROM fat;
ALTER TABLE fat MODIFY receita MEDIUMINT; -- naaaaaaao! era pra ser decimal! aughh

SELECT * FROM ship;
ALTER TABLE ship MODIFY uf_entrega CHAR(2);
ALTER TABLE ship MODIFY dia date;
SELECT MAX(custo_frete) FROM ship;
ALTER TABLE ship MODIFY custo_frete DECIMAL(7,2);

SELECT * FROM weight;
ALTER TABLE weight MODIFY sku MEDIUMINT;
SELECT MIN(peso_unitario) FROM weight;
ALTER TABLE weight MODIFY peso_unitario DECIMAL(4,2);

-- Escreva uma única consulta que aplique a regra de rateio do frete definida com a àrea de negócio e apresente o custo total de frete gasto no Setor "Alimentos".
-- ***Regra rateio = (Custo de frete / Peso total) *  Peso unitário

SELECT
	custo_frete, ((custo_frete / sum(peso_unitario))*peso_unitario) as rateio
FROM
	ship
INNER JOIN fat on fat.dia_emissao_nota = ship.dia
INNER JOIN weight on weight.sku = fat.sku
INNER JOIN family on fat.sku = family.sku
WHERE
	family.setor = "Alimentos";

WITH test(rateio) as ((custo_frete / sum(peso_unitario))*peso_unitario)



-- Escreva uma única consulta que apresente o crescimento percentual de vendas  em relação  ao último mês para todos os meses a partir de 2018.
-- Apresente também a variação em relação ao mesmo mês do ano anterior para todos os meses.

asda

-- Escreva uma única consulta que apresente o percentual de vendas das famílias Cachorros, Gato e Peixes em relação ao total para todos os meses em 2018.



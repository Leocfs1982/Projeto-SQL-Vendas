-- Projeto SQL de Análise de Vendas
-- Objetivo: calcular o faturamento total
-- dos produtos com preço unitário acima de R$ 100.

SELECT
    SUM(quantidade * preco_unitario) AS faturamento_total
FROM vendas
WHERE preco_unitario > 100;

-- 2. Contar quantos produtos estão cadastrados
SELECT
    COUNT(*) AS total_produtos
FROM vendas;

-- 3. Contar quantos produtos estão cadastrados
SELECT
    COUNT(*) AS total_produtos
FROM vendas;

-- 4. Identificar o produto com maior faturamento
SELECT
    produto,
    quantidade * preco_unitario AS faturamento
FROM vendas
ORDER BY faturamento DESC
LIMIT 1;

-- 5. Identificar o produto com menor faturamento
SELECT
    produto,
    quantidade * preco_unitario AS faturamento
FROM vendas
ORDER BY faturamento ASC
LIMIT 1;
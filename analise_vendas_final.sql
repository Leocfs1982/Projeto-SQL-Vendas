
-- PROJETO DE ANALISE DE VENDAS
-- Ferramenta: SQLite
-- Objetivo: analisar faturamento e quantidade vendida.

-- 1. RESUMO GERAL DAS VENDAS

SELECT
    SUM(quantidade) AS total_unidades,
    SUM(quantidade * preco_unitario) AS faturamento_total,
    COUNT(DISTINCT produto) AS total_produtos
FROM vendas;


-- 2. FATURAMENTO POR PRODUTO

SELECT
    produto,
    SUM(quantidade * preco_unitario) AS faturamento
FROM vendas
GROUP BY produto
ORDER BY faturamento DESC;


-- 3. FATURAMENTO POR PRODUTO COM TOTAL GERAL

SELECT
    produto,
    faturamento
FROM (
    SELECT
        produto,
        SUM(quantidade * preco_unitario) AS faturamento,
        0 AS ordem
    FROM vendas
    GROUP BY produto

    UNION ALL

    SELECT
        'TOTAL GERAL' AS produto,
        SUM(quantidade * preco_unitario) AS faturamento,
        1 AS ordem
    FROM vendas
)
ORDER BY ordem, faturamento DESC;


-- 4. PRODUTO COM MAIOR FATURAMENTO

SELECT
    produto,
    SUM(quantidade * preco_unitario) AS faturamento
FROM vendas
GROUP BY produto
ORDER BY faturamento DESC
LIMIT 1;


-- 5. PRODUTO COM MENOR FATURAMENTO

SELECT
    produto,
    SUM(quantidade * preco_unitario) AS faturamento
FROM vendas
GROUP BY produto
ORDER BY faturamento ASC
LIMIT 1;

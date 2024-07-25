
-- Selecionar todos os dados de uma tabela
-- σ_TRUE(Livro)
SELECT * FROM Livro;

-- Selecionar um subconjunto de atributos de uma tabela
-- σ titulo, autor (Livro)
SELECT titulo, autor FROM Livro;

-- Selecionar dados de uma tabela mediante alguma condição
-- σ ano_publicacao > 2020 (Livro)
SELECT * FROM Livro WHERE ano_publicacao > 2020;

-- Realizar seleção de dados sem apresentar duplicadas
-- σ DISTINCT autor (Livro)
SELECT DISTINCT autor FROM Livro;

-- Realizar consulta de seleção-projeção-junção
-- π titulo, autor (σ Livro.ISBN = Livro_Pedido.ISBN (Livro ⨝ Livro_Pedido))
SELECT Livro.titulo, Livro.autor
FROM Livro
JOIN Livro_Pedido ON Livro.ISBN = Livro_Pedido.ISBN;

-- Atribuir “apelidos”
-- π l.titulo, l.autor (σ l.ISBN = lp.ISBN (Livro AS l ⨝ Livro_Pedido AS lp))
SELECT l.titulo, l.autor
FROM Livro AS l
JOIN Livro_Pedido AS lp ON l.ISBN = lp.ISBN;

-- Aplicar união
-- (π titulo (Livro)) ∪ (π titulo (Livro_Pedido))
SELECT titulo FROM Livro
UNION
SELECT l.titulo FROM Livro_Pedido lp JOIN Livro l ON lp.ISBN = l.ISBN;

-- Aplicar interseção
-- (π titulo (Livro)) ∩ (π titulo (Livro_Pedido))
SELECT titulo FROM Livro
INTERSECT
SELECT l.titulo FROM Livro_Pedido lp JOIN Livro l ON lp.ISBN = l.ISBN;

-- Aplicar diferença
-- (π titulo (Livro)) - (π titulo (Livro_Pedido))
SELECT titulo FROM Livro
EXCEPT
SELECT l.titulo FROM Livro_Pedido lp JOIN Livro l ON lp.ISBN = l.ISBN;

-- Aplicar produto cartesiano
-- Livro × Livro_Pedido
SELECT * FROM Livro, Livro_Pedido;

-- Realizar seleção sob condição que envolva outra seleção
-- σ preco > (SELECT AVG(preco) FROM Livro) (Livro)
SELECT * FROM Livro WHERE preco > (SELECT AVG(preco) FROM Livro);

-- Consultar valores de atributos que iniciem por algum termo
-- σ titulo LIKE 'Livro%' (Livro)
SELECT * FROM Livro WHERE titulo LIKE 'Livro%';

-- Ordenar resultados de consultas de forma ascendente
SELECT * FROM Livro ORDER BY titulo ASC;

-- Utilizar função de agregação
SELECT AVG(preco) FROM Livro;

-- Realizar agrupamento de resultado de consulta
SELECT autor, COUNT(*) FROM Livro GROUP BY autor;
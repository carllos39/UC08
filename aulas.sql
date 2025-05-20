
--Selec para selecionar os dados (tudo que for antes from são atributos, tudo que for depois do from são tabelas)
SELECT * FROM clientes;
SELECT * FROM produtos;

--nesta query chamo os atributos da tabela específica
SELECT nome, email FROM clientes;

--Nesta query posso multiplicar os valores da coluna com um número(12), o AS ajudar a organizar a forma como visualizar os dados da minha consulta. 
SELECT produto, preco_unidade, preco_unidade * 12 FROM produtos;
SELECT produto, preco_unidade, preco_unidade * 12 AS DUZIA FROM produtos;

-- ORDER BY é uma cláusula opcional de instrução, permitindo ordenar as linhas devolvidas pela instrução SELECT. Em ordem ascendente ou descendente. 
SELECT produto FROM produtos ORDER BY produto ASC;
SELECT nome, email, cidade FROM clientes ORDER BY nome ASC;
SELECT nome, email, cidade FROM clientes ORDER BY cidade ASC;
SELECT nome, email, cidade FROM clientes ORDER BY cidade, nome;

-- Neste caso vamos filtrar a cidade em ordem decrescente e depois o bloco de pessoas que estão nesta categoria será colocada em ordem alfabetica. 
SELECT nome, email, cidade FROM clientes ORDER BY cidade DESC, nome ASC;

--Nesta consulta vamos buscar a encomenda mais recente.
SELECT * FROM encomendas ORDER BY data_hora DESC;

-- Nesta consulta vamos buscar os 10 primeiros clientes
SELECT id, nome, email FROM clientes LIMIT 10;

-- Nesta consulta vamos buscar os 10 ultimos clientes
SELECT id, nome, email FROM clientes ORDER BY id DESC LIMIT 10;

-- Nesta consulta vamos buscar ignorar os 10 primeiros e trazer os 3 seguintes.
SELECT id, nome, email FROM clientes LIMIT 3 OFFSET 10;
SELECT id, nome, email FROM clientes LIMIT 10, 3;
SELECT * FROM produtos ORDER BY preco_unidade DESC LIMIT 1;

-- Where é uma condição de busca filtrada.
-- Nesta vamos buscar todos os clientes da cidade de lisboa.
SELECT * FROM clientes WHERE cidade = "Lisboa";

-- Nesta vamos buscar todos os clientes do sexo masculino
SELECT * FROM clientes WHERE sexo = "m";

-- Usando os operadores lógicos 
SELECT * FROM clientes WHERE cidade = "Lisboa" AND sexo = "m";

SELECT * FROM produtos WHERE preco_unidade <= 1;

--Intervalo de preço. 
SELECT * FROM produtos WHERE preco_unidade >= 1 AND preco_unidade <= 2;

--Nesta vamos buscar todos que morem em Lisboa ou que sejam do sexo masculino.
SELECT nome, email, cidade, sexo FROM clientes WHERE cidade = "Lisboa" OR sexo = "m";
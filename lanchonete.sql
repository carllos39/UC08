01/0702025
-- Criar o banco
CREATE DATABASE lanchonete;
USE lanchonete;

-- Tabela de clientes
CREATE TABLE cliente (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100),
  telefone VARCHAR(15)
);

-- Tabela de produtos
CREATE TABLE produto (
  id_produto INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100),
  preco DECIMAL(6,2)
);

-- Tabela de pedidos (cabeçalho do pedido)
CREATE TABLE pedido (
  id_pedido INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente INT,
  data_pedido DATE,
  FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

-- Tabela intermediária de itens do pedido (detalhamento)
CREATE TABLE item_pedido (
  id_pedido INT,
  id_produto INT,
  quantidade INT,
  PRIMARY KEY (id_pedido, id_produto),
  FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
  FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);
-- Inserindo dados na tabela de clientes
INSERT INTO cliente (nome, telefone) VALUES
('Ana Lima', '1199887766'),
('Carlos Souza', '1199776655'),
('João Rocha', '1199111222'),
('Paula Mendes', '1199554433'), -- não fez nenhum pedido
('Paulo Augusto', '1199778833'); -- não fez nenhum pedido

-- Inserindo dados na tabela de produtos
INSERT INTO produto (nome, preco) VALUES
('Hamburguer', 15.00),
('Refrigerante', 5.00),
('Batata Frita', 7.50),
('Milkshake', 10.00); -- nunca foi pedido

-- Inserindo pedidos
INSERT INTO pedido (id_cliente, data_pedido) VALUES
(1, '2025-06-20'),
(1, '2025-06-21'),
(2, '2025-06-21'),
(3, '2025-06-22');

-- Inserindo itens nos pedidos
INSERT INTO item_pedido (id_pedido, id_produto, quantidade) VALUES
(1, 1, 2), -- Ana pediu 2 Hamburgueres
(1, 2, 2), -- Ana pediu 2 Refrigerantes
(2, 3, 1), -- Ana pediu 1 Batata Frita
(3, 2, 1), -- Carlos pediu 1 Refrigerante
(4, 1, 1), -- João pediu 1 Hamburguer
(4, 3, 1); -- João pediu 1 Batata Frita
 
1-
 SELECT 
cliente.nome,
pedido.data_pedido
FROM cliente
JOIN pedido ON cliente.id_cliente = pedido.id_cliente;

2-
SELECT 
cliente.nome,
produto.nome AS produto_nome,
item_pedido.quantidade
FROM cliente
JOIN pedido ON cliente.id_cliente = pedido.id_cliente
JOIN item_pedido ON pedido.id_pedido= item_pedido.id_pedido
JOIN produto ON item_pedido.id_produto = produto.id_produto;

3-
SELECT 
	cliente.nome,
    item_pedido.quantidade,
    produto.nome AS produto_nome,
    produto.preco
FROM cliente
JOIN pedido ON cliente.id_cliente = pedido.id_cliente
JOIN item_pedido ON pedido.id_pedido = item_pedido.id_pedido
JOIN produto ON item_pedido.id_produto = produto.id_produto
WHERE pedido.data_pedido = '2025-06-21'

4-
SELECT 
cliente.nome
FROM cliente
JOIN pedido ON cliente.id_cliente = pedido.id_cliente
JOIN item_pedido ON pedido.id_pedido = item_pedido.id_pedido
JOIN produto ON item_pedido.id_produto = produto.id_produto
--WHERE produto.nome LIKE %Refrigerante%
WHERE produto.nome = 'Refrigerante';

5-
SELECT
	cliente.nome,
    produto.nome AS produto_nome
FROM cliente
LEFT JOIN pedido ON cliente.id_cliente = pedido.id_cliente
LEFT JOIN item_pedido ON pedido.id_pedido = item_pedido.id_pedido
LEFT JOIN produto ON item_pedido.id_produto = produto.id_produto;

6-
SELECT  
produto.nome,
COUNT(item_pedido.id_produto) qtd_vezes_pedido
FROM produto

LEFT JOIN item_pedido ON produto.id_produto = item_pedido.id_produto
GROUP BY produto.nome; 
7-
SELECT
	cliente.nome,
    SUM(item_pedido.quantidade) AS total_itens_comprados,
    SUM(item_pedido.quantidade * produto.preco) AS valor_total_gasto
FROM cliente
JOIN pedido ON cliente.id_cliente = pedido.id_cliente
JOIN item_pedido ON pedido.id_pedido = item_pedido.id_pedido
JOIN produto ON item_pedido.id_produto = produto.id_produto
GROUP BY cliente.nome;

8-
SELECT 
	produto.nome,
    COUNT(item_pedido.id_produto) AS vezes_vendido,
    SUM(item_pedido.quantidade) AS qtd_total_vendida,
    SUM(item_pedido.quantidade * produto.preco) AS receita_total
FROM produto
LEFT JOIN item_pedido ON produto.id_produto = item_pedido.id_produto
GROUP BY produto.nome;

desafio-
SELECT 
cliente.nome,
 COUNT(item_pedido.id_produto) AS vezes_vendido,
 SUM(item_pedido.quantidade * produto.preco) AS receita_total
FROM cliente
JOIN item_pedido ON item_pedido.id_pedido = item_pedido.id_produto
JOIN produto ON produto.preco =produto.preco
GROUP BY produto.nome;

10/07/2025-Aecio
CREATE TABLE conta (

    id INT AUTO_INCREMENT PRIMARY KEY,

    nome_cliente VARCHAR(100) NOT NULL,

    saldo DECIMAL(10,2) NOT NULL DEFAULT 0.00,

    CHECK (saldo >= 0)

);
 
INSERT INTO conta (nome_cliente, saldo) VALUES ('Ana', 1000.00);

INSERT INTO conta (nome_cliente, saldo) VALUES ('Bob', 500.00);
 
 
-- Debita da conta da Ana

UPDATE conta SET saldo = saldo - 200 WHERE nome_cliente = 'Ana';
 
-- Aqui ocorre uma falha (ex: perda de conexão)
 
-- Credita na conta do Bob

UPDATE conta SET saldo = saldo + 200 WHERE nome_cliente = 'Bob';
 
-- Exemplo Seguro:

START TRANSACTION;
 
-- Debita da conta de Ana

UPDATE conta SET saldo = saldo - 200 WHERE nome_cliente = 'Ana';
 
-- Confere se a conta da Ana tem saldo suficiente (opcional, mas ilustrativo)

SELECT saldo FROM conta WHERE nome_cliente = 'Ana';
 
-- Credita na conta do Bob

UPDATE conta SET saldo = saldo + 200 WHERE nome_cliente = 'Bob';
 
-- Se tudo ocorreu bem, confirma a transação

COMMIT;
 
-- Exemplo com Erro:

START TRANSACTION;
 
UPDATE conta SET saldo = saldo - 200 WHERE nome_cliente = 'Ana';
 
-- Simulando erro: coluna inexistente

UPDATE conta SET saldxo = saldo + 200 WHERE nome_cliente = 'Bob';
 
-- ROLLBACK será necessário porque a segunda falha

ROLLBACK;

 
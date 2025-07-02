1. INNER JOIN (Junção Interna)
O que faz?
Retorna apenas os registros que têm correspondência em ambas as tabelas.
Exemplo prático:
Imagine duas tabelas:
Clientes (ID e Nome)
Pedidos (ID_Cliente e Produto)
Se você usar um INNER JOIN, verá apenas os clientes que fizeram pedidos.
SELECT Clientes.Nome, Pedidos.ProdutoFROM ClientesINNER JOIN Pedidos ON Clientes.ID = Pedidos.ID_Cliente;
Resultado:
Só aparecem os clientes que têm pedidos registrados.
2. LEFT JOIN (Junção à Esquerda)
O que faz?
Retorna todos os registros da tabela da esquerda (primeira tabela), mesmo que não haja correspondência na tabela da direita.
Exemplo prático:
Se você quiser listar todos os clientes, mesmo os que não fizeram pedidos, use LEFT JOIN.
SELECT Clientes.Nome, Pedidos.ProdutoFROM ClientesLEFT JOIN Pedidos ON Clientes.ID = Pedidos.ID_Cliente;
Resultado:
Clientes sem pedidos aparecerão com NULL no campo de produto.
Cenários ideais para o uso do LEFT JOIN:
Listagem completa com detalhes opcionais: Utilize LEFT JOIN quando precisar listar todos os itens de uma tabela e enriquecê-los com informações opcionais de outra tabela.
Análise de lacunas em dados: Facilita a identificação de registros na tabela principal que não têm correspondentes em outra, evidenciando possíveis lacunas nos dados.
Criação de relatórios inclusivos: Ideal para gerar relatórios que exigem a visualização do todo, permitindo análises mais abrangentes e inclusivas.
3. RIGHT JOIN (Junção à Direita)
O que faz?
Retorna todos os registros da tabela da direita (segunda tabela), mesmo que não haja correspondência na tabela da esquerda.
Exemplo prático:
Se você quiser listar todos os pedidos, mesmo que não estejam associados a um cliente, use RIGHT JOIN.
SELECT Clientes.Nome, Pedidos.ProdutoFROM ClientesRIGHT JOIN Pedidos ON Clientes.ID = Pedidos.ID_Cliente;
Resultado:
Pedidos sem clientes associados aparecerão com NULL no campo de nome.
Resumo visual:
 
Tipo de JOIN	O que retorna?
INNER JOIN	Apenas correspondências entre as tabelas.
LEFT JOIN	Tudo da tabela da esquerda + correspondências.
RIGHT JOIN	Tudo da tabela da direita + correspondências.
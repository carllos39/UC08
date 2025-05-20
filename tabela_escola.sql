
--Criar o banco de dados:
CREATE DATABASE escola;
USE escola;
--Criar a tabela alunos:
CREATE TABLE alunos (
 id INT AUTO_INCREMENT PRIMARY KEY,
 nome VARCHAR(100) NOT NULL,
 idade INT NOT NULL,
 serie VARCHAR(20),
 cidade VARCHAR(50)
);
--Criar a tabela matriculas:
CREATE TABLE matriculas (
 id_matricula INT AUTO_INCREMENT PRIMARY KEY,
 id_aluno INT,
 curso VARCHAR(50),
 data_matricula DATE,
 FOREIGN KEY (id_aluno) REFERENCES alunos(id)
);
--Inserir dados nas tabelas:
INSERT INTO alunos (nome, idade, serie, cidade) VALUES
('Ana Souza', 15, '9º Ano', 'São Paulo'),
('Bruno Lima', 17, '3º Ano', 'Rio de Janeiro'),
('Amanda Rocha', 14, '8º Ano', 'São Paulo'),
('Carlos Silva', 16, '2º Ano', 'Belo Horizonte'),
('Alice Nunes', 13, '7º Ano', 'Curitiba');
 
INSERT INTO matriculas (id_aluno, curso, data_matricula) VALUES
(1, 'Matemática', '2024-02-01'),
(1, 'Física', '2024-02-10'),
(2, 'História', '2024-01-20'),
(3, 'Geografia', '2024-02-15'),
(4, 'Química', '2024-01-25');
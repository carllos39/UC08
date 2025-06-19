Consultas

insert into cursos (nome,totalhora)values('ingles','60');
insert into cursos (nome,totalhora)values('espanhol','80');



insert into aluno (nome,sobrenome,data_nascimento,telefone)values('Maria Silva','Nascimento','2000-05-10','11999999999');
insert into aluno (nome,sobrenome,data_nascimento,telefone)values('João Souza','Nascimento','1998-08-22','11988888888');

insert into turma-ingles(data_inicio,horario,nivel,aluno_id)VALUES('2025-06-20','19:00','intermediario','1');

insert into turma_espanhol(data_inicio,horario,nivel,aluno_id)VALUES('2025-06-22','19:00','intermediario','2');


insert into matricula(numero,aluno_id,cursos_id)values('1240','1','1');
insert into matricula(numero,aluno_id,cursos_id)values('1241','2','2');
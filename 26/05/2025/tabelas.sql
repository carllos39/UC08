SELECT * FROM gh_tblpacientes AS P
INNER JOIN gh_tblprontuarios AS PR ON P.id_paciente = PR.id_paciente;



SELECT * FROM gh_tblpacientes AS P
LEFT JOIN gh_tblprontuarios AS PR ON P.id_paciente = PR.id_paciente;


SELECT * FROM gh_tblpacientes AS P
RIGHT JOIN gh_tblprontuarios AS PR ON P.id_paciente = PR.id_paciente;



SELECT 
 gh_tblpacientes.id_paciente,
    gh_tblpacientes.nome,
    gh_tblpacientes.sobrenome,
    gh_tblpacientes.data_nascimento,
    gh_tblgeneros.descricao AS genero,
    gh_tblprontuarios.id_prontuario,
    gh_tblprontuarios.descricao AS descricao_prontuario
FROM gh_tblpacientes
INNER JOIN gh_tblgeneros ON gh_tblpacientes.id_genero = gh_tblgeneros.id_genero
INNER JOIN gh_tblprontuarios ON gh_tblpacientes.id_paciente = gh_tblprontuarios.id_paciente



SELECT * FROM gh_tblpacientes
INNER JOIN gh_tblgeneros ON gh_tblpacientes.id_genero = gh_tblgeneros.id_genero
INNER JOIN gh_tblexames ON gh_tblpacientes.id_paciente = gh_tblexames.id_paciente;

SELECT * FROM gh_tblpacientes
INNER JOIN gh_tblexames ON gh_tblpacientes.id_paciente = gh_tblexames.id_paciente
INNER JOIN gh_tblmedicos ON gh_tblmedicos.id_medico = gh_tblexames.id_medico;


09/06/2025
class Escola     class Professores    class Disciplina
-id_escola        -id_professor         -id_disciplina  
-nome             -nome                 -nome
-end              -tel                  -periodo
-tel                                    -id_professor
-email 





CREATE TABLE professores (
 id_professor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(20),
    formacao VARCHAR(20)
);

CREATE TABLE disciplinas (
 id_disciplina  INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30),
    carga_horaria INT
);

CREATE TABLE professores_disciplinas(
 id_professor_disciplina  INT PRIMARY KEY AUTO_INCREMENT,
    id_professor INT,
    id_disciplina INT,
    semestre INT,
    ano INT,
    foreign key (id_professor) REFERENCES professores(id_professor),
    foreign key (id_disciplina) REFERENCES disciplinas(id_disciplina)
);

10/06/2025
backup_mysql_windows.bat
@echo off
REM Script de Backup Completo - MySQL (Windows)

REM Configurações
set DATA=%DATE:~10,4%-%DATE:~4,2%-%DATE:~7,2%
set DESTINO=C:\backups
set ARQUIVO=%DESTINO%\backup_%DATA%.sql
set USUARIO=root
set SENHA=

REM Criação do diretório
if not exist %DESTINO% mkdir %DESTINO%

REM Execução do backup
mysqldump -u %USUARIO% -p%SENHA% --all-databases > %ARQUIVO%

REM Compactação do arquivo (requer 7zip instalado e configurado no PATH)
7z a %ARQUIVO%.7z %ARQUIVO%
del %ARQUIVO%

Restaurar_backup_mysql_windows.bat

@echo off
REM Script de Restauração MySQL a partir de Dump (.sql)

REM Configurações
set ARQUIVO=C:\backups\backup_RESTAURAR.sql
set USUARIO=root
set SENHA=SENHA_AQUI

REM Restaurar o arquivo
mysql -u %USUARIO% -p%SENHA% < %ARQUIVO%

Backup_incremental_binlog_windows.bat
@echo off
REM Backup Incremental com Binlogs - Windows

REM Configurações
set BINLOG_DIR=C:\backups\binlogs
set MYSQL_BINLOG_PATH=C:\ProgramData\MySQL\MySQL Server 8.0\Data

REM Criação do diretório
if not exist %BINLOG_DIR% mkdir %BINLOG_DIR%

REM Copiar os arquivos binlog
xcopy /Y /Q %MYSQL_BINLOG_PATH%\mysql-bin.* %BINLOG_DIR%

16/06/2025

Entidades
Alunos -matricula,nome,data_nascimento,telefone
Cursos -ingles 60hs,espanhol 80 hs
Turma- 
ingles - data_inicio,horario,nivel 
espanhol-data_inicio,horario,nivel 


possiveis tabelas

create table aluno(id int AUTO_INCREMENT PRIMARY KEY,
                   nome varchar(20) not null,
                   sobrenome varchar(45) not null,
                   data_nascimento date not null,
                   telefone varchar(20) not null );
                   
create table cursos(id int AUTO_INCREMENT PRIMARY KEY,
                   nome varchar(45) not null,
                   totalhora time not null
        
                  );
                  
create table turma_ingles(id int AUTO_INCREMENT PRIMARY KEY,
                         data_inicio datetime not null,
                         horario time not null,
                         nivel varchar(30) not null,
                         aluno_id int not null,
                        CONSTRAINT fk_cursos_aluno FOREIGN KEY(aluno_id)REFERENCES aluno(id)
                  );
 create table turma_espanhol(id int AUTO_INCREMENT PRIMARY KEY,
                         data_inicio datetime not null,
                         horario time not null,
                         nivel varchar(30) not null,
                         aluno_id int not null,
                        CONSTRAINT fk_cursos_alunos FOREIGN KEY(aluno_id)REFERENCES aluno(id)
                  );
create table matricula(id int AUTO_INCREMENT PRIMARY KEY,
                    numero varchar(20)not null,
                    aluno_id int not null,
                    CONSTRAINT fk_matricula_aluno FOREIGN KEY(aluno_id)REFERENCES aluno(id),
                    cursos_id int not null,
                    CONSTRAINT fk_matricula_cursos FOREIGN KEY(cursos_id)REFERENCES cursos(id)
                  );



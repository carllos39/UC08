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
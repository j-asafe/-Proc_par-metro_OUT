DELIMITER //

CREATE PROCEDURE Proc_InserirAluno(
    IN inserir_id_curso INT,
    IN inserir_id_turma INT,
    IN inserir_nome_aluno VARCHAR(100),
    IN inserir_idade INT,
    IN inserir_nota DECIMAL(5,2)
)
BEGIN
    INSERT INTO alunos (nome, idade, id_turma)
    VALUES (inserir_nome_aluno, inserir_idade, inserir_id_turma);

    INSERT INTO boletim (id_curso, id_turma, id_aluno, nota)
    VALUES (inserir_id_curso, inserir_id_turma, LAST_INSERT_ID(), inserir_nota);
END //

DELIMITER ;


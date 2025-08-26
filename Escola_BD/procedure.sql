DELIMITER $$

CREATE PROCEDURE InserirDadosAluno(
    IN p_nome_aluno VARCHAR(100),
    IN p_idade INT,
    IN p_turma VARCHAR(50),
    IN p_curso VARCHAR(100),
    IN p_nota DECIMAL(5,2)
)
BEGIN
    DECLARE v_id_turma INT;
    DECLARE v_id_curso INT;
    DECLARE v_id_aluno INT;
    
    SELECT id INTO v_id_curso FROM cursos WHERE curso = p_curso LIMIT 1;
    IF v_id_curso IS NULL THEN
        INSERT INTO cursos(curso) VALUES (p_curso);
        SET v_id_curso = LAST_INSERT_ID();
    END IF;
    
    SELECT id INTO v_id_turma
    FROM turmas
    WHERE turma = p_turma AND id_curso = v_id_curso
    LIMIT 1;

    IF v_id_turma IS NULL THEN
        INSERT INTO turmas(turma, id_curso) VALUES (p_turma, v_id_curso);
        SET v_id_turma = LAST_INSERT_ID();
    END IF;
  
    INSERT INTO alunos(nome, idade, id_turma) VALUES (p_nome_aluno, p_idade, v_id_turma);
    SET v_id_aluno = LAST_INSERT_ID();
  
    INSERT INTO boletim(id_curso, id_turma, id_aluno, nota)
    VALUES (v_id_curso, v_id_turma, v_id_aluno, p_nota);
END$$

DELIMITER ;
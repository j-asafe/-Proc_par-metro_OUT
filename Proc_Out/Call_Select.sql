CALL Proc_InserirAluno(1, 1, 'João Asafe', 18, 9.0);

SELECT c.curso, t.turma, a.nome, b.nota
FROM boletim b
JOIN cursos c ON b.id_curso = c.id
JOIN turmas t ON b.id_turma = t.id
JOIN alunos a ON b.id_aluno = a.id_aluno
WHERE c.curso = 'Téc. em Desenvolvimento de Sistemas' AND t.turma = '3DS';

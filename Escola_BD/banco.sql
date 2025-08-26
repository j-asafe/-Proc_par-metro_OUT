CREATE DATABASE IF NOT EXISTS Escola;
USE Escola;

CREATE TABLE IF NOT EXISTS cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    curso VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS turmas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    turma VARCHAR(50) NOT NULL,
    id_curso INT NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES cursos(id)
);

CREATE TABLE IF NOT EXISTS alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INT NOT NULL,
    id_turma INT NOT NULL,
    FOREIGN KEY (id_turma) REFERENCES turmas(id)
);

CREATE TABLE IF NOT EXISTS boletim (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_curso INT NOT NULL,
    id_turma INT NOT NULL,
    id_aluno INT NOT NULL,
    nota DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES cursos(id),
    FOREIGN KEY (id_turma) REFERENCES turmas(id),
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno)
);

SELECT c.curso, t.turma, a.nome AS aluno, b.nota
FROM boletim b
INNER JOIN alunos a ON b.id_aluno = a.id_aluno
INNER JOIN turmas t ON b.id_turma = t.id
INNER JOIN cursos c ON b.id_curso = c.id
WHERE t.turma = '3ds' AND c.curso = 'técnico em desenvolvimento de sistemas';
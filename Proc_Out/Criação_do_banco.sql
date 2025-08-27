CREATE DATABASE IF NOT EXISTS Escola;
USE Escola;

CREATE TABLE cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    curso VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE turmas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    turma VARCHAR(50) NOT NULL,
    id_curso INT NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES cursos(id)
);

CREATE TABLE alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INT NOT NULL,
    id_turma INT NOT NULL,
    FOREIGN KEY (id_turma) REFERENCES turmas(id)
);


CREATE TABLE boletim (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_curso INT NOT NULL,
    id_turma INT NOT NULL,
    id_aluno INT NOT NULL,
    nota DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES cursos(id),
    FOREIGN KEY (id_turma) REFERENCES turmas(id),
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno)
);

INSERT INTO cursos (curso) VALUES ('Téc. em Desenvolvimento de Sistemas');
INSERT INTO turmas (turma, id_curso) VALUES ('3DS', 1);


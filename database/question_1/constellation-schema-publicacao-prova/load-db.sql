# ----------------------------------------------------------------------------
# - FILE: load-db.sql
# - DESC: Load data into publicacao-prova constellation schema.
# ----------------------------------------------------------------------------
# - AUTH: Andre Perez, andre.marcos.perez@usp.br
# - DATE: 2019-11-13
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# -- SETUP
# ----------------------------------------------------------------------------

USE constellation_publicacao_prova;

# ----------------------------------------------------------------------------
# -- MAIN
# ----------------------------------------------------------------------------

INSERT INTO fact_publicacao VALUES (1, 1, 3, 1);
INSERT INTO fact_publicacao VALUES (2, 2, 4, 1);
INSERT INTO fact_publicacao VALUES (2, 3, 1, 1);
INSERT INTO fact_publicacao VALUES (3, 1, 3, 1);
INSERT INTO fact_publicacao VALUES (4, 1, 3, 1);
INSERT INTO fact_publicacao VALUES (6, 1, 3, 1);
INSERT INTO fact_publicacao VALUES (7, 3, 2, 1);
INSERT INTO fact_publicacao VALUES (8, 3, 2, 1);
INSERT INTO fact_publicacao VALUES (8, 1, 4, 1);
INSERT INTO fact_publicacao VALUES (9, 1, 4, 1);
INSERT INTO fact_publicacao VALUES (11, 1, 4, 1);
INSERT INTO fact_publicacao VALUES (12, 3, 1, 1);
INSERT INTO fact_publicacao VALUES (12, 3, 2, 1);

INSERT INTO dim_data VALUES (1, 1, 'Um', 1, 'Janeiro', 2019, 'Dois Mil e Dezenove');
INSERT INTO dim_data VALUES (2, 1, 'Um', 2, 'Fevereiro', 2019, 'Dois Mil e Dezenove');
INSERT INTO dim_data VALUES (3, 1, 'Um', 3, 'Marco', 2019, 'Dois Mil e Dezenove');
INSERT INTO dim_data VALUES (4, 2, 'Dois', 3, 'Marco', 2019, 'Dois Mil e Dezenove');
INSERT INTO dim_data VALUES (5, 1, 'Um', 4, 'Abril', 2019, 'Dois Mil e Dezenove');
INSERT INTO dim_data VALUES (6, 2, 'Dois', 6, 'Junho', 2019, 'Dois Mil e Dezenove');
INSERT INTO dim_data VALUES (7, 1, 'Um', 7, 'Julho', 2019, 'Dois Mil e Dezenove');
INSERT INTO dim_data VALUES (8, 1, 'Um', 8, 'Agosto', 2019, 'Dois Mil e Dezenove');
INSERT INTO dim_data VALUES (9, 2, 'Dois', 8, 'Agosto', 2019, 'Dois Mil e Dezenove');
INSERT INTO dim_data VALUES (10, 1, 'Um', 9, 'Setembro', 2019, 'Dois Mil e Dezenove');
INSERT INTO dim_data VALUES (11, 1, 'Um', 11, 'Novembro', 2019, 'Dois Mil e Dezenove');
INSERT INTO dim_data VALUES (12, 2, 'Dois', 12, 'Dezembro', 2019, 'Dois Mil e Dezenove');

INSERT INTO dim_autor VALUES (1, 'Andre Silva', 'SCC', 'Departamento de Ciencia da Computacao', 'ICMC', 'Instituto de Ciencias Matematicas e de Computacao', 'USP', 'Universidade de Sao Paulo', 'Ciencia da Computacao');
INSERT INTO dim_autor VALUES (2, 'Pedro Silva', 'SCC', 'Departamento de Ciencia da Computacao', 'ICMC', 'Instituto de Ciencias Matematicas e de Computacao', 'USP', 'Universidade de Sao Paulo', 'Ciencia da Computacao');
INSERT INTO dim_autor VALUES (3, 'Maria Silva', 'SME', 'Departamento de Matematica e Estatistica', 'ICMC', 'Instituto de Ciencias Matematicas e de Computacao', 'USP', 'Universidade de Sao Paulo', 'Matematica');

INSERT INTO dim_local_publicacao VALUES (1, '0730-0301', 'ACM Transactions on Graphics', 'Matematica / Probabilidade e Estatistica', 'A1');
INSERT INTO dim_local_publicacao VALUES (2, '1063-6706', 'IEEE Transactions on Fuzzy Systems', 'Matematica / Probabilidade e Estatistica', 'A1');
INSERT INTO dim_local_publicacao VALUES (3, '1541-1672', 'IEEE Intelligent Systems', 'Ciencia da Computacao', 'A1');
INSERT INTO dim_local_publicacao VALUES (4, '0272-1716', 'IEEE Computer Graphics and Applications', 'Ciencia da Computacao', 'A2');

INSERT INTO fact_prova VALUES (4, 1, 1, 1, 10.0);
INSERT INTO fact_prova VALUES (4, 1, 2, 1, 5.98);
INSERT INTO fact_prova VALUES (4, 1, 3, 1, 9.66);
INSERT INTO fact_prova VALUES (4, 1, 4, 1, 7.30);
INSERT INTO fact_prova VALUES (6, 1, 1, 1, 9.40);
INSERT INTO fact_prova VALUES (6, 1, 2, 1, 6.22);
INSERT INTO fact_prova VALUES (6, 1, 3, 1, 5.04);
INSERT INTO fact_prova VALUES (6, 1, 4, 1, 7.78);

INSERT INTO fact_prova VALUES (9, 2, 1, 2, 5.96);
INSERT INTO fact_prova VALUES (9, 2, 2, 2, 9.93);
INSERT INTO fact_prova VALUES (9, 2, 3, 2, 10.0);
INSERT INTO fact_prova VALUES (9, 2, 4, 2, 7.66);
INSERT INTO fact_prova VALUES (12, 2, 1, 2, 4.57);
INSERT INTO fact_prova VALUES (12, 2, 2, 2, 10.0);
INSERT INTO fact_prova VALUES (12, 2, 3, 2, 10.0);
INSERT INTO fact_prova VALUES (12, 2, 4, 2, 8.72);

INSERT INTO dim_docente VALUES (1, 1, 'Andre Silva', 'SCC', 'Departamento de Ciencia da Computacao', 'ICMC', 'Instituto de Ciencias Matematicas e de Computacao', 'USP', 'Universidade de Sao Paulo');
INSERT INTO dim_docente VALUES (2, 2, 'Maria Silva', 'SME', 'Departamento de Matematica e Estatistica', 'ICMC', 'Instituto de Ciencias Matematicas e de Computacao', 'USP', 'Universidade de Sao Paulo');

INSERT INTO dim_aluno VALUES (1, 1, 'Andre Pereira', 'Engenharia Eletrica Eletronica', 'SEL', 'Departamento de Engenharia Eletrica e de Computacao', 'EESC', 'Escola de Engenharia de Sao Carlos', 'USP', 'Universidade de Sao Paulo');
INSERT INTO dim_aluno VALUES (2, 2, 'Pedro Pereira', 'Engenharia Eletrica Eletronica', 'SEL', 'Departamento de Engenharia Eletrica e de Computacao', 'EESC', 'Escola de Engenharia de Sao Carlos', 'USP', 'Universidade de Sao Paulo');
INSERT INTO dim_aluno VALUES (3, 3, 'Maria Pereira', 'Engenharia Eletrica Eletronica', 'SEL', 'Departamento de Engenharia Eletrica e de Computacao', 'EESC', 'Escola de Engenharia de Sao Carlos', 'USP', 'Universidade de Sao Paulo');
INSERT INTO dim_aluno VALUES (4, 4, 'Luiza Pereira', 'Engenharia Eletrica Eletronica', 'SEL', 'Departamento de Engenharia Eletrica e de Computacao', 'EESC', 'Escola de Engenharia de Sao Carlos', 'USP', 'Universidade de Sao Paulo');

INSERT INTO dim_disciplina VALUES (1, 'SSC0304', 'Introducao a Programacao para Engenharias', 2019, 1, 'SCC', 'Departamento de Ciencia da Computacao', 'ICMC', 'Instituto de Ciencias Matematicas e de Computacao', 'USP', 'Universidade de Sao Paulo');
INSERT INTO dim_disciplina VALUES (2, 'SSC0304', 'Introducao a Programacao para Engenharias', 2019, 2, 'SCC', 'Departamento de Ciencia da Computacao', 'ICMC', 'Instituto de Ciencias Matematicas e de Computacao', 'USP', 'Universidade de Sao Paulo');
INSERT INTO dim_disciplina VALUES (3, 'SMA0353', 'Calculo I', 2019, 1, 'SME', 'Departamento de Matematica e Estatistica', 'ICMC', 'Instituto de Ciencias Matematicas e de Computacao', 'USP', 'Universidade de Sao Paulo');
INSERT INTO dim_disciplina VALUES (4, 'SMA0353', 'Calculo I', 2019, 2, 'SME', 'Departamento de Matematica e Estatistica', 'ICMC', 'Instituto de Ciencias Matematicas e de Computacao', 'USP', 'Universidade de Sao Paulo');

# ----------------------------------------------------------------------------
# -- ROLLBACK
# ----------------------------------------------------------------------------

DELETE FROM fact_publicacao;
DELETE FROM dim_data;
DELETE FROM dim_autor;
DELETE FROM dim_local_publicacao;
DELETE FROM fact_prova;
DELETE FROM dim_docente;
DELETE FROM dim_aluno;
DELETE FROM dim_disciplina;
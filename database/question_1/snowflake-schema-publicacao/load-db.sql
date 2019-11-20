# ----------------------------------------------------------------------------
# - FILE: load-db.sql
# - DESC: Load data into publicacao snowflake schema.
# ----------------------------------------------------------------------------
# - AUTH: Andre Perez, andre.marcos.perez@usp.br
# - DATE: 2019-11-13
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# -- SETUP
# ----------------------------------------------------------------------------

USE snowflake_publicacao;

# ----------------------------------------------------------------------------
# -- MAIN
# ----------------------------------------------------------------------------

INSERT INTO fact_publicacao VALUES (1, 1, 3, 1);
INSERT INTO fact_publicacao VALUES (2, 2, 4, 1);
INSERT INTO fact_publicacao VALUES (2, 3, 1, 1);
INSERT INTO fact_publicacao VALUES (3, 1, 3, 1);
INSERT INTO fact_publicacao VALUES (4, 1, 3, 1);
INSERT INTO fact_publicacao VALUES (7, 3, 2, 1);
INSERT INTO fact_publicacao VALUES (8, 1, 4, 1);
INSERT INTO fact_publicacao VALUES (9, 1, 4, 1);
INSERT INTO fact_publicacao VALUES (11, 1, 4, 1);
INSERT INTO fact_publicacao VALUES (11, 3, 1, 1);
INSERT INTO fact_publicacao VALUES (11, 3, 2, 1);

INSERT INTO dim_data VALUES (1, 1, 'Um', 1, 'Janeiro', 2019, 'Dois Mil e Dezenove');
INSERT INTO dim_data VALUES (2, 1, 'Um', 2, 'Fevereiro', 2019, 'Dois Mil e Dezenove');
INSERT INTO dim_data VALUES (3, 1, 'Um', 3, 'Marco', 2019, 'Dois Mil e Dezenove');
INSERT INTO dim_data VALUES (4, 1, 'Um', 4, 'Abril', 2019, 'Dois Mil e Dezenove');
INSERT INTO dim_data VALUES (7, 1, 'Um', 7, 'Julho', 2019, 'Dois Mil e Dezenove');
INSERT INTO dim_data VALUES (8, 1, 'Um', 8, 'Agosto', 2019, 'Dois Mil e Dezenove');
INSERT INTO dim_data VALUES (9, 1, 'Um', 9, 'Setembro', 2019, 'Dois Mil e Dezenove');
INSERT INTO dim_data VALUES (11, 1, 'Um', 11, 'Novembro', 2019, 'Dois Mil e Dezenove');

INSERT INTO dim_autor VALUES (1, 1, 'Andre Silva', 'Ciencia da Computacao');
INSERT INTO dim_autor VALUES (2, 1, 'Pedro Silva', 'Ciencia da Computacao');
INSERT INTO dim_autor VALUES (3, 2, 'Maria Silva', 'Matematica');

INSERT INTO dim_departamento VALUES (1, 1, 'SCC', 'Departamento de Matematica e Estatistica');
INSERT INTO dim_departamento VALUES (2, 1, 'SME', 'Departamento de Matematica e Estatistica');

INSERT INTO dim_instituto VALUES (1, 1, 'ICMC', 'Instituto de Ciencias Matematicas e de Computacao');

INSERT INTO dim_universidade VALUES (1, 'USP', 'Universidade de Sao Paulo');

INSERT INTO dim_local_publicacao VALUES (1, '0730-0301', 'ACM Transactions on Graphics', 'Matematica / Probabilidade e Estatistica', 'A1');
INSERT INTO dim_local_publicacao VALUES (2, '1063-6706', 'IEEE Transactions on Fuzzy Systems', 'Matematica / Probabilidade e Estatistica', 'A1');
INSERT INTO dim_local_publicacao VALUES (3, '1541-1672', 'IEEE Intelligent Systems', 'Ciencia da Computacao', 'A1');
INSERT INTO dim_local_publicacao VALUES (4, '0272-1716', 'IEEE Computer Graphics and Applications', 'Ciencia da Computacao', 'A2');

# ----------------------------------------------------------------------------
# -- ROLLBACK
# ----------------------------------------------------------------------------

DELETE FROM fact_publicacao;
DELETE FROM dim_data;
DELETE FROM dim_autor;
DELETE FROM dim_departamento;
DELETE FROM dim_instituto;
DELETE FROM dim_universidade;
DELETE FROM dim_local_publicacao;
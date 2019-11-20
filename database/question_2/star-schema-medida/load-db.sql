# ----------------------------------------------------------------------------
# - FILE: load-db.sql
# - DESC: Load data into medida star schema.
# ----------------------------------------------------------------------------
# - AUTH: Andre Perez, andre.marcos.perez@usp.br
# - DATE: 2019-11-14
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# -- SETUP
# ----------------------------------------------------------------------------

USE star_medida;
SET SQL_SAFE_UPDATES = 0;

# ----------------------------------------------------------------------------
# -- MAIN
# ----------------------------------------------------------------------------

INSERT INTO fact_medida VALUES (1, 1, 1, 10, 100);
INSERT INTO fact_medida VALUES (1, 1, 2, 8, 93);
INSERT INTO fact_medida VALUES (2, 2, 1, 5, 100);
INSERT INTO fact_medida VALUES (2, 3, 1, 7, 100);
INSERT INTO fact_medida VALUES (3, 1, 1, 3, 30);
INSERT INTO fact_medida VALUES (3, 1, 2, 8, 93);
INSERT INTO fact_medida VALUES (4, 3, 1, 9, 100);
INSERT INTO fact_medida VALUES (4, 2, 2, 6, 100);
INSERT INTO fact_medida VALUES (4, 2, 1, 4, 30);
INSERT INTO fact_medida VALUES (4, 3, 2, 10, 100);

INSERT INTO dim_data VALUES (1, 2001, 'primeiro ano');
INSERT INTO dim_data VALUES (2, 2002, 'segundo ano');
INSERT INTO dim_data VALUES (3, 2003, 'terceiro ano');
INSERT INTO dim_data VALUES (4, 2004, 'quarto ano');

INSERT INTO dim_disciplina VALUES (1, 'bases de dados');
INSERT INTO dim_disciplina VALUES (2, 'organização de arquivos');
INSERT INTO dim_disciplina VALUES (3, 'compiladores');

INSERT INTO dim_departamento VALUES (1, 'computacao');
INSERT INTO dim_departamento VALUES (2, 'sistemas');

# ----------------------------------------------------------------------------
# -- ROLLBACK
# ----------------------------------------------------------------------------

DELETE FROM fact_medida;
DELETE FROM dim_data;
DELETE FROM dim_disciplina;
DELETE FROM dim_departamento;
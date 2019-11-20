# ----------------------------------------------------------------------------
# - FILE: create-db.sql
# - DESC: Create medida star schema.
# ----------------------------------------------------------------------------
# - AUTH: Andre Perez, andre.marcos.perez@usp.br
# - DATE: 2019-11-14
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# -- SETUP
# ----------------------------------------------------------------------------

DROP SCHEMA IF EXISTS star_medida;
CREATE SCHEMA star_medida;
USE star_medida;

# ----------------------------------------------------------------------------
# -- MAIN
# ----------------------------------------------------------------------------

CREATE TABLE fact_medida (
    data_id INT NOT NULL,
    disciplina_id INT NOT NULL,
    departamento_id INT NOT NULL,
	nota DECIMAL(4, 2) NOT NULL DEFAULT 0, -- haha
    presenca INT NOT NULL DEFAULT 0,
    CONSTRAINT pk_fact_medida PRIMARY KEY (data_id, disciplina_id, departamento_id)
);

CREATE TABLE dim_data (
    id INT NOT NULL AUTO_INCREMENT,
    ano INT(4),
    descricao_ano VARCHAR(30),
    CONSTRAINT pk_dim_data PRIMARY KEY (id)
);

CREATE TABLE dim_disciplina (
    id INT NOT NULL AUTO_INCREMENT,
    nome_extenso VARCHAR(30),
    CONSTRAINT pk_dim_disciplina PRIMARY KEY (id)
);

CREATE TABLE dim_departamento (
    id INT NOT NULL AUTO_INCREMENT,
    nome_extenso VARCHAR(30),
    CONSTRAINT pk_dim_departamento PRIMARY KEY (id)
);

CREATE TABLE mv_nota_media_por_disciplina_por_ano (
    id INT NOT NULL AUTO_INCREMENT,
    disciplina VARCHAR(30),
    ano INT(4),
    nota_media DECIMAL(4, 2) NOT NULL DEFAULT 0,
    CONSTRAINT 
    pk_mv_nota_media_por_disciplina_por_ano 
    PRIMARY KEY (id)
);

DELIMITER //
CREATE TRIGGER 
trigger_update_mv_nota_media_por_disciplina_por_ano 
AFTER INSERT ON fact_medida
FOR EACH ROW BEGIN
	SET @disciplina = (
		SELECT DISTINCT nome_extenso 
        FROM dim_disciplina 
        WHERE id = NEW.disciplina_id
    );
    SET @ano = (
		SELECT DISTINCT ano 
        FROM dim_data 
        WHERE id = new.data_id
    );
    SET @nota_media = (
		SELECT AVG(nota) 
        FROM fact_medida 
        WHERE 1=1 
        AND data_id = NEW.data_id 
        AND disciplina_id = NEW.disciplina_id
    );
	IF EXISTS(
		SELECT 1 
        FROM mv_nota_media_por_disciplina_por_ano 
        WHERE 1=1 
        AND disciplina = @disciplina 
        AND ano = @ano
    ) = TRUE 
    THEN
		UPDATE mv_nota_media_por_disciplina_por_ano 
        SET nota_media = @nota_media 
        WHERE 1=1
        AND disciplina = @disciplina 
        AND ano = @ano;
	ELSE
		INSERT INTO mv_nota_media_por_disciplina_por_ano 
        (disciplina, ano, nota_media) 
        VALUES 
        (@disciplina, @ano, @nota_media);
	END IF;
END;//
DELIMITER ;

# ----------------------------------------------------------------------------
# -- ROLLBACK
# ----------------------------------------------------------------------------

DROP TABLE IF EXISTS fact_medida;
DROP TABLE IF EXISTS dim_data;
DROP TABLE IF EXISTS dim_disciplina;
DROP TABLE IF EXISTS dim_departamento;
DROP TABLE IF EXISTS mv_nota_media_por_disciplina_por_ano;
DROP TRIGGER trigger_update_mv_nota_media_por_disciplina_por_ano;
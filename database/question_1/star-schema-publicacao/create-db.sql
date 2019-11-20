# ----------------------------------------------------------------------------
# - FILE: create-db.sql
# - DESC: Create publicacao star schema.
# ----------------------------------------------------------------------------
# - AUTH: Andre Perez, andre.marcos.perez@usp.br
# - DATE: 2019-11-13
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# -- SETUP
# ----------------------------------------------------------------------------

DROP SCHEMA IF EXISTS star_publicacao;
CREATE SCHEMA star_publicacao;
USE star_publicacao;

# ----------------------------------------------------------------------------
# -- MAIN
# ----------------------------------------------------------------------------

CREATE TABLE fact_publicacao (
    data_id INT NOT NULL,
    autor_id INT NOT NULL,
    local_publicacao_id INT NOT NULL,
    quantidade_publicacao TINYINT(1) NOT NULL DEFAULT 1,
    CONSTRAINT pk_fact_publicacao PRIMARY KEY (data_id, autor_id, local_publicacao_id)
);

CREATE TABLE dim_data (
    id INT NOT NULL AUTO_INCREMENT,
    dia INT(2),
    descricao_dia VARCHAR(30),
    mes INT(2),
    descricao_mes VARCHAR(30),
    ano INT(4),
    descricao_ano VARCHAR(30),
    CONSTRAINT pk_dim_data PRIMARY KEY (id)
);

CREATE TABLE dim_autor (
    id INT NOT NULL AUTO_INCREMENT,
    nome_autor VARCHAR(30),
	departamento_sigla VARCHAR(30),
    departamento_extenso VARCHAR(75),
    instituto_sigla VARCHAR(30),
    instituto_extenso VARCHAR(75),
    universidade_sigla VARCHAR(30),
    universidade_extenso VARCHAR(50),
    linha_pesquisa VARCHAR(30),
    CONSTRAINT pk_dim_autor PRIMARY KEY (id)
);

CREATE TABLE dim_local_publicacao (
    id INT NOT NULL AUTO_INCREMENT,
    issn VARCHAR(30) UNIQUE,
    nome_local VARCHAR(50) UNIQUE,
    tipo_publicacao VARCHAR(50),
    classificacao_qualis VARCHAR(2),
    CONSTRAINT pk_dim_local_publicacao PRIMARY KEY (id)
);

# ----------------------------------------------------------------------------
# -- ROLLBACK
# ----------------------------------------------------------------------------

DROP TABLE IF EXISTS fact_publicacao;
DROP TABLE IF EXISTS dim_data;
DROP TABLE IF EXISTS dim_autor;
DROP TABLE IF EXISTS dim_local_publicacao;
# ----------------------------------------------------------------------------
# - FILE: create-db.sql
# - DESC: Create publicacao-prova constelation schema.
# ----------------------------------------------------------------------------
# - AUTH: Andre Perez, andre.marcos.perez@usp.br
# - DATE: 2019-11-13
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# -- SETUP
# ----------------------------------------------------------------------------

DROP SCHEMA IF EXISTS constelation_publicacao_prova;
CREATE SCHEMA constelation_publicacao_prova;
USE constelation_publicacao_prova;

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

CREATE TABLE fact_prova (
    data_id INT NOT NULL,
    docente_id INT NOT NULL,
    aluno_id INT NOT NULL,
    disciplina_id INT NOT NULL,
    nota DECIMAL(4, 2) NOT NULL DEFAULT 0, -- haha
    CONSTRAINT pk_fact_prova PRIMARY KEY (data_id, docente_id, aluno_id, disciplina_id)
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
    nome_autor VARCHAR(30) UNIQUE,
    departamento_sigla VARCHAR(30),
    departamento_extenso VARCHAR(50),
    instituto_sigla VARCHAR(30),
    instituto_extenso VARCHAR(50),
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

CREATE TABLE dim_docente (
    id INT NOT NULL AUTO_INCREMENT,
    id_docente INT NOT NULL,
	nome VARCHAR(30),
	departamento_sigla VARCHAR(30),
    departamento_extenso VARCHAR(50),
    instituto_sigla VARCHAR(30),
    instituto_extenso VARCHAR(50),
    universidade_sigla VARCHAR(30),
    universidade_extenso VARCHAR(50),
    CONSTRAINT pk_dim_docente PRIMARY KEY (id)
);

CREATE TABLE dim_aluno (
    id INT NOT NULL AUTO_INCREMENT,
    id_aluno INT NOT NULL,
	nome VARCHAR(30),
	departamento_sigla VARCHAR(30),
    departamento_extenso VARCHAR(50),
    instituto_sigla VARCHAR(30),
    instituto_extenso VARCHAR(50),
    universidade_sigla VARCHAR(30),
    universidade_extenso VARCHAR(50),
    CONSTRAINT pk_dim_aluno PRIMARY KEY (id)
);

CREATE TABLE dim_disciplina (
    id INT NOT NULL AUTO_INCREMENT,
	id_disciplina VARCHAR(30),
    nome VARCHAR(50),
	departamento_sigla VARCHAR(30),
    departamento_extenso VARCHAR(50),
    instituto_sigla VARCHAR(30),
    instituto_extenso VARCHAR(50),
    universidade_sigla VARCHAR(30),
    universidade_extenso VARCHAR(50),
    CONSTRAINT pk_dim_disciplina PRIMARY KEY (id)
);

# ----------------------------------------------------------------------------
# -- ROLLBACK
# ----------------------------------------------------------------------------

DROP TABLE IF EXISTS fact_publicacao;
DROP TABLE IF EXISTS fact_prova;
DROP TABLE IF EXISTS dim_data;
DROP TABLE IF EXISTS dim_autor;
DROP TABLE IF EXISTS dim_local_publicacao;
DROP TABLE IF EXISTS dim_docente;
DROP TABLE IF EXISTS dim_aluno;
DROP TABLE IF EXISTS dim_disciplina;
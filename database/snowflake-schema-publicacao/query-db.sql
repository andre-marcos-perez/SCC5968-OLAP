# ----------------------------------------------------------------------------
# - FILE: query-db.sql
# - DESC: Query data on publicacao snowflake schema.
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

# - Join dim_autor, dim_departamento, dim_instituto e dim_universidade.

select autor.*, departamento.*, instituto.*, universidade.*
from dim_autor autor
join dim_departamento departamento on autor.departamento_id = departamento.id
join dim_instituto instituto on departamento.instituto_id = instituto.id
join dim_universidade universidade on instituto.universidade_id = universidade.id;

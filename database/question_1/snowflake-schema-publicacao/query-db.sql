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

# - Question 1.g

select sum(fact.quantidade_publicacao) as total_pub
from fact_publicacao fact 
join dim_autor autor 
on fact.autor_id = autor.id 
join dim_departamento departamento 
on autor.departamento_id = departamento.id
join dim_instituto instituto 
on departamento.instituto_id = instituto.id
join dim_universidade universidade 
on instituto.universidade_id = universidade.id
where universidade.universidade_sigla = 'USP';

select autor.linha_pesquisa, 
sum(fact.quantidade_publicacao) as total_pub
from fact_publicacao fact join dim_autor autor
on fact.autor_id = autor.id 
group by 1;
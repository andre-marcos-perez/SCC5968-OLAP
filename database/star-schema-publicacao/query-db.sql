# ----------------------------------------------------------------------------
# - FILE: query-db.sql
# - DESC: Query data on publicacao star schema.
# ----------------------------------------------------------------------------
# - AUTH: Andre Perez, andre.marcos.perez@usp.br
# - DATE: 2019-11-13
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# -- SETUP
# ----------------------------------------------------------------------------

USE publicacao;

# ----------------------------------------------------------------------------
# -- MAIN
# ----------------------------------------------------------------------------

# - Question 1.b

select sum(fact.quantidade_publicacao) as total_pub
from fact_publicacao fact 
join dim_data data 
on fact.data_id = data.id 
where 1=1
and data.mes = 11 
and data.ano = 2019;

select sum(fact.quantidade_publicacao) as total_pub
from fact_publicacao fact 
join dim_autor autor 
on fact.autor_id = autor.id 
where 1=1 
and autor.departamento_sigla = 'SCC' 
and autor.instituto_sigla = 'ICMC' 
and autor.universidade_sigla = 'USP';

select sum(fact.quantidade_publicacao) as total_pub
from fact_publicacao fact 
join dim_local_publicacao local_publicacao 
on fact.local_publicacao_id = local_publicacao.id 
where local_publicacao.classificacao_qualis = 'A2';

# - Question 1.h

-- Slice

select autor.nome_autor, 
sum(fact.quantidade_publicacao) as total_pub
from fact_publicacao fact
join dim_autor autor on fact.autor_id = autor.id
join dim_data data on fact.data_id = data.id
where 1=1
and data.mes = 11
and data.ano = 2019
group by 1;

-- Dice

select autor.nome_autor, 
sum(fact.quantidade_publicacao) as total_pub
from fact_publicacao fact
join dim_autor autor on fact.autor_id = autor.id
join dim_data data on fact.data_id = data.id
where 1=1
and data.mes between 6 and 12
and data.ano = 2019
group by 1;

-- Roll-up

select autor.instituto_sigla, 
autor.universidade_sigla, data.ano, 
sum(fact.quantidade_publicacao) as total_pub
from fact_publicacao fact
join dim_autor autor on fact.autor_id = autor.id
join dim_data data  on fact.data_id = data.id
group by 1, 2, 3;

-- Drill-down

select autor.departamento_sigla, 
autor.instituto_sigla,
autor.universidade_sigla, data.ano, 
sum(fact.quantidade_publicacao) as total_pub
from fact_publicacao fact
join dim_autor autor on fact.autor_id = autor.id
join dim_data data  on fact.data_id = data.id
group by 1, 2, 3, 4;

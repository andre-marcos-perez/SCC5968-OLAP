# ----------------------------------------------------------------------------
# - FILE: query-db.sql
# - DESC: Query data on medida star schema.
# ----------------------------------------------------------------------------
# - AUTH: Andre Perez, andre.marcos.perez@usp.br
# - DATE: 2019-11-14
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# -- SETUP
# ----------------------------------------------------------------------------

USE star_medida;

# ----------------------------------------------------------------------------
# -- MAIN
# ----------------------------------------------------------------------------

# - Question 2.a

select avg(fact.nota) as nota_media
from fact_medida fact
join dim_data data 
on fact.data_id = data.id
join dim_departamento departamento 
on fact.departamento_id = departamento.id
where 1=1
and departamento.nome_extenso = 'computacao'
and (data.ano = 2003 or data.ano = 2004);

# - Question 2.d

select disciplina.nome_extenso as disciplina, 
data.ano, avg(fact.nota) as nota_media
from fact_medida fact
join dim_data data 
on fact.data_id = data.id
join dim_disciplina disciplina 
on fact.disciplina_id = disciplina.id
group by 1, 2;
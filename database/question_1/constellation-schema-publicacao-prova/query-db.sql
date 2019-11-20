# ----------------------------------------------------------------------------
# - FILE: query-db.sql
# - DESC: Query data on publicacao-prova constellation schema.
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

# - Question 1.j

select prova.docente, prova.mes, 
prova.nota_media, publicacao.total_pub
from (
	select autor.nome_autor as autor, data.mes,
	sum(fact.quantidade_publicacao) as total_pub
	from fact_publicacao fact
	join dim_autor autor 
    on fact.autor_id = autor.id
	join dim_data data 
    on fact.data_id = data.id
	where data.ano = 2019
	group by 1, 2
) publicacao
join (
	select docente.nome as docente, data.mes, 
	avg(fact.nota) as nota_media
	from fact_prova fact
	join dim_docente docente 
    on fact.docente_id = docente.id
	join dim_data data 
    on fact.data_id = data.id
	where data.ano = 2019
	group by 1, 2
) prova
on 1=1 
and publicacao.mes = prova.mes 
and publicacao.autor = prova.docente;

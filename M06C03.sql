-- 1
select series.title , genres.name
from series
left join genres on series.genre_id = genres.id;

select episodes.title , actors.first_name , actors.last_name
from actor_episode
inner join actors on actor_episode.actor_id = actors.id
inner join episodes on actor_episode.episode_id = episodes.id;

-- 2
select distinct  actors.first_name , actors.last_name
from actor_movie
inner join actors on actor_movie.actor_id = actors.id
inner join movies on actor_movie.movie_id = movies.id
where movies.title like '%Guerra de las galaxias%';

-- 3
select movies.title , coalesce(genres.name,'no tiene género') as genres
from movies
left join genres on movies.genre_id = genres.id;

-- 4
select title as Título,
datediff(end_date, release_date) as Duración
from series;

-- 5
select last_name,first_name
from actors
where length(first_name) > 6
order by last_name;

select count(*) as Cantidad_de_episodios from episodes;

select series.title as Serie,
count(seasons.serie_id) as Total_temporadas
from series
inner join seasons on series.id = seasons.serie_id
group by series.title;

select name as Genero,
count(movies.genre_id) as Cantidad_de_peliculas
from genres
inner join movies on genres.id = movies.genre_id
group by name
having count(movies.genre_id) >= 3;



-- 1  Peliculas que la gente alquila mas tiempo, por ende la que menos esta en la tienda
select f.title as Titulo, sum(r.dias_renta) as Peliculas_mas_rentadas

from film as f 
left join inventory as inv
on f.film_id = inv.film_id
inner join rental as r 
on inv.inventory_id = r.inventory_id
group by f.title
order by Peliculas_mas_rentadas desc;

-- 2  Costo de comprar nuevamente cada pelicula
select distinct(f.title), replacement_cost as Costo

from film as f 
left join inventory as inv
on f.film_id = inv.film_id
inner join rental as r 
on inv.inventory_id = r.inventory_id
order by costo desc;

-- 3  Peliculas que mas dinero recaudan 

select f.title as Titulo,
round(sum(f.rental_rate * r.dias_renta),2) as Renta_Total

from film as f 
left join inventory as inv
on f.film_id = inv.film_id
inner join rental as r 
on inv.inventory_id = r.inventory_id
group by f.title
order by Renta_Total desc;

-- 4 Las  categorias con mayor demanda
select  c.name as Categoria,
count(f.title) as Pelicula

from film as f
left join category as c
on f.category_id = c.category_id
group by Categoria;

-- 5 Cantidad de peliculas por store
select count(f.film_id) as Cantidad_Peliculas, (inv.store_id) as Store

from film as f
inner join inventory as inv
on f.film_id = inv.film_id
group by store;

-- 6 La cantidad de peliculas por genero que tenemos
select(f.rating) as Rating,
 count(f.title) cantidad_peliculas  

from film as f 
group by Rating
order by cantidad_peliculas desc


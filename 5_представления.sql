-- Представление, которое выводит название (name) товарной позиции из таблицы products 
-- и соответствующее название (name) каталога из таблицы catalogs.

create view products_catalogs as
select 
  products.name as product, 
  catalogs.name as catalogs
from products 
  join catalogs 
    on products.catalog_id = catalogs.id;

select * from products_catalogs;


-- Представление, которое выводит название товара из таблицы products и среднюю оценку за него по отзывам

create view products_reviews as
select products.name, 
  avg(reviews.evaluation) as average_note
from products 
  left join reviews 
    on reviews.to_product_id = products.id 
group by products.id;
  
select * from products_reviews;















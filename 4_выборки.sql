use Wildberries;

-- 10 Пользователей, которые осуществили заказ (orders) в интернет-магазине и общее количество заказов для каждого из этих пользователей

select first_name, last_name, 
  count(orders.id) as total_orders
from orders
  join users 
    on orders.user_id = users.id
group by orders.user_id
limit 10;


-- Выведите список товаров products и разделов catalogs, который соответствует товару.

select products.name as products, 
  catalogs.name as catalogs
from products 
  join catalogs 
    on products.catalog_id = catalogs.id
limit 10;

-- Посчитать, сколько товаров входит в каждый каталог и среднюю цену по каталогу, максимальну и минимальную цену за товар

select catalogs.name,
  count(products.id) as total_products,
  avg(products.price) as average_price,
  min(products.price) as min_price,
  max(products.price) as max_price
from catalogs 
  left join products
    on catalogs.id = products.catalog_id 
group by catalogs.id;


-- Вывести отзыв и оценку за продукт самого молодого пользователя

select first_name, last_name, 
  products.name as product_name, 
  reviews.evaluation, reviews.body as review
from users
  join reviews 
    on users.id = reviews.from_user_id
  join products 
    on products.id = reviews.to_product_id 
order by birthday 
desc limit 1;


-- Определить, кто больше написал отзывов: мужчины или женщины?

select users.gender as gender,
  count(*) as total
from reviews 
  join users 
    on reviews.from_user_id = users.id 
where reviews.from_user_id = users.id
group by gender
order by total desc 
limit 1;


-- Количество товаров каждого размер, которые есть на складе и которые отностся к женскому каталогу

select sizes.name,
  count(sizes.id) as total
from products
 join storehouses_products 
   on storehouses_products.product_id = products.id
 join sizes 
   on products.size_id = sizes.id
 join catalogs 
   on products.catalog_id = catalogs.id 
where catalogs.name = 'Women'
group by sizes.name;









































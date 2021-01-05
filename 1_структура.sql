create database Wildberries;
use Wildberries;

create table users (
	id int unsigned not null auto_increment primary key,
	first_name varchar(250) not null,
	last_name varchar(250) not null,
	birthday date,
	gender char(1),
	phone varchar(100) unique not null,
	email varchar(100) unique not null,
	country varchar(100),
 	city varchar (100),
	created_at datetime default current_timestamp,
	updated_at datetime default current_timestamp on update current_timestamp
) comment = 'Покупатели';

create index users_phone_idx on users(phone);
create index users_email_idx on users(email);

create table finances (
	id int unsigned not null auto_increment primary key,
	balance decimal(11,2),
	user_id int unsigned,
	created_at datetime default current_timestamp,
	updated_at datetime default current_timestamp on update current_timestamp
) comment = 'Финансы покупателя';

create table catalogs (
	id int unsigned not null auto_increment primary key,
	name varchar(250) not null unique
) comment = 'Разделы интернет-магазина';

create table rubrics (
	id int unsigned not null auto_increment primary key,
	name varchar(250) not null unique,
	catalog_id int unsigned	
) comment = 'Рубрики интернет-магазина';

create table brands (
	id int unsigned not null auto_increment primary key,
	name varchar(100) not null unique
) comment = 'Названия магазинов';

create table products (
	 id int unsigned not null auto_increment primary key,
	 name varchar(250) not null,
	 description text,
	 rubric_id int unsigned,
	 catalog_id int unsigned,
	 brand_id int unsigned,
	 size_id int unsigned,
	 adress_id int unsigned,
	 created_at datetime default current_timestamp,
	 updated_at datetime default current_timestamp on update current_timestamp
) comment = 'Товарные позиции';

create index products_name_idx on products(name);

create table sizes (
	id int unsigned not null auto_increment primary key,
	name char(10)
) comment = 'Размеры';

create table orders (
	id int unsigned not null auto_increment primary key,
	user_id int unsigned,
	created_at datetime default current_timestamp,
	updated_at datetime default current_timestamp on update current_timestamp
) comment = 'Заказы';

create table orders_products (
	id int unsigned not null auto_increment primary key,
	order_id int unsigned,
	product_id int unsigned,
	total int unsigned default '1',
	order_status_id int unsigned not null,
	created_at datetime default current_timestamp,
	updated_at datetime default current_timestamp on update current_timestamp
) comment = 'Состав заказа';

create table orders_statuses (
	id int unsigned not null auto_increment primary key,
	name varchar(100) not null unique
) comment = 'Статус заказа';

create table waiting_lists (
	id int unsigned not null auto_increment primary key,
	product_id int unsigned,
	user_id int unsigned,
	total int unsigned default '1',
	waiting_status_id int unsigned,
	created_at datetime default current_timestamp,
	updated_at datetime default current_timestamp on update current_timestamp
) comment = 'Листы ожидания';

create table waiting_statuses (
	id int unsigned not null auto_increment primary key,
	name varchar(100) not null unique
) comment = 'Статус ожидания';

create table reviews (
	id int unsigned not null auto_increment primary key,
	evaluation int unsigned,
	body text,
	to_product_id int unsigned,
	from_user_id int unsigned,
	created_at datetime default current_timestamp,
	updated_at datetime default current_timestamp on update current_timestamp
) comment = 'Отзывы';

create table storehouses (
	id int unsigned not null auto_increment primary key,
	name varchar(250),
	adress_id int unsigned,
	created_at datetime default current_timestamp,
	updated_at datetime default current_timestamp on update current_timestamp
) comment = 'Склады';

create table storehouses_products (
	id int unsigned not null auto_increment primary key,
	storehouse_id int unsigned,
	product_id int unsigned,
	value int unsigned,
	created_at datetime default current_timestamp,
	updated_at datetime default current_timestamp on update current_timestamp
) comment = 'Запасы на складе';

create table discounts (
	id int unsigned not null auto_increment primary key,
	user_id int unsigned,
	product_id int unsigned,
	discount float unsigned,
	started_at datetime,
	finished_at datetime,
	created_at datetime default current_timestamp,
	updated_at datetime default current_timestamp on update current_timestamp
) comment = 'Скидки';

create table adresses (
	id int unsigned not null auto_increment primary key,
	city varchar(250) not null unique,
	street varchar(250) not null,
	house int unsigned not null comment 'номер дома', 
	housing int unsigned comment 'корпус'
) comment = 'Адреса пунктов выдачи';




   
   
   
   